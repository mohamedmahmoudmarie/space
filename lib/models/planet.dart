class Planet {
  final String name;
  final String title; // e.g. "Earth: Our Blue Marble"
  final String image; // 2D image used in the page view
  final String model; // 3D .glb model shown in details screen
  final String about;
  final String distanceFromSun; // km
  final String lengthOfDay; // hours
  final String orbitalPeriod; // earth years
  final String radius; // km
  final String mass; // kg
  final String gravity; // m/s²
  final String surfaceArea; // km²

  const Planet({
    required this.name,
    required this.title,
    required this.image,
    required this.model,
    required this.about,
    required this.distanceFromSun,
    required this.lengthOfDay,
    required this.orbitalPeriod,
    required this.radius,
    required this.mass,
    required this.gravity,
    required this.surfaceArea,
  });
}
