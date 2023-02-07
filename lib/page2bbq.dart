import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

const List<Widget> meat = <Widget>[
  Text('🐷'),
  Text('🐔'),
  Text('🐏'),
  Text('🐟'),
];

final List<bool> _selectedMeat = <bool>[true, false, false, false];

const List<Widget> hungerState = <Widget>[
  Text('🐣'),
  Text('👨'),
  Text('🐺'),
];

List<bool> _selectedHungerState = <bool>[false, true, false];

class Page2 extends StatefulWidget {
  const Page2({super.key, required this.title});

  final String title;

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  String result = "";
  String getResult() {
    double meatFactor;
    if (_selectedMeat[0] || _selectedMeat[2]) {
      meatFactor = 1;
    } else {
      meatFactor = 1.2;
    }
    double hungerFactor;
    if (_selectedHungerState[0]) {
      hungerFactor = 0.9;
    } else if (_selectedHungerState[1]) {
      hungerFactor = 1;
    } else {
      hungerFactor = 1.1;
    }
    String meatString;
    if (_selectedMeat[0]) {
      meatString = "свинины";
    } else if (_selectedMeat[1]) {
      meatString = "курицы";
    } else if (_selectedMeat[2]) {
      meatString = "баранины";
    } else {
      meatString = "рыбы";
    }
    String kg = (0.4 * hungerFactor * meatFactor * _currentPeopleSliderValue).toStringAsPrecision(2);

    return "$kg кг $meatString";
  }

  int _currentPeopleSliderValue = 1;
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
            stops: [
              0.3,
              0.8,
            ],
            colors: [
              Color.fromARGB(255, 202, 154, 138),
              Color.fromARGB(255, 115, 67, 50),
            ],
          )),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "\nШАШЛЫК",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Text(
                  "2. Каким мясом угощаем?\n",
                  style: TextStyle(fontSize: 23),
                  textAlign: TextAlign.center,
                ),
                ToggleButtons(
                    textStyle: const TextStyle(fontSize: 40),
                    isSelected: _selectedMeat,
                    onPressed: (int index) async {
                      if (index == 0) {
                        final player = AudioPlayer();
                        await player.play(AssetSource('khru.mp3'));
                      } else if (index == 1) {
                        final player = AudioPlayer();
                        await player.play(AssetSource('koko.mp3'));
                      } else if (index == 2) {
                        final player = AudioPlayer();
                        await player.play(AssetSource('me.mp3'));
                      } else if (index == 3) {
                        final player = AudioPlayer();
                        await player.play(AssetSource('boolk.mp3'));
                      }

                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < _selectedMeat.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            _selectedMeat[buttonIndex] = true;
                          } else {
                            _selectedMeat[buttonIndex] = false;
                          }
                        }
                        result = getResult();
                      });
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderColor: Colors.transparent,
                    selectedBorderColor: Colors.transparent,
                    selectedColor: Colors.white,
                    fillColor: Colors.red[200],
                    color: Colors.red[400],
                    constraints: const BoxConstraints(
                      minHeight: 40.0,
                      minWidth: 80.0,
                    ),
                    children: meat),
                const Text(
                  "\n3. Сколько человек угощаем?\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23),
                ),
                Text(
                  _currentPeopleSliderValue.toString(),
                  style: const TextStyle(fontSize: 18, color: Colors.blue),
                ),
                Slider(
                    value: _currentPeopleSliderValue.toDouble(),
                    thumbColor: Colors.red,
                    max: 30,
                    divisions: 30,
                    label: _currentPeopleSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentPeopleSliderValue = value.toInt();
                        result = getResult();
                      });
                    }),
                const Text("\n4. Насколько голодны ваши гости?\n",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23)),
                ToggleButtons(
                    textStyle: const TextStyle(fontSize: 40),
                    isSelected: _selectedHungerState,
                    onPressed: (int index) async {
                      if (index == 0) {
                        final player = AudioPlayer();
                        await player.play(AssetSource('pisk.mp3'));
                      } else if (index == 1) {
                        final player = AudioPlayer();
                        await player.play(AssetSource('privet.mp3'));
                      } else if (index == 2) {
                        final player = AudioPlayer();
                        await player.play(AssetSource('voi.mp3'));
                      }

                      setState(() {
                        for (int buttonIndex = 0;
                            buttonIndex < _selectedHungerState.length;
                            buttonIndex++) {
                          if (buttonIndex == index) {
                            _selectedHungerState[buttonIndex] = true;
                          } else {
                            _selectedHungerState[buttonIndex] = false;
                          }
                        }
                        result = getResult();
                      });
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    borderColor: Colors.transparent,
                    selectedBorderColor: Colors.transparent,
                    selectedColor: Colors.white,
                    fillColor: Colors.red[200],
                    color: Colors.red[400],
                    constraints: const BoxConstraints(
                      minHeight: 40.0,
                      minWidth: 80.0,
                    ),
                    children: hungerState),
                const Text("\n4. Чтобы всех накормить, Вам понадобится:",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 23)),
                Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 237, 195, 195),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                          color: const Color.fromARGB(255, 242, 221, 221))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 2.5, 20, 2.5),
                    child: Text(
                      result,
                      style: const TextStyle(fontSize: 23),
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          )),
    );
  }
}
