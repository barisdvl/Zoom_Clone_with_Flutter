import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:zoom_clone/pages/home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late DateTime selectedDate;

  void snackBar(text) {
    final snackBar = SnackBar(
      content: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF242424),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF242424),
          shadowColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "For verifivation, please confirm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "your date of birth",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 0.6, color: Colors.grey.shade400),
                        top:
                            BorderSide(width: 0.6, color: Colors.grey.shade400),
                      ),
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.grey.shade800),
                          shadowColor: MaterialStateProperty.all<Color>(
                              Colors.transparent)),
                      child: Center(
                          child: Text(
                        "Day/Month/Year",
                        style: TextStyle(color: Colors.grey),
                      )),
                      onPressed: () async {
                        var datePicked = await DatePicker.showSimpleDatePicker(
                          context,
                          textColor: Colors.white,
                          backgroundColor: Colors.grey.shade800,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1960),
                          lastDate: DateTime(2100),
                          dateFormat: "dd-MMMM-yyyy",
                          locale: DateTimePickerLocale.en_us,
                          looping: true,
                        ).then((receivedDate) {
                          if (receivedDate != null) {
                            setState(() {
                              selectedDate = receivedDate;
                            });
                          }
                        });
                        snackBar(
                            "Date Picked ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}");
                      },
                    ),
                  ),
                ),
              ),
              Text("This data will not be stored",
                  style: TextStyle(
                      color: Colors.grey.shade300,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
