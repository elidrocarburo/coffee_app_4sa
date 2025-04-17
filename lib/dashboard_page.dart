import 'package:coffee_app_4sa/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette().scaffoldBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 5.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {

                    },
                    child: Container(
                      padding: EdgeInsets.all(7.0),
                      height: 42.0,
                      width: 42.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF1F232C),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Iconify(HeroiconsSolid.view_grid, size: 12.0, color: Color(0xFF4D4F52)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}