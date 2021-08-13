import 'dart:io';
import 'package:exam_db_firebase/ui/roomPage.dart';
import 'package:exam_db_firebase/ui/room_2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class MainPage extends StatefulWidget {
  final String? name;
  MainPage(this.name);
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List rooms = [
    "https://im0-tub-ru.yandex.net/i?id=664bb63346b5a06d1e8edaf5b1236a0a&ref=rim&n=33&w=222&h=150",
    "https://3.bp.blogspot.com/-2M5BbpvEaCs/WrRNxTFvxZI/AAAAAAAA_2o/HIgtjtkrHYYmvXs_tOuRjlwELIkBi3qOwCEwYBhgL/s1600/The%2BDifference%2BBetween%2BHouse%2BBedroom%2B%2526%2BHotel%2BRoom%2B%252820%2529.jpg",
  ];
  List room1 = [
    "https://im0-tub-ru.yandex.net/i?id=7300aa26f3f222d3b4c956cf948fbe33&ref=rim&n=33&w=226&h=150",
    "https://im0-tub-ru.yandex.net/i?id=56dbfeb5cb7464f6fd7cc6faa7c94aa5&ref=rim&n=33&w=225&h=150",
    "https://im0-tub-ru.yandex.net/i?id=850f2c8d42aea63ab63fdbe6d0c1a7b9&ref=rim&n=33&w=267&h=150",
    "https://im0-tub-ru.yandex.net/i?id=c9d1072cf817ee3e42f728c94d3d3724&ref=rim&n=33&w=240&h=150",
  ];
  List room2 = [
    "https://im0-tub-ru.yandex.net/i?id=43b50c8bbbaa09ec28d7390e3d231019&ref=rim&n=33&w=200&h=150",
    "https://im0-tub-ru.yandex.net/i?id=9692650ba4ebca6b4489ba74b638be70&ref=rim&n=33&w=225&h=150",
    "https://im0-tub-ru.yandex.net/i?id=46278e50dc7b91c8d614a9568da6eca8&ref=rim&n=33&w=200&h=150",
    "https://im0-tub-ru.yandex.net/i?id=f2bcfcd8abf79a7820ebbab669a18f16&ref=rim&n=33&w=200&h=150",
  ];
  List<bool> bookmark = [false, false];
  File? _image;
  final ImagePicker _picker = ImagePicker();
  late ImageProvider? _imageWidget;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("INternet pictures");
    if (_image != null) {
      _imageWidget = FileImage(_image!);
    } else {
      _imageWidget = AssetImage("assets/icons/Cmaera.png");
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
                  Text(widget.name!),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit),),
                ],
              ),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
            ),),
            Text("Profile settings", style: TextStyle(fontSize: 30.0),),
            IconButton(onPressed: () {},
                icon: Icon(Icons.logout)),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Internet Pictures"),
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
                    image: DecorationImage(
                        image:
                            bookmark[0] ? NetworkImage(room1[index]) : NetworkImage(room2[index]),
                        fit: BoxFit.fill),
                  ),
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
              image: DecorationImage(
                  image: NetworkImage(rooms[index]),
                  fit: BoxFit.fill),
            ),
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
            context, MaterialPageRoute(builder: (context) => index == 0 ? RoomPage(_imageWidget) : Room2Page(_imageWidget)));
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
        _imageWidget = AssetImage("assets/icons/Cmaera.png");
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
