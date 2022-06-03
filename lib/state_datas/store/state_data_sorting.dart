import 'package:flutter/material.dart';

class StateDataSorting extends ChangeNotifier{

  String sortByString = 'none';
  void sortBy( String newSortByString ){
    sortByString = newSortByString;
    notifyListeners();
  }

}

