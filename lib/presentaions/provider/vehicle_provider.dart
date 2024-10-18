import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VehicleProvider extends ChangeNotifier {
  String? selectedVehicleType;
  String? selectedBrand;
  String? selectedFuelType;
  DateTime? insuranceExpiryDate;
  DateTime? pollutionExpiryDate;
  List<String> selectedVehicleImages = [];
  List<String> selectedDocumentImages = [];

  final List<String> vehicleTypes = ['Car', 'Bike'];
  final List<String> fuelTypes = ['Petrol', 'Diesel', 'Electric'];

  final List<String> carBrands = ['Toyota', 'Honda', 'Ford', 'BMW', 'Nissan'];
  final List<String> bikeBrands = [
    'Yamaha',
    'Kawasaki',
    'Ducati',
    'Suzuki',
    'Honda'
  ];

  // Select Vehicle Type
  void setVehicleType(String? type) {
    selectedVehicleType = type;
    selectedBrand = null; // Reset brand when vehicle type changes
    notifyListeners();
  }

  // Select Brand
  void setBrand(String? brand) {
    selectedBrand = brand;
    notifyListeners();
  }

  // Select Fuel Type
  void setFuelType(String? fuelType) {
    selectedFuelType = fuelType;
    notifyListeners();
  }

  // Select Vehicle Images
  Future<void> addVehicleImages() async {
    final picker = ImagePicker();
    final List<XFile>? images = await picker.pickMultiImage();
    if (images != null) {
      selectedVehicleImages = images.map((e) => e.path).toList();
      notifyListeners();
    }
  }

  // Set Insurance Expiry Date
  void setInsuranceExpiryDate(DateTime? date) {
    insuranceExpiryDate = date;
    notifyListeners();
  }

  // Set Pollution Expiry Date
  void setPollutionExpiryDate(DateTime? date) {
    pollutionExpiryDate = date;
    notifyListeners();
  }

  // Get Brands for Selected Vehicle Type
  List<String> getBrandsForSelectedType() {
    return selectedVehicleType == 'Car' ? carBrands : bikeBrands;
  }

  // Clear Form
  void clearForm() {
    selectedVehicleType = null;
    selectedBrand = null;
    selectedFuelType = null;
    selectedVehicleImages.clear();
    selectedDocumentImages.clear();
    insuranceExpiryDate = null;
    pollutionExpiryDate = null;
    notifyListeners();
  }
}
