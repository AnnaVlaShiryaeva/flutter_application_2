import 'package:flutter/material.dart';

const List<Widget> pizzaSize = <Widget>[
 Padding(
   padding: EdgeInsets.all(8.0),
   child: Text('Маленькая\n(28-30 см)', textAlign: TextAlign.center,),
 ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text('Средняя\n(33-35 см)', textAlign: TextAlign.center,),
  ),
  Padding(
    padding: EdgeInsets.all(8.0),
    child: Text('Большая\n(>40 см )', textAlign: TextAlign.center,),
  ),
];

final List<bool> _selectedPizzaSize = <bool>[true, false, false];


class Page4 extends StatefulWidget {
  const Page4({super.key, required this.title});

  final String title;

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  String message = "";
  int _currentSliderValue = 1;
  


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // backgroundColor: Colors.red,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7],
            colors: [
              Color.fromARGB(255, 242, 186, 153),
              Color.fromARGB(255, 243, 139, 80),
              Color.fromARGB(255, 246, 106, 19),
            ],
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("\nПИЦЦА",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold ),
              ),
              const Spacer(),
                const Text(
                  "2. Выберете диаметр пиццы:\n",
                  style: TextStyle(fontSize: 23),
                  textAlign: TextAlign.center,
                ),
                  //выбор диаметра пиццы
                ToggleButtons(
                    textStyle: const TextStyle(fontSize: 20),
                    isSelected: _selectedPizzaSize,
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < _selectedPizzaSize.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            _selectedPizzaSize[buttonIndex] = true;
                          } else {
                            _selectedPizzaSize[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderColor: Colors.black,
                    selectedBorderColor: Colors.black,
                    selectedColor: Colors.white,
                    fillColor: Colors.red[200],
                    color: const Color.fromARGB(255, 8, 8, 8),
                    constraints: const BoxConstraints(
                      minHeight: 40.0,
                      minWidth: 80.0,
                    ),
                    children: pizzaSize),
                  
                const Text(
                  "\n3. Сколько человек угощаем?\n",
                  style: TextStyle(fontSize: 23),
                  textAlign: TextAlign.center,
                ),
                Text(
                  _currentSliderValue.toString(),
                  style: const TextStyle(fontSize: 18, color: Colors.blue),
                ),
                Slider(
                    value: _currentSliderValue.toDouble(),
                    thumbColor: Colors.red,
                    max: 30,
                    divisions: 30,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value.toInt();
                      });
                    }),
                
                    
                const Text("\nЧтобы всех накормить, Вам понадобится:\n",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23)),
                  const Spacer() ,
                
              ],
            ),
          )),
    );
  }
}
