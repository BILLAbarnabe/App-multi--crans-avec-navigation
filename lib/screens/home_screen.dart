import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/destination_data.dart';
import '../theme/app_theme.dart';
import '../widgets/destination_card.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final featured = destinations.where((d) => d.featured).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Voyage'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6_outlined),
            onPressed: () {
              AppTheme.toggleTheme();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 700;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Découvrir le monde',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Des escapades inspirantes pour chaque envie.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 20),
                  SectionTitle(
                    title: 'Destinations populaires',
                    actionText: 'Voir tout',
                    onActionTap: () => context.go('/destinations'),
                  ),
                  const SizedBox(height: 12),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isWide ? 3 : 1,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 0.82,
                    ),
                    itemCount: featured.length,
                    itemBuilder: (context, index) {
                      final destination = featured[index];
                      return DestinationCard(
                        destination: destination,
                        onTap: () => context.go('/destination/${destination.id}'),
                      );
                    },
                  ),
                  const SizedBox(height: 28),
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () => context.go('/destinations'),
                          icon: const Icon(Icons.explore),
                          label: const Text('Explorer'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => context.go('/booking/bali'),
                          icon: const Icon(Icons.calendar_today),
                          label: const Text('Réserver'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
