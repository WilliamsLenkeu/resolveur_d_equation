import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _aController = TextEditingController();
  TextEditingController _bController = TextEditingController();
  TextEditingController _cController = TextEditingController();
  TextEditingController _dController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Résolution d\'une équation de 3ème degré'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _aController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Coefficient a'),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _bController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Coefficient b'),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _cController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Coefficient c'),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _dController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Coefficient d'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                //fonction pour resoudre les equations
              },
              child: Text('Résoudre'),
            ),
          ],
        ),
      ),
    );
  }
}
