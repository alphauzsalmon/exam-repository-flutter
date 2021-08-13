import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoomPage extends StatefulWidget {
  final ImageProvider? _imageWidget;
  RoomPage(this._imageWidget);
  @override
  State<StatefulWidget> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage> {
  var today =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .day;
  var today2 =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .month;
  var today3 =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .year;
  var tomorrow = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day + 1)
      .day;
  var tomorrow2 = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day + 1)
      .month;
  var tomorrow3 = DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day + 1)
      .year;
  bool price = false;
  bool price2 = false;
  bool price3 = false;
  int room = 250;
  int services = 0;
  int total = 0;
  String srv = "", srv2 = "", srv3 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            width: 60.0,
            height: 50.0,
            child: CircleAvatar(
              backgroundImage: widget._imageWidget,
            ),
          ),
        ],
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Container(
        color: Colors.green,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Summary",
                  style: TextStyle(color: Colors.white, fontSize: 30.0),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: ImageIcon(AssetImage("assets/icons/Filter.png"),
                            color: Colors.yellow),
                      ),
                      Text(
                        "Edit",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                ),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 132,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Miami St Hotel",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.star_border_outlined,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "Arrival",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text("$today/$today2/$today3"),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "Departure",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text("$tomorrow/$tomorrow2/$tomorrow3"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "Room",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text("206"),
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                "Staying",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text("1 Night"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 260.0),
                      child: Text(
                        "Services",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 130.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://i.pinimg.com/originals/8f/e4/76/8fe4760254eb2bea49e8701a8ba07d0e.jpg"),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                price
                                    ? Container(
                                        child: Text("+20 USD"),
                                      )
                                    : Text(""),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                price = !price;
                                _parking();
                              });
                            },
                          ),
                          InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://s7d2.scene7.com/is/image/ritzcarlton/_conversion?\$XlargeViewpRCRANCH_00086ort100pct\$"),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                price2
                                    ? Container(
                                        child: Text("+20 USD"),
                                      )
                                    : Text(""),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                price2 = !price2;
                                _gym();
                              });
                            },
                          ),
                          InkWell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://jooinn.com/images/a-flower-shop-4.jpg"),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                price3
                                    ? Container(
                                        child: Text("+20 USD"),
                                      )
                                    : Text(""),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                price3 = !price3;
                                _flower();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 210.0),
                      child: Text(
                        "Payment Details",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("206 room x 1 night"),
                        Text(
                          "$room USD",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Services$srv$srv2$srv3"),
                        Text(
                          "$services USD",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${total + room}.00 USD",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Payment",
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  _parking() {
    price ? total += 20 : total -= 20;
    price ? services += 20 : services -= 20;
    price ? srv = "(Parking)" : srv = "";
  }

  _gym() {
    price2 ? total += 20 : total -= 20;
    price2 ? services += 20 : services -= 20;
    price2 ? srv2 = "(Gym)" : srv2 = "";
  }

  _flower() {
    price3 ? total += 20 : total -= 20;
    price3 ? services += 20 : services -= 20;
    price3 ? srv3 = "(Flower)" : srv3 = "";
  }
}
