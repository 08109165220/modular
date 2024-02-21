import 'package:flutter/material.dart';
import 'package:modeler/home_model/home_details.dart';
import '../home_model/cardboy_Grid.dart';
import 'package:modeler/main.dart';
import '../login.dart';
import '../theme/theme_constants.dart';
import '../theme/theme_manager.dart';
import 'cardboy.dart';


class Home extends StatefulWidget {
  const Home({super.key,
  });


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CardType cardType = CardType.LINEAR;


  @override
  void initState() {
    homeModelList=homeModelList1;
    // _themeManager.addListener(themeListener);
    super.initState();
  }



 late List<HomeModel> homeModelList ;
  List<HomeModel> homeModelList1= [
   HomeModel(
     image: "assets/images/1693294002570.jpg",
     title: 'Ice',
     subtitle: '\$Solid',
   ),
   HomeModel(
     image: "assets/images/Screenshot_20231201-151721.jpg",
     title: 'Bones',
     subtitle: '\$Skelect',
   ),
   HomeModel(
     image: "assets/images/Screenshot_20231018-103406.jpg",
     title: 'SpongeBob',
     subtitle: '\$Square',
   ),
   HomeModel(
     image: "assets/images/Screenshot_20231202-174538.jpg",
     title: 'Cod M',
     subtitle: '\$War',
   ),
   HomeModel(
     image: "assets/images/Screenshot_20231016-205011.jpg",
     title: 'White&Black',
     subtitle: '\$Fight',
   ),
   HomeModel(
     image: "assets/images/Screenshot_20231005-223627.jpg",
     title: 'The Cat',
     subtitle: '\$Niggro',
   ),
   HomeModel(
     image: "assets/images/Screenshot_20231120-152029.jpg",
     title: 'Software',
     subtitle: '\$Tech',
   ),
   HomeModel(
     image: "assets/images/codm_2023-12-04_12_25_23.jpg",
     title: 'Cod M',
     subtitle: '\$Code259',
   ),
   HomeModel(
     image: "assets/images/Birds & Animal_peakpx (44).jpg",
     title: 'Tiger',
     subtitle: '\$Fierce',
   ),
 ];
  double? width = 40;
  bool isSearched = false;
  String searched = "";


  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        appBar: AppBar(
          title: InkWell(onTap: () {
            // Map<String ,dynamic> result={"age":120,"name":"ebere"};
            // int age=result["age"];
            Navigator.pushNamed(context, Trial.route(),arguments: {"age":120,"name":"ebere"});
          },
            child: Text(
              'LIQUID',
              style: TextStyle(color:Theme.of(context).colorScheme.onSecondary,),
            ),
          ),
          actions: [
            cardType == CardType.GRID
                ? TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ThirdPage(),
                          ));
                    },
                    child: Text(
                      "Sign-In",
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.purple),
                      overlayColor: MaterialStatePropertyAll(Colors.red),
                    ),
                  )
                : SingleChildScrollView(
                    child: Row(
                      children: [
                        AnimatedContainer(
                          color: Colors.transparent,
                          duration: Duration(milliseconds: 500),
                          width: width,
                          height: 40,
                          child: isSearched == true
                              ? TextField(
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),autofocus:true,onChanged: (value) {
                                  setState(() {
                                    searched=value;
                                    homeModelList=homeModelList1.where((element) => element.title.toLowerCase().contains(searched.toLowerCase())).toList();
                                  });
                                  },
                                  decoration: InputDecoration(
                                    hintText: "Search",
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            homeModelList=homeModelList1;

                                            isSearched = false;
                                            width = 40;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.close,
                                          color: Theme.of(context).colorScheme.onSecondary,
                                        )),
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isSearched = true;
                                      width = 210;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.search,
                                    color: Theme.of(context).colorScheme.onSecondary,
                                  )),
                        ),
                        IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.blue.withOpacity(0.95),
                                elevation: 30,
                                showDragHandle: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusDirectional.only(
                                        topStart: Radius.circular(50),
                                        topEnd: Radius.circular(50))),
                                context: context,
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    height: 400,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 140,
                                          right: 140,
                                          top: 180,
                                          bottom: 180),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.pinkAccent),
                                              iconSize:
                                                  MaterialStatePropertyAll(2)),
                                          onPressed: () {
                                            Navigator.pop(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Home()));
                                          },
                                          child: Center(child: Text('Close'))),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.more_vert, color:Theme.of(context).colorScheme.onSecondary)),
                      ],
                    ),
                  )
          ],
          backgroundColor:Theme.of(context).colorScheme.background,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        if (cardType == CardType.LINEAR) {
                          setState(() {
                            cardType = CardType.GRID;
                          });
                        } else {
                          setState(() {
                            cardType = CardType.LINEAR;
                          });
                        }
                      },
                      icon: Icon(
                          cardType == CardType.LINEAR ? Icons.list : Icons.apps,
                          color: Theme.of(context).colorScheme.onSecondary)),
                  Switch(value: themeManager.themeMode==ThemeMode.dark, onChanged:(newValue) {
                    themeManager.toggleTheme(newValue);setState((){});
                  },activeColor: Theme.of(context).colorScheme.onSecondary,)
                ],
              ),
              SizedBox(
                  height: 600,
                  child: cardType == CardType.LINEAR
                      ? ListView.builder(
                          itemCount: homeModelList.length,
                          itemBuilder: (context, index) => SizedBox(
                            height: 100,
                            child: CardBoy(
                              homeModel: homeModelList[index],
                            ),
                          ),
                        )
                      : GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                          itemCount: homeModelList.length,
                          itemBuilder: (context, index) => CardBoy(
                              cardType: CardType.GRID,
                              homeModel: homeModelList[index],),
                        ))
            ],
          ),
        ),
      )
    ;
  }
}
