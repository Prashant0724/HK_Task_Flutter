import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hk_task_flutter/Views/home_screen.dart';

import '../Controller/product_controller.dart';

class ProductForm extends StatelessWidget {
  final ProductController _controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _controller.productNameController,
              // onChanged: _controller.setProductName,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _controller.priceTextEditiController,
              // onChanged: _controller.setPrice,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _controller.addProduct(
                    _controller.priceTextEditiController.text,
                    _controller.productNameController.text);
                Get.to(HomePage());
              },
              child: Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
