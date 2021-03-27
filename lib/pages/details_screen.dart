import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  var image;
  var title_t, sub_title, price;
  DetailsScreen({this.image, this.title_t, this.sub_title, this.price});

  @override
  _DetailsScreenState createState() =>
      _DetailsScreenState(image, title_t, sub_title, price);
}

class _DetailsScreenState extends State<DetailsScreen> {
  var image;
  var title_t, sub_title, price;
  _DetailsScreenState(this.image, this.title_t, this.sub_title, this.price);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    color: Colors.blue[100],
                  )),
                  Expanded(
                      child: Container(
                    color: Colors.white,
                  )),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.grey[700],
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Icon(
                      Icons.share,
                      color: Colors.grey[700],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height / 2,
              margin: EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 1),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(image),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.blueGrey[100],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.teal),
                      child: Icon(Icons.favorite),
                    ),
                    Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.teal),
                          child: Center(
                              child: Text("Buy It",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                          ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
