import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'spec.dart';

void main() {
  var state = MyState();

  runApp(
    ChangeNotifierProvider(
      create: (context) => state,
      child: MyApp(),
  ),
  );
}

class MyApp extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class MainView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LISTAN'),
          centerTitle: true,
          actions:[PopupMenuButton(
           onSelected: (value) {
                Provider.of<MyState>(context, listen: false).setFilterBy("ABABBAB");
              },
              itemBuilder: (context) => [
                    PopupMenuItem(child: Text('alla'), value: 'alla'),
                    PopupMenuItem(child: Text('klar'), value: 'klar'),
                    PopupMenuItem(child: Text('oklar'), value: 'oklar'),
                  ]),
          ]),
    
        body:Column(
          children: [Container(height: 20), item('skola', true)];

        FloatingActionButton: FloatingActionButtonLocation.centerFloat(
              child: Icon(Icons.add),
                    onPressed: (Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondView()))))
                    );
           ]);

  }

  Widget item(String aktivitet, bool check) {
    return ListTile(
        leading: Checkbox(value:check, onChanged:null),                      
        title: Text(aktivitet, style: _textstyle(check)),
        trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {}          
        ) 
    );
     
    }     
}


  TextStyle _textstyle(check) {
    if (check) {
      return TextStyle(fontSize: 20, decoration: TextDecoration.lineThrough);
    } else {
      return TextStyle(fontSize: 20);
    }
  }



class SecondView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ny aktivitet'),
      ),
      body: _list(context),
    );
  }

  Widget _list(context) {
    return ListView(
      children: [
        _item('Lägg till en ny aktivitet:'),
        Container(
          margin: EdgeInsets.only(left: 16, top: 30),
          child: TextField(
            decoration: InputDecoration(hintText: 'Ny aktivitet'),
          ),
        ),
        _knappar(context),
      ],
    );
  }

  Widget _item(text) {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 50),
      child: Text(text, style: TextStyle(fontSize: 20)),
    );
  }

  Widget _knappar(context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Avbryt'),
          ),
          Container(width: 30),
          ElevatedButton(
            onPressed: () {
              onPressed:
              () {
                Navigator.pop(context);
              };
            },
            child: Text('Spara'),
          ),
        ],
      ),
    );
  }}

