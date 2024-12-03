import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_training/Settings/address_Screen.dart';
import 'package:project_training/Settings/favourit_Screen.dart';
import 'package:project_training/Settings/payment_Screen.dart';
import 'package:project_training/views/orders_1/orders_1.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              children: [
                SizedBox(height: 100.h),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/Ellipse 14.png"),
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 110.h,
                  width: 330.w,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 223, 220, 220),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Gislbert Jones",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              " Gilberjones001@gmail.com",
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.grey,
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                      fontSize: 13.sp, color: Colors.blue),
                                ))
                          ],
                        ),
                        Text(
                          "121-224-7890",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
                Container(
                  height: 65.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 223, 220, 220),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Address",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Addreess()
                            ),
                            );
                        },
                         icon: Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 65.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 223, 220, 220),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wishlist",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const favourite()
                            ),
                            );
                        },
                         icon: Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 65.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 223, 220, 220),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Payment",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const payment()
                            ),
                            );
                        },
                         icon: Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 65.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 223, 220, 220),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Orders",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Orders1()
                            ),
                            );
                        },
                         icon: Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 60.h),
                TextButton(onPressed: (){
                   Navigator.pop(context);
                }, child:
                Text("Sign Out",style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.red,
                  fontWeight: FontWeight.bold
                ),
                )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
