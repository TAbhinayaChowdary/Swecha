import 'package:flutter/material.dart';

class VitalsPage extends StatefulWidget {
  const VitalsPage({super.key});

  @override
  State<VitalsPage> createState() => _VitalsPageState();
}

class _VitalsPageState extends State<VitalsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _bookNumberController = TextEditingController();
  final TextEditingController _bpController = TextEditingController();
  final TextEditingController _pulseController = TextEditingController();
  final TextEditingController _rbsController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _lastMealController = TextEditingController();

  @override
  void dispose() {
    _bookNumberController.dispose();
    _bpController.dispose();
    _pulseController.dispose();
    _rbsController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _lastMealController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Handle form submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vitals submitted (implement logic)')),
      );
    }
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.black),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFBDBDBD)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.black, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      appBar: AppBar(
        title: const Text(
          'Vitals',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF007BFF),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Vitals',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _bookNumberController,
                      style: const TextStyle(color: Colors.black),
                      decoration: _inputDecoration('Book Number'),
                      cursorColor: Colors.black,
                      validator: (value) => value == null || value.isEmpty ? 'Enter Book Number' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _bpController,
                      style: const TextStyle(color: Colors.black),
                      decoration: _inputDecoration('BP (systolic/diastolic)'),
                      cursorColor: Colors.black,
                      validator: (value) => value == null || value.isEmpty ? 'Enter BP' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _pulseController,
                      style: const TextStyle(color: Colors.black),
                      decoration: _inputDecoration('Pulse'),
                      cursorColor: Colors.black,
                      validator: (value) => value == null || value.isEmpty ? 'Enter Pulse' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _rbsController,
                      style: const TextStyle(color: Colors.black),
                      decoration: _inputDecoration('RBS'),
                      cursorColor: Colors.black,
                      validator: (value) => value == null || value.isEmpty ? 'Enter RBS' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _weightController,
                      style: const TextStyle(color: Colors.black),
                      decoration: _inputDecoration('Weight (kg)'),
                      cursorColor: Colors.black,
                      validator: (value) => value == null || value.isEmpty ? 'Enter Weight' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _heightController,
                      style: const TextStyle(color: Colors.black),
                      decoration: _inputDecoration('Height (cm)'),
                      cursorColor: Colors.black,
                      validator: (value) => value == null || value.isEmpty ? 'Enter Height' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      controller: _lastMealController,
                      style: const TextStyle(color: Colors.black),
                      decoration: _inputDecoration('Last Meal and Time'),
                      cursorColor: Colors.black,
                      validator: (value) => value == null || value.isEmpty ? 'Enter Last Meal and Time' : null,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(48),
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _submit,
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
