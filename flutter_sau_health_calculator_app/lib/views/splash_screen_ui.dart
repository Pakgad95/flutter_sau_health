import 'package:flutter/material.dart';
import 'package:flutter_sau_health_calculator_app/views/home_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {

  @override
  void initState() {
     //หน่วงเวลา ย้อนกลับไม่ได้
    Future.delayed(
      //ระยะเวลาที่หน่วง
      Duration(seconds:  3),
      (){
        Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
          builder: (context) => HomeUi()
          ),
        );
      }
    );
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 137, 179),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/calculator.png',
              width: 30,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Body healty Caculator',
              style:  TextStyle(
                color: Colors.white
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CircularProgressIndicator(
              color: Colors.white,
            )

            
          ],
        ),
      ),
    );
  }
}