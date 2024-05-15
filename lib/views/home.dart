import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/equation_solver.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();
  final TextEditingController _dController = TextEditingController();
  List<num>? _solutions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Résolution d\'équation de 3ème degré',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[850],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(_aController, 'Coefficient a'),
            const SizedBox(height: 10.0),
            _buildTextField(_bController, 'Coefficient b'),
            const SizedBox(height: 10.0),
            _buildTextField(_cController, 'Coefficient c'),
            const SizedBox(height: 10.0),
            _buildTextField(_dController, 'Coefficient d'),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton(Icons.calculate, 'Résoudre', _solveEquation),
                const SizedBox(width: 10.0),
                _buildButton(Icons.restart_alt, 'Tout effacer', _clearAllFields),
              ],
            ),
            const SizedBox(height: 20.0),
            if (_solutions != null) _buildSolutionDataTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.grey),
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: Colors.grey[800],
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildButton(IconData icon, String label, void Function()? onPressed) {
    return Expanded(
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white),
        label: Text(label),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.grey[700],
        ),
      ),
    );
  }

  void _solveEquation() {
    try {
      final a = double.parse(_aController.text);
      if (a == 0) throw const FormatException();
      final b = double.parse(_bController.text);
      final c = double.parse(_cController.text);
      final d = double.parse(_dController.text);
      final solutions = solveCubicEquation(a, b, c, d);
      setState(() {
        _solutions = solutions;
      });
    } catch (e) {
      _showErrorDialog();
    }
  }

  void _clearAllFields() {
    _aController.clear();
    _bController.clear();
    _cController.clear();
    _dController.clear();
    setState(() {
      _solutions = null;
    });
  }

  Widget _buildSolutionDataTable() {
    return DataTable(
      columns: const [
        DataColumn(
          label: Text(
            'Solution',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
      rows: _solutions!.asMap().entries.map((entry) {
        final index = entry.key;
        final solution = entry.value;
        return DataRow(cells: [
          DataCell(
            Text(
              'x${index + 1} : ${(solution % 1 == 0 ? solution.toInt() : solution.toStringAsFixed(2)).toString()}',
              style: const TextStyle(color: Colors.white),
            ),
          )
        ]);
      }).toList(),
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erreur'),
          content: const Text('Veuillez entrer des nombres valides et a ne doit pas être zéro.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}