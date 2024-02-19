import "package:flutter/material.dart";
import "package:groupchat/Food%20Donation/cart_provider.dart";
import "package:provider/provider.dart";
import "package:url_launcher/url_launcher.dart";

class Cart_page extends StatelessWidget {
  const Cart_page({super.key});

  @override
  Widget build(BuildContext context) {
    //print(Provider.of<Cartprovider>(context).cart);
    final cart = Provider.of<Cartprovider>(context).cart;
    // final cart = context.watch<Cartprovider>().cart; short for above
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Claimed Tokens',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 21),
          ),
        ),
        body: ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              final carts = cart[index];
              // also final Map<String,dynamic>carts = cart[index];

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(carts['imageurl'] as String),
                  radius: 30,
                ),
                title: Text(
                  carts['title'] as String,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                subtitle: Text('Token :${carts['size']}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () async {
                          final url = carts['mapUrl'] as String;
                          if (await canLaunchUrl(Uri.parse(url))) {
                            await launchUrl(Uri.parse(url));
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        icon: const Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        )),
                    IconButton(
                      onPressed: () {
                        Provider.of<Cartprovider>(context, listen: false)
                            .removeproduct(carts);
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              );
            }));
  }
}

class Provide {}
