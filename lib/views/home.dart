import 'package:flutter/material.dart';
import '../services/equation_solver.dart';

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

  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Résolution d\'équation de 3ème degré'),
        backgroundColor: Colors.grey[850],
      ),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField(_aController, 'Coefficient a', Colors.grey),
              SizedBox(height: 10.0),
              _buildTextField(_bController, 'Coefficient b', Colors.grey),
              SizedBox(height: 10.0),
              _buildTextField(_cController, 'Coefficient c', Colors.grey),
              SizedBox(height: 10.0),
              _buildTextField(_dController, 'Coefficient d', Colors.grey),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  try {
                    double a = double.parse(_aController.text);
                    if (a == 0) {
                      throw FormatException();
                    }
                    double b = double.parse(_bController.text);
                    double c = double.parse(_cController.text);
                    double d = double.parse(_dController.text);
                    List<num> solutions = solveCubicEquation(a, b, c, d);
                    setState(() {
                      _result = solutions.join(', ');
                    });
                  } catch (e) {
                    setState(() {
                      _result = 'Erreur : Veuillez entrer des nombres valides et a ne doit pas être zéro.';
                    });
                  }
                },
                child: Text('Résoudre'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.grey[700],
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _aController.clear();
                  _bController.clear();
                  _cController.clear();
                  _dController.clear();
                  setState(() {
                    _result = '';
                  });
                },
                child: Text('Tout effacer'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.grey[700],
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Résultat : $_result',
                style: const TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, Color color) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: color),
        border: OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[800],
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}