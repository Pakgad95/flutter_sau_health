import 'package:flutter/material.dart';
import 'package:flutter_sau_health_calculator_app/views/about.ui.dart';
import 'package:flutter_sau_health_calculator_app/views/bmi_ui.dart';
import 'package:flutter_sau_health_calculator_app/views/bmr.ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  int barItemIndex = 1;


  //สร้างตัวแปลเก็บ uiที่จะเอามาจะแสดงแต่ละ baritem
  List showUI = [
    BmiUi(),
    AboutUi(),
    BmrUi(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: const Color.fromARGB(255, 237, 119, 158),
        title: Text(
          'Body healty Caculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ) ,//bar ด้านบน
      bottomNavigationBar: BottomNavigationBar(
        onTap: (paramValue){
          setState(() {
            barItemIndex = paramValue;
          });
        },
        currentIndex: barItemIndex,//ทำให้ขึ้นสีตอนกด
        
        selectedItemColor: const Color.fromARGB(255, 250, 79, 182) , //    
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person),
              label: 'BMI'
              ),

          BottomNavigationBarItem(
            icon:Icon(
          Icons.home),
          label: 'About'
          ),

          BottomNavigationBarItem(icon:
          Icon(FontAwesomeIcons.heart,
          ),
          label: 'BMR'
          )
        ]
      ),
      body: showUI[barItemIndex],//เปลี่ยนเลขได้โชว์เลยอันแรก
    
    );
  }
}