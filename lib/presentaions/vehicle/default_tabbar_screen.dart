import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomio_adminapp/presentaions/provider/vehicle_provider.dart';
import 'package:zoomio_adminapp/presentaions/styles/styles.dart';
import 'package:zoomio_adminapp/presentaions/vehicle/vechicle_screens/full_view_screen.dart';
import 'package:zoomio_adminapp/presentaions/vehicle/vechicle_screens/bike_tab_screen.dart';
import 'package:zoomio_adminapp/presentaions/vehicle/vechicle_screens/car_tab_screen.dart';

class DefaultTabbarScreen extends StatelessWidget {
  const DefaultTabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Vehicles"),
          backgroundColor: ThemeColors.primaryColor,
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.car_crash),
            ),
            Tab(
              icon: Icon(Icons.bike_scooter),
            )
          ]),
        ),
        body: const TabBarView(
          children: [CarTabScreen(), BikeTabScreen()],
        ),
      ),
    );
  }
}
