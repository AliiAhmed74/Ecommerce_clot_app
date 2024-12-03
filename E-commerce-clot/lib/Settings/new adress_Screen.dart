import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_training/Settings/payment_Screen.dart';

class Add_Adress extends StatefulWidget {
  const Add_Adress({super.key});

  @override
  State<Add_Adress> createState() => _Add_AdressState();
}

class _Add_AdressState extends State<Add_Adress> {
  TextEditingController streetController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadAddress();
  }

  // Method to load cached data
  Future<void> _loadAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      streetController.text = prefs.getString('street') ?? '';
      cityController.text = prefs.getString('city') ?? '';
      stateController.text = prefs.getString('state') ?? '';
    });
  }

  // Method to save data to SharedPreferences
  Future<void> _saveAddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('street', streetController.text);
    await prefs.setString('city', cityController.text);
    await prefs.setString('state', stateController.text);
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
                  "Add Address",
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
                controller: streetController,
                decoration: InputDecoration(
                  labelText: "Street Address",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
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
                controller: cityController,
                decoration: InputDecoration(
                  labelText: "City",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
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
                controller: stateController,
                decoration: InputDecoration(
                  labelText: "State",
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () async {
              // Save the data before navigating
              await _saveAddress();
              // Send the data back when the save button is clicked
              String address = "${streetController.text}, ${cityController.text}, ${stateController.text}";
              Navigator.pop(context, address);
            },
            child: Text(
              "Save",
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
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
