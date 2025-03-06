
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/homeModel.dart';

class CounterData extends Cubit<List<CardModel>> {
  CounterData() : super([]);
  void increment(CardModel carData) {
    List<CardModel> carList = state;
    CardModel itemData = CardModel(id: carData.id, image: carData.image, title: carData.title);
    bool value = true;
    for(var x=0; x<carList.length; x++)
    {
      if(carList[x].id==itemData.id)
      {
        value = false;
      }
    }
    if(value) {
      carList.add(itemData);
    }

    emit(carList.toList());
  }

  void decrement(CardModel carData) {
    if(state.isNotEmpty)
    {
      state.remove(carData);
    }
    var s = state;
    emit(s.toList());
  }
}

