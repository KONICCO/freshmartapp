import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freshmartapp/models/menu.dart';
import 'cardkategori.dart';
import 'navigasibar.dart';
import 'appbar.dart';
import 'package:freshmartapp/buah.dart';

class kategori extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference kategori = firestore.collection('kategori');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Container(
              width: 220,
              height: 38,
              child: Center(
                  child: TextField(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(bottom: -10.0, left: 10),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Sayur, Buah dll',
                          suffixIcon: Icon(Icons.search))))),
          backgroundColor: Colors.lightGreen,
        ),
        body: Container(
          decoration:
              BoxDecoration(image: DecorationImage(image: NetworkImage(""))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Wrap(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: kategori
                            .orderBy('id', descending: false)
                            .snapshots(),
                        builder: (_, snapshot) {
                          if (snapshot.hasData) {
                            return Wrap(
                              spacing: 15.0,
                              runSpacing: 30.0,
                              children: (snapshot.data! as QuerySnapshot)
                                  .docs
                                  .map(
                                    (e) => Cardkategori(
                                      Menu(
                                        id: e['id'], 
                                        image: e['image'], 
                                        name: e['name']),
                                    ),
                                  )
                                  .toList(),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }),
                  ],
                ),
              ),
            ),
            //bottombar
          ),
          //bottombar
        ),
        //bottombar
      ),
    );
  }
}
