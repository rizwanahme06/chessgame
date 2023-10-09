import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import '../componenet/config.dart';
import '../componenet/imagepicker.dart';
import '../componenet/profile_text.dart';
import 'game_board.dart';

class Profile extends StatefulWidget {
  final GoogleSignInAccount user;

  const Profile({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController statusController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool _isValidMove = false;

  @override
  void initState() {
    super.initState();
    // Set initial value for usernameController
    if (widget.user.email != null) {
      final emailParts = widget.user.email.split('@');
      if (emailParts.isNotEmpty) {
        usernameController.text = emailParts[0];
      }
    }
  }

  Future<void> save(BuildContext context) async {
    if (usernameController.text.isNotEmpty) {
      var regbody = {
        'status': statusController.text,
        'username': usernameController.text,
        'firstname': widget.user.displayName ?? firstnameController.text,

        // 'firstname': user ? user.displayName : firstnameController.text,
        'lastname': lastnameController.text,
        'country': countryController.text,
        'location': locationController.text,
        'language': languageController.text,
        'email': widget.user.email ?? emailController.text
      };

      print('Request URL: ${Uri.parse(User_data_create)}');
      print('Request Body: ${jsonEncode(regbody)}');
      var res = await http.post(Uri.parse(User_data_create),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regbody));
      print('Response Status Code: ${res.statusCode}');
      print('Response Body: ${res.body}');
      var jsonResponse = jsonDecode(res.body);
      print(jsonResponse['message']);

      // if (jsonResponse['message']) {
      //   // Navigator.push(
      //   //   context,
      //   //   MaterialPageRoute(builder: (context) => const GameBoard()),
      //   // );
      // } else {
      //   print('Something went wrong');
      // }

      if (res.statusCode == 200) {
        // return json.decode(res.body)['success'];
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GameBoard(
                    usernameController: usernameController,
                  )),
        );
      } else {
        throw Exception('fail to load data from the secret');
      }
    } else {
      setState(() {
        _isValidMove = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.close_outlined)),
        title: const Text(
          'Edit Profile',
        ),
        centerTitle: true,
        actions: [
          IconButton(
              // onPressed: () => {save()},
              onPressed: () {
                save(context);
              },
              icon: const Icon(Icons.check_outlined))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImagePickerClass(),
          Profile_Text(
            controller: statusController,
            text: "Status",
            errortext: _isValidMove ? "Enter proper info" : null,
          ),
          SizedBox(height: 5),
          Profile_Text(
            controller: usernameController,
            text: "Username",
            errortext: _isValidMove ? "Enter proper info" : null,
          ),
          SizedBox(height: 5),
          Profile_Text(
            controller: widget.user.email != null
                ? TextEditingController(text: widget.user.email)
                : emailController,
            // controller: widget.user.email ?? emailController,
            text: "Email",
            errortext: _isValidMove ? "Enter proper info" : null,
          ),
          SizedBox(height: 5),
          Profile_Text(
            controller: widget.user.displayName != null
                ? TextEditingController(text: widget.user.displayName)
                : emailController,
            // controller: widget.user.displayName ?? firstnameController.text,
            text: "First Name",
            errortext: _isValidMove ? "Enter proper info" : null,
          ),
          SizedBox(height: 5),
          Profile_Text(
            controller: lastnameController,
            text: "Last Name",
            errortext: _isValidMove ? "Enter proper info" : null,
          ),
          SizedBox(height: 5),
          Profile_Text(
            controller: countryController,
            text: "Country",
            errortext: _isValidMove ? "Enter proper info" : null,
          ),
          SizedBox(height: 5),
          Profile_Text(
            controller: locationController,
            text: "Location",
            errortext: _isValidMove ? "Enter proper info" : null,
          ),
          SizedBox(height: 5),
          Profile_Text(
            controller: languageController,
            text: "Language",
            errortext: _isValidMove ? "Enter proper info" : null,
          ),
        ],
      ),
    );
  }
}
