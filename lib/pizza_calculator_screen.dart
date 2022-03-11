
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';
import 'global_theme.dart';
import 'strings.dart';



class PizzaCalculatorScreen extends StatefulWidget {
  const  PizzaCalculatorScreen({Key? key}) : super(key: key);

  @override
  _PizzaCalculatorScreenState createState() => _PizzaCalculatorScreenState();
}

enum Sauce {hot, sweet, cheese }

class _PizzaCalculatorScreenState extends State <PizzaCalculatorScreen> {
  bool _isSlimDough = false;
  double _pizzaSize = 800;
  int _cost = 300;
  Sauce? _sauce = Sauce.hot;
  bool _addCheese = true;

  int _calcCost() {
    _cost = _pizzaSize.round() + 400;

    if (_isSlimDough == true) _cost += 100;
    if (_addCheese == true) _cost += 50;

    switch (_sauce) {
      case Sauce.hot:
        _cost +=40;
        break;
      case Sauce.sweet:
        _cost +=60;
        break;
      case Sauce.cheese:
        _cost +=80;
        break;
      case null:
        _sauce = Sauce.hot;
        break;
    }
    return _cost;
  }
void _onSauceChanged(Sauce? value) {
    setState(() {
      _sauce = value;
    });
}
  @override
  Widget build (BuildContext context) {
   /* const borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(color: Color(0xFFbbbbbb)), width: 2));
      const LinkTextStyle = TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0079D0));
    */
    return MaterialApp(
      theme: globalTheme(),
      home: Scaffold(

        /* appBar: AppBar(
        title: const Text('Home'),
        )*/

        body: Container(
       alignment: Alignment.topRight,
       width: double.infinity,
        child: SingleChildScrollView(
       child: Column(

         children: [
           const SizedBox(
             height: 62,
           ),
           Text('Ды-ды пицца!', style: Theme.of(context).textTheme.headline4),
           Container(
             height: 100,
             color: Theme.of(context).colorScheme.secondary,
           ),
           SizedBox(
             height: 100,
             child:
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Image.asset('assets/images/pizza 1.png'),
               ],
             ),
           ),


           const Text("Калькулятор пиццы",
           style: TextStyle(fontSize: 36, color: Color(0xFF0000000))),
           const Text("Выберите параметры",
               style: TextStyle(fontSize: 16, color: Color(0xFF0000000))),
           const SizedBox(height: 12,
           ),
           SizedBox(
           width: 300,
             child: SlidingSwitch(
               value: false,
               width: 300,
               onChanged: (bool value) {
                 _isSlimDough = value;
                 setState(() {
                   _calcCost();
                 });
               },
               height: 30,
               animationDuration: const Duration(milliseconds: 100),
               onTap: () {},
               onDoubleTap: () {},
               onSwipe: () {},
               textOff: "Обычное тесто",
               textOn: "Тонкое тесто",
               colorOn: const Color(0xffFFFFFF),
               colorOff: const Color(0xf0FFFFFF),
               background: const Color(0xffECEFF1),
               buttonColor: const Color(0xff0079D0),
               inactiveColor: const Color(0xff636f7B),
             ),
           ),

           const SizedBox(
             height: 10),

           Container(
             alignment: Alignment.centerLeft,
             padding: const EdgeInsets.only(top: 20, left:  20),
             child: const Text("Размер:",
             style: TextStyle(fontSize: 18, color: Color(0xFF000000))),
           ),

           SizedBox(
             width: 300,
             child: SfSlider(
               min: 20,
               max: 60,
               value: _pizzaSize,
               interval: 20,
               showTicks: true,
               showLabels: true,
               numberFormat: NumberFormat(),
               enableTooltip: false,
               minorTicksPerInterval: 0,
               stepSize: 20,
               onChanged: (dynamic value) {
                 setState(() {
                   _pizzaSize = value;
                   _calcCost();
                 });
               },
             )),

           const SizedBox(
               height: 10),

           Container(
             alignment: Alignment.centerLeft,
             padding: const EdgeInsets.only(top: 10, left: 20),
             child: const Text("Соус",
             style: TextStyle(fontSize: 18, color: Color(0xFF000000))),
           ),


           RadioListTile<Sauce>(
             title: const Text("Острый"),
             value: Sauce.hot,
             groupValue: _sauce,
             onChanged: _onSauceChanged,
             visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
           ),
           RadioListTile<Sauce>(
             title: const Text("Кисло-сладкий"),
             value: Sauce.sweet,
             groupValue: _sauce,
             onChanged: _onSauceChanged,
             visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
           ),
           RadioListTile<Sauce>(
             title: const Text("Сырный"),
             value: Sauce.cheese,
             groupValue: _sauce,
             onChanged: _onSauceChanged,
             visualDensity: const VisualDensity(horizontal: 0, vertical: -4.0),
           ),

           // Дополнительный сыр

           SizedBox(
             width: 300,
             child: Card(
               elevation: 0,
               color: Color(0xFFF0F0F0),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10)),

               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(
                       right: 20,
                     ),
                     child: SizedBox(
                       width: 38,
                         height: 56,
                       child: Image.asset('assets/images/2 1.png'),
                     ),
                   ),
                    const Text('Дополнительный сыр',
                   style: TextStyle(fontSize: 16, color: Color(0xFF263238))),
                   Switch(
                     value: _addCheese,
                     onChanged: (bool value) {
                       setState(() {
                         _addCheese = value;
                       });
                   },
                   ),
                 ],
               ),
             ),
           ),

                // Выводим итоговую стоимость
           Container(
             alignment: Alignment.centerLeft,
             padding: const EdgeInsets.only(top: 10,left: 20 ),
             child: Text("Стоимость:  ",
             style: TextStyle(fontSize: 18,color: Color(0xFF000000))),
           ),

           // цена в отдельной строке
           SizedBox(
             width: 300,
             height: 50,

             child: Card(
               elevation: 0,
               color: const Color(0xFFF0F0F0),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10)),
               child: Text("${_calcCost()}руб. ",
               style: const TextStyle(fontSize: 32, color:Color(0xFF000000)),
               textAlign: TextAlign.center,
               ),
             ),
           ),

           const SizedBox(
             height: 5,
           ),
           SizedBox(height: 25,),
           SizedBox(width: 154,height: 42,child:
           ElevatedButton(onPressed: () {},
             child: Text('Заказать'),
             style: ElevatedButton.styleFrom(
               primary: Color(0xFF0079D0),
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(36.0),
               ),
             ),
           )
           ),





         ],
       ),
        ),
     ),
      ),
    );
  }


  }


