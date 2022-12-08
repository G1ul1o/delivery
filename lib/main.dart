import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const MyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.gradient = const LinearGradient(colors: [Colors.indigo, Colors.cyanAccent]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}




class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          title: const Text("Application de rappels"),
        ),
        body: Center(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Image.asset("assets/images/vieux.jpg"),
              const Text("Bienvenue",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 10),
              const Text("Pour créer un évènement, toucher ci-dessous",
                style : TextStyle(
                    fontSize: 15
                ),
                textAlign:  TextAlign.center,
              ),
              Padding(padding: EdgeInsets.zero),
              SizedBox(height: 40),

              MyElevatedButton(
                borderRadius: BorderRadius.circular(20),
                child: Text('Créer un evenement', style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                      context, //info de la page actuelle utile pour la redirection
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___,) => NotePage()
                      )
                  );
                },
              )


            ],
          ),
        )
    );
  }
}

class NotePage extends StatelessWidget {
  final fieldText1 = TextEditingController();
  final fieldText2 = TextEditingController();

  NotePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Evenement",
              style: TextStyle(
                fontSize: 24,
              )
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              SizedBox(height: 10),

              const Text("Veuillez entrer la date de votre évènement",
                style: TextStyle(
                  fontSize : 24,
                ),
                textAlign:  TextAlign.center,
              ),

              SizedBox(height: 90),


              TextFormField(
                controller: fieldText1,
                decoration: InputDecoration(
                    hintText: "Nom de l'evenement",
                    border: OutlineInputBorder(
                      borderRadius : BorderRadius.circular(30),
                    )),
              ),

              SizedBox(height: 40),

              TextFormField(
                controller: fieldText2,
                decoration: InputDecoration(
                    hintText: "Date de l'evenement",
                    border: OutlineInputBorder(
                      borderRadius : BorderRadius.circular(30),
                    )),
              ),

              SizedBox(height: 40),


              MyElevatedButton(
                borderRadius: BorderRadius.circular(20),
                child: Text('Valider', style: TextStyle(fontSize: 20)),
                onPressed: () {
                  fieldText1.clear();
                  fieldText2.clear();


                  //Navigator.push();
                },
              )
            ],
          ),
        )
    );
  }
}





