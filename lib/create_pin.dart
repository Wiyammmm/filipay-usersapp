import 'package:filipayusersapp/home.dart';
import 'package:flutter/material.dart';

class CreatePinPage extends StatefulWidget {
  const CreatePinPage({super.key});

  @override
  State<CreatePinPage> createState() => _CreatePinPageState();
}

class _CreatePinPageState extends State<CreatePinPage> {
  bool create = true;
  List<int> pin = [];
  final int pinLength = 4;
  List<int> confirmpin = [];
  String createdPin = '';
  String confirmPinEnter = '';

  void _onNumberButtonPressed(int number) {
    if (create) {
      if (pin.length < pinLength) {
        setState(() {
          pin.add(number);
        });
      }
    } else {
      if (confirmpin.length < pinLength) {
        setState(() {
          confirmpin.add(number);
        });
      }
    }
  }

  void _onBackButtonPressed() {
    if (create) {
      if (pin.isNotEmpty) {
        setState(() {
          pin.removeLast();
        });
      }
    } else {
      if (confirmpin.isNotEmpty) {
        setState(() {
          confirmpin.removeLast();
        });
      }
    }
  }

  void _onEnterButtonPressed() {
    if (create) {
      if (pin.length == pinLength) {
        // Here, you can use the `pin` list for further processing.
        print('Entered PIN: ${pin.join()}');

        setState(() {
          createdPin = pin.join();
          create = false;
        });
        // You can navigate to the next screen or perform any other actions here.
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.only(top: 16, bottom: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  // side: BorderSide(
                  //   color: Color(0xFFa02e49),
                  //   width: 3.0,
                  // ),
                ),
                title: Text(
                  create ? 'CREATE PIN' : 'CONFIRM PIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.orange[400]),
                ),
                content: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Column(
                    children: [
                      FittedBox(
                          child: Text(
                        'Please enter a $pinLength-digit PIN.',
                      )),
                      Text('Please try again.'),
                      SizedBox(height: 10),
                      // Divider(
                      //   thickness: 2,
                      // ),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  ),
                ),
              );
            });
      }
    } else {
      if (confirmpin.length == pinLength) {
        // Here, you can use the `pin` list for further processing.
        print('Entered Confirm PIN: ${confirmpin.join()}');
        confirmPinEnter = confirmpin.join();
        if (confirmPinEnter == createdPin) {
          print('confirmed');
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: ((context) => HomePage())));
        } else {
          print('not confirm');
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  titlePadding: EdgeInsets.only(top: 16, bottom: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    // side: BorderSide(
                    //   color: Color(0xFFa02e49),
                    //   width: 3.0,
                    // ),
                  ),
                  title: Text(
                    'INVALID PIN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.orange[400]),
                  ),
                  content: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: Column(
                      children: [
                        FittedBox(
                            child: Text(
                          'PIN do not match',
                        )),
                        Text('Please try again.'),
                        SizedBox(height: 10),
                        // Divider(
                        //   thickness: 2,
                        // ),
                        Center(
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue[900],
                                      fontWeight: FontWeight.bold))),
                        ),
                      ],
                    ),
                  ),
                );
              });
        }

        // You can navigate to the next screen or perform any other actions here.
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding: EdgeInsets.zero,
                titlePadding: EdgeInsets.only(top: 16, bottom: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  // side: BorderSide(
                  //   color: Color(0xFFa02e49),
                  //   width: 3.0,
                  // ),
                ),
                title: Text(
                  create ? 'CREATE PIN' : 'CONFIRM PIN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.orange[400]),
                ),
                content: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: Column(
                    children: [
                      FittedBox(
                          child: Text(
                        'Please enter a $pinLength-digit PIN.',
                      )),
                      Text('Please try again.'),
                      SizedBox(height: 10),
                      // Divider(
                      //   thickness: 2,
                      // ),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold))),
                      ),
                    ],
                  ),
                ),
              );
            });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              create ? 'CREATE PIN' : 'CONFIRM PIN',
              style: TextStyle(
                  color: Colors.blue[900],
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.06),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Text(
                'To protect the securty of your account, please register a 4-Digit PIN Code.',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (create)
                  for (int i = 0; i < pinLength; i++)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: i < pin.length ? Colors.blue : Colors.grey,
                        ),
                      ),
                    ),
                if (!create)
                  for (int i = 0; i < pinLength; i++)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              i < confirmpin.length ? Colors.blue : Colors.grey,
                        ),
                      ),
                    ),
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildNumberButton(1),
                    _buildNumberButton(2),
                    _buildNumberButton(3),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildNumberButton(4),
                    _buildNumberButton(5),
                    _buildNumberButton(6),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildNumberButton(7),
                    _buildNumberButton(8),
                    _buildNumberButton(9),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildNumberButton(0),

                      _buildBackButton(),
                      // _buildEnterButton(),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                onPressed: () {
                  _onEnterButtonPressed();
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF53a1d8), // Background color of the button
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Border radius
                  ),
                ),
                child: Text(
                  create ? 'ENTER' : 'CONFIRM',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberButton(int number) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _onNumberButtonPressed(number),
        child: Text(
          '$number',
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.08,
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: ElevatedButton(
        onPressed: _onBackButtonPressed,
        child: Icon(
          Icons.backspace_outlined,
          size: MediaQuery.of(context).size.width * 0.08,
        ),
      ),
    );
  }
}
