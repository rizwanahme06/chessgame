import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImagePickerClass extends StatefulWidget {
  const ImagePickerClass({super.key});

  @override
  State<ImagePickerClass> createState() => ImagePickerClassState();
}

class ImagePickerClassState extends State<ImagePickerClass> {
  File? image;

  Future getImage({required ImageSource source}) async {
    try {
      final ImagePicker picker = await ImagePicker();
      XFile? image = await picker.pickImage(source: source);
      if (image == null) return;
      final SetImageParmanent = await saveImageParmanent(image.path);
      setState(() => this.image = SetImageParmanent);
    } on PlatformException catch (e) {
      print('Fail to pic image: $e');
    }
  }

  Future<File> saveImageParmanent(String imageKPath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imageKPath);
    final image = File('${directory.path}/name');

    return File(imageKPath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: .0),
      // backgroundColor: const Color.fromRGBO(158, 158, 158, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DecoratedBox(
            decoration: const BoxDecoration(
              color: Color(0xFF212121), // Grey 900
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Profile Picture',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      final snackBar = SnackBar(
                        content: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    const Icon(
                                      Icons.image,
                                      color: Colors.black,
                                    ),
                                    TextButton(
                                      child: const Text(
                                        'Select an image from gallery',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      onPressed: () =>
                                          getImage(source: ImageSource.gallery),
                                    )
                                  ]),
                              Divider(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const Icon(
                                    Icons.camera_alt,
                                    color: Colors.black,
                                  ),
                                  TextButton(
                                    child: const Text(
                                      'Take a picture with camera',
                                      style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    onPressed: () =>
                                        getImage(source: ImageSource.camera),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        backgroundColor:
                            const Color.fromARGB(60, 255, 255, 255),
                        behavior: SnackBarBehavior.floating,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Container(
                      child: image != null
                          ? Image.file(
                              image!,
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/profile.jpg',
                              height: 50,
                              width: 50,
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                      // decoration: const BoxDecoration(
                      //   image: DecorationImage(
                      //       image: AssetImage('lib/image/profile.jpg'),
                      //       fit: BoxFit.cover,
                      //       alignment: Alignment.center),
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
