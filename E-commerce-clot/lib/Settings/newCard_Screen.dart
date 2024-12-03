import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Add_Cards extends StatefulWidget {
  const Add_Cards({super.key});

  @override
  State<Add_Cards> createState() => _Add_CardsState();
}

class _Add_CardsState extends State<Add_Cards> {
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
                  "Add Card",
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60.h,
              width: 340.w,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 223, 220, 220),
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Card Number",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ),
         SizedBox(height: 5.h),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 223, 220, 220),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "CCV",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 50.w),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 60.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 223, 220, 220),
                        borderRadius: BorderRadius.circular(15)),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Exp",
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60.h,
              width: 340.w,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 223, 220, 220),
                  borderRadius: BorderRadius.circular(15)),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Cardholder Name",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ),
          Spacer(),
          ElevatedButton(onPressed: (){
            
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const payment()
            //   ),
            //   );
          }, 
          child: Text("Save",style: 
          TextStyle(
            fontSize: 18.sp,
            color: Colors.white
            
          ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            minimumSize: Size(340.w, 60.h),
            ),
          )
        ],
      ),
    );
  }
}