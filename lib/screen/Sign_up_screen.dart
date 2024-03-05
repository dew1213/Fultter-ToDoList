import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:onboarding_screen/screen/Home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final repasswordController = TextEditingController();

  SingupWithEmail() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      print("Create successfully");
      _showMyDialog("Createsucessfuldsdsad");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void _showMyDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            backgroundColor: Colors.amberAccent,
            title: const Text('AlertDialog Title'),
            content: Text(txtMsg),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Column(
        children: [
          const Spacer(),
          Text(
            "Welcome to our community",
            style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.bodyLarge,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              "\nTo get started, please provide your information to create an account",
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displaySmall,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            controller: nameController,
            hintText: "Enter your name.",
            obscureText: false,
            labelText: "Name",
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            controller: emailController,
            hintText: "Enter your email.",
            obscureText: false,
            labelText: "Email",
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            controller: passwordController,
            hintText: "Enter your password.",
            obscureText: true,
            labelText: "Password",
          ),
          const SizedBox(
            height: 20,
          ),
          MyTextField(
            controller: repasswordController,
            hintText: "Enter your password again.",
            obscureText: true,
            labelText: "Re-password",
          ),
          const SizedBox(
            height: 20,
          ),
          MyButton(onTap: SingupWithEmail, hintText: "Sign up"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Have a member ?",
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 1,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Sign in.",
                    style: GoogleFonts.lato(
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                    ),
                  )),
            ],
          ),
          const Spacer(),
        ],
      )),
    );
  }
}
