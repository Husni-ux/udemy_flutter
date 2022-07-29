import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TableDes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey,
              child: Row(

                children: [
                  TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter a search term'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Button',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Button',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Table(
                defaultColumnWidth: FixedColumnWidth(120.0),
                border: TableBorder.all(
                  color: Colors.grey,
                ),
                children: [
                  TableRow(children: [
                    Column(children: [
                      Text('Nom', style: TextStyle(fontSize: 10.0))
                    ]),
                    Column(children: [
                      Text('Persom', style: TextStyle(fontSize: 10.0))
                    ]),
                    Column(children: [
                      Text('telephone', style: TextStyle(fontSize: 10.0))
                    ]),
                    Column(children: [
                      Text('Montant', style: TextStyle(fontSize: 10.0))
                    ]),
                    Column(children: [
                      Text('A commence le', style: TextStyle(fontSize: 10.0))
                    ]),
                    Column(children: []),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('Javatpoint')]),
                    Column(children: [Text('Flutter')]),
                    Column(children: [Text('5*')]),
                    Column(children: [Text('5*')]),
                    Column(children: [Text('5*')]),
                    Column(children: []),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('Javatpoint')]),
                    Column(children: [Text('MySQL')]),
                    Column(children: [Text('5*')]),
                    Column(children: [Text('5*')]),
                    Column(children: [Text('5*')]),
                    Column(children: []),
                  ]),
                  TableRow(children: [
                    Column(children: [Text('Javatpoint')]),
                    Column(children: [Text('ReactJS')]),
                    Column(children: [Text('5*')]),
                    Column(children: [Text('5*')]),
                    Column(children: [Text('5*')]),
                    Column(children: []),
                  ]),
                ],
              ),
            ),
          ]),
    );
  }
}
