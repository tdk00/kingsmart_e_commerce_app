import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderRadioModel {
  bool isSelected;
  final String buttonText;

  GenderRadioModel(this.isSelected, this.buttonText);
}

class GenderRadioItem extends StatefulWidget {
  final GenderRadioModel _item;
  GenderRadioItem(this._item);

  @override
  _GenderRadioItemState createState() => _GenderRadioItemState();
}

class _GenderRadioItemState extends State<GenderRadioItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .39,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: widget._item.isSelected ? Colors.red : Colors.white,
              spreadRadius: 1),
        ],
      ),
      margin: EdgeInsets.all(15.0),
      child: Center(
        child: Text(widget._item.buttonText,
            textAlign: TextAlign.left,
            style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 27,
                ),
                color: Colors.black)),
      ),
    );
  }
}
