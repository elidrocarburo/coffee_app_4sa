import 'package:coffee_app_4sa/models/coffee_item.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatefulWidget {
  final CoffeeItem cItem;
  const ItemDetails({super.key,  required this.cItem});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.black,
          ),
          Hero(tag: widget.cItem.itemImg.toString(), 
          child: Container(
            height: (screenHeight/2) + 70.0,
            width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(widget.cItem.itemImg.toString()),
              fit: BoxFit.cover)
            ),
          ))
        ],
      ),
    );
  }
}