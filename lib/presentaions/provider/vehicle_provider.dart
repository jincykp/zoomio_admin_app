import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zoomio_adminapp/data/model/vehicle.dart';
// Import your Vehicle model class

class VehicleProvider with ChangeNotifier {
  List<Vehicle> _vehicles = [];
  bool _isLoading = false;

  List<Vehicle> get vehicles => _vehicles;
  bool get isLoading => _isLoading;

  // // Fetch vehicles from Firestore
  // Future<void> fetchVehicles() async {
  //   _isLoading = true;
  //   notifyListeners();

  //   try {
  //     QuerySnapshot snapshot =
  //         await FirebaseFirestore.instance.collection('vehicles').get();
  //     _vehicles = snapshot.docs
  //         .map((doc) =>
  //             Vehicle.fromFirestore(doc.data() as Map<String, dynamic>))
  //         .toList();
  //   } catch (error) {
  //     print('Error fetching vehicles: $error');
  //   }

  //   _isLoading = false;
  //   notifyListeners();
  // }
}
