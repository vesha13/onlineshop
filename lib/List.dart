import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Card.dart';

class ArtDetails extends StatelessWidget {
  final MyCard item;

  ArtDetails(this.item, {Key? key}) : super(key: key);

  static PageRouteBuilder getRoute(MyCard item) {
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
      return new ArtDetails(item);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      appBar: AppBar(
        title: Text('Sneakers Shop'),
      ),
      body: Column(children: [
          Center(
            child:Text(item.title, style: TextStyle(fontSize: 34, color: const Color.fromARGB(255, 245, 255, 133)))
            ),
          Padding(
                      padding: const EdgeInsets.all(10.12),
                      child: Center(child: 
                          Image.network(
                      width: 400,
                      item.img,
                      fit: BoxFit.cover,
                    ),) 
                    ),
         
          Text(item.desc, style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 253, 246, 253)))
      ],)
    );
  }

}
