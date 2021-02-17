import 'package:bleep/views/widgets/room_list.dart';
import 'package:flutter/material.dart';
import 'package:bleep/views/widgets/empty_appbar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EmptyAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          onPressed: () => null,
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            height: 50.0,
            color: Colors.black,
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
                width: double.infinity,
                child: Padding(
                    padding:
                        EdgeInsets.only(left: 18.0, top: 60.0, bottom: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "rooms",
                          style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.w700,
                              fontFamily: "MontserratAlternates"),
                        ),
                      ],
                    ))),
            Expanded(child: RoomList())
          ],
        ));
  }
}
