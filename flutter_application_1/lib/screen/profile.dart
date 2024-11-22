import 'package:flutter/material.dart';




class Profile extends StatefulWidget {
  const Profile({
    super.key,
    required this.counter,
  
    required this.selectedIndex
  });

  final int counter;
  final int selectedIndex; // Accept selectedIndex as a parameter
  final String title = "Profile Screen";
  
  @override 
  State<Profile> createState() => _ProfilePageState();

}

class _ProfilePageState extends State<Profile> {
  int counter = 0;
  int selectedIndex = 0;
@override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
  
          children: <Widget>[

            Icon(Icons.person,
          size: MediaQuery.of(context).size.width * 0.2),
          const Row(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
            'This is our Profile'
          )
          ]
          ),
          const Row(
        mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Email: "),
                      Text("juan.pueblo@upr.edu")
            
            ]),
          Text(
            '$counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          
        ],
      ),
    );
  }
}