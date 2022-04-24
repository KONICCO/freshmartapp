import 'package:flutter/material.dart';
import 'package:freshmartapp/models/menubuah.dart';
import 'package:freshmartapp/screens/detail_screen.dart';

class Cardbuah extends StatelessWidget {
  final Menubuah menu;
  Cardbuah(this.menu);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 153,
            height: 153,
            margin: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(menu.image),
                )),
          ),
          Container(
            // color: Colors.lightGreen,
            width: 153,
            margin: EdgeInsets.only(left: 15),
            decoration: new BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: new BorderRadius.only(
                  bottomLeft: const Radius.circular(10.0),
                  bottomRight: const Radius.circular(10.0),
                )),
            child: Column(children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 8, top: 8),
                  child: Text(
                    '${menu.name}',
                    style: TextStyle(color: Colors.white),
                  )),
              Text(
                'Rp. ${menu.price}',
                style: TextStyle(color: Colors.white),
              ),
              // Text('${menu.stock}'),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (Context) => DetailScreen(
                              menu.id, menu.image, menu.name, menu.price ,menu.stock)));
                },
                child: Container(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
                  child: Text(
                    'Beli',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
