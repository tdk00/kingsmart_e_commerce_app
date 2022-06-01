import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kingsmart_online_app/Color.dart';

import '../store/category_products.dart';

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    return Container(
      color: CustomColors().kingsRed,
      height: height1 / 19.5,
      padding: EdgeInsets.only(
          left: screenWidth / 17.4,
          right: screenWidth / 17.4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        width: screenWidth / 1.13,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            onSubmitted: ( String value ) {
              Navigator.push(context,  MaterialPageRoute( builder: (_) => CategoryProducts( id: 0, searchKeyWord: value, categoryName: value ) ) );
            },
            decoration: InputDecoration(
                isCollapsed: true,
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 15),
                hintText: "Nə axtarırsan?"),
          ),
      ),
    );
  }
}