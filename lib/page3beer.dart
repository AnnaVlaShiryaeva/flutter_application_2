
import 'package:flutter/material.dart';

const List<Widget> time = <Widget>[
 Text(' 2-4 часа '),
  Text(' 4-6 часов '),
  Text(' до утра!'),
];

final List<bool> _selectedTime = <bool>[true, false, false];


class Page3 extends StatefulWidget {
  const Page3({super.key, required this.title});

  final String title;

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  String message = "";
  int _currentSliderValueWomen = 1;
  int _currentSliderValueMen = 1;


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
            stops: [0.1, 0.5, 0.8],
            colors: [
              Color.fromARGB(255, 245, 242, 183),
              Color.fromARGB(255, 244, 230, 100),
              Color.fromARGB(255, 219, 201, 45),
            ],
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("\nПЕННОЕ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold ),
              ),
              const Spacer(),
                const Text(
                  "2. Сколько женщин в компании?\n",
                  style: TextStyle(fontSize: 23),
                  textAlign: TextAlign.center,
                ),
                Text(
                  _currentSliderValueWomen.toString(),
                  style: const TextStyle(fontSize: 18, color: Colors.blue),
                ),
                Slider(
                    value: _currentSliderValueWomen.toDouble(),
                    thumbColor: Colors.red,
                    max: 15,
                    divisions: 15,
                    label: _currentSliderValueWomen.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValueWomen = value.toInt();
                      });
                    }),
                const Text(
                  "3. Сколько мужчин в компании?\n",
                  style: TextStyle(fontSize: 23),
                  textAlign: TextAlign.center,
                ),
                Text(
                  _currentSliderValueMen.toString(),
                  style: const TextStyle(fontSize: 18, color: Colors.blue),
                ),
                Slider(
                    value: _currentSliderValueMen.toDouble(),
                    thumbColor: Colors.red,
                    max: 15,
                    divisions: 15,
                    label: _currentSliderValueMen.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValueMen = value.toInt();
                      });
                    }),
                    const Text(
                  "4. Как долго планируете веселиться?\n",
                  style: TextStyle(fontSize: 23),
                  textAlign: TextAlign.center,
                ),
                ToggleButtons(
                    textStyle: const TextStyle(fontSize: 23),
                    isSelected: _selectedTime,
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < _selectedTime.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            _selectedTime[buttonIndex] = true;
                          } else {
                            _selectedTime[buttonIndex] = false;
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
                    children: time),
                    
                const Text("\nРецепт вашего веселья:\n",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23)),
                const Spacer(),
              ],
            ),
          )),
    );
  }
}
