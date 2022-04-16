import 'package:fap/controller/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _campusId;
  String dropdownValue = 'Select Campus';
  final List<String> _campusList = [
    'Select Campus',
    'FU-Hòa Lạc',
    'FU-Hồ Chí Minh',
    'FU-Đà Nẵng',
    'FU-Cần Thơ',
    'FU-Quy Nhơn',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Welcome back!\nSign in to continue!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff0b111e),
                fontSize: 28,
                fontWeight: FontWeight.bold ,
                letterSpacing: 0.26,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              width: 300,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffE8EDF0),
              ),
              child: DropdownButton<String>(
                hint: const Text('Select Your Campus', textAlign: TextAlign.center,),
                icon: const Icon(Icons.arrow_drop_down),
                value: dropdownValue,
                elevation: 18,
                underline: const SizedBox(),
                style: const TextStyle(
                  color: Color(0xff0b111e),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.26,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _campusId = _campusList.indexOf(newValue!).toString();
                    dropdownValue = newValue;
                    new LoginController().setCampusId(_campusId);
                  });
                },
                items: _campusList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                if (_campusId != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginController(),
                    ),
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 28,
                    height: 28,
                    child: Image.asset('assets/images/google.png'),
                  ),
                  const Text(
                    ' Sign in with Google',
                    style: TextStyle(
                      color: Color(0xff0b111e),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xffE8EDF0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: const Size(300, 50),
              ),
            ),
            Text(_campusId ?? "Nothing"),
          ],
        ),
      ),
    );
  }
}
