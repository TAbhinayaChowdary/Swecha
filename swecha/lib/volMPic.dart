import 'package:flutter/material.dart';

class MedicinePickupPage extends StatefulWidget {
  const MedicinePickupPage({super.key});

  @override
  State<MedicinePickupPage> createState() => _MedicinePickupPageState();
}

class _MedicinePickupPageState extends State<MedicinePickupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _bookNoController = TextEditingController();

  @override
  void dispose() {
    _bookNoController.dispose();
    super.dispose();
  }

  void _fetchPrescription() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Handle fetch prescription logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Fetching prescription (implement logic)')),
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
          'Medicine Pickup',
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
                'Medicine Pickup',
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
                      controller: _bookNoController,
                      style: const TextStyle(color: Colors.black),
                      decoration: _inputDecoration('Book No'),
                      cursorColor: Colors.black,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Enter Book No'
                          : null,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(48),
                      ),
                      onPressed: _fetchPrescription,
                      child: const Text('Fetch Prescription'),
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
