import 'package:flutter/material.dart';
import 'volPReg.dart';
import 'volVital.dart';
import 'volDas.dart';
import 'volDPr.dart';
import 'volMPic.dart';

class VolunteerMainPage extends StatelessWidget {
  const VolunteerMainPage({super.key});

  final List<_GridOption> _options = const [
    _GridOption('Patient registration', Icons.person),
    _GridOption('Vitals', Icons.monitor_heart),
    _GridOption('Doctor assigning', Icons.medical_services),
    _GridOption('View queue', Icons.queue),
    _GridOption('Doctor prescription', Icons.receipt_long),
    _GridOption('Medicine pickup', Icons.local_pharmacy),
  ];

  void _onOptionTap(BuildContext context, String title) {
    if (title == 'Patient registration') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PatientRegistrationPage()),
      );
      return;
    }
    if (title == 'Vitals') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const VitalsPage()),
      );
      return;
    }
    if (title == 'Doctor assigning') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DoctorAssigningPage()),
      );
      return;
    }
    if (title == 'Doctor prescription') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DoctorPrescriptionPage()),
      );
      return;
    }
    if (title == 'Medicine pickup') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MedicinePickupPage()),
      );
      return;
    }
    // TODO: Implement navigation or action for each option
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Tapped: $title (implement logic)')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      appBar: AppBar(
        title: const Text(
          'Volunteer\'s Main Page',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF007BFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'DASHBOARD',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: _options.map((option) {
                  return GestureDetector(
                    onTap: () => _onOptionTap(context, option.title),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(option.icon, size: 48, color: const Color(0xFF26A69A)),
                            const SizedBox(height: 12),
                            Text(
                              option.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GridOption {
  final String title;
  final IconData icon;
  const _GridOption(this.title, this.icon);
}
