import 'package:flutter/material.dart';
import 'package:zoom_clone/pages/home_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  var tfPswrd = TextEditingController();
  var tfEmail = TextEditingController();

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF242424),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFF242424),
            shadowColor: Colors.transparent,
            title: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Text(
                  "ZOOM",
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
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
                  controller: tfEmail,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade700,
                      border: InputBorder.none,
                      hintText: "Email Address",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w600,
                      )),
                ),
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
                  controller: tfPswrd,
                  obscureText: true,
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade700,
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              ((tfEmail.text.isEmpty || tfPswrd.text.isEmpty))
                  ? Container(
                      width: size.width * 0.85,
                      height: 50,
                      decoration: BoxDecoration(
                        color: (tfEmail.text.isEmpty || tfPswrd.text.isEmpty)
                            ? Colors.grey.shade700
                            : Colors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                              color:
                                  (tfEmail.text.isEmpty || tfPswrd.text.isEmpty)
                                      ? Colors.grey.shade400
                                      : Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        print("Sign in as ${tfEmail.text}");
                        snackBar("Sign in as ${tfEmail.text}");
                      },
                      child: Container(
                        width: size.width * 0.85,
                        height: 50,
                        decoration: BoxDecoration(
                          color: (tfEmail.text.isEmpty || tfPswrd.text.isEmpty)
                              ? Colors.grey.shade700
                              : Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                                color: (tfEmail.text.isEmpty ||
                                        tfPswrd.text.isEmpty)
                                    ? Colors.grey.shade400
                                    : Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                height: 35,
              ),
              GestureDetector(
                onTap: () {
                  print("Clicked on Forget Password? button");
                  snackBar("Clicked on Forget Password? button");
                },
                child: Text(
                  "Forget Password?",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: size.height * 0.25,
              ),
              GestureDetector(
                onTap: () {
                  print("Clicked Sign in with SSO button");
                  snackBar("Sign in with SSO");
                },
                child: Container(
                  width: size.width * 0.85,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Transform.rotate(
                          angle: 170,
                          child: Icon(
                            Icons.vpn_key,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Sign In with SSO",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  print("Clicked Sign in with Google button");
                  snackBar("Sign in with Google");
                },
                child: Container(
                  width: size.width * 0.85,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 21,
                          height: 21,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/icons/google.png"))),
                        ),
                        Spacer(),
                        Text(
                          "Sign In with Google",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  print("Clicked Sign in with Facebook button");
                  snackBar("Sign in with Facebook");
                },
                child: Container(
                  width: size.width * 0.85,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/icons/facebook.png"))),
                        ),
                        Spacer(),
                        Text(
                          "Sign In with Facebook",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
