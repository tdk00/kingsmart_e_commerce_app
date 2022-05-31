import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/radio_model.dart';

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:  EdgeInsets.all(15.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
           Container(
            height: 27.0,
            width: 27.0,
            child:  Center(
              child: _item.isSelected
                  ? Icon(
                Icons.done,
                color: Colors.white,
              )
                  : Container(),
            ),
            decoration:  BoxDecoration(
              color: _item.isSelected ? Color(0xFFEA0029) : Colors.transparent,
              border: Border.all(
                  width: 1.0,
                  color: _item.isSelected ? Color(0xFFEA0029) : Colors.grey),
              borderRadius: const BorderRadius.all(Radius.circular(60.0)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.0),
            child: Text(_item.text),
          )
        ],
      ),
    );
  }
}