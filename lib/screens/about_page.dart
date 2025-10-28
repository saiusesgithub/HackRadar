import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const githubUrl = 'https://github.com/saiusesgithub/HackRadar';

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Column(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset('assets/icons/logo.png', fit: BoxFit.cover),
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

        _buildInfoCard(
          icon: Icons.storage,
          title: 'Data source',
          subtitle:
              'Events are scraped from public sources (initially Devfolio) and stored in Supabase. More sources will be added over time.',
        ),
        _buildInfoCard(
          icon: Icons.person,
          title: 'Developer',
          subtitle: 'saiusesgithub — Open source enthusiast',
        ),
        _buildGitHubCard(context, githubUrl),

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

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: ListTile(
        leading: Icon(icon, color: Colors.white70),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
      ),
    );
  }

  Widget _buildGitHubCard(BuildContext context, String githubUrl) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: ListTile(
        leading: const Icon(Icons.code, color: Colors.white70),
        title: const Text('Source code', style: TextStyle(color: Colors.white)),
        subtitle: Text(
          githubUrl,
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.open_in_new, color: Colors.white70),
          onPressed: () async {
            final uri = Uri.parse(githubUrl);
            if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Could not open link')),
              );
            }
          },
        ),
      ),
    );
  }
}
