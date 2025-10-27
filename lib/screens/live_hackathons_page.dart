import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class LiveHackathonsPage extends StatefulWidget {
  const LiveHackathonsPage({super.key});

  @override
  State<LiveHackathonsPage> createState() => _LiveHackathonsPageState();
}

class _LiveHackathonsPageState extends State<LiveHackathonsPage> {
  List<Container> cards = [
    Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color(0xFF1A1A1F),
        border: Border.all(color: const Color(0xff00ffd5), width: 2.0),
      ),
      child: const Text('1'),
    ),
    Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color(0xFF1A1A1F),
        border: Border.all(
          color: const Color.fromARGB(255, 44, 93, 85),
          width: 2.0,
        ),
      ),
      child: const Text('2'),
    ),
    Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color(0xFF1A1A1F),
        border: Border.all(color: const Color(0xff00ffd5), width: 2.0),
      ),
      child: const Text('3'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        child: CardSwiper(
          cardsCount: cards.length,
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
              cards[index],
        ),
      ),
    );
  }
}
