import '../models/planet.dart';

/// All the planets shown in the Explore page view.
/// The [Planet.model] files go in `assets/models/` (the .glb files from the
/// project assets). If a model is missing, the details screen falls back to
/// the planet image automatically.
abstract class PlanetsData {
  static const int initialIndex = 3; // Earth

  static const List<Planet> planets = [
    Planet(
      name: 'Sun',
      title: 'Sun: The Heart of Our System',
      image: 'assets/images/sun.png',
      model: 'assets/models/sun.glb',
      about:
          'The Sun is a yellow dwarf star at the center of our solar system. '
          'It holds 99.8% of the system\'s mass, and its gravity keeps every '
          'planet in orbit. Nuclear fusion in its core turns hydrogen into '
          'helium, releasing the light and heat that make life on Earth possible.',
      distanceFromSun: '0',
      lengthOfDay: '609.12',
      orbitalPeriod: '—',
      radius: '696340',
      mass: '1.989 × 10³⁰',
      gravity: '274',
      surfaceArea: '6.09 × 10¹²',
    ),
    Planet(
      name: 'Mercury',
      title: 'Mercury: The Swift Planet',
      image: 'assets/images/mercury.png',
      model: 'assets/models/mercury.glb',
      about:
          'Mercury is the smallest planet and the closest one to the Sun. '
          'It races around the Sun faster than any other planet, completing '
          'an orbit in just 88 days. With almost no atmosphere to trap heat, '
          'its surface swings from scorching days to freezing nights.',
      distanceFromSun: '57909227',
      lengthOfDay: '4222.6',
      orbitalPeriod: '0.24',
      radius: '2439.7',
      mass: '3.30 × 10²³',
      gravity: '3.7',
      surfaceArea: '7.48 × 10⁷',
    ),
    Planet(
      name: 'Venus',
      title: 'Venus: Earth\'s Hot Twin',
      image: 'assets/images/venus.png',
      model: 'assets/models/venus.glb',
      about:
          'Venus is similar to Earth in size, but its thick carbon dioxide '
          'atmosphere traps heat in a runaway greenhouse effect, making it the '
          'hottest planet in the solar system. It also spins backwards, so the '
          'Sun rises in the west there.',
      distanceFromSun: '108209475',
      lengthOfDay: '2802',
      orbitalPeriod: '0.62',
      radius: '6051.8',
      mass: '4.87 × 10²⁴',
      gravity: '8.87',
      surfaceArea: '4.60 × 10⁸',
    ),
    Planet(
      name: 'Earth',
      title: 'Earth: Our Blue Marble',
      image: 'assets/images/earth.png',
      model: 'assets/models/earth.glb',
      about:
          'Earth is the only known planet in the universe that supports life. '
          'Its unique combination of factors, including liquid water, a '
          'breathable atmosphere, and a suitable distance from the Sun, has '
          'created the ideal conditions for the development of complex '
          'organisms. Earth\'s magnetic field protects it from harmful solar '
          'radiation, and its atmosphere helps to regulate temperature and '
          'weather patterns.',
      distanceFromSun: '149598026',
      lengthOfDay: '23.93',
      orbitalPeriod: '1',
      radius: '6371',
      mass: '5.972 × 10²⁴',
      gravity: '9.81',
      surfaceArea: '5.10 × 10⁸',
    ),
    Planet(
      name: 'Mars',
      title: 'Mars: The Red Planet',
      image: 'assets/images/mars.png',
      model: 'assets/models/mars.glb',
      about:
          'Mars gets its red color from iron oxide dust covering its surface. '
          'It is home to Olympus Mons, the tallest volcano in the solar '
          'system, and shows signs that liquid water once flowed there, which '
          'makes it a main target in the search for past life.',
      distanceFromSun: '227943824',
      lengthOfDay: '24.6',
      orbitalPeriod: '1.88',
      radius: '3389.5',
      mass: '6.42 × 10²³',
      gravity: '3.71',
      surfaceArea: '1.45 × 10⁸',
    ),
    Planet(
      name: 'Jupiter',
      title: 'Jupiter: The Gas Giant',
      image: 'assets/images/jupiter.png',
      model: 'assets/models/jupiter.glb',
      about:
          'Jupiter is the largest planet in the solar system, more than twice '
          'as massive as all the other planets combined. Its Great Red Spot is '
          'a giant storm bigger than Earth that has raged for hundreds of '
          'years, and it has dozens of moons, including Ganymede, the largest '
          'moon in the solar system.',
      distanceFromSun: '778340821',
      lengthOfDay: '9.93',
      orbitalPeriod: '11.86',
      radius: '69911',
      mass: '1.898 × 10²⁷',
      gravity: '24.79',
      surfaceArea: '6.14 × 10¹⁰',
    ),
    Planet(
      name: 'Saturn',
      title: 'Saturn: The Ringed Jewel',
      image: 'assets/images/saturn.png',
      model: 'assets/models/saturn.glb',
      about:
          'Saturn is famous for its spectacular ring system, made of billions '
          'of pieces of ice and rock. It is a gas giant so light for its size '
          'that it would float in water, and it has more known moons than any '
          'other planet.',
      distanceFromSun: '1426666422',
      lengthOfDay: '10.7',
      orbitalPeriod: '29.45',
      radius: '58232',
      mass: '5.68 × 10²⁶',
      gravity: '10.44',
      surfaceArea: '4.27 × 10¹⁰',
    ),
    Planet(
      name: 'Uranus',
      title: 'Uranus: The Sideways Planet',
      image: 'assets/images/uranus.png',
      model: 'assets/models/uranus.glb',
      about:
          'Uranus is an ice giant that rotates on its side, with its axis '
          'tilted about 98 degrees. Methane in its atmosphere gives it a pale '
          'blue-green color, and it has the coldest atmosphere of any planet.',
      distanceFromSun: '2870658186',
      lengthOfDay: '17.2',
      orbitalPeriod: '84',
      radius: '25362',
      mass: '8.68 × 10²⁵',
      gravity: '8.87',
      surfaceArea: '8.08 × 10⁹',
    ),
    Planet(
      name: 'Neptune',
      title: 'Neptune: The Windy Giant',
      image: 'assets/images/neptune.png',
      model: 'assets/models/neptune.glb',
      about:
          'Neptune is the farthest planet from the Sun. This deep blue ice '
          'giant has the strongest winds in the solar system, reaching more '
          'than 2,000 km/h, and it was the first planet found by mathematical '
          'prediction rather than direct observation.',
      distanceFromSun: '4498396441',
      lengthOfDay: '16.1',
      orbitalPeriod: '164.8',
      radius: '24622',
      mass: '1.02 × 10²⁶',
      gravity: '11.15',
      surfaceArea: '7.62 × 10⁹',
    ),
  ];
}
