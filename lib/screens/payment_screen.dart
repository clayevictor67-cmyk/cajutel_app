import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final String planName;
  final String price;
  final String duration;
  final String speed;

  const PaymentScreen({
    super.key,
    required this.planName,
    required this.price,
    required this.duration,
    required this.speed,
  });

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedMethod = "";

  Widget paymentCard({
    required String title,
    required IconData icon,
    required Color color,
  }) {
    bool isSelected = selectedMethod == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = title;
        });
      },

      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.15) : Colors.white,

          borderRadius: BorderRadius.circular(16),

          border: Border.all(
            color: isSelected ? color : Colors.transparent,
            width: 2,
          ),
        ),

        child: Row(
          children: [

            //////////////////////////////////////////////////
            /// ICON
            //////////////////////////////////////////////////

            Container(
              height: 50,
              width: 50,

              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),

              child: Icon(
                icon,
                color: color,
                size: 28,
              ),
            ),

            const SizedBox(width: 14),

            //////////////////////////////////////////////////
            /// TEXT
            //////////////////////////////////////////////////

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),

            //////////////////////////////////////////////////
            /// CHECK
            //////////////////////////////////////////////////

            if (isSelected)
              Icon(
                Icons.check_circle,
                color: color,
              ),
          ],
        ),
      ),
    );
  }

  ////////////////////////////////////////////////////////////
  /// BUILD
  ////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,

      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text("Payment"),
      ),

      ////////////////////////////////////////////////////////////
      /// BODY
      ////////////////////////////////////////////////////////////

      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(
          color: Color(0xfff5f5f5),

          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //////////////////////////////////////////////////
              /// PLAN CARD
              //////////////////////////////////////////////////

              Container(
                padding: const EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(18),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      widget.planName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      widget.speed,
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      widget.duration,
                      style: const TextStyle(
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      widget.price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              //////////////////////////////////////////////////
              /// TITLE
              //////////////////////////////////////////////////

              const Text(
                "Choose Payment Method",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 18),

              //////////////////////////////////////////////////
              /// PAYMENT METHODS
              //////////////////////////////////////////////////

              paymentCard(
                title: "Orange Money",
                icon: Icons.account_balance_wallet,
                color: Colors.orange,
              ),

              paymentCard(
                title: "Afrimoney",
                icon: Icons.phone_android,
                color: Colors.blue,
              ),

              paymentCard(
                title: "QMoney",
                icon: Icons.payments,
                color: Colors.green,
              ),

              paymentCard(
                title: "Bank Transfer",
                icon: Icons.account_balance,
                color: Colors.purple,
              ),

              const Spacer(),

              //////////////////////////////////////////////////
              /// CONTINUE BUTTON
              //////////////////////////////////////////////////

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: () {
                    if (selectedMethod.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Please select payment method"),
                        ),
                      );
                    } else {

                      //////////////////////////////////////////////////
                      /// NEXT STEP LATER:
                      /// REAL PAYMENT PROCESSING
                      //////////////////////////////////////////////////

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Selected: $selectedMethod",
                          ),
                        ),
                      );
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16),
                    ),
                  ),

                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}