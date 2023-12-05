import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_app/presentation/controllers/account_controller_appwriter.dart';

class appwriteLoginPage extends StatefulWidget {
  @override
  State<appwriteLoginPage> createState() => _appwriteLoginPageState();
}

class _appwriteLoginPageState extends State<appwriteLoginPage> {
  final AccountController _appwriterController = Get.put(AccountController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13131B),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Image.asset(
                'assets/images/logo1.png',
                width: 200,
                height: 200,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              height: 580,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: const Color(0xFFF5F5F5)),
              child: Column(
                children: [
                  SizedBox(
                      width: 360,
                      height: 40,
                      child: const Text(
                        "AppWrite Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                        textAlign: TextAlign.start,
                      )),
                  SizedBox(
                      width: 360,
                      height: 40,
                      child: const Text(
                        "Sign In to your account to continue where you left",
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.start,
                      )),
                  Container(
                    width: 360,
                    height: 60,
                    padding: EdgeInsets.fromLTRB(24, 6, 20, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFFD4D4D4)),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: "Email", border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 360,
                    height: 60,
                    padding: EdgeInsets.fromLTRB(24, 6, 20, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFFD4D4D4)),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Password", border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 200,
                    height: 50,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 219, 125, 3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: _appwriterController.isLoading.value
                          ? null
                          : () {
                              _appwriterController.createEmailSession(
                                _emailController.text,
                                _passwordController.text,
                              );
                            },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
