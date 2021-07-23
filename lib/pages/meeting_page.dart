import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zoom_clone/models/meeting_page_model.dart';
import 'package:zoom_clone/pages/home_page.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  _MeetingPageState createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  int pageIndex = 2;
  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
    if (index == 0) {
      print("Clicked Mute Button");
    }
    if (index == 1) {
      print("Clicked Stop Video Button");
    }
    if (index == 2) {
      print("Clicked Share Screen Button");
    }

    if (index == 3) {
      print("Clicked Participants Button");
    }
    if (index == 4) {
      print("Clicked More Button");
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF242424),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                FaIcon(FontAwesomeIcons.volumeMute),
                SizedBox(
                  width: 15,
                ),
                FaIcon(FontAwesomeIcons.camera),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.security_outlined,
                  color: Colors.green,
                  size: 15,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Zoom",
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                  size: 20,
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()),
                    (route) => false);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, top: 5, bottom: 5),
                  child: Text("Leave",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            )
          ],
        ),
      ),
      body: Container(
        color: Color(0xFF242424),
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Center(
              child: Container(
                width: size.width,
                height: size.height * 0.50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/meeting_room2.jpg"),
                        fit: BoxFit.fill)),
              ),
            ),
            Positioned(
              top: 15,
              right: 15,
              child: Container(
                width: 120,
                height: 170,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage("assets/images/meeting_room1.jpg"),
                        fit: BoxFit.fill)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 90,
        decoration: BoxDecoration(
            color: Color(0xFF242424),
            border: Border(
                top: BorderSide(
                    width: 2, color: Colors.black.withOpacity(0.06)))),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(textItems.length, (index) {
              return InkWell(
                  onTap: () {
                    selectedTab(index);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FaIcon(bottomItems[index],
                          size: sizedItems[index], color: colorItems[index]),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        textItems[index],
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: colorItems[index]),
                      )
                    ],
                  ));
            }),
          ),
        ),
      ),
    );
  }
}
