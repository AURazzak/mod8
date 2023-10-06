import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:Text('Size Selector'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 0.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizeButton('S'),
                  SizeButton('M'),
                  SizeButton('L'),
                  SizeButton('XL'),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizeButton('XXL'),
                  SizeButton('XXXL'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SizeButton extends StatefulWidget {
  final String size;

  SizeButton(this.size);

  @override
  _SizeButtonState createState() => _SizeButtonState();
}

class _SizeButtonState extends State<SizeButton> {
  Color buttonColor = Colors.grey;
  static _SizeButtonState? previousButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0,
      height: 40,
      margin: EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (previousButton != null) {
              previousButton!.setState(() {
                previousButton!.buttonColor = Colors.grey;
              });
            }
            buttonColor = Colors.orange;
            previousButton = this;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Button ${widget.size} is  been pressed'),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
        ),
        child: Text(widget.size),
      ),
    );
  }
}