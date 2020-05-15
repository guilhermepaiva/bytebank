import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('100.00'),
                subtitle: Text('CC: 0007-8'),
              )
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.monetization_on),
                title: Text('300.00'),
                subtitle: Text('CC: 1245-9'),
              )
            ),
          ],
        ),
        appBar: AppBar(title: Text('Transferências'),),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
        ),
      ),
    )
  );
}
