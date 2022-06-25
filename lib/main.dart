// ignore_for_file: unused_field

import 'package:flutter/material.dart';

TextEditingController faultsController = TextEditingController();
TextEditingController score1Controller = TextEditingController();
TextEditingController score2Controller = TextEditingController();
TextEditingController score3Controller = TextEditingController();

double score = 0.0;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AMSA Qur'an Calculator",
      theme: ThemeData.dark(),

      // theme: ThemeData(
      //   // scaffoldBackgroundColor: Colors.black87,
      //   primarySwatch: Colors.green,
      // ),
      home: const MyHomePage(title: "AMSA Qur'an Calculator"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void resetAll() {
    setState(() {
      faultsController.text = '';
      score1Controller.text = '';
      score2Controller.text = '';
      score3Controller.text = '';
      score = 0;
    });
  }

  void calculateScore(
    double penalty,
    double score1,
    double score2,
    double score3,
  ) {
    setState(() {
      double subTotal1 = (score1 - (penalty * 5.0));
      double subTotal2 = (score2 - (penalty * 5.0));
      double subTotal3 = (score3 - (penalty * 5.0));

      score = (subTotal1 + subTotal2 + subTotal3) / 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.green,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(
          size.width / 14,
          size.height / 30,
          size.width / 14,
          size.height / 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Calculate Participant's score",
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: size.width / 15,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: size.height / 20,
              width: size.width,
            ),
            //---------------------------------------------------------------------------

            SizedBox(
              width: size.width / 2,
              height: size.height / 11,
              child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.tealAccent,
                maxLength: 1,
                controller: faultsController,
                decoration: InputDecoration(
                  labelText: 'No of penalties',
                  labelStyle: const TextStyle(color: Colors.green),
                  fillColor: Colors.white,
                  hintText: 'Fouls commited',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  focusColor: Colors.green,
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 40,
              width: size.width,
            ),
            //---------------------------------------------------------------------------

            SizedBox(
              width: size.width,
              height: size.height / 11,
              child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.tealAccent,
                maxLength: 2,
                controller: score1Controller,
                decoration: InputDecoration(
                  labelText: 'First Score',
                  labelStyle: const TextStyle(color: Colors.green),
                  fillColor: Colors.white,
                  hintText: "Enter participant's first score",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  focusColor: Colors.green,
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 30,
              width: size.width,
            ),
            //---------------------------------------------------------------------------

            SizedBox(
              width: size.width,
              height: size.height / 11,
              child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.tealAccent,
                maxLength: 2,
                controller: score2Controller,
                decoration: InputDecoration(
                  labelText: 'Second Score',
                  labelStyle: const TextStyle(color: Colors.green),
                  fillColor: Colors.white,
                  hintText: "Enter participant's second score",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  focusColor: Colors.green,
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 30,
              width: size.width,
            ),
            //---------------------------------------------------------------------------

            SizedBox(
              width: size.width,
              height: size.height / 11,
              child: TextField(
                keyboardType: TextInputType.number,
                cursorColor: Colors.tealAccent,
                maxLength: 2,
                controller: score3Controller,
                decoration: InputDecoration(
                  labelText: 'Third Score',
                  labelStyle: const TextStyle(color: Colors.green),
                  fillColor: Colors.white,
                  hintText: "Enter participant's third score",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  focusColor: Colors.green,
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      borderSide: BorderSide(color: Colors.green)),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 30,
              width: size.width,
            ),
            //---------------------------------------------------------------------------

            Container(
              width: size.width / 1.5,
              height: size.height / 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black,
              ),
              child: InkWell(
                splashColor: Colors.white10,
                child: TextButton(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: size.height / 45,
                    ),
                  ),
                  onPressed: () {
                    double pens = double.parse(faultsController.text);
                    double scor1 = double.parse(score1Controller.text);
                    double scor2 = double.parse(score2Controller.text);
                    double scor3 = double.parse(score3Controller.text);

                    calculateScore(pens, scor1, scor2, scor3);
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height / 30,
              width: size.width,
            ),
            //---------------------------------------------------------------------------

            Text(
              "Participant's Final score:",
              style: TextStyle(
                  color: Colors.white54,
                  fontSize: size.width / 15,
                  fontWeight: FontWeight.w600),
            ),

            ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: size.height / 15, maxWidth: size.width / 2),
              child: Text(
                '$score',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            //---------------------------------------------------------------------------
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: resetAll,
        backgroundColor: Colors.green,
        tooltip: 'Reset All',
        child: const Icon(Icons.loop_rounded),
      ),
    );
  }
}
