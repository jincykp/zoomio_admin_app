import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zoomio_adminapp/presentaions/custom_widgets/buttons.dart';
import 'package:zoomio_adminapp/presentaions/custom_widgets/signup_formfields.dart';
import 'package:zoomio_adminapp/presentaions/home_screen.dart';

import 'package:zoomio_adminapp/presentaions/styles/styles.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();

  final String adminName = "admin";
  final String adminPassword = "mypassword";

  @override
  void initState() {
    super.initState();
    setPredefinedCredentials(); // Set predefined credentials when the app starts
  }

  // Store the predefined admin credentials in SharedPreferences
  Future<void> setPredefinedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('adminname', adminName);
    await prefs.setString('adminPassword', adminPassword);
  }

  // Validate entered admin credentials with the stored ones
  Future<bool> validateAdminCredentials(
      String enteredName, String enteredPassword) async {
    final prefs = await SharedPreferences.getInstance();
    String? storedName = prefs.getString('adminname');
    String? storedPassword = prefs.getString('adminPassword');
    return storedName == enteredName && storedPassword == enteredPassword;
  }

  // Handle the login process
  Future<void> handleLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      String enteredName = nameController.text.trim();
      String enteredPassword = passWordController.text.trim();

      bool isValid =
          await validateAdminCredentials(enteredName, enteredPassword);

      if (isValid) {
        // Login successful
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text("Login successful"),
          backgroundColor: ThemeColors.successColor,
        ));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else {
        // Login failed
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Invalid admin name and password")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sign In", style: TextStyle(fontSize: 22),
                  // style: Textstyles.titleText,
                ),
                SizedBox(
                  height: screenWidth * 0.04,
                ),
                SignupFormfields(
                  controller: nameController,
                  hintText: "Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: screenWidth * 0.04,
                ),
                SignupFormfields(
                  controller: passWordController,
                  hintText: "Password",
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: screenWidth * 0.04,
                ),
                CustomButtons(
                  text: "Sign In",
                  onPressed: handleLogin, // Trigger the login function
                  backgroundColor: ThemeColors.primaryColor,
                  textColor: ThemeColors.textColor,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
