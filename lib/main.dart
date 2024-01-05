import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CoinFlip(),
    );
  }
}

List<String> coin = ["heads", "tails"];
int num = Random().nextInt(2);
int Hcounter = 0;
int Tcounter = 0;

class CoinFlip extends StatefulWidget {
  const CoinFlip({super.key});

  @override
  State<CoinFlip> createState() => _CoinFlipState();
}

class _CoinFlipState extends State<CoinFlip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[49],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                "Press the button to flip the coin ",
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: Colors.brown,
                    height: 5),
              ),
              SizedBox(
                height: 18,
              ),
              Image.asset("Assets/coin/${coin[num]}.jpg"),
              SizedBox(
                height: 34,
              ),
              ElevatedButton(
                  onPressed: ()
                  {
                    final Player = AudioPlayer();
                    Player.play(AssetSource("Assets/sound/coin_flip_sound.mp3"));
                    setState((){

                      if (num == 1) {
                        Tcounter++;
                      } else {
                        Hcounter++;
                      }
                      num = Random().nextInt(2);

                    });
                  },
                  child: Text(" Toass ")),
              SizedBox(
                height: 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Heads counter = $Hcounter",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.green),
                  ),
                  SizedBox(
                    width: 54,
                  ),
                  Text(
                    "Tails counter = $Tcounter",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.redAccent),
                  )
                ],
              ),
              SizedBox(
                height: 64,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Hcounter = 0;
                      Tcounter = 0;
                    });
                  },
                  child: Text("Reset counters")),
            ],
          ),
        ),
      ),
    );
  }
}
