import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoomio_adminapp/presentaions/provider/vehicle_provider.dart';
import 'package:zoomio_adminapp/presentaions/styles/styles.dart';

class AllVehiclesScreen extends StatefulWidget {
  const AllVehiclesScreen({super.key});

  @override
  State<AllVehiclesScreen> createState() => _AllVehiclesScreenState();
}

class _AllVehiclesScreenState extends State<AllVehiclesScreen> {
  @override
  void initState() {
    // final vehicleProvider =
    //     Provider.of<ImagePickerProvider>(context, listen: false);
    // vehicleProvider.fetchVehicles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vahicles"),
        backgroundColor: ThemeColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
          itemBuilder: (context, index) {
            return Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Container(
                      //  color: Colors.white,
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 129, 127, 127),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  const Text("Vehicle name")
                ],
              ),
            );
          },
          itemCount: 9,
        ),
      ),
    );
  }
}
