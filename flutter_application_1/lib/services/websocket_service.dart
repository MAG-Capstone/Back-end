import 'dart:async';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  WebSocketChannel? _channel;
  final _controller = StreamController<dynamic>.broadcast();
  bool _isListening = false; // Track if the stream is already being listened to.

  Stream<dynamic> get stream => _controller.stream;

  void connect(String uri) {
    if (_channel != null) {
      print("Closing existing WebSocket connection before reconnecting...");
      close();
    }

    try {
      _channel = WebSocketChannel.connect(Uri.parse(uri));
      print("Connected to WebSocket: $uri");

      if (!_isListening) {
        _channel!.stream.listen(
          (message) {
            _controller.add(message);
          },
          onError: (error) {
            print("WebSocket error: $error");
            close();
          },
          onDone: () {
            print("WebSocket connection closed by server.");
            close();
          },
        );
        _isListening = true; // Mark that the listener is set.
      }
    } catch (e) {
      print("Error connecting to WebSocket: $e");
    }
  }

  void sendMessage(String message) {
    if (_channel == null) {
      print("Error: No WebSocket connection to send message.");
      return;
    }

    try {
      _channel!.sink.add(message);
      print("Message sent: $message");
    } catch (e) {
      print("Error sending message: $e");
    }
  }

  void close() {
    try {
      _channel?.sink.close();
      _controller.close();
      _channel = null;
      _isListening = false; // Reset the listener flag.
      print("WebSocket connection closed.");
    } catch (e) {
      print("Error closing WebSocket: $e");
    }
  }
}
