//import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


import 'screen/home.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      //Route controls

      home: MyHomePage(title: 'Flutter Demo Home Page'),
      
    );
  }
}



// NAV BAR BELOW




// Pages are defined below

// MAIN 4Y THIS SHOULD EVENTUALLY BE REPLACED WITH A MAP OR LIST OF STUFF








// class Settings extends StatelessWidget {
//   const Settings({
//     super.key,
//     required this.counter,
//     required this.selectedIndex,
//   });

//   final int counter;
//   final int selectedIndex; // Accept selectedIndex as a parameter

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           const Text(
//             'This is our Profile',
//           ),
//           Text(
//             '$counter',
//             style: Theme.of(context).textTheme.headlineMedium,
//           ),
//           const Text(
//             'Hello!',
//           ),
//           Text('Selected Index: $selectedIndex'), // Display the selectedIndex
//         ],
//       ),
//     );
//   }
// }