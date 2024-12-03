import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/Widgets.dart';
import '../core/colors.dart';
import 'Checkout_Cart.dart';
import 'Order Placed Successfully.dart';

class Personal_Info extends StatelessWidget {
   Personal_Info({super.key});

   List<Item> itemsList = [
     Item(image: "assets/Frame 92.png", title: "Men's Harrington Jacket",price: "148"),
     Item(image: "assets/Frame 92.png", title: "Men's Harrington Jacket",price: "50"),
     Item(image: "assets/Frame 92.png", title: "Men's Harrington Jacket",price: "55"),
     Item(image: "assets/Frame 92.png", title: "Men's Harrington Jacket",price: "75"),
     Item(image: "assets/Frame 92.png", title: "Men's Harrington Jacket",price: "35"),
     Item(image: "assets/Frame 92.png", title: "Men's Harrington Jacket",price: "35"),
     Item(image: "assets/Frame 92.png", title: "Men's Harrington Jacket",price: "35"),
   ];
   // List to track quantities of each item
   List<int> quantities = [0,0, 0, 0, 0,0,0];


   List<CustomTextField> myTextField=[
    CustomTextField(title: "Shipping Address", subtitle: "Add Shipping Address"),
    CustomTextField(title: "Payment Method", subtitle: "Add Payment Method")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: CustomWidgets.ArrowIcon),
        title: Text("Checkout"),
        centerTitle: true,
        ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(),
                itemCount: myTextField.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 35,
                      bottom: 10,
                      top: 25
                    ),
                    child: Container(
                      height: 70,
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: myTextField[index].title,
                          labelStyle: TextStyle(
                            color: Colors.black54
                          ),
                          hintText: myTextField[index].subtitle,
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                          suffixIcon: Icon(Icons.arrow_forward_ios_outlined)
                        ),
                      ),
                    ),
                  );
              },),
            ),
            Container(
              width: double.infinity,
              height: 270.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.r), // Use ScreenUtil for border radius
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
                    Text("Subtotal:                                                              \$${calculateSubtotal()}" ,style: TextStyle(
                        color: Colors.black38
                    ),),
                    Text("Shipping Cost:                                                    \$10.00",style: TextStyle(
                        color: Colors.black38)),
                    Text("Discount:                                                             \$20.00",style: TextStyle(
                        color: Colors.black38)),
                    Divider(),
                    Text("Total:                                                                  \$${calculateTotal()}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 10.h), // Use ScreenUtil for spacing
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.discount_outlined),
                        Text("Enter Coupon Code",style: TextStyle(
                          color: Colors.black45 ,
                        ),),
                        IconButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(CustomColors.purble)
                            ),
                            onPressed: (){}, icon: Icon(Icons.arrow_forward_ios ,color: Colors.white,size: 16,))
                      ],
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: CustomColors.purble,
                            fixedSize: Size(500, 55)
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Order_Placed_Successfully(),));
                        }, child: Text("\$${calculateSubtotal()}                                  Place Order",style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                      fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),))
                  ],
                ),
              ),
            ),
          ],
        ),
      )
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
class CustomTextField{
  final String title;
  final String subtitle;

  CustomTextField({required this.title ,required this.subtitle});
}
