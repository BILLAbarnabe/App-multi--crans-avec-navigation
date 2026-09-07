# Projet Flutter — App multi-écrans avec navigation

Application Flutter multi-écrans dédiée aux voyages, avec navigation nommée, recherche, détails et réservation.

## Fonctionnalités

- 4 écrans distincts : accueil, liste, détail, réservation
- Navigation avec GoRouter et routes nommées
- Recherche et filtrage de destinations
- Écran de détail avec paramètres
- Formulaire de réservation validé
- Thème clair/sombre
- Design responsive mobile/tablette
- Données séparées de l’interface utilisateur

## Stack technique

- Flutter
- Dart
- GoRouter

## Lancement

1. Vérifier que Flutter est installé
2. Installer les dépendances :
   flutter pub get
3. Lancer l’application :
   flutter run
4. Pour exécuter les tests :
   flutter test

## Architecture

```text
lib/
├── data/
│   └── destination_data.dart
├── models/
│   └── destination.dart
├── screens/
│   ├── home_screen.dart
│   ├── list_screen.dart
│   ├── detail_screen.dart
│   └── booking_screen.dart
├── widgets/
│   ├── destination_card.dart
│   ├── custom_input.dart
│   └── section_title.dart
└── main.dart
```

Les données de démonstration sont dans `lib/data/` et le modèle dans `lib/models/`. Les écrans ne contiennent pas de données de destinations en dur.

## Captures d’écran

Les captures des écrans accueil, liste, détail et réservation sont conservées dans `screenshots/`.

![Accueil](screenshots/accueil.png)
![Liste et recherche](screenshots/liste-recherche.png)
![Détail d'une destination](screenshots/detail-destination.png)
![Formulaire de réservation](screenshots/reservation.png)
