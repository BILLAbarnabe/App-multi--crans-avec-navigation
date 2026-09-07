import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/destination_data.dart';
import '../widgets/destination_card.dart';
import '../widgets/custom_input.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _search = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<dynamic> get filteredDestinations {
    final query = _search.trim().toLowerCase();
    if (query.isEmpty) return destinations;

    return destinations.where((destination) {
      final text = '${destination.title} ${destination.country} ${destination.region}'.toLowerCase();
      return text.contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final items = filteredDestinations;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinations'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomInput(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _search = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: items.isEmpty
                    ? const Center(child: Text('Aucune destination trouvée'))
                    : LayoutBuilder(
                        builder: (context, constraints) {
                          final isWide = constraints.maxWidth >= 700;
                          return GridView.builder(
                            itemCount: items.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: isWide ? 2 : 1,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: isWide ? 1.15 : 0.82,
                            ),
                            itemBuilder: (context, index) {
                              final destination = items[index];
                              return DestinationCard(
                                destination: destination,
                                onTap: () => context.go('/destination/${destination.id}'),
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
