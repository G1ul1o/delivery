import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meilleur groupe ever"),
      ),
      body: Center(
        child: Text("Bientôt l'app ou quoi la",
          style: TextStyle(
              fontSize: 24
          ),
        ),
      ),
    );
  }
}