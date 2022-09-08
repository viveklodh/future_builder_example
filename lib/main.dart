import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<int> futureFunction() async {
    await Future.delayed(Duration(seconds: 5));
    return 50;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("future builder example"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.yellowAccent,
          child: Center(
            child: FutureBuilder(
              future: futureFunction(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data.toString(),
                    style: TextStyle(fontSize: 100),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
