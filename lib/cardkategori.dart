import 'package:flutter/material.dart';
import 'package:freshmartapp/models/menu.dart';
import 'package:freshmartapp/buah.dart';

class Cardkategori extends StatelessWidget {
  final Menu menu;
  Cardkategori(this.menu);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () {
          Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (Context) => buah(
                              menu.id, menu.image, menu.name,)));
        },
        child: Container(
          child: Column(
            children: [
              Container(
                width: 153,
                height: 115,
                margin: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0),
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      // image: AssetImage(menu.image),
                      image: NetworkImage(menu.image)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15.0),
                width: 153,
                height: 58,
                decoration: new BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(10.0),
                      bottomRight: const Radius.circular(10.0),
                    )),
                child: Center(
                  child: Text(
                    '${menu.name}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
