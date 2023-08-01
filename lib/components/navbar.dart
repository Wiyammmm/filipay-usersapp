import 'package:filipayusersapp/login_screen.dart';
import 'package:flutter/material.dart';

class SideNavBar extends StatefulWidget {
  const SideNavBar({super.key});

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  void _Logout() {
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
              'LOGOUT',
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
                    'Are you sure you want to Log out?',
                  )),
                  // Text('Please try again.'),
                  SizedBox(height: 10),
                  // Divider(
                  //   thickness: 2,
                  // ),
                  Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('NO',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold))),
                      TextButton(
                          onPressed: () {
                            // Navigator.of(context).pop();
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: ((context) => LoginScreen())));
                          },
                          child: Text('YES',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold))),
                    ],
                  )),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Drawer(
      child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            color: Color(0xFF53a1d8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    color: Color(0xFFa4d2ec),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color(0xFF0a5c7c), // Choose the border color
                      width: 3.0, // Adjust the border width as needed
                    ),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/filipaywoman.png', // Replace with your image path
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35,
                        child: FittedBox(
                          child: Text(
                            'Jhon Dela Cruz',
                            style: TextStyle(
                                color: Color(0xFF002657),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Text(
                        '@JuanDelaCruz',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Standard',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: Image.asset(
                  'assets/e-wallet.png',
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                title: Text(
                  'E-Wallet',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Image.asset(
                  'assets/transaction-history.png',
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                title: Text(
                  'Transaction History',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Image.asset(
                  'assets/profile.png',
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                title: Text(
                  'Profile Settings',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Image.asset(
                  'assets/messages.png',
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                title: Text(
                  'Messages',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Image.asset(
                  'assets/emergency.png',
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                title: Text(
                  'Emergency',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: Image.asset(
                  'assets/bookings.png',
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                title: Text(
                  'My Bookings',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]),
                ),
                onTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Divider(
                  thickness: 2,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Text(
                  'Settings & Privacy',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontStyle: FontStyle.italic,
                      color: Colors.blue),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terms of Service',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Privacy Policy',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        _Logout();
                      },
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
