import 'package:flutter/material.dart';
import 'package:zoomio_adminapp/data/model/vehicle_model.dart';
import 'package:zoomio_adminapp/data/services/database.dart';

class VehicleProvider extends ChangeNotifier {
  List<Vehicle> _vehicles = []; // List to hold vehicles
  bool _isLoading = false; // Flag to track loading state

  List<Vehicle> get vehicles => _vehicles; // Getter for the vehicle list
  bool get isLoading => _isLoading; // Getter for the loading state

  // Method to fetch vehicles from an external source (e.g., Firebase)
  Future<void> fetchVehicles() async {
    try {
      _isLoading = true;
      notifyListeners();

      _vehicles = await getVehicles();

      _isLoading = false;
      notifyListeners();

      print("Fetched vehicles: $_vehicles"); // Debugging line
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      print('Error fetching vehicles: $e');
    }
  }

  // Method to get only cars
// Method to get only cars
  List<Vehicle> get cars {
    return _vehicles
        .where((vehicle) => vehicle.vehicleType.toLowerCase() == 'car')
        .toList();
  }

  // Method to get only bikes
  List<Vehicle> get bikes {
    return _vehicles
        .where((vehicle) => vehicle.vehicleType.toLowerCase() == 'bike')
        .toList();
  }

  // Method to add a new vehicle
  void addVehicle(Vehicle newVehicle) {
    _vehicles.add(newVehicle);
    notifyListeners(); // Notify UI about the update
  }

  // Optional: Method to clear all vehicles (useful for testing or reset)
  void clearVehicles() {
    _vehicles.clear();
    notifyListeners();
  }
}
