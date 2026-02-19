// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({Key? key}) : super(key: key);

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  //ใส่ใน class 2
TextEditingController _weightController = TextEditingController();//ตัวแปลเก็บข้อมูลน้ำหนัก
TextEditingController _heightController = TextEditingController();// ตัวแปลเก็บข้อมูลส่วนสูง

//สร้างตัวแปลเก็บค่าดัชนีมวลกาย
double _bmi = 0.00;
String _bmiResult = 'การแปลผล';


  @override

  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void _calculateBMI() {
    final weight = double.tryParse(_weightController.text);
    final height = double.tryParse(_heightController.text);

    if (weight != null && height != null && height > 0) {
      // Convert height from cm to meters
      final heightInMeters = height / 100;


      //คำนวณ BMI และแปลผล
      setState(() {
        _bmi = weight / (heightInMeters * heightInMeters);//สูตรคำนวณ BMI
      });
      setState(() {
        if (_bmi < 18.5) {
          _bmiResult = 'น้ำหนักน้อยกว่าปกติ';
        } else if (_bmi >= 18.5 && _bmi < 25) {
          _bmiResult = 'น้ำหนักปกติ';
        } else if (_bmi >= 25 && _bmi < 30) {
          _bmiResult = 'เริ่มอ้วน';
        } else {
          _bmiResult = 'คุณอ้วนแล้วนะ';
        }
      });
    }
  }

  void _clearFields() {//ฟังก์ชันสำหรับล้างข้อมูลในช่องกรอกและรีเซ็ตค่า BMI
    setState(() {
      _weightController.clear();
      _heightController.clear();
      _bmi = 0.00;
      _bmiResult = 'การแปลผล';
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
                'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3748),
                ),
              ),
               SizedBox(height: 30),
              
             Image.asset(
                'assets/image/bmi (1).png',
                width: 120,
              ),
              
              SizedBox(height: 40),
              
              //ใส่น้ำหนัก
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
                    controller: _weightController,//เชื่อมต่อกับตัวแปลเก็บข้อมูลน้ำหนัก
                    keyboardType: TextInputType.number,//กำหนดให้แป้นพิมพ์เป็นตัวเลข
                    decoration: InputDecoration(//ตกแต่งช่องกรอกข้อมูล
                      hintText: 'กรอกน้ำหนักของคุณ',//ข้อความแนะนำในช่องกรอกข้อมูล
                      hintStyle: TextStyle(color: Colors.grey[400]),//สีข้อความแนะนำ
                      filled: true, //กำหนดให้มีพื้นหลังในช่องกรอกข้อมูล
                      fillColor: const Color.fromARGB(255, 255, 245, 252),
                      border: OutlineInputBorder(//กำหนดรูปแบบขอบของช่องกรอกข้อมูล
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),


                      enabledBorder: OutlineInputBorder(//กำหนดรูปแบบขอบเมื่อช่องกรอกข้อมูลถูกเปิดใช้งาน
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),

                      
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
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
              
             //ส่วนของการกรอกข้อมูลส่วนสูง
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
                    controller: _heightController,//เชื่อมต่อกับตัวแปลเก็บข้อมูลส่วนสูง
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
              
              
              SizedBox(height: 30),
              
              //ปุ่มคำนวณ
              SizedBox(

                //mediaquery.of(context).size.width,//กำหนดให้ปุ่มมีความกว้างเท่ากับหน้าจอ ใช้ได้เหมือนกัน
                
                width: double.infinity,//กำหนดให้ปุ่มมีความกว้างเต็มที่
                height: 50,
                child: ElevatedButton(
                  onPressed: _calculateBMI,
                  style: ElevatedButton.styleFrom(//กำหนดรูปแบบปุ่ม
                    backgroundColor: const Color.fromARGB(255, 255, 128, 204),
                    shape: RoundedRectangleBorder(//กำหนดรูปแบบของปุ่ม
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 2,
                   //sneckbar//*** */

                  ),
                  child: const Text(
                    'คำนวณ BMI',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 15),
              
              //ปุ่มล้างข้อมูล
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _clearFields,//เชื่อมต่อกับฟังก์ชันล้างข้อมูล
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
              
              //ส่วนของการแสดงผลลัพธ์
            
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(35),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 253, 229, 242),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    const Text(
                      'BMI',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF4A5568),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _bmi.toStringAsFixed(2),//แสดงผลลัพธ์ BMI โดยจำกัดทศนิยม 2 ตำแหน่ง
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                     Text(
                      _bmiResult,//แสดงผลลัพธ์การแปลผล BMI
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 243, 136, 35),
                      ),
                    ),


                   
                  ],
                ),
              ),
              //  SizedBox(
              //         width: MediaQuery.of(context).size.width * 0.8,
              //         child: Card(
                        
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(5.0),
              //           ),
                        
              //           color: const Color.fromARGB(255, 144, 238, 144),
              //           child: Padding(
              //             padding: const EdgeInsets.symmetric(
              //               vertical: 20.0),
              //             child: Column(
              //               children: [
              //                 Text(
              //                   'BMI',
              //                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //                 ),
              //                 Text(
              //                   '0.00',
              //                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            
              //                 ),
              //                  Text(
              //                   'การแปลผล',
              //                   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       )
            ],
          ),
          
        ),
      ),
    );
  }
}


