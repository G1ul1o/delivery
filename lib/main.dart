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
class NotePage extends StatefulWidget{

  const NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NoteState();
}

class _NoteState extends State<NotePage> {
  DateTime _dateTime = DateTime(2022);
  final fieldText1 = TextEditingController();
  final fieldText2 = TextEditingController();

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

              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(border: Border.all(
                    width : 3,
                    color: Colors.black
                )),
              child: Text(
                '${_dateTime.day}-${_dateTime.month}-${_dateTime.year}',
                style: const TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(height: 10),


              MyElevatedButton(

                borderRadius: BorderRadius.circular(20),
                child: Text('Entrer une date', style: TextStyle(fontSize: 20)),
                onPressed: ()async {
                  DateTime? _newDate = await showDatePicker(
                    context: context,
                    initialDate: _dateTime,
                    firstDate: DateTime(1800),
                    lastDate: DateTime(3000),
                  );
                  if(_newDate != null){
                    setState(() { _dateTime = _newDate; });
                  }
                },
              ),

              SizedBox(height: 40),


              MyElevatedButton(
                borderRadius: BorderRadius.circular(20),
                child: Text('Valider', style: TextStyle(fontSize: 20)),
                
                onPressed: () {
                  fieldText1.clear();
                  final day = _dateTime.day;
                  final month = _dateTime.month;
                  final year = _dateTime.year;
                  _dateTime = DateTime(2022);
                  Navigator.push(
                      context, //info de la page actuelle utile pour la redirection
                      PageRouteBuilder(
                      pageBuilder: (_, __, ___,) => NotePage()
                  ));
                  //Navigator.push();
                },
              )
            ],
          ),
        )
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





