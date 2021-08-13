import 'dart:io';
import 'package:exam_db_firebase/picture.dart';
import 'package:exam_db_firebase/ui/room2_with_db.dart';
import 'package:exam_db_firebase/ui/room_with_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class MainPageWithDb extends StatefulWidget {
  final List<Picture>? _pictures;
  MainPageWithDb(this._pictures);
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPageWithDb> {
  List<Picture> rasmlar = [];
  List<Picture> rooms = [];
  List<Picture> room1 = [];
  List<Picture> room2 = [];
  List<Picture> room3 = [];
  List<bool> bookmark = [false, false];
  File? _image;
  final ImagePicker _picker = ImagePicker();
  late ImageProvider _imageWidget;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("DB pictures");
    for (int i = 0; i < widget._pictures!.length; ++i) {
      rasmlar.add(widget._pictures![i]);
    }
    rooms = [rasmlar[0], rasmlar[1]];
    room1 = [rasmlar[2], rasmlar[3], rasmlar[4], rasmlar[5]];
    room2 = [rasmlar[6], rasmlar[7], rasmlar[8], rasmlar[9]];
    room3 = [rasmlar[10], rasmlar[11], rasmlar[12]];
    if (_image != null) {
      _imageWidget = FileImage(_image!);
    } else {
      _imageWidget = AssetImage("assets/icons/Camera.png");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  InkWell(child: CircleAvatar(
                    maxRadius: 50.0,
                    backgroundImage: _imageWidget,
                  ),
                    onTap: () {
                      _showPicker(context);
                    },),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),),
            Text("Settings", style: TextStyle(fontSize: 30.0),),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("DB Pictures"),
        iconTheme: (
            IconThemeData(
              color: Colors.green,
            )
        ),
        actions: [
          Container(
            //margin: EdgeInsets.only(left: 100.0),
            width: 60.0,
            height: 50.0,
            child: CircleAvatar(
              backgroundImage: _imageWidget,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: 50.0,
            alignment: Alignment.centerLeft,
            child: Text(
              "Available room",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 280.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _listView(context, index);
              },
              itemCount: rooms.length,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Photos",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  bookmark[0] ? "Room - 206" : "Room - 207",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(15.0),
                  width: 180.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    shape: BoxShape.rectangle,
                  ),
                  child: bookmark[0] ? Image.memory(room1[index].picture!) : Image.memory(room2[index].picture!),
                );
              },
              itemCount: room1.length,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Book now",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.greenAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              fixedSize: Size(300.0, 50.0),
            ),
          ),
        ],
      ),
    );
  }

  _listView(BuildContext context, index) {
    return InkWell(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            width: 220.0,
            height: 250.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              shape: BoxShape.rectangle,
            ),
            child: Image.memory(rooms[index].picture!),
          ),
          Positioned(
            child: Row(
              children: [
                Text(
                  "Room-${206+index}",
                  style: TextStyle(color: Colors.white),
                ),
                InkWell(
                  child: bookmark[index]
                      ? Icon(
                    Icons.bookmark,
                    color: Colors.yellow,
                  )
                      : Icon(
                    Icons.bookmark_border,
                  ),
                  onTap: () {
                    setState(() {
                      bookmark[index] = !bookmark[index];
                    });
                  },
                )
              ],
            ),
            left: 130.0,
            top: 30.0,
          ),
          Positioned(
            child: Padding(
              padding: EdgeInsets.only(left: 50.0),
              child: Text(
                "250 USD(Per Night)",
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
            top: 260.0,
          ),
          Positioned(
            child: Text(
              "${index + 1}/${rooms.length}",
              style: TextStyle(color: Colors.white),
            ),
            top: 230.0,
            left: 170.0,
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => index == 0 ? RoomPageWithDb(_imageWidget, room3) : Room2PageWithDb(_imageWidget, room3)));
      },
    );
  }

  _imgFromGallery() async {
    XFile? image =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = File(image!.path);
      if (_image != null) {
        _imageWidget = FileImage(_image!);
      } else {
        _imageWidget = AssetImage("assets/icons/Camera.png");
      }
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.photo_library),
                  title: new Text('Photo Library'),
                  onTap: () {
                    _imgFromGallery();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
