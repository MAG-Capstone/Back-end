
import 'package:flutter/material.dart';

class Settings extends StatefulWidget{
  final String title = "Settings Screen";

  const Settings({super.key});
   @override 
  State<Settings> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<Settings> {

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        ),
        
        body: Column(
          children: <Widget>[
       
                         

            GestureDetector(
              onTap: (){
                throw UnimplementedError('This feature is not yet implemented.');
              },
        
                child: Row(
                children: [
                Icon(Icons.notifications,
                size: MediaQuery.of(context).size.width * 0.1 ),
                Text("Notifications",
                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.1 ),)
                ],
                )
              
            ),


            GestureDetector(
              onTap:(){
                throw UnimplementedError('This feature is not yet implemented.');
              },
              child: Row(children: [
                Icon(Icons.language,
                 size: MediaQuery.of(context).size.width * 0.1 ),
                Text("Language",
                style: TextStyle(fontSize:  MediaQuery.of(context).size.width * 0.1 ),)
                ],
                
                ),
            ),

            
            GestureDetector(
              onTap:(){
                throw UnimplementedError('This feature is not yet implemented.');
              },
              child: Row(children: [
                Icon(Icons.payment,
                size: MediaQuery.of(context).size.width * 0.1 ),
                Text("Payment Method",
                style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.1 ),)
                
                ],
                
                ),
            )



          ],
        )
    );
  }


}
