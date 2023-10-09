// import 'package:flutter/material.dart';

// class Floating_Text extends StatefulWidget {
//   const Floating_Text({super.key});

//   @override
//   State<Floating_Text> createState() => _Floating_TextState();
// }

// class _Floating_TextState extends State<Floating_Text> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: <Widget>[
//                 const Icon(
//                   Icons.image,
//                   color: Colors.black,
//                 ),
//                 TextButton(
//                   child: const Text(
//                     'Select an image from gallery',
//                     style: TextStyle(
//                         color: Colors.black87,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   onPressed: () {},
//                 )
//               ]),
//           const Divider(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               const Icon(
//                 Icons.camera_alt,
//                 color: Colors.black,
//               ),
//               TextButton(
//                   child: const Text(
//                     'Take a picture with camera',
//                     style: TextStyle(
//                         color: Colors.black87,
//                         fontSize: 22,
//                         fontWeight: FontWeight.w600),
//                   ),
//                   onPressed: () {}),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
