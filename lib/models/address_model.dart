import 'package:flutter/material.dart';

class AddressModel extends ChangeNotifier{
    final int id;
    String content, postal, note;
    bool selected;
    AddressModel( { required this.id, required this.content, required this.postal, required this.note, required this.selected } );

    void changeSelectedStatus( bool status )
    {
        selected = status;
        notifyListeners();
    }


    void changeAddress( String value )
    {
      content = value;
      notifyListeners();
    }
    void changePostalCode( String value )
    {
      postal = value;
      notifyListeners();
    }

    void changeNote( String value )
    {
      note = value;
      notifyListeners();
    }

    factory AddressModel.fromJson(Map<String, dynamic> json) {
      return AddressModel(
        id: int.tryParse( json['id'] ) ?? 0,
        content: json['content'],
        postal: json['postal'],
        note: json['note'],
        selected: json['selected'] == '0' ? false : true ,
      );
    }
    Map<String, dynamic> toJson() =>
        {
          'id': id,
          'content': content,
          'postal': postal,
          'note': note,
          'selected': selected,
        };

}