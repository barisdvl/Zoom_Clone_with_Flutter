import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/models/home.dart';
import 'package:zoom_clone/pages/join_meeting_page.dart';
import 'package:zoom_clone/pages/signin_page.dart';
import 'package:zoom_clone/pages/signup_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activetab = 0;
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.settings_outlined,
              color: Colors.grey,
            ),
            Spacer(),
            Row(
              children: List.generate(4, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: activetab == index
                            ? Color(0xFFcfcfcf).withOpacity(0.2)
                            : Color(0xFFcfcfcf)),
                  ),
                );
              }),
            ),
            Spacer()
          ],
        ),
      ),
      body: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 0.99,
          height: size.height,
          onPageChanged: (int index, reason) {
            setState(() {
              activetab = index;
            });
          },
        ),
        items: List.generate(items.length, (index) {
          return Container(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      items[index]["title"],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      items[index]["description"],
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
                items[index]["img"] == null
                    ? Container()
                    : Container(
                        width: 280,
                        height: 280,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(items[index]["img"]))),
                      ),
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: Container(
        width: size.width,
        height: 150,
        decoration: BoxDecoration(color: Color(0xFF242424)),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JoinMeetingPage()));
                },
                child: Container(
                  width: size.width * 0.75,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xFF0e72ec),
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text(
                      "Join a Meeting",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xFF0e72ec),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInPage()));
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(0xFF0e72ec),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
