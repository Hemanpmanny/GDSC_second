import "package:flutter/material.dart";

class Product_cart extends StatelessWidget {
  final String text;
  final String price;
  final String image;
  final String mapUrl;
  final Color backgroundcolor;
  final bool isAvaliable;
  final int count;

  const Product_cart(
      {super.key,
      required this.text,
      required this.price,
      required this.image,
      required this.backgroundcolor,
      required this.mapUrl,
      required this.count,
      required this.isAvaliable});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(17),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: backgroundcolor, borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              price,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Center(
              child: Image(
                image: AssetImage(image),
                height: 175,
              ),
            )
          ]),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: isAvaliable ? Colors.green : Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
