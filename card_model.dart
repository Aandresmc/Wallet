import 'package:flutter/material.dart';

class CardModel {
  List<CardResults> results;

  CardModel({this.results});
  //llena la lista "CardResults" luego de la iteracion de los resultados Json
  //para agregar cada "Wallet" en el List<CardResults>
    CardModel.fromJson(Map<String, dynamic> json) {
        if(json['cardResults']!=null){
          
          results = new  List<CardResults>();

          json['cardResults'].forEach((v){
          results.add(new CardResults.fromJson(v));
          });
         
        }
    }
}

class CardResults {
  String cardHolderName;
  String cardNumber;
  String cardMonth;
  String cardYear;
  String cardCvv;
  Color cardColor;
  String cardType;

  CardResults(
      {this.cardHolderName,
      this.cardNumber,
      this.cardMonth,
      this.cardYear,
      this.cardCvv,
      this.cardColor,
      this.cardType});

//para mapear los datos que se reciben de un json a propiedades de la clase CardResults
  CardResults.fromJson(Map<String, dynamic> json) {
    cardHolderName = json['cardHolderName'];
    cardNumber = json['cardNumber'];
    cardMonth = json['cardMonth'];
    cardYear = json['cardYear'];
    cardCvv = json['cardCvv'];
    cardColor = json['cardColor'];
    cardType = json['cardType'];
  }
}
