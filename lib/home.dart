import 'package:filipayusersapp/qrcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool payAhead = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2cb2e6),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text('hello, Jhon!'),
          )
        ],
      ),
      drawer: SideNavBar(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/citybg.png",
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.89,
              color: Colors.white.withOpacity(0.9),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: FittedBox(
                          child: Row(
                            children: [
                              Text('Smile Always',
                                  style: TextStyle(
                                      fontFamily: 'DaiBannaSIL',
                                      fontStyle: FontStyle.italic,
                                      color: Colors.orange)),
                              Text(
                                '!',
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Color(0xFFf2f2f2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('TRANSPORTATION',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06)),
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            height: 40,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue[900],
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage('assets/car.png'),
                                    fit: BoxFit.contain)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Color(0xFFe6f4ff),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                vehicleBtn(
                                  icon: 'jeepney',
                                  btnName: 'Jeepney',
                                ),
                                vehicleBtn(
                                  icon: 'bus',
                                  btnName: 'Bus',
                                ),
                                vehicleBtn(
                                  icon: 'mini-van',
                                  btnName: 'UV Express',
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                vehicleBtn(
                                  icon: 'ship',
                                  btnName: 'Ship',
                                ),
                                vehicleBtn(
                                  icon: 'tricycle',
                                  btnName: 'Tricycle',
                                ),
                                vehicleBtn(
                                  icon: 'taxi',
                                  btnName: 'Taxi',
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                vehicleBtn(
                                  icon: 'ticket-flight',
                                  btnName: 'Plane',
                                ),
                                vehicleBtn(
                                  icon: 'train',
                                  btnName: 'Train',
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                elevation: 20,
                color: Colors.white.withOpacity(0.3),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.06,
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  payAhead = true;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: payAhead
                                    ? Color(0xFF2e3191)
                                    : Colors
                                        .white, // Background color of the button
                                padding: EdgeInsets.symmetric(horizontal: 24.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                      color: Color(0xFF2e3191), width: 2.0),
                                ),
                              ),
                              child: FittedBox(
                                child: Text(
                                  'PAY AHEAD',
                                  style: TextStyle(
                                      color: payAhead
                                          ? Colors.white
                                          : Color(0xFF2e3191),
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  payAhead = false;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: payAhead
                                    ? Colors.white
                                    : Color(
                                        0xFF2e3191), // Background color of the button
                                padding: EdgeInsets.symmetric(horizontal: 24.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Border radius
                                  side: BorderSide(
                                      color: Color(0xFF2e3191), width: 2.0),
                                ),
                              ),
                              child: FittedBox(
                                child: Text(
                                  'PAY ON THE GO',
                                  style: TextStyle(
                                      color: payAhead
                                          ? Color(0xFF2e3191)
                                          : Colors.white,
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.05,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blue, // Choose the border color
                    width: 3.0, // Adjust the border width as needed
                  ),
                ),
                child: AspectRatio(
                  aspectRatio: 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipOval(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QrCodeScanner()),
                          );
                        },
                        child: Image.asset(
                          'assets/qr-code.png',
                          width: 10, // Replace with your image path
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}

class vehicleBtn extends StatelessWidget {
  const vehicleBtn({
    super.key,
    required this.icon,
    required this.btnName,
  });
  final String icon;
  final String btnName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
              color: Color(0xFF53a1d8),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: Color(0xFFa4d2ec),
                shape: BoxShape.circle,
              ),
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/$icon.png', // Replace with your image path
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Text(
          '$btnName',
          style: TextStyle(color: Colors.blue[900]),
        )
      ],
    );
  }
}
