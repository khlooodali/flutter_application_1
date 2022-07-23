import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/allertdialog.dart';
import 'package:flutter_application_1/constants/pallete.dart';
import 'package:flutter_application_1/doctors/doclogin.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:ui';

import 'package:http/http.dart' as http;

class Signdoc extends StatefulWidget {
  @override
  State<Signdoc> createState() => _docState();
}

class _docState extends State<Signdoc> {
  bool isMale = true;
  final _docname = TextEditingController();
  final _docusername = TextEditingController();

  final _docprice = TextEditingController();

  final _docemail = TextEditingController();

  final _docphone = TextEditingController();

  final _docpass = TextEditingController();

  final _docdep = TextEditingController();
  final _docaddress = TextEditingController();
  final _docabout = TextEditingController();
  bool visablepassword = true;
  final GlobalKey<FormState> _formkey = GlobalKey();
  final ImagePicker _picker = ImagePicker();
  final ImageCropper _cropper = ImageCropper();
  File? pickedimage1;
  bool _inProcess = false;
  File? pickedimage2;
  final icon = CupertinoIcons.moon_stars;

  Widget getImageWidget() {
    if (pickedimage1 != null) {
      return Image.file(
        pickedimage1!,
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        "assets/person.png",
        width: 150,
        height: 150,
        fit: BoxFit.cover,
      );
    }
  }

  fetchimage(ImageSource source) async {
    this.setState(() {
      _inProcess = true;
    });
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      CroppedFile? cropped = await _cropper.cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
          compressQuality: 100,
          maxWidth: 700,
          maxHeight: 700,
          compressFormat: ImageCompressFormat.jpg,
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: 'Crop Image',
                toolbarColor: Colors.pink[200],
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                statusBarColor: Colors.pink,
                backgroundColor: Colors.white,
                lockAspectRatio: false),
            IOSUiSettings(
              title: 'Crop Image',
            ),
          ]);
      this.setState(() {
        pickedimage1 = File(cropped!.path);
        _inProcess = false;
      });
    } else {
      this.setState(() {
        _inProcess = false;
      });
    }
  }

  Future savedoctor() async {
    var res = await http.post(
        Uri.parse('https://procanecer.herokuapp.com/api/v1/doctor/adddoctor'),
        body: <String, String>{
          'name': _docname.text,
          'email': _docemail.text,
          'password': _docpass.text,
          'address': _docaddress.text,
          'specialize': _docdep.text,
          'about': _docabout.text,
          'avatar': '',
          'phone': _docphone.text
        });

    print(res.body);

    var dialog = CustomAlertDialog(
        title: "Signed UP Successfuly",
        message: "you can Login in Our App ",
        onPostivePressed: () {
          Navigator.push(
              context, new MaterialPageRoute(builder: (context) => doclogin()));
        },
        onNegativePressed: () {
          Navigator.of(context).pop();
        },
        positiveBtnText: 'ok',
        negativeBtnText: "Cancel",
        bgColor: Colors.white,
        circularBorderRadius: 15.0);
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 6, 84, 147),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Center(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ClipOval(
                      child: getImageWidget(),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4,
                    child: ClipOval(
                      child: Container(
                        color: Colors.blue,
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            fetchimage(ImageSource.gallery);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            buildSignupDoctor(),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: bttn(),
            )
          ],
        ),
      ),
    );

    throw UnimplementedError();
  }

  Container buildSignupDoctor() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          SingleChildScrollView(
            child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _docname,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: " Name",
                          prefixIcon: Icon(Icons.account_box_rounded),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintStyle: TextStyle(
                              fontSize: 14, color: Palette.textColor1),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _docemail,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@gmail.com')) {
                            return 'please enter your Email';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          prefixIcon: Icon(Icons.email),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintStyle: TextStyle(
                              fontSize: 14, color: Palette.textColor1),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    //textfiled with dropdown

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _docaddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Address",
                          prefixIcon: Icon(Icons.home),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintStyle: TextStyle(
                              fontSize: 14, color: Palette.textColor1),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _docphone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your phone number';
                          } else if (value.length < 11) {
                            return 'Invalid phone number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          prefixIcon: Icon(Icons.call),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintStyle: TextStyle(
                              fontSize: 14, color: Palette.textColor1),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _docprice,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your price for detection';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "detection price",
                          prefixIcon: Icon(Icons.money),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintStyle: TextStyle(
                              fontSize: 14, color: Palette.textColor1),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _docdep,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your specialization';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: " Your Specialize",
                          enabledBorder: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(10),
                          hintStyle: TextStyle(
                              fontSize: 14, color: Palette.textColor1),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _docpass,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return 'please enter strong password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.textColor1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Palette.textColor1),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            hintStyle: TextStyle(
                                fontSize: 14, color: Palette.textColor1),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visablepassword = !visablepassword;
                                  });
                                },
                                icon: Icon(visablepassword
                                    ? Icons.visibility
                                    : Icons.visibility_off))),
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          setState(() {
                            _docpass.text = value.trim();
                          });
                        },
                        obscureText: visablepassword,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        maxLines: 5,
                        controller: _docabout,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This value is needed';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Type about Your Self",
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Palette.textColor1),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintStyle: TextStyle(
                              fontSize: 14, color: Palette.textColor1),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10),
            child: Row(children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMale = true;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          color:
                              isMale ? Palette.textColor2 : Colors.transparent,
                          border: Border.all(
                              width: 1,
                              color: isMale
                                  ? Colors.transparent
                                  : Palette.textColor1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Icon(
                        Icons.account_box_rounded,
                        color: isMale ? Colors.white : Palette.iconColor,
                      ),
                    ),
                    Text(
                      "Male",
                      style: TextStyle(color: Palette.textColor1),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 100,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isMale = false;
                  });
                },
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      margin: EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                          color:
                              isMale ? Colors.transparent : Palette.textColor2,
                          border: Border.all(
                              width: 1,
                              color: isMale
                                  ? Palette.textColor1
                                  : Colors.transparent),
                          borderRadius: BorderRadius.circular(15)),
                      child: Icon(
                        Icons.account_box_rounded,
                        color: isMale ? Palette.iconColor : Colors.white,
                      ),
                    ),
                    Text(
                      "Female",
                      style: TextStyle(color: Palette.textColor1),
                    )
                  ],
                ),
              ),
            ]),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  Container bttn() {
    return Container(
      width: 400,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextButton(
            child: Text(
              'Sign Up',
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
            onPressed: () {
              savedoctor();
              _formkey.currentState!.validate();
              /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Profile(
                            name: _docname.text,
                            about: _docabout.text,
                            price: _docprice.text,
                            phone: _docphone.text,
                            email: _docemail.text,
                            special: _docdep.text,
                            address: _docaddress.text,
                          ))); */
            }),
      ),
    );
  }
}
