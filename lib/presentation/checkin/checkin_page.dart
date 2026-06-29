import 'dart:developer';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginpage/application/checkin/checkin_bloc.dart';
import 'package:loginpage/presentation/checkin/camera_page.dart';

class CheckinPage extends StatefulWidget {
  const CheckinPage({super.key});

  @override
  State<CheckinPage> createState() => _CheckinPageState();
}

class _CheckinPageState extends State<CheckinPage> {
  final TextEditingController odoController = TextEditingController();

  String loginType = "IN";

  @override
  void dispose() {
    odoController.dispose();
    super.dispose();
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
            loginType = "IN";
          });

          context.read<CheckinBloc>().add(const CheckinEvent.reset());

          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xfff5f6fb),
          appBar: AppBar(
            centerTitle: true,
            foregroundColor: Colors.white,
            title: const Text(
              "Employee Check In",
              style: TextStyle(fontWeight: FontWeight.bold),
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
                    DropdownButtonFormField<String>(
                      initialValue: loginType,
                      decoration: const InputDecoration(
                        labelText: "Login Type",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.login),
                      ),
                      items: const [
                        DropdownMenuItem(value: "IN", child: Text("In")),
                        DropdownMenuItem(value: "OUT", child: Text("Out")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          loginType = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    TextField(
                      controller: odoController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Odometer Value",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.speed),
                      ),
                    ),

                    const SizedBox(height: 25),

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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.camera_alt_outlined, size: 50),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.photo_camera_outlined, size: 50),
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

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton.icon(
                        onPressed: state.isLoading
                            ? null
                            : () {
                                if (odoController.text.trim().isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Enter odometer value"),
                                    ),
                                  );
                                  return;
                                }

                                if (state.selfieImage == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Capture selfie"),
                                    ),
                                  );
                                  return;
                                }

                                if (state.odometerImage == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("Capture odometer image"),
                                    ),
                                  );
                                  return;
                                }

                                log("UI Login Type: $loginType");

                                context.read<CheckinBloc>().add(
                                  CheckinEvent.submit(
                                    logType: loginType,
                                    odometerValue: odoController.text,
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
                          state.isLoading ? "Submitting..." : "Submit",
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
  }
}
