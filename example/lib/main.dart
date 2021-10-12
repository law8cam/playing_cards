import 'package:flutter/material.dart';
import 'package:playing_cards/playing_cards.dart';

void main() {
  runApp(MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark().copyWith(
        // primarySwatch: Colors.orange,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        checkboxTheme: CheckboxThemeData(fillColor: MaterialStateColor.resolveWith(
              (states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.blue; // the color when checkbox is selected;
            }
            return Colors.white; //the color when checkbox is unselected;
          },
        )),
      ),
      themeMode: ThemeMode.dark,

      home: CardHomeView()));
}

class CardHomeView extends StatefulWidget {
  CardHomeView({Key key}) : super(key: key);

  @override
  _CardHomeViewState createState() => _CardHomeViewState();
}

class _CardHomeViewState extends State<CardHomeView> {
  Suit suit = Suit.spades;
  CardValue value = CardValue.ace;

  // This style object overrides the styles for the suits, replacing the
  // image-based default implementation for the suit emblems with a text based
  // implementation.
  PlayingCardViewStyle myCardStyles = PlayingCardViewStyle(suitStyles: {
    Suit.spades: SuitStyle(
        builder: (context) => FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "♠",
                style: TextStyle(fontSize: 500),
              ),
            ),
        style: TextStyle(color: Colors.black)
    ),
    Suit.hearts: SuitStyle(
        builder: (context) => FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "♥",
                style: TextStyle(fontSize: 500),
              ),
            ),
        style: TextStyle(color: Colors.red)),
    Suit.diamonds: SuitStyle(
        builder: (context) => FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "♦",
                style: TextStyle(fontSize: 500),
              ),
            ),
        style: TextStyle(color: Colors.red)),
    Suit.clubs: SuitStyle(
        builder: (context) => FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                "♣",
                style: TextStyle(fontSize: 500),
              ),
            ),
        style: TextStyle(color: Colors.black)
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              height: 400,

              child: PlayingCardView(card: PlayingCard(suit, value), style: myCardStyles, cardColor: Colors.blue,)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            DropdownButton<Suit>(
                value: suit,
                items: Suit.values
                    .map((s) =>
                        DropdownMenuItem(value: s, child: Text(s.toString())))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    suit = val;
                  });
                }),
            DropdownButton<CardValue>(
                value: value,
                items: CardValue.values
                    .map((s) =>
                        DropdownMenuItem(value: s, child: Text(s.toString())))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    value = val;
                  });
                }),
          ])
        ],
      ),
    );
  }
}
