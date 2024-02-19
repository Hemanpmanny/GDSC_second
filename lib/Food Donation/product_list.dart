import "package:flutter/material.dart";
import "package:groupchat/Food%20Donation/global_variables.dart";
import "package:groupchat/Food%20Donation/product_card.dart";
import "package:groupchat/Food%20Donation/product_detailes_page.dart";
import "package:groupchat/pages/select%20page/select_page.dart";


class product_list extends StatefulWidget {
  const product_list({super.key});

  @override
  State<product_list> createState() => _product_listState();
}

class _product_listState extends State<product_list> {
  @override
  Widget build(BuildContext context) {
    

    return SafeArea(
      //helps to make items below the notch and above the bottom-safe area
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                // Dart
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectPage()),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text('Food Donation',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
              ),
            ],
          ),
          //
          Expanded(
            child: ListView.builder(
                itemCount: product.length,
                itemBuilder: (context, index) {
                  final products = product[index];
                  return GestureDetector(
                    onTap: () {
                      if (!(products['isAvaliable'] as bool)) {
                        return;
                      }

                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return Product_detailes_page(product: products);
                      }));
                    },
                    child: Product_cart(
                      text: products['title'] as String,
                      price: products['price'] as String,
                      image: products['imageurl'] as String,
                      mapUrl: products['mapUrl'] as String,
                      count: products['count'] as int,
                      backgroundcolor: index.isEven
                          ? const Color.fromRGBO(216, 240, 253, 1)
                          : const Color.fromARGB(255, 243, 244, 244),
                      isAvaliable: products['isAvaliable'] as bool,
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
