class Vehicle {
  String id;
  String name;
  String imageUrl;

  Vehicle({required this.id, required this.name, required this.imageUrl});

  // Method to create a Vehicle object from Firestore data
  factory Vehicle.fromFirestore(Map<String, dynamic> data) {
    return Vehicle(
      id: data['id'] ?? '', // Make sure to handle null values appropriately
      name: data['name'] ?? '',
      imageUrl:
          data['imageUrl'] ?? '', // Adjust based on your Firestore structure
    );
  }

  // Optionally, you can also add a method to convert the Vehicle back to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}
