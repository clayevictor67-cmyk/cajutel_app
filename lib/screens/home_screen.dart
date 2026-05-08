import 'package:flutter/material.dart';
import 'plans_screen.dart';
import 'account_screen.dart';
import 'settings_screen.dart';
import 'payment_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const HomePage(),
    const PlansScreen(),
    const AccountScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.wifi),
            label: "Plans",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

////////////////////////////////////////////////////////////
/// HOME PAGE
////////////////////////////////////////////////////////////

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget quickButton(IconData icon, String text) {
    return Column(
      children: [
        Container(
          height: 48,
          width: 48,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),

          child: Icon(
            icon,
            color: Colors.blue,
            size: 22,
          ),
        ),

        const SizedBox(height: 5),

        Text(
          text,
          style: const TextStyle(fontSize: 11),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,

      body: SafeArea(
        child: Column(
          children: [

            ////////////////////////////////////////////////////
            /// WHITE BODY
            ////////////////////////////////////////////////////

            Expanded(
              child: Container(
                width: double.infinity,

                decoration: const BoxDecoration(
                  color: Color(0xfff5f5f5),

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28),
                    topRight: Radius.circular(28),
                  ),
                ),

                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      ////////////////////////////////////////////////////
                      /// TOP USER CARD
                      ////////////////////////////////////////////////////

                      Container(
                        padding: const EdgeInsets.all(16),

                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(18),
                        ),

                        child: const Row(
                          children: [

                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                            ),

                            SizedBox(width: 10),

                            Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [

                                Text(
                                  "Welcome",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),

                                SizedBox(height: 3),

                                Text(
                                  "Cajutel User",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),

                      ////////////////////////////////////////////////////
                      /// ACTIVE PLAN
                      ////////////////////////////////////////////////////

                      Container(
                        padding: const EdgeInsets.all(16),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),

                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,

                          children: [

                            const Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [

                                Text(
                                  "Active Plan",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),

                                SizedBox(height: 6),

                                Text(
                                  "10 Mbps Unlimited",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),

                                SizedBox(height: 4),

                                Text(
                                  "Expires: 30 March",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),

                            const Text(
                              "6 Days Left",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 22),

                      ////////////////////////////////////////////////////
                      /// QUICK ACTIONS
                      ////////////////////////////////////////////////////

                      const Text(
                        "Quick Actions",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 18),

                      ////////////////////////////////////////////////////
                      /// FIRST ROW
                      ////////////////////////////////////////////////////

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,

                        children: [

                          //////////////////////////////////////////////////
                          /// 1 DAY
                          //////////////////////////////////////////////////

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const PaymentScreen(
                                    planName: "1 Day Plan",
                                    price: "10 NLe",
                                    duration: "1 Day",
                                    speed: "10 Mbps",
                                  ),
                                ),
                              );
                            },

                            child: quickButton(
                              Icons.flash_on,
                              "1 Day",
                            ),
                          ),

                          //////////////////////////////////////////////////
                          /// 7 DAYS
                          //////////////////////////////////////////////////

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const PaymentScreen(
                                    planName: "7 Days Plan",
                                    price: "35 NLe",
                                    duration: "7 Days",
                                    speed: "10 Mbps",
                                  ),
                                ),
                              );
                            },

                            child: quickButton(
                              Icons.flash_on,
                              "7 Days",
                            ),
                          ),

                          //////////////////////////////////////////////////
                          /// 1 MONTH
                          //////////////////////////////////////////////////

                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const PaymentScreen(
                                    planName: "1 Month Plan",
                                    price: "100 NLe",
                                    duration: "30 Days",
                                    speed: "10 Mbps",
                                  ),
                                ),
                              );
                            },

                            child: quickButton(
                              Icons.flash_on,
                              "1 Month",
                            ),
                          ),

                          //////////////////////////////////////////////////
                          /// PAYMENTS
                          //////////////////////////////////////////////////

                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Payments Coming Soon"),
                                ),
                              );
                            },

                            child: quickButton(
                              Icons.payment,
                              "Payments",
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      ////////////////////////////////////////////////////
                      /// SECOND ROW
                      ////////////////////////////////////////////////////

                      Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,

                        children: [

                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Speed Test Coming Soon"),
                                ),
                              );
                            },

                            child: quickButton(
                              Icons.speed,
                              "Speed",
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Support Coming Soon"),
                                ),
                              );
                            },

                            child: quickButton(
                              Icons.support_agent,
                              "Support",
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Usage Screen Coming Soon"),
                                ),
                              );
                            },

                            child: quickButton(
                              Icons.bar_chart,
                              "Usage",
                            ),
                          ),

                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("More Features Coming Soon"),
                                ),
                              );
                            },

                            child: quickButton(
                              Icons.more_horiz,
                              "More",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}