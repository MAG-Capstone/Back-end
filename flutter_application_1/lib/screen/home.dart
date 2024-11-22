import 'package:flutter/material.dart';
import '../screen/profile.dart';
import '../screen/settings.dart';

import '../services/websocket_service.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0; // Add selectedIndex to the parent state

  final WebSocketService _webSocketService = WebSocketService(); // WebSocket instance
  String _receivedMessage = ""; // To store the incoming WebSocket message

  @override
  void initState() {
    super.initState();
    _webSocketService.connect('ws://localhost:3000'); // Replace with your WebSocket URL

    // Listen for incoming messages
    _webSocketService.stream.listen((message) {
      setState(() {
        _receivedMessage = message; // Update the UI with the received message
      });
    });
  }

  @override
  void dispose() {
    _webSocketService.close(); // Ensure WebSocket is closed when widget is disposed
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),


      
      //body: Body(counter: _counter, selectedIndex: _selectedIndex), 

      body: Body(counter: _counter, selectedIndex: _selectedIndex, receivedMessage: _receivedMessage,onSendMessage: (String message) {
        _webSocketService.sendMessage(message); // Send the message via WebSocket
        }, // Provide the required onSendMessage argument
      ),

      bottomNavigationBar: NavBar(
        onItemTapped: _onNavBarTapped, // Pass callback to NavBar
      ),


      floatingActionButton: CameraButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }


// Defunct: Controls which Page  
// Widget _getSelectedPage() {
//   switch(_selectedIndex) {
//     case 0:
//       return Body(counter: _counter, selectedIndex: _selectedIndex);
//     case 1:
//       return Profile(counter: _counter, selectedIndex: _selectedIndex,);
//     case 2:
//       return Settings(counter: _counter, selectedIndex: _selectedIndex,);
//     default:
//       return Body(counter: _counter, selectedIndex: _selectedIndex);
//   }
// }

  FloatingActionButton CameraButton() {
    return FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Scan QR Code',
      child: const Icon(Icons.camera),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
    required this.counter,
    required this.selectedIndex,
    required this.receivedMessage, // Accept the received message as a parameter
    required this.onSendMessage, // Accept a callback to send messages
  });

  final int counter;
  final int selectedIndex; // Accept selectedIndex as a parameter
  final String receivedMessage; // Variable to hold WebSocket message
  final Function(String) onSendMessage; // Callback to send messages

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textController = TextEditingController();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$counter',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const Text(
            'Hello!',
          ),
          Text('Selected Index: $selectedIndex'), // Display the selectedIndex
          const SizedBox(height: 20),
          const Text('WebSocket Message:'),
          Text(
            receivedMessage.isNotEmpty ? receivedMessage : 'No messages received yet.',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _textController,
              decoration: const InputDecoration(
                hintText: 'Enter your message here',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final message = _textController.text;
              if (message.isNotEmpty) {
                onSendMessage(message); // Call the callback to send the message
                _textController.clear();
              }
            },
            child: const Text('Send Message'),
          ),
        ],
      ),
    );
  }
}

// MAV BAR



class NavBar extends StatefulWidget {
  final Function(int) onItemTapped; // Define the callback

  const NavBar({super.key, required this.onItemTapped});

  @override
  State<NavBar> createState() => _NavBarState();
}



class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onItemTapped(index); // Call the passed callback
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () => _onItemTapped(0),
              ),
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile(counter: 2, selectedIndex: _selectedIndex))
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.settings),
                 onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settings())
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}