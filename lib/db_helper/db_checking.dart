import 'package:exam_db_firebase/db_helper/db_helper.dart';
import 'package:exam_db_firebase/db_helper/main_page_with_db.dart';
import 'package:exam_db_firebase/ui/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:exam_db_firebase/picture.dart';

class DbChecking extends StatefulWidget {
  final String? name;
  DbChecking(this.name);
  @override
  State<StatefulWidget> createState() => _DbCheckingState();
}

class _DbCheckingState extends State<DbChecking> {
  List _images = [
    "https://im0-tub-ru.yandex.net/i?id=664bb63346b5a06d1e8edaf5b1236a0a&ref=rim&n=33&w=222&h=150",
    "https://3.bp.blogspot.com/-2M5BbpvEaCs/WrRNxTFvxZI/AAAAAAAA_2o/HIgtjtkrHYYmvXs_tOuRjlwELIkBi3qOwCEwYBhgL/s1600/The%2BDifference%2BBetween%2BHouse%2BBedroom%2B%2526%2BHotel%2BRoom%2B%252820%2529.jpg",
    "https://im0-tub-ru.yandex.net/i?id=7300aa26f3f222d3b4c956cf948fbe33&ref=rim&n=33&w=226&h=150",
    "https://im0-tub-ru.yandex.net/i?id=56dbfeb5cb7464f6fd7cc6faa7c94aa5&ref=rim&n=33&w=225&h=150",
    "https://im0-tub-ru.yandex.net/i?id=850f2c8d42aea63ab63fdbe6d0c1a7b9&ref=rim&n=33&w=267&h=150",
    "https://im0-tub-ru.yandex.net/i?id=c9d1072cf817ee3e42f728c94d3d3724&ref=rim&n=33&w=240&h=150",
    "https://im0-tub-ru.yandex.net/i?id=43b50c8bbbaa09ec28d7390e3d231019&ref=rim&n=33&w=200&h=150",
    "https://im0-tub-ru.yandex.net/i?id=9692650ba4ebca6b4489ba74b638be70&ref=rim&n=33&w=225&h=150",
    "https://im0-tub-ru.yandex.net/i?id=46278e50dc7b91c8d614a9568da6eca8&ref=rim&n=33&w=200&h=150",
    "https://im0-tub-ru.yandex.net/i?id=f2bcfcd8abf79a7820ebbab669a18f16&ref=rim&n=33&w=200&h=150",
    "https://i.pinimg.com/originals/8f/e4/76/8fe4760254eb2bea49e8701a8ba07d0e.jpg",
    "https://s7d2.scene7.com/is/image/ritzcarlton/_conversion?\$XlargeViewpRCRANCH_00086ort100pct\$",
    "https://jooinn.com/images/a-flower-shop-4.jpg",
  ];
  DatabaseHelper? _databaseHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _databaseHelper = DatabaseHelper();
    _add();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Picture>>(
        future: _databaseHelper!.getPictures(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.length != 0 ? MainPageWithDb(snapshot.data!.toList()) : MainPage(widget.name);
          }
          return CircularProgressIndicator();
        });
  }

  Future _add() async {
    for (int i = 0; i < _images.length; ++i) {
      var image = await http.get(
        Uri.parse(_images[i]),);
      var bytes = image.bodyBytes;
      Picture picture = Picture(id: i + 1, title: "${i + 1}-rasm", picture: bytes);
      _databaseHelper!.savePicture(picture);
      print("Yozilgan Picture: " + picture.toString());
    }
   // setState(() {});
  }
}
