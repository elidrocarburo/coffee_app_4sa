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
          )),
          Positioned(
            top: 35.0,
            left: 10.0,
            child: Container(
              color: Colors.transparent,
              height: 50.0,
              width: screenWidth - 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 45.0,
                      width: 45.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF14181D),
                        border: Border.all(color: Color(0xFF322B2E), width: 1.0),
                        borderRadius: BorderRadius.circular(15.0)
                      ),
                      child: Icon(Icons.arrow_back_ios_new_rounded,
                      color: Color(0xFF525154),
                      size: 17.0,),
                    ),
                  )
                ],
              ),
            ))
        ],
      ),
    );
  }
}