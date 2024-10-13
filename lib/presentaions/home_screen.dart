import 'package:flutter/material.dart';
import 'package:zoomio_adminapp/presentaions/styles/styles.dart';
import 'package:zoomio_adminapp/presentaions/vehicle/all_vehicles.dart';
import 'package:zoomio_adminapp/presentaions/vehicle/vehicle_add.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.primaryColor,
        title: const Center(child: Text("Home Page")),
      ),
      drawer: Drawer(
        child: ListView.separated(
          itemBuilder: (context, index) {
            final items = [
              {'icon': Icons.dashboard, 'title': 'Dash Board'},
              {'icon': Icons.person, 'title': 'Users'},
              {'icon': Icons.directions_car, 'title': 'Drivers'},
              {'icon': Icons.bike_scooter, 'title': 'Vehicles'},
              {'icon': Icons.attach_money, 'title': 'Revenue'},
              {'icon': Icons.emoji_transportation, 'title': 'All rides'},
            ];

            return ListTile(
              leading: Icon(
                items[index]['icon'] as IconData,
                color: ThemeColors.primaryColor,
              ),
              title: Text(
                items[index]['title'] as String,
                style: const TextStyle(color: ThemeColors.primaryColor),
              ),
              onTap: () {
                _handleItemTap(context, index);
              },
            );
          },
          separatorBuilder: (context, index) =>
              const Divider(), // Add Divider between items
          itemCount: 6, // Number of list items
        ),
      ),
      // Adding the FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Define what happens when the button is pressed
          _onFabPressed(context);
        },
        backgroundColor: ThemeColors.primaryColor, // Custom color for the FAB
        child: const Icon(Icons.add), // Icon for the FAB
      ),
    );
  }

  // Handling the onTap event for the Drawer items
  void _handleItemTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/dashboard');
        break;
      case 1:
        Navigator.pushNamed(context, '/users');
        break;
      case 2:
        Navigator.pushNamed(context, '/drivers');
        break;
      case 3:
        Navigator.push(
            context,
            (MaterialPageRoute(
                builder: (context) => const AllVehiclesScreen())));
        break;
      case 4:
        Navigator.pushNamed(context, '/revenue');
        break;
      case 5:
        Navigator.pushNamed(context, '/allRides');
        break;
    }
  }

  // Defining the action for the FloatingActionButton
  void _onFabPressed(BuildContext context) {
    // For example, navigate to a new screen or open a dialog
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const VehicleAddScreen())); // Replace with your desired route
  }
}
