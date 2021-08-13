import 'package:exam_db_firebase/db_helper/db_checking.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

FirebaseAuth _authUser = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _formKey = GlobalKey<FormState>();
  String? phoneNumber;
  String? name;
  TextEditingController smsCode = TextEditingController();
  bool forPhone = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOG IN"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(50.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Your name",
                    ),
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "You must enter your name";
                      }
                    },
                    onSaved: (n) {
                      name = n;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(50.0),
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Phone Number",
                    ),
                    initialValue: "+998",
                    maxLength: 13,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "You must enter your phone number";
                      }
                    },
                    onSaved: (p) {
                      phoneNumber = p;
                    },
                  ),
                ),
                ElevatedButton(
                  child: Text("Send"),
                  onPressed: () {
                    _phoneVerify();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _phoneVerify() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _authUser.verifyPhoneNumber(
        phoneNumber: phoneNumber!,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException credential) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 3),
              content: Text("Smsni tekshirib qaytadan urinib ko'ring!"),
            ),
          );
        },
        codeSent: (String verificationId, int? forceResendingToken) async {
          //show dialog to take input from the user
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: Text("Enter SMS Code"),
              content: Form(
                child: Column(
                  children: [
                    TextFormField(
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      controller: smsCode,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Sms Code",
                      ),
                      maxLength: 6,
                      validator: (text) {
                        if (text!.isEmpty) {
                          return "You must enter sms code";
                        }
                      },
                    ),
                    ElevatedButton(
                      child: Text("OK"),
                      onPressed: () async {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        var _credential = PhoneAuthProvider.credential(
                            verificationId: verificationId,
                            smsCode: smsCode.text);
                        auth.signInWithCredential(_credential);
                        await Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DbChecking(name)));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        codeAutoRetrievalTimeout: (String text) {
          print("TEXT: $text");
        },
      );
    }
  }
}
