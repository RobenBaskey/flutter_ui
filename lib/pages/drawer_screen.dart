import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  var item_color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal[800],
      child: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('asset/images/dfdf.jpg'),
            ),
            title: Text(
              "Roben Baskey",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            subtitle: Text(
              "Active Now",
              style: TextStyle(color: item_color),
            ),
          ),
          SizedBox(
            height: 70,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.pets,
                    color: Colors.white,
                  ),
                  title: GestureDetector(
                    onTap: (){
                      Fluttertoast.showToast(
                          msg: "This is Center Short Toast",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          fontSize: 16.0
                      );
                    },
                    child: Text(
                      "Adoption",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.padding, color: item_color),
                  title: Text(
                    "Donation",
                    style: TextStyle(
                        color: item_color, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.add, color: item_color),
                  title: Text(
                    "Add Pet",
                    style: TextStyle(
                        color: item_color, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.favorite, color: item_color),
                  title: Text(
                    "Favourite",
                    style: TextStyle(
                        color: item_color, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.message, color: item_color),
                  title: Text(
                    "Message",
                    style: TextStyle(
                        color: item_color, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle, color: item_color),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                        color: item_color, fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.settings, color: item_color),
                  title: Text(
                    "Settings",
                    style: TextStyle(
                        color: item_color, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text("Log Out",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              )
            ),
          ),
        ],
      ),
    );
  }
}
