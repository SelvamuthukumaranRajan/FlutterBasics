import 'package:get/get.dart';

class CartController extends GetxController {

  var totalPrice = 0.obs;
  var productCount = 0.obs;

  // var items = <Product>[Product("Item1",200,false), Product("Item2",400,false), Product("Item3",700,false), Product("Item4",100,false),].obs;
  var items = <Product>[Product("Item1".obs,200.obs,false.obs), Product("Item2".obs,400.obs,false.obs), Product("Item3".obs,700.obs,false.obs), Product("Item4".obs,100.obs,false.obs),].obs;

  updateTotalPrice(int price) {
    totalPrice.value+=price;
  }

  incProductCount(){
    productCount.value++;
  }

  updateAddToCart(int index){
    // items[index].isAddedToCart = true;
    items[index].isAddedToCart.value = true;
  }

  addProductToCart(int index){
    incProductCount();
    // updateTotalPrice(items[index].productPrice);
    updateTotalPrice(items[index].productPrice.value);
    updateAddToCart(index);
  }

}

class Product {
  // var productPrice = 0;
  // var productName = "";
  // var isAddedToCart = false;

  var productPrice = 0.obs;
  var productName = "".obs;
  var isAddedToCart = false.obs;

  Product(this.productName, this.productPrice, this.isAddedToCart);

}
