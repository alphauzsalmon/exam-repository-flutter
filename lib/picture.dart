
import 'dart:typed_data';

class Picture {
  int? id;
  String? title;
  Uint8List? picture;

  Picture({this.id, this.title, this.picture});

  Picture.fromMap(Map map) {
    this.id = map['Id'];
    this.title = map['Title'];
    this.picture = map['Picture'];
  }

  Map<String, dynamic> toMap() => {
    "Id": id,
    "Title": title,
    "Picture": picture,
  };
}
