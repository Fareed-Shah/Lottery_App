import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int x = 5;
  int input = 0;
  TextEditingController randomController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.teal,
          title: const Text(
            'Lottery App',
            style: TextStyle(fontFamily: 'Pacifo'),
          ),
        ),
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 20.0),
                  child: TextFormField(
                    controller: randomController,
                    // For accepting only numbers in textformfiled.
                    inputFormatters: [
                      //
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        fillColor: const Color(0xffF8F9FA),
                        filled: true,
                        hintText: 'Enter Your Lottery Number',
                        hintStyle: const TextStyle(fontFamily: 'Pacifo'),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xffE4E7EB)),
                            borderRadius: BorderRadius.circular(15.00)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.00))),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        minimumSize: const Size(20.00, 40.00)),
                    onPressed: () {
                      setState(() {
                        input = int.parse(randomController.text);
                        randomController.clear();
                      });
                    },
                    child: const Text(
                      'Find Lottery',
                      style: TextStyle(fontFamily: 'Secular Regular'),
                    )),
                const SizedBox(
                  height: 50.00,
                ),
                Text(
                  'Your Lottery Number:  $input',
                  style: const TextStyle(fontFamily: 'Secular Regular'),
                ),
                const SizedBox(
                  height: 20.00,
                ),
                Container(
                  height: 250,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                  child: input == 0
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.person,
                              color: Colors.green,
                              size: 35.0,
                            ),
                            SizedBox(
                              height: 10.00,
                            ),
                            Text(
                              'Enter Your Lottery Number',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      : x == input
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.done_all,
                                  color: Colors.green,
                                  size: 35.0,
                                ),
                                SizedBox(
                                  height: 10.00,
                                ),
                                Text(
                                  'You won the Lottery',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 35.0,
                                ),
                                const SizedBox(
                                  height: 10.00,
                                ),
                                Text(
                                  'Better Luck For Next Time \n Lottery Winning Number is $x',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
