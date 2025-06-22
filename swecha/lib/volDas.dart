import 'package:flutter/material.dart';

class DoctorAssigningPage extends StatefulWidget {
  const DoctorAssigningPage({super.key});

  @override
  State<DoctorAssigningPage> createState() => _DoctorAssigningPageState();
}

class _DoctorAssigningPageState extends State<DoctorAssigningPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _bookNumberController = TextEditingController();
  String? _selectedDoctor;

  final List<String> _doctors = [
    'Dr. A Kranthi Kiran (Orthopaedic)',
    'Dr. Divya Veeramalli (Gynaecologist)',
    'Dr. M. Rama Rao (General Physician)',
    'Dr. Sekhar (General Physician)',
    'Dr. Siva Ramulu (ENT)',
    'Dr. Pramod Kumar Garg (General Physician)',
    'Dr. Somaraju (Pediatrician)',
    'Dr. Anshitha (General Physician)',
    'Dr. Vemuri Usha Rani (Gynaecologist)',
  ];

  @override
  void dispose() {
    _bookNumberController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false && _selectedDoctor != null) {
      // TODO: Handle form submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Doctor assigned (implement logic)')),
      );
    } else if (_selectedDoctor == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a doctor')),
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
          'Doctor Assigning',
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
                'Doctor Assigning',
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
                      validator: (value) => value == null || value.isEmpty
                          ? 'Enter Book Number'
                          : null,
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Doctor Assigned',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ..._doctors.map((doctor) => RadioListTile<String>(
                          title: Text(
                            doctor,
                            style: const TextStyle(color: Colors.black),
                          ),
                          value: doctor,
                          groupValue: _selectedDoctor,
                          activeColor: Colors.black,
                          onChanged: (value) {
                            setState(() {
                              _selectedDoctor = value;
                            });
                          },
                        )),
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
