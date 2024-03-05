import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home_screen.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});
  final List<PageViewModel> pages = [
    PageViewModel(
      title: 'ORDER',
      body: 'Begin your shopping journey with us!  ',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 8,
              ),
              onPressed: () {},
              child: const Text("Let's get started"),
            ),
          ],
        ),
      ),
      image: Image.asset("assets/images/2.png"),
      decoration: const PageDecoration(
        imagePadding: EdgeInsets.all(16.0),
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        pageColor: Color.fromARGB(255, 183, 181, 106),
      ),
    ),
    PageViewModel(
      title: 'PAYMENT',
      body:
          'Secure your purchases! Add your payment details and enjoy worry-free transactions.',
      footer: SizedBox(
        height: 45,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 8,
              ),
              onPressed: () {},
              child: const Text("Let's get started"),
            ),
          ],
        ),
      ),
      image: Image.asset("assets/images/1.png"),
      decoration: const PageDecoration(
          imagePadding: EdgeInsets.all(16.0),
          pageColor: Color.fromARGB(255, 88, 169, 185),
          titleTextStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          )),
    ),
    PageViewModel(
        title: 'DELIVERY',
        body: 'Choose your delivery options to get started.',
        footer: SizedBox(
          height: 45,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 8,
                ),
                onPressed: () {},
                child: const Text("Let's get started"),
                
              ),
            ],
          ),
        ),
        image: Image.asset("assets/images/3.png"),
        decoration: const PageDecoration(
            imagePadding: EdgeInsets.all(16.0),
            pageColor: Color.fromARGB(255, 118, 185, 121),
            titleTextStyle: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 109, 108, 80),
        title: const Text("Welcome to wet tamarind company"),
        centerTitle: true,
      ),
      body: IntroductionScreen(
        pages: pages,
        showSkipButton: true,
        skip: const Text(
          "skip",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0), // กำหนดสีของข้อความเป็นสีแดง
          ),
        ),
        showDoneButton: true,
        done: const Text(
          "done",
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0), // กำหนดสีของข้อความเป็นสีแดง
          ),
        ),
        showNextButton: true,
        next: const Icon(
          Icons.arrow_forward,
          size: 25,
          color: Colors.black,
        ),
        onDone: () => onDone(context), // ต้องการ function
        curve: Curves.bounceOut,
        dotsDecorator: DotsDecorator(
          size: const Size.square(9),
          color: const Color.fromARGB(255, 0, 0, 0),
          activeColor: const Color.fromARGB(255, 134, 107, 68),
          activeSize: const Size(18.0, 9.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }

  void onDone(context) async {
    final prefers = await SharedPreferences.getInstance();
    await prefers.setBool("On boarding", false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>  HomeScreen(),
      ),
    );
  }
}
