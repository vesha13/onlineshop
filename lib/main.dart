import 'package:cloud_firestore/cloud_firestore.dart';
import 'List.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Card.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => print(value.options.projectId));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home: MyArtApp(),
    );
  }
}

class MyArtApp extends StatefulWidget {
  MyArtApp({Key? key}) : super(key: key);

  @override
  State<MyArtApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyArtApp> {
  List<MyCard> item = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sneakers Shop"),
      ),
      body: FutureBuilder<List<MyCard>>(
       
        /// Initialize FlutterFire:
        future: getArt(),
        builder: (context, snapshot) {
          /// if Error
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          /// On completion
          if (snapshot.connectionState == ConnectionState.done) {
            item = snapshot.data!;
            return buildGrid(item);
          }

          /// On Loading
          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 3,
          ));
        },
      ),
    );
  }

  Future<List<MyCard>> getArt() async {
    List<MyCard> cards = [];
    await FirebaseFirestore.instance
        .collection('onlineshop')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((QueryDocumentSnapshot doc) {
        cards.add(MyCard.fromDoc(doc));
      });
    });
    return cards;
  }

  Widget buildGrid(List<MyCard> item) {
    return RefreshIndicator(
      onRefresh: () async{
        item=[];
        await getArt();
        setState(() {});
        return Future.value();
      },
      child: GridView.builder(
        
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemCount: item.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              
              onTap: () {
                Navigator.push(context, ArtDetails.getRoute(item[index]));
              },
              child: Card(
                child: Container(
                
                color: Color.fromARGB(255, 195, 182, 148),
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text(
                        item[index].title,
                        textAlign: TextAlign.left,
                        
                        style: TextStyle(fontSize: 22),
                      ),),
                    
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Center(child: 
                          Image.network(
                      width: 140,
                      item[index].img,
                      fit: BoxFit.cover,
                    ),) 
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        item[index].desc,
                        style: TextStyle(fontSize: 12), 
                      ),
                    ),
                  ],
                ),
              ),
              ),
            );
          }),
    );
  }
}
