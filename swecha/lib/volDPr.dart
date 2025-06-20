import 'package:flutter/material.dart';

class DoctorPrescriptionPage extends StatefulWidget {
  const DoctorPrescriptionPage({super.key});

  @override
  State<DoctorPrescriptionPage> createState() => _DoctorPrescriptionPageState();
}

class _DoctorPrescriptionPageState extends State<DoctorPrescriptionPage> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _bookNoController = TextEditingController();
  late TabController _tabController;
  List<_PrescriptionItem> _items = [ _PrescriptionItem() ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _bookNoController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _addItem() {
    setState(() {
      _items.add(_PrescriptionItem());
    });
  }

  void _removeItem(int index) {
    setState(() {
      if (_items.length > 1) {
        _items.removeAt(index);
      }
    });
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      // TODO: Handle form submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Prescription submitted (implement logic)')),
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
          'Doctor Prescription',
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
                'Medicines',
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
                      validator: (value) => value == null || value.isEmpty ? 'Enter Book No' : null,
                    ),
                    const SizedBox(height: 18),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xFFBDBDBD)),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Color(0xFFFFA726),
                        indicator: BoxDecoration(
                          color: Color(0xFFFFA726),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: const [
                          Tab(text: 'Medicine'),
                          Tab(text: 'Non-Medicine'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    ..._items.asMap().entries.map((entry) {
                      int index = entry.key;
                      _PrescriptionItem item = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFBDBDBD)),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                controller: item.medicineIdController,
                                style: const TextStyle(color: Colors.black),
                                decoration: _inputDecoration(_tabController.index == 0 ? 'Medicine ID' : 'Non-Medicine ID'),
                                cursorColor: Colors.black,
                                validator: (value) => value == null || value.isEmpty ? 'Enter ID' : null,
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                controller: item.daysController,
                                style: const TextStyle(color: Colors.black),
                                decoration: _inputDecoration('Days'),
                                cursorColor: Colors.black,
                                validator: (value) => value == null || value.isEmpty ? 'Enter Days' : null,
                              ),
                              const SizedBox(height: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CheckboxListTile(
                                    title: const Text('Morning', style: TextStyle(color: Colors.black)),
                                    value: item.morning,
                                    onChanged: (val) => setState(() => item.morning = val ?? false),
                                    controlAffinity: ListTileControlAffinity.leading,
                                    activeColor: Color(0xFF007BFF),
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Afternoon', style: TextStyle(color: Colors.black)),
                                    value: item.afternoon,
                                    onChanged: (val) => setState(() => item.afternoon = val ?? false),
                                    controlAffinity: ListTileControlAffinity.leading,
                                    activeColor: Color(0xFF007BFF),
                                  ),
                                  CheckboxListTile(
                                    title: const Text('Night', style: TextStyle(color: Colors.black)),
                                    value: item.night,
                                    onChanged: (val) => setState(() => item.night = val ?? false),
                                    controlAffinity: ListTileControlAffinity.leading,
                                    activeColor: Color(0xFF007BFF),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Calculated Quantity: ${item.calculatedQuantity}',
                                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                              const SizedBox(height: 8),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size.fromHeight(40),
                                ),
                                onPressed: () => _removeItem(index),
                                child: const Text('Remove'),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(48),
                      ),
                      onPressed: _addItem,
                      child: const Text('Add Item'),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF007BFF),
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(48),
                      ),
                      onPressed: _submit,
                      child: const Text('Submit Prescription'),
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

class _PrescriptionItem {
  final TextEditingController medicineIdController = TextEditingController();
  final TextEditingController daysController = TextEditingController();
  bool morning = false;
  bool afternoon = false;
  bool night = false;

  int get calculatedQuantity {
    int days = int.tryParse(daysController.text) ?? 0;
    int times = (morning ? 1 : 0) + (afternoon ? 1 : 0) + (night ? 1 : 0);
    return days * times;
  }
}
