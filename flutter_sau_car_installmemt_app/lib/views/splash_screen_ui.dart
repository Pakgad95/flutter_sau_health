import 'package:flutter/material.dart';
import 'package:flutter_sau_health_calculator_app/views/car_ui.dart.dart';


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
          builder: (context) => CarInstallmentUi(),
          ),
        );
      }
    );
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 135, 59),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/car (1).png',
              width: 30,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Car for You',
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