class Vehicle {
  String id;
  String brand;
  List<String> imageUrls; // List to hold image URLs

  Vehicle({
    this.id = '',
    required this.brand,
    this.imageUrls = const [],
  });

  // Convert the vehicle object to a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'brand': brand,
      'imageUrls': imageUrls, // Include image URLs
    };
  }

  // Create a Vehicle object from a Map
  factory Vehicle.fromMap(Map<String, dynamic> map, String id) {
    return Vehicle(
      id: id,
      brand: map['brand'],
      imageUrls: List<String>.from(map['imageUrls'] ?? []),
    );
  }
}
