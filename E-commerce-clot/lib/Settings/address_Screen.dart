import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_training/Settings/new%20adress_Screen.dart';

class Addreess extends StatefulWidget {
  const Addreess({super.key});

  @override
  State<Addreess> createState() => _AddreessState();
}

class _AddreessState extends State<Addreess> {
  String address = "2715 Ash Dr.San joes,South...";
  String address2 = "2715 Ash Dr.San joes,South...";

  @override
  void initState() {
    super.initState();
    _loadCachedData();
  }

  // Load cached data from SharedPreferences
  void _loadCachedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      address = prefs.getString('address') ?? "2715 Ash Dr.San joes,South...";
      address2 = prefs.getString('address2') ?? "2715 Ash Dr.San joes,South...";
    });
  }

  // Save the updated address to SharedPreferences
  void _saveCachedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('address', address);
    await prefs.setString('address2', address2);
  }

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
                  "Address",
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
            height: 100.h,
            width: 350.w,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 223, 220, 220),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    address,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      // Navigate to Add_Adress and await the result
                      final updatedAddress = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Add_Adress()),
                      );

                      if (updatedAddress != null) {
                        setState(() {
                          address = updatedAddress;
                          _saveCachedData(); // Save updated data
                        });
                      }
                    },
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.purple,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            height: 100.h,
            width: 350.w,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 223, 220, 220),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    address2,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      // Navigate to Add_Adress and await the result
                      final updatedAddress = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Add_Adress()),
                      );

                      if (updatedAddress != null) {
                        setState(() {
                          address2 = updatedAddress;
                          _saveCachedData(); // Save updated data
                        });
                      }
                    },
                    child: Text(
                      "Edit",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.purple,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
