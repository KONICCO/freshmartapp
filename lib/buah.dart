import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freshmartapp/models/menubuah.dart';

import 'package:freshmartapp/cardbuah.dart';
class buah extends StatefulWidget {
  int id;
  String image;
  String name;
  buah(this.id, this.image, this.name ,
  {Key? key})
  : super(key: key);

  @override
  State<buah> createState() => _buahState(id,image,name);
}

class _buahState extends State<buah> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference buah = firestore.collection('buah');
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
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Wrap(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 20,
              runSpacing: 30,
              children: [
                StreamBuilder<QuerySnapshot>(
                        stream: buah
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
                                    (e) => Cardbuah(
                                      Menubuah(
                                        id: e['id'], 
                                        image: e['image'], 
                                        name: e['name'],
                                        price: e['price'],
                                        stock: e['stock']),
                                    ),
                                  )
                                  .toList(),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        }),
                //Cardbuah(Menubuah(id: 1, image: 'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full/MTA-5095900/kedaisayur_kedaisayur-buah-naga-buah-buahan--1-kg-_full07.jpg', name: 'Buah Naga 1KG', price: 20000))
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Pesanan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifisikasi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Akun',
            ),
          ],
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
