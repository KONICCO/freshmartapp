import 'package:flutter/material.dart';
import 'package:freshmartapp/kategori.dart';
import 'package:freshmartapp/screens/theme.dart';

class splash extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/home.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 50, top: 140),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                'FreshMart',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
              ),
              SizedBox(height: 25),
            ],
          ),
          //
        ),
        Container(
          margin: const EdgeInsets.only(left: 50, bottom: 200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Selamat Datang',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ],
          ), //
        ),
        Container(
          margin: const EdgeInsets.only(left: 50, bottom: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Lakukan pembelian kebutuhan pangan dengan pengiriman yang cepat dan aman',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
          //
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 100, bottom: 80),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.green,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0)),
                    minimumSize: Size(200, 40), //////// HERE
                  ),
                  onPressed: () {
                    Route route = MaterialPageRoute(builder: (context) => kategori());
                    Navigator.push(context, route);
                  },
                  child: Text('Getting Started'),
                ),
            ),
          ],
        )
      ],
    ));
  }
}
