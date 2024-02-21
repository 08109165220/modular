import 'package:flutter/material.dart';

import 'package:modeler/home_model/home_details.dart';

import '../home_model/cardboy_Grid.dart';
import '../main.dart';
import '../theme/theme_manager.dart';

enum CardType {
  GRID,
  LINEAR,
}

class CardBoy extends StatelessWidget {
   CardBoy(
      {super.key, this.cardType = CardType.LINEAR, required this.homeModel,});

  final HomeModel homeModel;

  final CardType? cardType;

  @override
  Widget build(BuildContext context) {
    return cardType == CardType.LINEAR
        ? GestureDetector(
            onTap: () {
              // MaterialPageRoute(
              //                     builder: (context) => Push(homeModelDetail: homeModel
              //                       ,cardType: CardType.LINEAR,),
              //                   ));
              Navigator.pushNamed(
                  context,
                  Push.route(),arguments: {"homeModelDetail":homeModel,"cardType":CardType.LINEAR});
            },
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  // color: Colors.blue.withOpacity(0.6),
                  child: ListTile(
                    title: Text(
                      homeModel.title,
                      style: TextStyle(color:Theme.of(context).colorScheme.onSecondary),
                    ),
                    subtitle: Text(
                      homeModel.subtitle,
                      style: TextStyle(color: Colors.black),
                    ),
                    hoverColor: Colors.green,
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: themeManager.themeMode==ThemeMode.light?
                            ClipRRect(borderRadius: BorderRadiusDirectional.all(Radius.circular(20)),
                              child: Image.asset(
                                homeModel.image,height:30,width: 60,fit: BoxFit.fill,
                        ),
                            )
                         :Image.asset(
                              homeModel.image,height:30,width: 60,fit: BoxFit.fill,
                            ),),
                      ],
                    ),
                  ),
                )),
          )
        : GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                  context,
                  Push.route(),arguments: {"homeModelDetail":homeModel,"cardType":CardType.GRID});
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadiusDirectional.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 2,
                          spreadRadius: 2,
                          blurStyle: BlurStyle.solid)
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(30),
                  child: GridTile(
                    header: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Center(
                          child: Text(
                        homeModel.title,
                        style: TextStyle(color: Colors.purple),
                      )),
                    ),
                    footer: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                      ),
                      child: Center(
                          child: Text(
                        homeModel.subtitle,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )),
                    ),
                    child: Image.asset(
                      homeModel.image,
                      height: 40,
                      width: 40,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
