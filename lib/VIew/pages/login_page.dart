import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o_mobile/Model/consts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  FocusNode nodeOne = FocusNode();
  FocusNode nodeTwo = FocusNode();
  var kodController = TextEditingController();
  var izohController = TextEditingController();

  void onTapButton(BuildContext context) {
    if (kodController.text.length != 9) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Xatolik!'),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'images/error.png',
                        fit: BoxFit.cover,
                      ),
                      const Text('Kiritilgan kod yaroqli emas'),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Ok',
                        style: GoogleFonts.montserrat(color: kprimaryColor),
                      ))
                ],
              ));
    } else {
      //TODO internet connection check
      sentData(kodController.text, izohController.text);
      //TODO then
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('Done'),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.asset(
                        'images/done.png',
                        fit: BoxFit.cover,
                      ),
                      const Text('So\'rov jo\'natildi'),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Ok',
                        style: GoogleFonts.montserrat(color: kprimaryColor),
                      ))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              const SizedBox(height: 120),
              const Text(
                'OMobile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kprimaryColor,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 120),
              const Text(
                '*Kod va izoh kiriting',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: kprimaryColor)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    labelText: 'Kod',
                    labelStyle: TextStyle(color: kprimaryColor)),
                controller: kodController,
                onSubmitted: (val) {
                  print(val);
                  FocusScope.of(context).requestFocus(nodeTwo);
                },
              ),
              const SizedBox(height: 30),
              TextField(
                focusNode: nodeTwo,
                textInputAction: TextInputAction.send,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide(color: kprimaryColor)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    labelText: 'Izoh',
                    labelStyle: TextStyle(color: kprimaryColor)),
                controller: izohController,
                onSubmitted: (txt) {
                  //TODO sent
                  onTapButton(context);
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  //TODO sent
                  onTapButton(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: const BoxDecoration(
                      color: kprimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: const Center(child: Text('Jo\'natish')),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
