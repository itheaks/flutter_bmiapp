import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.purpleAccent.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text('Know Your BMI')),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 21),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: wtController,
                  decoration: InputDecoration(
                      labelText: "Enter your Weight (in Kgs)",
                      prefixIcon: Icon(Icons.line_weight)),
                ),
                const SizedBox(height: 21),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: ftController,
                  decoration: InputDecoration(
                      labelText: "Enter your Height (in Feet)",
                      prefixIcon: Icon(Icons.height)),
                ),
                const SizedBox(height: 21),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: inController,
                  decoration: InputDecoration(
                      labelText: "Enter your Height (in Inch)",
                      prefixIcon: Icon(Icons.height)),
                ),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if (wt != "" && ft != "" && inch != "") {
                      var iwt = int.parse(wt);
                      var ift = int.parse(ft);
                      var iInch = int.parse(inch);
                      var tInch = (ift * 12) + iInch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;
                      var bmi = iwt / (tM * tM);
                      var msg = "";
                      if (bmi > 25) {
                        msg = "You are Overweight!!";
                        setState(() {
                          bgColor = Colors.redAccent.shade200;
                        });
                      } else if (bmi < 18) {
                        msg = "You are Underweight!!";
                        setState(() {
                          bgColor = Colors.yellowAccent.shade200;
                        });
                      } else {
                        msg = "You are Healthy to ROCK";
                        setState(() {
                          bgColor = Colors.green.shade200;
                        });
                      }
                      setState(() {
                        result = "$msg\nYour BMI is: ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the required blanks!!";
                      });
                    }
                  },
                  child: const Text('Calculate'),
                ),
                const SizedBox(height: 11),
                Text(
                  result,
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
