import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_training/core/colors.dart';
import 'package:project_training/features/personal_info.dart';

import '../core/Widgets.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // List of items for display
  List<Item> itemsList = [
    Item(
        image: "assets/Frame 92.png",
        title: "Men's Harrington Jacket",
        price: "148"),
    Item(
        image: "assets/Frame 92.png",
        title: "Men's Harrington Jacket",
        price: "50"),
    Item(
        image: "assets/Frame 92.png",
        title: "Men's Harrington Jacket",
        price: "55"),
    Item(
        image: "assets/Frame 92.png",
        title: "Men's Harrington Jacket",
        price: "75"),
    Item(
        image: "assets/Frame 92.png",
        title: "Men's Harrington Jacket",
        price: "35"),
    Item(
        image: "assets/Frame 92.png",
        title: "Men's Harrington Jacket",
        price: "35"),
    Item(
        image: "assets/Frame 92.png",
        title: "Men's Harrington Jacket",
        price: "35"),
  ];
  // List to track quantities of each item
  List<int> quantities = [0, 0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.w), // Use ScreenUtil for padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 20.h), // Use ScreenUtil for spacing

              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: Text(
                      "Cart",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 80),
                    child: Text(
                      "Remove all",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ), // Use ScreenUtil for font size
              SizedBox(height: 20.h),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: itemsList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: 5.h), // Use ScreenUtil for padding
                      child: Container(
                        height: 80.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.circular(15.r), // Use ScreenUtil for border radius
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 5,
                          //     blurRadius: 7,
                          //   ),
                          // ],
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.all(8.w), // Use ScreenUtil for padding
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(itemsList[index].image),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.w), // Use ScreenUtil for padding
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      itemsList[index].title,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    Text("\$${itemsList[index].price}"),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (quantities[index] > 0)
                                          quantities[index]--;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: CustomColors.purble,
                                        borderRadius: BorderRadius.circular(5
                                            .r), // Use ScreenUtil for border radius
                                      ),
                                      child: Icon(Icons.remove,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 7.w), // Use ScreenUtil for spacing
                                  Text(quantities[index].toString()),
                                  SizedBox(
                                      width: 7.w), // Use ScreenUtil for spacing
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        quantities[index]++;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: CustomColors.purble,
                                        borderRadius: BorderRadius.circular(5
                                            .r), // Use ScreenUtil for border radius
                                      ),
                                      child:
                                          Icon(Icons.add, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ()));
                },
                child: Container(
                  width: double.infinity,
                  height: 270.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        15.r), // Use ScreenUtil for border radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.w), // Use ScreenUtil for padding
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Subtotal:                                                              \$${calculateSubtotal()}",
                          style: TextStyle(color: Colors.black38),
                        ),
                        Text(
                            "Shipping Cost:                                                    \$10.00",
                            style: TextStyle(color: Colors.black38)),
                        Text(
                            "Discount:                                                             \$20.00",
                            style: TextStyle(color: Colors.black38)),
                        Divider(),
                        Text(
                          "Total:                                                                  \$${calculateTotal()}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.h), // Use ScreenUtil for spacing
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.discount_outlined),
                            Text(
                              "Enter Coupon Code",
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                            IconButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        CustomColors.purble)),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 16,
                                ))
                          ],
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: CustomColors.purble,
                                fixedSize: Size(500, 55)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Personal_Info(),
                                  ));
                            },
                            child: Text(
                              "Checkout",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8)),
                            ))
                      ],
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

  double calculateSubtotal() {
    double subtotal = 0;
    for (int i = 0; i < itemsList.length; i++) {
      subtotal += double.parse(itemsList[i].price) * quantities[i];
    }
    return subtotal;
  }

  double calculateTotal() {
    double deliveryCharge = 10.0;
    double discount = 20.0;
    return calculateSubtotal() + deliveryCharge - discount;
  }
}

class Item {
  final String image;
  final String title;
  final String price;

  Item({required this.image, required this.title, required this.price});
}
