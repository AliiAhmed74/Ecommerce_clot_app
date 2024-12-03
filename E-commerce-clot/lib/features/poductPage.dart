import 'package:flutter/material.dart';
import 'package:project_training/core/colors.dart';
import 'package:provider/provider.dart';
import '../core/Widgets.dart';
import '../core/provider.dart';
import 'Checkout_Cart.dart';
import 'Empty_Cart.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
  //  final productProvider = Provider.of<ProductProvider>(context, listen: false);
    String price = "\$148";


    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: CustomWidgets.ArrowIcon,
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Icon(Icons.favorite_border_outlined),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              height: 280,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Frame 92.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 15),
            // Product Title
            Text(
              "Men's Harrington Jacket",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Product Price
            Text(
              price,
              style: TextStyle(
                color: CustomColors.purble,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 25),
            // Options (Size, Color, Quantity) with ListView
            Expanded(
              child: ListView(
                children: [
                  // Size Option
                  OptionTile(
                    label: "Size",
                    child: Consumer(
                      builder: (context, provider, _) {
                        return DropdownButton<String>(
                          //value: ,
                          items: ["S", "M", "L", "XL"]
                              .map(
                                (size) => DropdownMenuItem<String>(
                                  value: size,
                                  child: Text(size),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                            //  provider.setSize(value);
                            }
                          },
                          underline: SizedBox(),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  // Color Option
                  OptionTile(
                    label: "Color",
                    child: Consumer(
                      builder: (context, provider, _) {
                        return DropdownButton<String>(
                          // value: ,
                          items: ["Green", "Blue", "Red", "Yellow"]
                              .map(
                                (color) => DropdownMenuItem<String>(
                                  value: color,
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: _getColor(color),
                                        radius: 8,
                                      ),
                                      SizedBox(width: 8),
                                      Text(color),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                            //  provider.setColor(value);
                            }
                          },
                          underline: SizedBox(),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  // Quantity Option
                  OptionTile(
                    label: "Quantity",
                    child: Row(
                      children: [
                        IconButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(CustomColors.purble)
                          ),
                          onPressed: () {
                            
                          },
                          icon: Icon(Icons.remove, color: Colors.white),
                          padding: EdgeInsets.all(8),
                          constraints: BoxConstraints(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0),
                          child: Text(
                            11.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(CustomColors.purble)
                          ),
                          onPressed: () {
                            
                          },
                          icon: Icon(Icons.add, color: Colors.white),
                          color: CustomColors.purble,
                          padding: EdgeInsets.all(8),
                          constraints: BoxConstraints(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Text(
                    "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives   you plenty of room to layer underneath,"
                    " while the soft corduroy keeps it casual and timeless.",
                    style: TextStyle(color: Colors.black45),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.purble,
                      fixedSize: Size(250, 57)
                    ),
                      onPressed: () {
                      if(11.11>=1){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Cart(),));
                      }else{
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EmptyCart(),));
                      }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            price,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text("Add to Cart", style: TextStyle(color: Colors.white),)
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor(String colorName) {
    switch (colorName) {
      case 'Green':
        return Colors.green;
      case 'Blue':
        return Colors.blue;
      case 'Red':
        return Colors.red;
      case 'Yellow':
        return Colors.yellow;
      default:
        return Colors.grey;
    }
  }
}

class OptionTile extends StatelessWidget {
  final String label;
  final Widget child;

  const OptionTile({required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white70,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          child,
        ],
      ),
    );
  }
}
