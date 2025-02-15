import 'package:flutter/material.dart';

import 'package:decorated_text/decorated_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Transform.scale(
          scale: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DecoratedText(
                'Decorated Text',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
                fillColor: Colors.teal,
                borderWidth: 1,
              ),
              DecoratedText(
                'Decorated Text',
                borderColor: Colors.amber,
                borderWidth: 3,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        blurRadius: 4,
                        offset: Offset(4, 4))
                  ],
                ),
                fillGradient: LinearGradient(colors: [Colors.blue, Colors.red]),
              ),
              DecoratedText(
                'Decorated Text',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        blurRadius: 4,
                        offset: Offset(4, 4))
                  ],
                ),
                borderWidth: 1.5,
                borderColor: Colors.yellow[800]!,
                fillGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.2, 0.55, 0.55, 0.75],
                  colors: [
                    Colors.white,
                    Colors.yellow[500]!,
                    Colors.yellow[800]!,
                    Colors.yellow[500]!,
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
