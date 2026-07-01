import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loginpage/domain/checkin/checkin_hive_model.dart';
import 'package:loginpage/infrastructure/database_functions/checkin_hivehelper.dart';
import 'package:loginpage/presentation/checkin/checkin_page.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  CheckinHiveModel? checkinData;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final data = await CheckinHiveHelper.get();

    setState(() {
      checkinData = data;
      loading = false;
    });
  }

  String formatDate(String? value) {
    if (value == null || value.isEmpty) {
      return "--";
    }

    try {
      final date = DateTime.parse(value).toLocal();
      return DateFormat("dd MMM yyyy • hh:mm a").format(date);
    } catch (e) {
      return "--";
    }
  }

  @override
  Widget build(BuildContext context) {
    final checkedIn = checkinData?.isCheckedIn ?? false;

    bool completedToday = false;

    if (checkinData != null) {
      completedToday = checkinData!.completedToday;
    }

    return Scaffold(
      backgroundColor: const Color(0xfff5f6fb),

      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFCC2605), Color(0xFF8B5CF6)],
            ),
          ),
        ),
      ),

      body: loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: loadData,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        children: [
                          infoTile(
                            "Vehicle Type",
                            checkinData?.vehicleType ?? "--",
                          ),

                          const Divider(),

                          infoTile(
                            "Odometer",
                            (checkinData?.odometerValue ?? "").isNotEmpty
                                ? checkinData!.odometerValue
                                : "--",
                          ),

                          const Divider(),

                          infoTile(
                            "Status",
                            checkinData == null
                                ? "Not Checked In"
                                : checkedIn
                                ? "Checked In"
                                : "Checked Out",
                          ),

                          const Divider(),

                          infoTile(
                            "Check In",
                            formatDate(checkinData?.checkInTime),
                          ),

                          const Divider(),

                          infoTile(
                            "Check Out",
                            formatDate(checkinData?.checkOutTime),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  if (completedToday)
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Center(
                        child: Text(
                          "✅ Attendance Completed",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    )
                  else
                    SizedBox(
                      height: 55,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: checkedIn
                              ? Colors.red
                              : Colors.green,
                        ),
                        icon: Icon(
                          checkedIn ? Icons.logout : Icons.login,
                          color: Colors.white,
                        ),
                        label: Text(
                          checkedIn ? "Check Out" : "Check In",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        onPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => CheckinPage(
                                logType: checkedIn ? "OUT" : "IN",
                              ),
                            ),
                          );
                          await loadData();
                        },
                      ),
                    ),
                ],
              ),
            ),
    );
  }

  Widget infoTile(String title, String value) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(flex: 3, child: Text(value)),
      ],
    );
  }
}
