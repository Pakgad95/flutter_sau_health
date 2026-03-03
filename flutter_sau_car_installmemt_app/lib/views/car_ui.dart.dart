import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CarInstallmentUi extends StatefulWidget {
  @override
  State<CarInstallmentUi> createState() => _CarInstallmentUiState();
}

class _CarInstallmentUiState extends State<CarInstallmentUi> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _interestController = TextEditingController();

  int? _downPercent;
  int? _durationMonths;

  double _monthlyPayment = 0.00;

  final NumberFormat _formatter = NumberFormat("#,##0.00");

  @override
  void dispose() {
    _priceController.dispose();
    _interestController.dispose();
    super.dispose();
  }

  void _calculateInstallment() {
    final price = double.tryParse(_priceController.text);
    final rate = double.tryParse(_interestController.text);

    if (price == null || price <= 0) {
      _showMessage("กรุณาป้อนราคารถ");
      return;
    }

    if (rate == null || rate <= 0) {
      _showMessage("กรุณาป้อนอัตราดอกเบี้ย");
      return;
    }

    if (_downPercent == null) {
      _showMessage("กรุณาเลือกเงินดาวน์");
      return;
    }

    if (_durationMonths == null) {
      _showMessage("กรุณาเลือกระยะเวลาผ่อน");
      return;
    }

    // สูตรคำนวณ
    double financed = price - (price * _downPercent! / 100);

    double interestTotal =
        financed * (rate / 100) * (_durationMonths! / 12);

    double monthly =
        (financed + interestTotal) / _durationMonths!;

    setState(() {
      _monthlyPayment = monthly;
    });
  }

  void _clearFields() {
    setState(() {
      _priceController.clear();
      _interestController.clear();
      _downPercent = null;
      _durationMonths = null;
      _monthlyPayment = 0.00;
    });
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
                    title: const Text("CI Calculator"),
                    centerTitle: true,
                    backgroundColor: Colors.green,
                  ),
     body: SingleChildScrollView(
  padding: const EdgeInsets.all(20),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Center(
        child: Image.asset(
          'assets/image/car2.png',
          width: 300,
        ),
      ),
      SizedBox(height: 20),

            const Text("ราคารถ (บาท)"),
            const SizedBox(height: 5),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            const Text("จำนวนเงินดาวน์ (%)"),
            Row(
              children: [10, 20, 30, 40, 50]
                  .map((value) => Expanded(
                        child: RadioListTile<int>(
                          title: Text("$value"),
                          value: value,
                          groupValue: _downPercent,
                          onChanged: (val) {
                            setState(() {
                              _downPercent = val;
                            });
                          },
                        ),
                      ))
                  .toList(),
            ),

            const SizedBox(height: 20),

            const Text("ระยะเวลาผ่อน (เดือน)"),
            const SizedBox(height: 5),
            DropdownButtonFormField<int>(
              value: _durationMonths,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              hint: const Text("เลือกระยะเวลา"),
              items: [24, 36, 48, 60, 72]
                  .map((month) => DropdownMenuItem(
                        value: month,
                        child: Text("$month เดือน"),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  _durationMonths = val;
                });
              },
            ),

            const SizedBox(height: 20),

            const Text("อัตราดอกเบี้ย (%/ปี)"),
            const SizedBox(height: 5),
            TextField(
              controller: _interestController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _calculateInstallment,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green),
                    child: const Text("คำนวณ"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _clearFields,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange),
                    child: const Text("ยกเลิก"),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    "ค่างวดรถต่อเดือนเป็นเงิน",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _formatter.format(_monthlyPayment),
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  const Text("บาทต่อเดือน"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}