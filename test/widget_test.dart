import 'package:flutter_test/flutter_test.dart';

import 'package:explore_app/main.dart';

void main() {
  testWidgets('l\'application s\'affiche avec l\'écran d\'accueil', (tester) async {
    await tester.pumpWidget(const ExploreApp());

    expect(find.text('Explore Voyage'), findsOneWidget);
    expect(find.text('Destinations populaires'), findsOneWidget);
  });
}
