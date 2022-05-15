import 'package:flutter/material.dart';

class StateDataSlidePanel extends ChangeNotifier{

  bool slidePanelOffStage = true;
  void toggleSlidePanelOffStage( bool status ){
    slidePanelOffStage = status;
    notifyListeners();
  }

}

