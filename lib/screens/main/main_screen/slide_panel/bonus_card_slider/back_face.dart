import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../models/bonus_cart.dart';

class BackFace extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    BonusKart bonusKart = Provider.of<BonusKart>(context);
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: 2,
      child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: SizedBox()),
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: BarcodeWidget(
                      barcode: Barcode.code128(),
                      data: bonusKart.fullCardCode,
                      width: 250,
                      height: 70,
                      drawText: false,
                    ),
                  ),
              ),
              Expanded(
                child: Text(
                  bonusKart.fullCardCode,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 15,
                      ),
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
        ],
      ),
    );
  }
}