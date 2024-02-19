import 'package:flutter/material.dart';
import 'package:groupchat/Food%20Donation/cart_provider.dart';
import 'package:groupchat/Food%20Donation/home_pagef.dart';
import 'package:provider/provider.dart';



class FoodDonation extends StatelessWidget {
  const FoodDonation({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cartprovider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food Donation',
          theme: ThemeData(
              fontFamily: 'Lato',
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.blue,
                  primary: Colors.blue),
              textTheme: const TextTheme(
                  titleLarge:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                  titleMedium:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  bodyMedium:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              appBarTheme: const AppBarTheme(
                  titleTextStyle: TextStyle(fontSize: 16, color: Colors.black)),
              useMaterial3: true), //try removing this and see changes
          home: const Home_pagef()),
    );
  }
}
