import 'package:cloud_firestore/cloud_firestore.dart';
import 'PicList.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Picture.dart';

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
      theme: ThemeData(
         primarySwatch: Colors.pink,
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.indigo,
              accentColor: Color.fromARGB(255, 3, 100, 61))),
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
  List<Pic> narutoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Naruto Best Guys"),
      ),
      body: FutureBuilder<List<Pic>>(
       
        /// Initialize FlutterFire:
        future: getArt(),
        builder: (context, snapshot) {
          /// if Error
          if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          /// On completion
          if (snapshot.connectionState == ConnectionState.done) {
            narutoList = snapshot.data!;
            return buildGrid(narutoList);
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

  Future<List<Pic>> getArt() async {
    List<Pic> cards = [];
    await FirebaseFirestore.instance
        .collection('art')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((QueryDocumentSnapshot doc) {
        cards.add(Pic.fromDoc(doc));
      });
    });
    return cards;
  }

  Widget buildGrid(List<Pic> narutoList) {
    return RefreshIndicator(
      onRefresh: () async{
        narutoList=[];
        await getArt();
        setState(() {});
        return Future.value();
      },
      child: GridView.builder(
        
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
          ),
          itemCount: narutoList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              highlightColor: Colors.pink,
              onTap: () {
                Navigator.push(context, ArtDetails.getRoute(narutoList[index]));
              },
              child: Card(
                child: Container(
                
                color: Color.fromARGB(255, 183, 220, 176),
                child: Column(
                  
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text(
                        narutoList[index].title,
                        textAlign: TextAlign.center,
                        
                        style: TextStyle(fontSize: 20, fontFamily: 'RobotoMono'),
                      ),),
                    
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Center(child: 
                          Image.network(
                      height: 100,
                      narutoList[index].image,
                      fit: BoxFit.cover,
                    ),) 
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        narutoList[index].description,
                        style: TextStyle(fontSize: 14, fontFamily: 'RobotoMono'), 
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
