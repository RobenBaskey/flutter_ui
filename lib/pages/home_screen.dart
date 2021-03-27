import 'package:flutter/material.dart';
import 'package:flutter_ui/model/image_model.dart';
import 'package:flutter_ui/model/pet_model.dart';
import 'package:flutter_ui/pages/details_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDraweOpend = false;

  List<PetModel> pets = [
    PetModel(Icons.pedal_bike, "Cats"),
    PetModel(Icons.pedal_bike, "Dogs"),
    PetModel(Icons.pedal_bike, "Parrots"),
    PetModel(Icons.pedal_bike, "Cats"),
    PetModel(Icons.pedal_bike, "Cats"),
    PetModel(Icons.pedal_bike, "Cats"),
  ];

  List<ImageModel> image_data = [
    ImageModel("Cat", "This is Cat", "\$100"),
    ImageModel("Dog", "This is Dog", "\$150"),
    ImageModel("Cat", "This is Cat", "\$100"),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      color: Colors.grey,
      duration: Duration(microseconds: 250),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  isDraweOpend
                      ? IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDraweOpend = false;
                            });
                          })
                      : IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            setState(() {
                              xOffset = size.width - 100;
                              yOffset = size.height / 5;
                              scaleFactor = 0.6;
                              isDraweOpend = true;
                            });
                          }),
                  Column(
                    children: <Widget>[
                      Text("Location"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Thakurgaon, Bangladesh",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('asset/images/dfdf.jpg'),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(Icons.search),
                  Text("Enter your favourite"),
                  IconButton(icon: Icon(Icons.settings), onPressed: () {})
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 100,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: pets.map((pet) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Fluttertoast.showToast(msg: pet.name);
                              },
                              child: Container(
                                child: IconButton(
                                  icon: Icon(pet.icon),
                                  onPressed: () {},
                                ),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(pet.name)
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  children: image_data.map((imaged) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(
                                  image: 'asset/images/catt.png',
                                  title_t : imaged.name,
                                  sub_title: imaged.description,
                                  price: imaged.price
                                )
                        ));
                  },
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Stack(
                          children: <Widget>[
                            Container(
                              height: 170,
                              margin: EdgeInsets.only(top: 20, left: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue[100]),
                              child: Hero(
                                tag: "details_image",
                                  child: Image.asset(
                                'asset/images/catt.png',
                                width: double.infinity,
                              )),
                            ),
                          ],
                        )),
                        Expanded(
                            child: Stack(
                          children: <Widget>[
                            Container(
                              height: 150,
                              margin: EdgeInsets.only(
                                  top: 40, bottom: 15, right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  color: Colors.grey[50]),
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      imaged.name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      imaged.description,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text("Price : ${imaged.price}")
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                );
              }).toList()),
            )
          ],
        ),
      ),
    );
  }
}
