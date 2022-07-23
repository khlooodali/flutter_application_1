import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class Scan extends StatefulWidget {
  @override
  State<Scan> createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  final ImagePicker _picker = ImagePicker();
  final ImageCropper _cropper = ImageCropper();
  File? pickedimage1;
  bool _inProcess = false;
  File? pickedimage2;

  Widget getImageWidget() {
    if (pickedimage1 != null) {
      return Image.file(
        pickedimage1!,
        width: 250,
        height: 250,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        "assets/OIP.jpg",
        width: 250,
        height: 250,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Scan a photo',
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.pink[200],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/photo3.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getImageWidget(),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                      color: Colors.grey,
                      child: Text(
                        " From Camera",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        fetchimage(ImageSource.camera);
                      }),
                  MaterialButton(
                      color: Colors.pink[200],
                      child: Text(
                        " FROM Device",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        fetchimage(ImageSource.gallery);
                      })
                ],
              ),
            ],
          ),
        ));
    /*  drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Text(
                  'pages',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text(
                    'login',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginSignupScreen()),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginSignupScreen()),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('Home',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('About us',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      )),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => about_us()),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text(
                    'Help',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Gethelp()),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text(
                    'Contact us',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Help()),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text(
                    'Appoinment',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => appoinement()),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => instructions()),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text(
                    'Pharmacy',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Pharmcy()),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text(
                    'Doctors',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => infoPage()),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text(
                    'Scan',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Scan()),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text(
                    'X-ray Centers',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Rays()),
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text(
                    'log out',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Continue()),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
   */
  }
}
