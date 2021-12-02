// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crypto/model/api_methods.dart';
import 'package:crypto/ui/add_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  getValues() async{
      bitcoin= await getPrice("bitcoin");
      thether= await getPrice('thether');
      etherum=await getPrice('etherum');
      setState(() {
        
      });
      
    }
  double bitcoin = 0.0;
  double etherum = 0.0;
  double thether = 0.0;
    @override
    // ignore: must_call_super
    void initState() {
      getValues();
      
    }
  @override
  Widget build(BuildContext context) {
   
    
    getvalue(String id,double amount){if(id=="shiling"){
      return bitcoin*amount;
    }
      else if(id=="smuni"){
      return thether*amount;
    }
    else {
      return etherum*amount;
    }
    
    }
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('coins')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              // ignore: prefer_const_literals_to_create_immutables
              return ListView(
                children: snapshot.data!.docs.map((document) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      // ignore: prefer_const_literals_to_create_immutables
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('coin:${document.id}'),
                        Text("Amount Owned:\$${getvalue(document.id,document['Amount']).toStringAsFixed(2)}"),
                      ],
                    ),
                  );
                }).toList(),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddView()),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.amber,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
