// ignore_for_file: unused_import

import "dart:math";
import "dart:ui";

import "package:flutter/material.dart";
import "package:groupchat/Food%20Donation/cart_provider.dart";
import "package:provider/provider.dart";
import 'package:url_launcher/url_launcher.dart';

class Product_detailes_page extends StatefulWidget {
  final Map<String, Object> product;

  const Product_detailes_page({super.key, required this.product});

  @override
  State<Product_detailes_page> createState() => _Product_detailes_pageState();
}

class _Product_detailes_pageState extends State<Product_detailes_page> {
// INITIAL DATA / STATE
// CHANGE/ UPDATE DATA/STATE

// INITSTAte()

// build() => UI

  /// initState();
  /// build(); => {setState()}  => UI
  /// dispose()

  /// Stateless
  ///
  /// build() =>

  int sizefinal = 0;
  void onTap() {
    if ((widget.product['count'] as int) > 0) {
      // Generate a unique 6 digit token
      var rng = new Random();
      int sizefinal = 100000 + rng.nextInt(900000);

      Provider.of<Cartprovider>(context, listen: false).addproduct(
        {
          'id': widget.product['id'],
          'company': widget.product['company'],
          'title': widget.product['title'],
          'price': widget.product['price'],
          'size': sizefinal,
          'imageurl': 'assets/images/h1.png',
          'mapUrl': widget.product['mapUrl'],
        },
      );
      setState(() {
        widget.product['count'] = (widget.product['count'] as int) - 1;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Slot confirmed ')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Tokens Expired, Try again later')));
    }
    // Cartprovider is got to know by hovering the changenotifier in main.dart
  }
  //we have to make listner as false when outside the build function

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Detailes',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        body: Column(
          children: [
            Text(
              widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  widget.product['imageurl'] as String,
                  height: 250,
                )),
            const Spacer(
              flex: 2,
            ),
            Container(
              height: 240,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.circular(40),
                // boxShadow: const [BoxShadow(blurRadius: 8)]
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${widget.product['price']}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // ElevatedButton(
                    //   onPressed: () async {
                    //     final url = widget.product['mapUrl'] as String;
                    //     if (await canLaunchUrl(Uri.parse(url))) {
                    //       await launchUrl(Uri.parse(url));
                    //     } else {
                    //       throw 'Could not launch $url';
                    //     }
                    //   },
                    //   child: const Text(
                    //     'Open GoogleMap',
                    //     style: TextStyle(
                    //         color: Colors.black,
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 20),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(
                          "Token Available: ${widget.product['count'] as int}",
                          style: const TextStyle(
                              fontSize: 24), // Adjust the style as needed
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton.icon(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            fixedSize: const Size(350, 50)),
                        icon: const Icon(
                          Icons.lunch_dining,
                          color: Colors.black,
                        ),
                        label: const Text(
                          'Generate Token',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    )
                  ]),
            )
          ],
        ));
  }
}
