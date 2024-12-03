
import 'package:flutter/material.dart';
import '../core/Widgets.dart';
import '../core/colors.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: CustomWidgets.ArrowIcon),
      ),
      body: Center(
        child: Container(
          height: 250,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/cart.png'),
              Text("Your Cart is Empty",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),


              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.purble,
                    fixedSize: Size.fromHeight(55)
                  ),
                  onPressed: (){
                /////نعديييييييييييييييييييييل/////
                Navigator.pop(context);
              }, child: Text("Explore Categories",
                style: TextStyle(
                  color: Colors.white
                ),))
            ],
          ),
        ),
      ),
    );
  }
}
