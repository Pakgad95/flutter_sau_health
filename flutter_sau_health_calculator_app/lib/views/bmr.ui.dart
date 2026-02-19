import 'package:flutter/material.dart';

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => _BmrUiState();
}

class _BmrUiState extends State<BmrUi> {
  final TextEditingController _weightController = TextEditingController();//ตัวแปรเก็บข้อมูลน้ำหนัก
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  double _bmr = 0.00;
  String? selectedGender; // เพิ่มตัวแปรนี้
  String _bmrResult = 'kalories/day';

  
  
  @override

  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _ageController.dispose();

    super.dispose();
  }

  void _calculateBMR() {
    final weight = double.tryParse(_weightController.text);
    final height = double.tryParse(_heightController.text);
          int age = int.tryParse(_ageController.text) ?? 0;
    if (weight != null && height != null && height > 0) {
      final heightInMeters = height / 100;
      setState(() {
        _bmr = 10 * weight + 6.25 * height - 5 * age + (selectedGender == 'male' ? 5 : -161);
      });
    }
  }

  void _clearFields() {
    setState(() {
      _weightController.clear();
      _heightController.clear();
      _ageController.clear();
      _bmr = 0.00;
        _bmrResult = 'การแปลผล';
      selectedGender = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              
              const Text(
                'คำนวณหาค่าแคลอรี่ที่ร่างกายต้องการ (BMR)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3748),
                ),
              ),
              const SizedBox(height: 30),
              
              Image.asset(
                'assets/image/triangle.png',
                width: 120,
              ),
               SizedBox(height: 25),

                       
                             Align(//จัดตำแหน่งข้อความเพศ
                                alignment: Alignment.centerLeft,
                               child: Text(
                                    'เพศ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF4A5568),
                                    ),
                                    textAlign: TextAlign.start,
                                                        
                                 ),
                             ),
                     
                   
                 SizedBox(
                  height: 10,
                 ),
               
              
              Row(
                children: [
                  
                 
                   SizedBox(width: 16),
                  
                  
                  Expanded(//ทำให้กว้างเท่ากัน เป็นการขยายเต็มที่
                    child: GestureDetector(
                      onTap: () {//เมื่อเลือกเพศชายให้เปลี่ยนสีเป็นฟ้าอ่อน
                        setState(() {
                          selectedGender = 'male'; // กำหนดค่าเมื่อเลือกเพศชาย
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(//ตกแต่งกล่องเพศชาย
                          color: selectedGender == 'male'
                              ? const Color(0xFFBEE3F8) // สีฟ้าอ่อนเมื่อเลือก
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: selectedGender == 'male' 
                                ? const Color(0xFF3182CE)//ถ้าเป็นชายจริงให้เปลี่ยนเป็นสีฟ้าเข้ม
                                : const Color(0xFFE2E8F0),//ภ้าอยู่หลัง :ให้เป็นสีขาว
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'ชาย',
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedGender == 'male'
                                  ? const Color(0xFF2C5282)
                                  : const Color(0xFF4A5568),
                              fontWeight: selectedGender == 'male'
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  const SizedBox(width: 12),
                  
                  
                  Expanded(
                    child: GestureDetector(
                      onTap: () {//ถ้าเลือกเพศหญิงให้เปลี่ยนสีเป็นชมพูอ่อน
                        setState(() {
                          selectedGender = 'female';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(//ตกแต่งกล่องเพศหญิง
                          color: selectedGender == 'female'
                              ? const Color(0xFFFED7E2) // สีชมพูอ่อนเมื่อเลือก
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: selectedGender == 'female'
                                ? const Color(0xFFD53F8C)
                                : const Color(0xFFE2E8F0),
                            width: 1,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'หญิง',
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedGender == 'female'
                                  ? const Color(0xFF97266D)
                                  : const Color(0xFF4A5568),
                              fontWeight: selectedGender == 'female'
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 40),
              
              // น้ำหนัก
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'น้ำหนัก (kg.)',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4A5568),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'กรอกน้ำหนักของคุณ',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 245, 252),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color(0xFFE85D2C)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // ส่วนสูง
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ส่วนสูง (cm.)',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4A5568),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _heightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'กรอกส่วนสูงของคุณ',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 245, 252),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 248, 117, 163)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 20),
              
              // อายุ
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'อายุ (ปี)',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF4A5568),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'กรอกอายุของคุณ',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 245, 252),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Color.fromARGB(255, 246, 124, 169)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // ปุ่มคำนวณ
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _calculateBMR,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 126, 188),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    'คำนวณ BMR',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 15),
              
              // ปุ่มล้างข้อมูล
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _clearFields,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    'ล้างข้อมูล',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
              
              // แสดงผล BMI
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(35),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 227, 239),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Text(
                      'BMR',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF4A5568),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _bmr.toStringAsFixed(2),//แสดงผลลัพธ์ BMR โดยจำกัดทศนิยม 2 ตำแหน่ง
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                     const SizedBox(height: 8),
                    Text(
                      _bmrResult,//แสดงผลลัพธ์ BMR โดยจำกัดทศนิยม 2 ตำแหน่ง
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 243, 136, 35),
                      ),
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