import 'package:flutter/material.dart';
import 'package:flutter_ui/model/image_model.dart';
import 'package:flutter_ui/model/pet_model.dart';

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

  List<ImageModel> image_data =[
    ImageModel("Cat", "This is Cat", "\$100"),
    ImageModel("Dog", "This is Dog", "\$150"),
    ImageModel("Cat", "This is Cat", "\$100"),
  ];
  @override
  Widget build(BuildContext context) {
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
              height: 50,
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
                              xOffset = 250;
                              yOffset = 130;
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
                  CircleAvatar()
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
                            Container(
                              child: IconButton(
                                icon: Icon(pet.icon),
                                onPressed: () {
                                  print(pet.name);
                                },
                              ),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
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
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  children: image_data.map((image) {
                      return Row(
                        children: <Widget>[
                          Expanded(
                              child: Stack(
                            children: <Widget>[
                              Container(
                                height: 170,
                                margin: EdgeInsets.only(top: 20,left: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue[100]
                                ),
                                child: Image.asset('asset/images/catt.png'),
                              ),
                            ],
                          )),
                          Expanded(child: Text("Roben")),
                        ],
                      );
              }).toList()),
            )
          ],
        ),
      ),
    );
  }
}
