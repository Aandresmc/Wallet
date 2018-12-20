import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/card_model.dart';
import 'dart:convert';
import '../helpers/card_colors.dart';

class CardListBloc{
  //manejara la lista de Card Result que se tiene en el modelo  que trae datos desde inital data json
  BehaviorSubject<List<CardResults>> _cardsColletion =
      BehaviorSubject<List<CardResults>>();

  //el listado de tarjetas que luego seran agregados al StreamController por medio de sink.add
  List<CardResults> _cardResults;

   //trae datos del  StreamController que es _cardsColletion
  Stream<List<CardResults>> get cardList => _cardsColletion.stream;

  void initialData() async {
    var initialData = await rootBundle.loadString('data/initialData.json');
    var decodedJson = jsonDecode(initialData);
    // se le hace entrega de los datos  que venian del json (pre cargados CardModel)
    _cardResults = CardModel.fromJson(decodedJson).results;
    
    for (var i = 0; i < _cardResults.length; i++) {
      _cardResults[i].cardColor = CardColor.baseColors[i];
    }
    // donde se agrega el listado de tarjetas
    _cardsColletion.sink.add(_cardResults);
  }

  CardListBloc(){
    initialData();
  }
 

  void dispose() {
    _cardsColletion.close();
  }
}

final cardListBloc =  CardListBloc();
