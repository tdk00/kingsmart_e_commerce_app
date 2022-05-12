import 'package:flutter/material.dart';

class StateData extends ChangeNotifier{
  List meselen = [];
  int say = 0;

    addToList( id ){
      if (  basketContains( id ) == -1 ) {
        meselen.add( Product(id , 0) );
        return meselen.length - 1;
      }
      else{
        return basketContains(id);
      }


  }

  increase( key ){
    meselen[key].increaseCount();
    notifyListeners();
  }

  basketContains( productId ){
      for( var i = 0; i < meselen.length; i++ )
        {
          if( productId == meselen[i].id )
            {
              return i;
            }
        }
      return -1;
  }



}

class Product {
  int id, count;
  Product(this.id, this.count);

  increaseCount(){
    count++;
  }
}
