import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class DetailScreen extends StatefulWidget{
  int id;
  String image;
  String name;
  int price;
  String stock;
  DetailScreen(this.id, this.image, this.name , this.price, this.stock,
  {Key? key})
  : super(key: key);
  State<DetailScreen> createState() => _DetailScreen(id,image,name,price,stock);
  
}
class _DetailScreen extends State<DetailScreen> {
  int _id;
  String _image;
  String _name;
  int _price;
  String _stock;
  //  name({Key? key}) : super(key: key);
  int i = 1;
  int price = 1000;

  _DetailScreen(this._id, this._image, this._name , this._price,this._stock);


  void _minus(){
    if(i > 1){
    setState(() {
      i--;
     
    });
    }
  }
  void _plus(){
    setState(() {
      i++;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon:  Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon:  Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: SizedBox(
            width: 260,
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
                        suffixIcon:  Icon(Icons.search))))),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 500,
                  height: 300,
                  // margin:  EdgeInsets.only(left: 15),
                  decoration:  BoxDecoration(
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(25),
                      //   topRight: Radius.circular(25),
                      // ),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                               _image))),
                ),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin:  EdgeInsets.only(
                                left: 10, bottom: 8, top: 8),
                            child:  Text(
                              _name,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                            )),
                        Container(
                          margin:  EdgeInsets.only(
                              right: 10, left: 10, bottom: 8, top: 13),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Text(
                                 NumberFormat.currency(
                                   locale: 'id', 
                                   symbol: 'Rp',
                                   decimalDigits:0)
                                   .format(_price,
                                   ),
                                 
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                               Text(
                                'stock: ${_stock}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: 7,
                            color: Color.fromARGB(255, 252, 252, 252)),
                        Container(
                          margin:  EdgeInsets.only(
                              right: 10, left: 10, top: 13),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deskripsi Produk',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Consectetur labore esse minim enim pariatur occaecat dolor cupidatat labore magna nostrud in elit eu.',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: _minus,
                            child: Icon(
                            Icons.remove,
                            size: 20,
                          ),
                          ),
                          
                          SizedBox(width: 20),
                          Text(
                            '${i}',
                            style: GoogleFonts.montserrat(fontSize: 20),
                          ),
                          SizedBox(width: 20),
                          InkWell(
                            onTap: _plus,
                            child: Icon(
                            Icons.add,
                            size: 20,
                          ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                // margin:  EdgeInsets.only(left: 100, bottom: 80),
                height: 40,
                width: 200.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    // minimumSize: Size(50, 40), //////// HERE
                  ),
                  onPressed: () {},
                  child: Text('+ Keranjang'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
