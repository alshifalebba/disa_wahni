import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginpage/infrastructure/database_functions/checkin_hivehelper.dart';
import 'package:loginpage/application/vehicle/vehicle_bloc.dart';
import 'package:loginpage/application/checkin/checkin_bloc.dart';
import 'package:loginpage/infrastructure/api_services/api_services.dart';
import 'package:loginpage/infrastructure/api_services/get_vehicle_rep.dart';
import 'package:loginpage/presentation/checkin/camera_page.dart';

class CheckinPage extends StatefulWidget {
  final String logType;
  
  const CheckinPage({super.key, required this.logType});

  @override
  State<CheckinPage> createState() => _CheckinPageState();
}

class _CheckinPageState extends State<CheckinPage> {
  final TextEditingController odoController = TextEditingController();

  String? selectedVehicle;
  bool loadingVehicle = true;

  bool get showOdometer {
    return selectedVehicle == "Bike" || selectedVehicle == "Car";
  }

  @override
  void initState() {
    super.initState();
    loadVehicleFromHive();
  }

  @override
  void dispose() {
    odoController.dispose();
    super.dispose();
  }

  Future<void> loadVehicleFromHive() async {
    if (widget.logType == "OUT") {
      final data = await CheckinHiveHelper.get();

      if (data != null) {
        setState(() {
          selectedVehicle = data.vehicleType;

          if (selectedVehicle == "Bike" || selectedVehicle == "Car") {
            odoController.text = data.odometerValue;
          }
        });
      }
    }

    if (mounted) {
      setState(() {
        loadingVehicle = false;
      });
    }
  }

  Future<void> captureSelfie() async {
    final XFile? image = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const CameraPage(lensDirection: CameraLensDirection.front),
      ),
    );

    if (image != null && mounted) {
      context.read<CheckinBloc>().add(CheckinEvent.selfieCaptured(image));
    }
  }

  Future<void> captureOdometer() async {
    final XFile? image = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const CameraPage(lensDirection: CameraLensDirection.back),
      ),
    );

    if (image != null && mounted) {
      context.read<CheckinBloc>().add(CheckinEvent.odometerCaptured(image));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          VehicleBloc(VehicleRepository(ApiService()))
            ..add(const VehicleEvent.getVehicleTypes()),
      child: BlocBuilder<VehicleBloc, VehicleState>(
        builder: (context, vehicleState) {
          return BlocConsumer<CheckinBloc, CheckinState>(
            listener: (context, state) {
              if (state.errorMessage != null) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
              }

              if (state.successMessage != null) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.successMessage!)));

                odoController.clear();

                setState(() {
                  selectedVehicle = null;
                });

                context.read<CheckinBloc>().add(const CheckinEvent.reset());

                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              if (loadingVehicle) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }
              return Scaffold(
                backgroundColor: const Color(0xfff5f6fb),
                appBar: AppBar(
                  centerTitle: true,
                  foregroundColor: Colors.white,
                  title: Text(
                    widget.logType == "IN"
                        ? "Employee Check In"
                        : "Employee Check Out",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFCC2605), Color(0xFF8B5CF6)],
                      ),
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          // Vehicle Type
                          if (widget.logType == "IN") ...[
                            if (vehicleState.isLoading)
                              const CircularProgressIndicator()
                            else
                              DropdownButtonFormField<String>(
                                value: selectedVehicle,
                                decoration: const InputDecoration(
                                  labelText: "Vehicle Type",
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.directions_car),
                                ),
                                items: vehicleState.vehicles
                                    .map(
                                      (vehicle) => DropdownMenuItem(
                                        value: vehicle,
                                        child: Text(vehicle),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedVehicle = value;

                                    if (!showOdometer) {
                                      odoController.clear();
                                    }
                                  });
                                },
                              ),

                            const SizedBox(height: 20),
                          ] else ...[
                            if (selectedVehicle == "Others")
                              DropdownButtonFormField<String>(
                                value: selectedVehicle,
                                decoration: const InputDecoration(
                                  labelText: "Vehicle Type",
                                  border: OutlineInputBorder(),
                                ),
                                items: vehicleState.vehicles
                                    .map(
                                      (vehicle) => DropdownMenuItem(
                                        value: vehicle,
                                        child: Text(vehicle),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedVehicle = value;

                                    if (!showOdometer) {
                                      odoController.clear();
                                    }
                                  });
                                },
                              )
                            else
                              TextFormField(
                                initialValue: selectedVehicle,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  labelText: "Vehicle",
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.directions_car),
                                ),
                              ),

                            const SizedBox(height: 20),
                          ],
                          const SizedBox(height: 20),

                          if (showOdometer)
                            TextField(
                              controller: odoController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: widget.logType == "IN"
                                    ? "Start Odometer"
                                    : "End Odometer",
                                border: const OutlineInputBorder(),
                                prefixIcon: const Icon(Icons.speed),
                              ),
                            ),

                          if (showOdometer) const SizedBox(height: 20),

                          // Selfie
                          GestureDetector(
                            onTap: captureSelfie,
                            child: Container(
                              height: 180,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: state.selfieImage == null
                                  ? const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.camera_alt_outlined,
                                          size: 50,
                                        ),
                                        SizedBox(height: 10),
                                        Text("Capture Selfie"),
                                      ],
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.file(
                                        File(state.selfieImage!.path),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Odometer Image
                          if (showOdometer)
                            GestureDetector(
                              onTap: captureOdometer,
                              child: Container(
                                height: 180,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: state.odometerImage == null
                                    ? const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.photo_camera_outlined,
                                            size: 50,
                                          ),
                                          SizedBox(height: 10),
                                          Text("Capture Odometer Image"),
                                        ],
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.file(
                                          File(state.odometerImage!.path),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                              ),
                            ),

                          if (showOdometer) const SizedBox(height: 30),

                          SizedBox(
                            width: double.infinity,
                            height: 55,
                            child: ElevatedButton.icon(
                              onPressed: state.isLoading
                                  ? null
                                  : () {
                                      if (widget.logType == "IN" &&
                                          selectedVehicle == null) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              "Select Vehicle Type",
                                            ),
                                          ),
                                        );
                                        return;
                                      }

                                      if (state.selfieImage == null) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text("Capture Selfie"),
                                          ),
                                        );
                                        return;
                                      }

                                      if (showOdometer &&
                                          odoController.text.trim().isEmpty) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              "Enter Odometer Value",
                                            ),
                                          ),
                                        );
                                        return;
                                      }

                                      if (showOdometer &&
                                          state.odometerImage == null) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              "Capture Odometer Image",
                                            ),
                                          ),
                                        );
                                        return;
                                      }

                                      context.read<CheckinBloc>().add(
                                        CheckinEvent.submit(
                                          logType: widget.logType,
                                          vehicleType: selectedVehicle ?? "",
                                          odometerValue: showOdometer
                                              ? odoController.text
                                              : "",
                                        ),
                                      );
                                    },
                              icon: state.isLoading
                                  ? const SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Icon(Icons.check),
                              label: Text(
                                state.isLoading
                                    ? "Submitting..."
                                    : widget.logType == "IN"
                                    ? "Check In"
                                    : "Check Out",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
