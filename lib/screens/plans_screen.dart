import 'package:flutter/material.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  ////////////////////////////////////////////////////////////
  /// PLAN CARD
  ////////////////////////////////////////////////////////////

  Widget planCard({
    required String speed,
    required String price,
    required String duration,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //////////////////////////////////////////////////
          /// TOP ROW
          //////////////////////////////////////////////////

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [

              Text(
                speed,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),

              Text(
                price,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          //////////////////////////////////////////////////
          /// DURATION
          //////////////////////////////////////////////////

          Text(
            duration,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),

          const SizedBox(height: 8),

          //////////////////////////////////////////////////
          /// BUTTON
          //////////////////////////////////////////////////

          Align(
            alignment: Alignment.bottomRight,

            child: SizedBox(
              height: 34,

              child: ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                ),

                child: const Text(
                  "Buy",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
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

        title: const Text(
          "Internet Plans",
        ),
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
            children: [

              //////////////////////////////////////////////////
              /// PLAN 1
              //////////////////////////////////////////////////

              planCard(
                speed: "1 Mbps",
                price: "10 NLe",
                duration: "1 Day",
              ),

              //////////////////////////////////////////////////
              /// PLAN 2
              //////////////////////////////////////////////////

              planCard(
                speed: "10 Mbps",
                price: "35 NLe",
                duration: "7 Days",
              ),

              //////////////////////////////////////////////////
              /// PLAN 3
              //////////////////////////////////////////////////

              planCard(
                speed: "10 Mbps",
                price: "100 NLe",
                duration: "1 Month",
              ),
            ],
          ),
        ),
      ),
    );
  }
}