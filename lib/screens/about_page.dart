import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const githubUrl = 'https://github.com/saiusesgithub/HackRadar';

    return ListView(
      children: [
        Center(
          child: Column(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF00FFD5),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'HR',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'HackRadar',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Discover live and upcoming hackathons from multiple sources in one place.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        Card(
          color: Colors.transparent,
          elevation: 0,
          child: ListTile(
            leading: const Icon(Icons.storage, color: Colors.white70),
            title: const Text(
              'Data source',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'Events are scraped from public sources (initially Devfolio) and stored in Supabase. More sources will be added over time.',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ),
        const SizedBox(height: 12),

        Card(
          color: Colors.transparent,
          elevation: 0,
          child: ListTile(
            leading: const Icon(Icons.person, color: Colors.white70),
            title: const Text(
              'Developer',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'saiusesgithub — Open source enthusiast',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ),
        const SizedBox(height: 12),

        Card(
          color: Colors.transparent,
          elevation: 0,
          child: ListTile(
            leading: const Icon(Icons.code, color: Colors.white70),
            title: const Text(
              'Source code',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              githubUrl,
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.open_in_new, color: Colors.white70),
              onPressed: () async {
                final uri = Uri.parse(githubUrl);
                if (!await launchUrl(
                  uri,
                  mode: LaunchMode.externalApplication,
                )) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not open link')),
                  );
                }
              },
            ),
          ),
        ),

        const SizedBox(height: 24),

        Center(
          child: Text(
            'If you have suggestions or want to contribute, open an issue on GitHub.',
            style: theme.textTheme.bodySmall?.copyWith(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
