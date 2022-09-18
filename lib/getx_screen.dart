import 'package:BasicApp/getxControllers/CartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxScreen extends StatelessWidget {
  const GetxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController cartControllers = Get.put(CartController());
    // final CartController cartProducts = Get.find();

    return Scaffold(
      backgroundColor: const Color(0xFF90CAF9),
      appBar: AppBar(
        title: const Text("Getx"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: GetX<CartController>(builder: (controller) {
                return ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.all(5),
                    children: List.generate(controller.items.length, (index) {
                      return Center(
                        child: Card(
                          color: Colors.white,
                          shadowColor: const Color(0xFF90CAF9),
                          elevation: 8,
                          borderOnForeground: true,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        // controller
                                        //     .items[index].productName,
                                        controller
                                            .items[index].productName.value,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic),
                                      ),
                                      Text(
                                        "\$ ${controller.items[index].productPrice.toString()}",
                                        // "\$ ${controller.items[index].productPrice.value.toString()}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    ],
                                  ),
                                  OutlinedButton(
                                    style: ButtonStyle(
                                      shadowColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.redAccent),
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(
                                              const Color(0xFF90CAF9)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(6)),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      // controller
                                      //     .items[index].isAddedToCart
                                      controller
                                              .items[index].isAddedToCart.value
                                          ? ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Product is already in your cart"),
                                            ))
                                          : cartControllers
                                              .addProductToCart(index);
                                    },
                                    child:
                                        // controller
                                        //     .items[index].isAddedToCart
                                        controller.items[index].isAddedToCart
                                                .value
                                            ? const Text("ADDED",
                                                style: TextStyle(
                                                    color: Colors.greenAccent))
                                            : const Text("ADD",
                                                style: TextStyle(
                                                    color: Colors.blue)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }));
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GetX<CartController>(builder: (controller) {
                return Column(
                  children: [
                    Text(
                      "Total Product Count: ${controller.productCount.value}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Total Price: ${controller.totalPrice.value}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
