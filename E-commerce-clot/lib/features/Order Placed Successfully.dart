import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_training/core/colors.dart';
import 'package:project_training/views/orders_2/orders_2.dart';

class Order_Placed_Successfully extends StatelessWidget {
  const Order_Placed_Successfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.purble,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Image.asset(
                  "assets/Order Placed Successfully.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(20),
                    left: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Order Placed\n  Successfully",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "You will recieve an email confirmation",
                      style: TextStyle(color: Colors.black45),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColors.purble,
                            fixedSize: Size(350, 57)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Orders2()),
                          );
                        },
                        child: Text("See Ordrer details",
                            style: TextStyle(color: Colors.white)))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
