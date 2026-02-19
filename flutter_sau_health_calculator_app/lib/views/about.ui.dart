import 'package:flutter/material.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 180.0,
              ),
        
              Text('Body Health Calculator',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
        
        
              ),),
              SizedBox(height: 20,),
        
              Image.asset(
                'assets/image/calculator.png',
                width: 120,
              ),
              SizedBox(height: 10,),
               Text('คำนวนดัชนีมวลกาย (BMI) ',
              style: TextStyle(
        
        
              ),),
                Text('คำนวนหาค่าแคลอรี่ที่ร่างกายต้องการในแต่ละวัน (BMR) ',
              style: TextStyle(
        
        
              ),),
              SizedBox(height: 70,),
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/4/47/Logosau-02.png',
                width: 70,
              ),
              SizedBox(height: 10,),
              Text('Developed by Pakgad SAO 2026')
        
              
            ],
        
          )
        ),
      ),
    );
  }
}