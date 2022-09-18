import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FilePickerScreen extends StatefulWidget {
  const FilePickerScreen({Key? key}) : super(key: key);

  @override
  State<FilePickerScreen> createState() => _FilePickerScreenState();
}

class _FilePickerScreenState extends State<FilePickerScreen> {
  String? fileName;
  List<PlatformFile>? paths;
  String? directoryPath;
  String? extension;
  bool loadingPath = false;
  bool multiPick = false;
  FileType pickingType = FileType.any;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() => extension = controller.text);
  }

  void _openFileExplorer() async {
    setState(() => loadingPath = true);
    try {
      directoryPath = null;
      paths = (await FilePicker.platform.pickFiles(
        type: pickingType,
        allowMultiple: multiPick,
        allowedExtensions: (extension?.isNotEmpty ?? false)
            ? extension?.replaceAll(' ', '').split(',')
            : null,
      ))
          ?.files;
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print(ex);
    }
    if (!mounted) return;
    setState(() {
      loadingPath = false;
      fileName =
          paths != null ? paths!.map((e) => e.name).toString() : '...';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("File Picker"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: DropdownButton<FileType>(
                      isExpanded: true,
                      hint: const Text('LOAD PATH FROM'),
                      value: pickingType,
                      items: const <DropdownMenuItem<FileType>>[
                        DropdownMenuItem(
                          value: FileType.audio,
                          child: Text('AUDIO'),
                        ),
                        DropdownMenuItem(
                          value: FileType.image,
                          child: Text('IMAGE'),
                        ),
                        DropdownMenuItem(
                          value: FileType.video,
                          child: Text('VIDEO'),
                        ),
                        DropdownMenuItem(
                          value: FileType.media,
                          child: Text('MEDIA'),
                        ),
                        DropdownMenuItem(
                          value: FileType.any,
                          child: Text('ANY'),
                        ),
                        DropdownMenuItem(
                          value: FileType.custom,
                          child: Text('CUSTOM FORMAT'),
                        ),
                      ],
                      onChanged: (value) => setState(() {
                            pickingType = value!;
                            if (pickingType != FileType.custom) {
                              controller.text = extension = '';
                            }
                          })),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 5, 20, 5),
                  child: Container(
                    child: pickingType == FileType.custom
                        ? TextFormField(
                            maxLength: 15,
                            autovalidateMode: AutovalidateMode.always,
                            controller: controller,
                            decoration: const InputDecoration(
                                labelText: 'File extension'),
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.none,
                          )
                        : const SizedBox(),
                  ),
                ),
                CheckboxListTile(
                  title: const Text('Pick multiple files'),
                  onChanged: (value) => setState(() => multiPick = value!),
                  value: multiPick,
                  controlAffinity: ListTileControlAffinity.trailing,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                  child: Column(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () => _openFileExplorer(),
                        child: const Text("Open file picker"),
                      ),
                    ],
                  ),
                ),
                Builder(
                  builder: (BuildContext context) => loadingPath
                      ? const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: CircularProgressIndicator(),
                        )
                      : directoryPath != null
                          ? ListTile(
                              title: const Text('Directory path'),
                              subtitle: Text(directoryPath!),
                            )
                          : paths != null
                              ? Container(
                                  padding: const EdgeInsets.only(bottom: 30.0),
                                  height:
                                      MediaQuery.of(context).size.height * 0.50,
                                  child: Scrollbar(
                                      child: ListView.separated(
                                    itemCount:
                                        paths != null && paths!.isNotEmpty
                                            ? paths!.length
                                            : 1,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final bool isMultiPath =
                                          paths != null && paths!.isNotEmpty;
                                      final String name =
                                          'File $index: ${isMultiPath ? paths!.map((e) => e.name).toList()[index] : fileName ?? '...'}';
                                      final path = paths!
                                          .map((e) => e.path)
                                          .toList()[index]
                                          .toString();

                                      return ListTile(
                                        title: Text(
                                          name,
                                        ),
                                        subtitle: Text(path),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) =>
                                            const Divider(),
                                  )),
                                )
                              : const SizedBox(),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
