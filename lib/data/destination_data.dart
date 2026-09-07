import '../models/destination.dart';

const List<Destination> destinations = [
  Destination(
    id: 'bali',
    title: 'Bali',
    country: 'Indonésie',
    region: 'Asie',
    description:
        'Vallées vertes, temples spirituels et plages paradisiaques parfaites pour une escapade paisible et lumineuse.',
    imageUrl:
        'https://images.unsplash.com/photo-1537996194471-e657df975ab4?auto=format&fit=crop&w=900&q=80',
    rating: 4.9,
    price: 1290,
    duration: 7,
    featured: true,
    highlights: ['Plages', 'Temple', 'Spa', 'Randonnée'],
  ),
  Destination(
    id: 'kyoto',
    title: 'Kyoto',
    country: 'Japon',
    region: 'Asie',
    description:
        'Des jardins paisibles, des temples millénaires et une cuisine raffinée dans une ville pleine de charme.',
    imageUrl:
        'https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?auto=format&fit=crop&w=900&q=80',
    rating: 4.8,
    price: 1490,
    duration: 6,
    featured: true,
    highlights: ['Culture', 'Cuisine', 'Parcs', 'Temple'],
  ),
  Destination(
    id: 'reykjavik',
    title: 'Reykjavik',
    country: 'Islande',
    region: 'Europe',
    description:
        'Volcans, cascades et aurores boréales offrent une expérience spectaculaire et hors du commun.',
    imageUrl:
        'https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=900&q=80',
    rating: 4.7,
    price: 1890,
    duration: 8,
    featured: true,
    highlights: ['Aurores', 'Volcans', 'Road trip', 'Spa'],
  ),
  Destination(
    id: 'marrakech',
    title: 'Marrakech',
    country: 'Maroc',
    region: 'Afrique',
    description:
        'Senteurs, souks fascinants et architecture majestueuse pour une immersion culturelle intense.',
    imageUrl:
        'https://images.unsplash.com/photo-1518548419970-58e3b4079ab2?auto=format&fit=crop&w=900&q=80',
    rating: 4.6,
    price: 980,
    duration: 5,
    featured: false,
    highlights: ['Souks', 'Palais', 'Cuisine', 'Riad'],
  ),
  Destination(
    id: 'patagonia',
    title: 'Patagonie',
    country: 'Argentine',
    region: 'Amérique du Sud',
    description:
        'Des paysages grandioses, des lacs et des montagnes qui donnent le vertige à chaque étape.',
    imageUrl:
        'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?auto=format&fit=crop&w=900&q=80',
    rating: 4.9,
    price: 2100,
    duration: 9,
    featured: false,
    highlights: ['Lac', 'Randonnée', 'Photographie', 'Nature'],
  ),
  Destination(
    id: 'capetown',
    title: 'Le Cap',
    country: 'Afrique du Sud',
    region: 'Afrique',
    description:
        'Entre montagnes, plages et culture vibrante, cette destination offre un mélange unique de nature et de ville.',
    imageUrl:
        'https://images.unsplash.com/photo-1521295121783-8a321d551ad2?auto=format&fit=crop&w=900&q=80',
    rating: 4.7,
    price: 1450,
    duration: 7,
    featured: false,
    highlights: ['Plage', 'Vin', 'Nature', 'Villes'],
  ),
];

Destination? findDestinationById(String? id) {
  if (id == null) return null;
  return destinations.where((destination) => destination.id == id).firstOrNull;
}

extension on Iterable<Destination> {
  Destination? get firstOrNull => isEmpty ? null : first;
}
