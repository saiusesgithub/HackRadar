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
        child: Text(
          'No live hackathons available right now...',
          style: TextStyle(color: Colors.white),
        ),
      );
    }
    final height = MediaQuery.of(context).size.height * 0.70;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: height,
              child: CardSwiper(
                numberOfCardsDisplayed: 4,
                cardsCount: cards.length,
                cardBuilder:
                    (context, index, percentThresholdX, percentThresholdY) =>
                        cards[index],
              ),
            ),
          ],
        ),
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
            return const Center(
              child: Text(
                'No hackathons found.',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          final hackathons = snapshot.data!;

          final cards = hackathons.map((hackathon) {
            final title = hackathon['title'] ?? 'Unnamed Hackathon';
            final imageUrl = hackathon['image_url'] ?? hackathon['image'] ?? '';
            final startDate = hackathon['start_date'] ?? 'TBA';
            final participants =
                hackathon['no_of_participants']?.toString() ?? '—';
            final location = hackathon['location'] ?? 'Online';

            return SwipeableCard(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox.expand(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (imageUrl != null &&
                          imageUrl.toString().isNotEmpty) ...{
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            imageUrl.toString(),
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stack) => Container(
                              height: 150,
                              color: const Color(0xFF101010),
                              child: const Icon(
                                Icons.broken_image,
                                color: Colors.white30,
                                size: 48,
                              ),
                            ),
                          ),
                        ),
                      } else ...{
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: const Color(0xFF101010),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.image,
                              color: Colors.white30,
                              size: 48,
                            ),
                          ),
                        ),
                      },
                      const SizedBox(height: 12),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 76,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xFF2A2A2A)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    size: 16,
                                    color: Colors.white70,
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      startDate.toString(),
                                      style: const TextStyle(
                                        color: Colors.white70,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 6),
                              const Divider(
                                color: Color(0xFF3A3A3A),
                                height: 1,
                              ),
                              const SizedBox(height: 6),

                              Row(
                                children: [
                                  const Icon(
                                    Icons.place,
                                    size: 16,
                                    color: Colors.white70,
                                  ),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      location.toString(),
                                      style: const TextStyle(
                                        color: Colors.white70,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Spacer to push button to the bottom
                      const Spacer(),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Text(
                              participants,
                              style: const TextStyle(color: Colors.white70),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              style: ButtonStyle(
                                side: WidgetStateProperty.all(
                                  const BorderSide(color: Color(0xff00ffd5)),
                                ),
                                padding: WidgetStateProperty.all(
                                  const EdgeInsets.symmetric(vertical: 12),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'View Details',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
