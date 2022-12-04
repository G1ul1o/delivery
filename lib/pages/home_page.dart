import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'event_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Delivery de projet c'est trop bien"), // titre de la page
        ),
        body: Center( //on peut mettre qu'un seul texte
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assts/images/shadow monarch.png"),
              const Text("Delivery de projet c'est trop bien",
                style:  TextStyle(
                    fontSize: 42,
                    fontFamily: 'Poppins'
                ),
                textAlign: TextAlign.center,
              ),
              const Text("Bienvenue en enfer",
                style: TextStyle(
                    fontSize: 24
                ),
                textAlign: TextAlign.center,
              ),
              Padding(padding: EdgeInsets.only(top: 20)),

              ElevatedButton.icon(
                style:  ButtonStyle(
                    padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
                    backgroundColor: MaterialStatePropertyAll(Colors.blueGrey)
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___)=> EventPage()
                      )
                  );
                },
                label: Text("Afficher le projet",
                  style:  TextStyle(
                      fontSize: 20
                  ),
                ),
                icon: Icon(Icons.calendar_month),
              )
            ],
          ),
        ) //corp de la page
    );
  }
}
