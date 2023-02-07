
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';


 const List<Widget> meat = <Widget>[
  Text('🐷'),
  Text('🐔'),
  Text('🐏'),
  Text('🐟'),
];
final List<bool> _selectedMeat= <bool>[true, false, false, false];

class Page2 extends StatefulWidget {
  const Page2({super.key, required this.title});


  final String title;
 

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
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
            stops: [
              0.3,
              0.8,
            ],
            colors: [
              Color.fromARGB(255, 159, 118, 104),
              Color.fromARGB(255, 115, 67, 50),
            ],
          )),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Каким мясом угощаем?\n",
                    style: TextStyle(fontSize: 25),
                    textAlign: TextAlign.center,
                    ),
                    ToggleButtons(
                      textStyle: const TextStyle(fontSize: 40 ),
                      isSelected: _selectedMeat,
                      onPressed: 
                      (int index) async {
                      if (index==0){
                        final player = AudioPlayer();
                        await player.play(AssetSource('khru.mp3'));
                      }
                      else if (index==1){final player = AudioPlayer();
                        await player.play(AssetSource('koko.mp3'));}
                      else if (index==2){final player = AudioPlayer();
                        await player.play(AssetSource('me.mp3'));}  
                      else if (index==3){ final player = AudioPlayer();
                        await player.play(AssetSource('boolk.mp3'));}

                        setState(() {
                          for (int buttonIndex = 0; buttonIndex < _selectedMeat.length; buttonIndex++) {
                            if (buttonIndex == index) {
                              _selectedMeat[buttonIndex] = true;
                            } else {
                              _selectedMeat[buttonIndex] = false;
                            }
                          }
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
                      children: meat
                    ),
                    
                    const Text("\nСколько человек угощаем?\n",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25 ),
                  
                      ),
                    Text (_currentSliderValue.toString(),
                      style: const TextStyle(fontSize: 18, color: Colors.blue ),
                      
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
                    }

                  )
                  ],

                ),
              )
             ),
    );
  }
}
