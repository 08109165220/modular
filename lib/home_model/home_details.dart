import 'package:flutter/material.dart';
import 'package:modeler/home_model/cardboy_Grid.dart';

import '../Screen/cardboy.dart';
class Push extends StatelessWidget {
  static String route () => "/Push";
  const Push({super.key, required this. homeModelDetail, this.cardType});

  final CardType? cardType;
   final HomeModel homeModelDetail;

  @override
  Widget build(BuildContext context) {
    return cardType==CardType.GRID? Scaffold(
      backgroundColor: Colors.black12,
     appBar: AppBar(backgroundColor: Colors.black,
      title: Text(homeModelDetail.title),),
    body:Container(height:700,width:400,
     decoration: BoxDecoration(color: Colors.amber,),
     child: Image.asset(homeModelDetail.image,fit: BoxFit.fill),)
    )
    : Scaffold(backgroundColor:Colors.blue,
     appBar:AppBar(backgroundColor: Colors.black,
      title: Text(homeModelDetail.title),));
  }
}

class Trial extends StatefulWidget {
  static String route () => "/Trial";
  const Trial({super.key});

  @override
  State<Trial> createState() => _TrialState();
}

class _TrialState extends State<Trial> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
