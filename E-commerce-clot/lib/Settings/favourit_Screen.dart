import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_training/Categories_Screens/hoodies.dart';
import 'package:project_training/Settings/hoodies.dart';

class favourite extends StatefulWidget {
  const favourite({super.key});

  @override
  State<favourite> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
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
                      color: const Color.fromARGB(255, 216, 213, 213),
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
                  "Favourite",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),

            Container(
                  height: 80.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 223, 220, 220),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(Icons.favorite,color: Colors.white,),
                        SizedBox(width: 10.w),
                        Column(
                          children: [
                            Text(
                              "My Favourite",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text("12 Products",style: 
                            TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey,

                            ),)
                              
                          ],
                        ),
                        Spacer(),
                        IconButton(onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Hoodies1()
                            ),
                            );
                        },
                         icon: Icon(Icons.arrow_forward_ios_rounded))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                
             
        ],
      ),
    );
  }
}