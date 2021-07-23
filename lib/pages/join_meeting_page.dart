import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zoom_clone/pages/home_page.dart';
import 'package:zoom_clone/pages/meeting_page.dart';

class JoinMeetingPage extends StatefulWidget {
  const JoinMeetingPage({Key? key}) : super(key: key);

  @override
  _JoinMeetingPageState createState() => _JoinMeetingPageState();
}

class _JoinMeetingPageState extends State<JoinMeetingPage> {
  bool switchAudio = false;
  bool switchVideo = false;
  bool tfMeetingIdCheck = false;
  var tfMeetingId = TextEditingController();
  var tfYourName = TextEditingController();

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF242424),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF242424),
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                    color: Colors.blue[700],
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              width: 70,
            ),
            Text(
              "Join a Meeting",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.6, color: Colors.grey.shade400),
                  top: BorderSide(width: 0.6, color: Colors.grey.shade400),
                ),
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: tfMeetingId,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade700,
                    border: InputBorder.none,
                    hintText: (tfMeetingIdCheck)
                        ? "Personal Link Name"
                        : "Meeting ID",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontWeight: FontWeight.w600,
                    ),
                    suffixIcon: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.centerEnd,
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 0.6, color: Colors.blue)),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  (tfMeetingIdCheck)
                      ? tfMeetingIdCheck = false
                      : tfMeetingIdCheck = true;
                });
              },
              child: (tfMeetingIdCheck)
                  ? Text(
                      "Join with meeting ID",
                      style: TextStyle(color: Colors.blue),
                    )
                  : Text(
                      "Join with a personel link name",
                      style: TextStyle(color: Colors.blue),
                    ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.6, color: Colors.grey.shade400),
                  top: BorderSide(width: 0.6, color: Colors.grey.shade400),
                ),
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: tfYourName,
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade700,
                  border: InputBorder.none,
                  hintText: "Your Name",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                'By clicking "Join", you agree to our Terms of Service and Privacy Statement',
                style: TextStyle(color: Colors.grey.shade400, height: 1.5),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            (tfMeetingId.text.isEmpty || tfYourName.text.isEmpty)
                ? Container(
                    width: size.width * 0.8,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xffe4e4ed),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Text(
                        "Join",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      print(
                          "Joined to ${tfMeetingId.text} as ${tfYourName.text}");
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MeetingPage()),
                          (route) => false);
                    },
                    child: Container(
                      width: size.width * 0.8,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "Join",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Text(
                "If you received an invitation link, tab on the link again to join the meeting",
                style: TextStyle(color: Colors.grey.shade400, height: 1.5),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 10.0, bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "JOIN OPTIONS",
                  style: TextStyle(
                      color: Colors.grey.shade400, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                border: Border(
                  bottom: BorderSide(width: 0.6, color: Colors.grey.shade400),
                  top: BorderSide(width: 0.6, color: Colors.grey.shade400),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Don't Connect To Audio",
                      style: TextStyle(
                          color: Colors.white,
                          height: 1.5,
                          fontWeight: FontWeight.w600),
                    ),
                    Switch(
                        activeColor: Colors.white,
                        activeTrackColor: Colors.green,
                        value: switchAudio,
                        onChanged: (value) {
                          setState(() {
                            switchAudio = value;
                          });
                        })
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                border: Border(
                  bottom: BorderSide(width: 0.6, color: Colors.grey.shade400),
                  top: BorderSide(width: 0.6, color: Colors.grey.shade400),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Turn Off My Video",
                      style: TextStyle(
                          color: Colors.white,
                          height: 1.5,
                          fontWeight: FontWeight.w600),
                    ),
                    Switch(
                        activeColor: Colors.white,
                        activeTrackColor: Colors.green,
                        value: switchVideo,
                        onChanged: (value) {
                          setState(() {
                            switchVideo = value;
                          });
                        })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
