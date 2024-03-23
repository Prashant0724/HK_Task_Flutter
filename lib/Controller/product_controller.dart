import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Model/product_model.dart';

class ProductController extends GetxController {

  Rx<List<ProductModel>> products = Rx<List<ProductModel>>([]);
  TextEditingController productNameController =
      TextEditingController();
  TextEditingController priceTextEditiController = TextEditingController();
  late ProductModel productModel;
  var itemCount = 0.obs;

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    productNameController.dispose();
    priceTextEditiController.dispose();
  }

  addProduct(String price, String productname) {
    productModel = ProductModel(price: price, productname: productname);
    products.value.add(productModel);
    itemCount.value = products.value.length;
  }

  removeProduct(int index) {
    products.value.removeAt(index);
    itemCount.value = products.value.length;
  }
}
