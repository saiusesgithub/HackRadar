import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:hackradar/widgets/swipeable_card.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LiveHackathonsPage extends StatefulWidget {
  const LiveHackathonsPage({super.key});

  @override
  State<LiveHackathonsPage> createState() => _LiveHackathonsPageState();
}

class _LiveHackathonsPageState extends State<LiveHackathonsPage> {
  late final Future<List<Map<String, dynamic>>> _future;

  @override
  void initState() {
    super.initState();
    _future = Supabase.instance.client
        .from('open_hackathons')
        .select()
        .then((data) => data);
  }

  Widget _buildCardSwiperWidget(List<SwipeableCard> cards) {
    if (cards.isEmpty) {
      return const Center(
        child: Text('No live hackathons available right now...'),
      );
    }
    return Flexible(
      child: CardSwiper(
        cardsCount: cards.length,
        cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
            cards[index],
        numberOfCardsDisplayed: 2,
        isLoop: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hackathons found.'));
          }

          final hackathons = snapshot.data!;

          final cards = hackathons.map((hackathon) {
            return SwipeableCard(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      hackathon['title'] ?? 'Unnamed Hackathon',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      hackathon['type'] ?? 'Unknown Type',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      hackathon['no_of_participants'] ?? 'Unknown',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      hackathon['start_date'] ?? 'Unknown',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    OutlinedButton(
                      style: ButtonStyle(
                        side: WidgetStateProperty.all(
                          const BorderSide(color: Color(0xff00ffd5)),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'More Info',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList();

          return _buildCardSwiperWidget(cards);
        },
      ),
    );
  }
}
