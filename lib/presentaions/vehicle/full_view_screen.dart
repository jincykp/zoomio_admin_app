import 'package:flutter/material.dart';
import 'package:zoomio_adminapp/presentaions/styles/styles.dart';

class VehicleFullViewScreen extends StatefulWidget {
  const VehicleFullViewScreen({super.key});

  @override
  State<VehicleFullViewScreen> createState() => _VehicleFullViewScreenState();
}

class _VehicleFullViewScreenState extends State<VehicleFullViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.primaryColor,
        title: const Text("Vehicle Details"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(image: NetworkImage(""))),
          )
        ],
      ),
    );
  }
}
