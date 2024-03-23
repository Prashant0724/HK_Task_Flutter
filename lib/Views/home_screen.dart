import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hk_task_flutter/Views/login_screen.dart';
import 'package:hk_task_flutter/Views/product_form.dart';

import '../Controller/log_in_controller.dart';
import '../Controller/product_controller.dart';

class Product {
  final String name;
  Product(this.name);
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
final ProductController _controller = Get.put(ProductController());
LoginController controller = Get.put(LoginController());


class _HomePageState extends State<HomePage> {
  final List<Product> AllProducts = [
    // Product('apple'),
    // Product('paneer'),
    // Product('prateek'),
  ];
  List<Product> displayedProducts = [];
  bool isSearching = false;
  @override
  void initState() {
    super.initState();
    displayedProducts = AllProducts;
  }

  void searchProducts(String query) {
    setState(() {
      displayedProducts = AllProducts.where((product) =>
          product.name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: isSearching
            ? TextField(
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  icon: Padding(
                    padding: EdgeInsets.only(right: 6),
                    child: Icon(Icons.search),
                  ),
                ),
                onChanged: (value) {
                  searchProducts(value);
                },
              )
            : Container(
                // padding: EdgeInsets.only(right: 10),
                child: Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.only(right: 20),
                      icon: Icon(Icons.navigate_before),
                      onPressed: () {
                        // Implement back functionality
                      },
                    ),
                    SizedBox(width: 8.0),
                    // Text('Home Page'),
                  ],
                ),
              ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 23, left: 20),
            child: IconButton(
              icon: isSearching ? Icon(Icons.close) : Icon(Icons.search),
              onPressed: () {
                setState(() {
                  isSearching = !isSearching;
                });
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: EdgeInsets.only(left: 15,right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hi-Fi Shop & Service',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: (){
                        Get.to(LoginScreen());
                        controller.emailcontroller.value.clear();
                        controller.passwordController.value.clear();
                      },
                      child: Icon(Icons.logout,))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.topCenter,
              // color: Colors.blue,
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width * 0.6,
              padding: EdgeInsets.only(left: 15, right: 40),
              child: const Text(
                'Audio shop on Rustaveli Ave 57.'
                ' This shop offers both products and services ',
                style: TextStyle(fontSize: 11),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Products",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " 41",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400,
                              fontSize: 18),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 289),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Show all",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Expanded(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            height: MediaQuery.of(context).size.height * .26,
                            width: MediaQuery.of(context).size.width * .33,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 40),
                                        child: Image.asset(
                                          "assets/images/head1.jpg",
                                          height: 100,
                                          width: 80,
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Icon(
                                          Icons.delete_outline_sharp,
                                          size: 35,
                                        ))
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // "AKG N700NCM2 Wireless\nHedphones",
                                       _controller.productNameController.text,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      // "\$199.00",
                                      _controller.priceTextEditiController.text,
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade600),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            height: MediaQuery.of(context).size.height * .26,
                            width: MediaQuery.of(context).size.width * .33,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 40),
                                        child: Image.asset(
                                          "assets/images/head1.jpg",
                                          height: 100,
                                          width: 80,
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Icon(
                                          Icons.delete_outline_sharp,
                                          size: 35,
                                        ))
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "AKG N700NCM2 Wireless\nHedphones",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      "\$199.00",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade600),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            height: MediaQuery.of(context).size.height * .26,
                            width: MediaQuery.of(context).size.width * .33,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 40),
                                        child: Image.asset(
                                          "assets/images/head1.jpg",
                                          height: 100,
                                          width: 80,
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Icon(
                                          Icons.delete_outline_sharp,
                                          size: 35,
                                        ))
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "AKG N700NCM2 Wireless\nHedphones",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      "\$199.00",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade600),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),

                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Accessories",
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " 19",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade400,
                              fontSize: 18),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 289-35),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Show all",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Expanded(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            height: MediaQuery.of(context).size.height * .3,
                            width: MediaQuery.of(context).size.width * .33,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 40),
                                        child: Image.asset(
                                          "assets/images/head1.jpg",
                                          height: 100,
                                          width: 80,
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Icon(
                                          Icons.delete_outline_sharp,
                                          size: 35,
                                        ))
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "AKG N700NCM2 Wireless\nHedphones",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      "\$199.00",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade600),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            height: MediaQuery.of(context).size.height * .3,
                            width: MediaQuery.of(context).size.width * .33,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 40),
                                        child: Image.asset(
                                          "assets/images/head1.jpg",
                                          height: 100,
                                          width: 80,
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Icon(
                                          Icons.delete_outline_sharp,
                                          size: 35,
                                        ))
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "AKG N700NCM2 Wireless\nHedphones",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      "\$199.00",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade600),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(15),
                            height: MediaQuery.of(context).size.height * .3,
                            width: MediaQuery.of(context).size.width * .33,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 40),
                                        child: Image.asset(
                                          "assets/images/head2.jpg",
                                          height: 100,
                                          width: 80,
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Icon(
                                          Icons.delete_outline_sharp,
                                          size: 35,
                                        ))
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "AKG N700NCM2 Wireless\nHedphones",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(
                                      "\$199.00",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.grey.shade600),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var result = await Get.to(() => ProductForm());

        },


        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(30), // Adjust the radius as needed
        ),
      ),
    );
  }
}

class ProductListView extends StatelessWidget {
  final List<Product> products;

  const ProductListView({required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(products[index].name),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Implement delete product functionality
            },
          ),
        );
      },
    );
  }
}




