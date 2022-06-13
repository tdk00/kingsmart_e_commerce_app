import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StateDataOrdersByDate extends ChangeNotifier{

  var dateFrom = "";
  var dateTo = "";


  void setFromDate( String newFromDate ){

    dateFrom = newFromDate;
    notifyListeners();
  }

  void setToDate( String newToDate ){

    dateTo = newToDate;
    notifyListeners();
  }


}

