import 'package:flutter/material.dart';

void main() => runApp(Lab1());


/// this is your APP Main screen configuration
class Lab1 extends StatelessWidget {
  Lab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LAb1HomePage(),
    );
  }
}


// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class LAb1HomePage extends StatelessWidget {
  LAb1HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      /*******************--[focus here 🧐]--*******************/
      appBar: AppBar(
        leading: const Icon(Icons.stars),
        title: const Text('Lab 1'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: myWidget(),
      /*******************--[focus here 🧐]--*******************/
    );
  }



  Widget myWidget() {
    return SingleChildScrollView(
      child: Column(
        
        children: [
          /*******************--[focus here 🧐]--*******************/
          SizedBox(height: 25,),
          exercise1(),
          SizedBox(height: 25,),
          exercise2(),
          SizedBox(height: 25,),
          exercise3(),
          SizedBox(height: 25,),
          exercise4(),
          SizedBox(height: 25,),
          exercise5(),
          SizedBox(height: 25,),
          exercise6(),
          /*******************--[focus here 🧐]--*******************/
        ],
      ),
    );
  }

  /// TODO: Implement Exercises below as per the handed Document
  Widget exercise1() {
    return Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(20),
        child:
        /*******************--[focus here 🧐]--*******************/
        const Text("Welcome to lab1",
          textAlign: TextAlign.left, 
          style: TextStyle(
            fontSize: 32, fontFamily: "monospace", 
            color: Color.fromARGB(255, 11, 235, 213),
            backgroundColor: Colors.grey,
            fontStyle: FontStyle.italic
            ),
        ),
    );

  }

  Widget exercise2() {
    return const Icon(
      Icons.share,
      size: 120,
      color: Colors.blue,
    );
  }



  /// TODO : print on the screen on Pressed when clicking on the button, and print on Long Pressed when long click to Button
  Widget exercise3() {
  return MyButton();
  }
}
  class MyButton extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyButtonState createState() => _MyButtonState();
  }

  class _MyButtonState extends State<MyButton> {
  String message = '';

  void _onPressed() {
  setState(() {
  message = 'on Pressed';
  });
  print('on Pressed');
  }

  void _onLongPressed() {
  setState(() {
  message = 'Long Pressed';
  });
  print('Long Pressed');
  }
 @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _onPressed,
          onLongPress: _onLongPressed,
          style: ElevatedButton.styleFrom(
            elevation: 8,
            shape: StadiumBorder(),
             padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
          ),
          child: const Text(
            "Click here",
            style: TextStyle(fontSize: 20, color: Colors.yellowAccent),
          ),
        ),
         // Add some spacing between the button and the text
        Text(message), // Display the message below the button
      ],
    );
  }}



  Widget exercise4() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom (backgroundColor:  Color.fromARGB(255, 255, 251, 251), shape: CircleBorder(), elevation: 8.0, ) ,
    
      child: const CircleAvatar(
            backgroundColor: Colors.black,
             
              radius: 36,
              
              child: Icon(
                
                Icons.favorite,
                color:Colors.greenAccent,
                size: 32,
              ),
      ),
    
    );
  }

  Widget exercise5() {
    return Center(child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(200, 60),
        foregroundColor: Color.fromARGB(255, 255, 102, 0),
        textStyle: const TextStyle(fontSize: 26,  fontWeight: FontWeight.w500,),
        //surfaceTintColor: Colors.orange
        side: const BorderSide(width: 3, color: Color.fromARGB(255, 245, 193, 116))
      ),
    child: const Text('Button to press'),
    onPressed: () {},
    ),
    );
  }
  Widget exercise6() {
    return Container(
  height: 200,
  width: 200,
  //color: Colors.yellow,
  padding: const EdgeInsets.all(16.0),
  decoration: const BoxDecoration(
    color: Colors.yellowAccent,
    border: Border(
      
      top: BorderSide(width: 7,color: Color.fromARGB(255, 22, 133, 224)),
      left: BorderSide(width: 7,color:  Color.fromARGB(255, 79, 23, 209)),
      right: BorderSide(width: 7,color:   Color.fromARGB(255, 79, 23, 209)),
      bottom: BorderSide(width: 7,color: Color.fromARGB(255, 239, 23, 59)) ),
  ),
  child:  const Icon(
    Icons.warning,
    color:Colors.black,
    size: 46,
  ),
);
  }