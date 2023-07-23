import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Picture.dart';

class ArtDetails extends StatelessWidget {
  final Pic naruto;

  ArtDetails(this.naruto, {Key? key}) : super(key: key);

  static PageRouteBuilder getRoute(Pic naruto) {
    return PageRouteBuilder(
        transitionsBuilder: (_, animation, secondAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: RotationTransition(
          turns: Tween<double>(begin: 1, end: 1.0).animate(animation),
          child: child,
        ),
      );
    }, pageBuilder: (_, __, ___) {
      return new ArtDetails(naruto);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        title: Text(naruto.title),
      ),
      body: Column(children: [

          Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(child: 
                          Image.network(
                      width: 300,
                      naruto.image,
                      fit: BoxFit.cover,
                    ),) 
                    ),
          Padding(
             padding: const EdgeInsets.all(10.10),
            child: Text(naruto.description, style: TextStyle(fontSize: 20, fontFamily: 'RobotoMono')))
      ],)
    );
  }

}
