import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LISTAN"), actions: const [
        IconButton(icon: Icon(Icons.menu_outlined), onPressed: null),
      ]),
      body: Center(
        child: Column(
          children: [
            Container(height: 15),
            item("Skola", true),
            item("Handla", false),
            item("Jobba", false),
            item("Musik", true),
          ],
        ),
      ),
    );
  }

  Widget item(String lista, bool done) {
    return ListTile(
      leading: Checkbox(
        value: done,
        onChanged: (val) {},
      ),
      title: Text(lista, style: _textstyle(done)),
    );
  }

  TextStyle _textstyle(done) {
    if (done) {
      return TextStyle(decoration: TextDecoration.lineThrough, fontSize: 20);
    } else {
      return TextStyle(fontSize: 20, decoration: TextDecoration.underline);
    }
  }
}

class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listan"),
      ),
      body: Center(
          child: Column(
        children: [
          Container(height: 25),
        ],
      )),
    );
  }
}
