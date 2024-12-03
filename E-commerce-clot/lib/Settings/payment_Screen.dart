import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_training/Settings/newCard_Screen.dart';

class payment extends StatefulWidget {
  const payment({super.key});

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
             Padding(
            padding: const EdgeInsets.only(left: 25, top: 60),
            child: Row(
              children: [
                Container(
                  height: 45.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 171, 169, 169),
                      borderRadius: BorderRadius.circular(20)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                ),
                SizedBox(width: 80.w),
                Text(
                  "Payment",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
            ),
          
          
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text("Cards",style: 
                  TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            Container(
                  height: 65.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 223, 220, 220),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Text(
                          "*****4187",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                           fontWeight: FontWeight.bold,

                          ),
                        ),
                        SizedBox(width: 10.w,),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              radius: 10.r,
                              
                              backgroundColor: Colors.orange,
                            ),
                            Positioned(
                              left: 8.w,
                              child: CircleAvatar(
                                radius: 10.r,
                                
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Add_Cards()
                            ),
                            );
                        },
                         icon: Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                  
                ),
                  Container(
                  height: 65.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 223, 220, 220),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Text(
                          "*****9387",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                           fontWeight: FontWeight.bold,

                          ),
                        ),
                        SizedBox(width: 10.w,),
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              radius: 10.r,
                              
                              backgroundColor: Colors.orange,
                            ),
                            Positioned(
                              left: 8.w,
                              child: CircleAvatar(
                                radius: 10.r,
                                
                                backgroundColor: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Add_Cards()
                            ),
                            );
                        },
                         icon: Icon(Icons.arrow_forward_ios_rounded)
                         )
                      ],
                    ),
                  ),
                ),
                  SizedBox(
                    height: 20.h,
                  ),
                   Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text("Paypal",style: 
                  TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  
                  ),
                  ),
                ],
              ),
            ),
                       SizedBox(height: 20.h,),
            Container(
                  height: 65.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 223, 220, 220),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Text(
                          "Cloth@gmail.com",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                           fontWeight: FontWeight.bold,

                          ),
                        ),
                        SizedBox(width: 10.w,),
                       
                        Spacer(),
                        IconButton(onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Add_Cards()
                            ),
                            );
                        },
                         icon: Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
                  ),
                ),
        ]
      ),
    );
  }
}