import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginpage/domain/user_details/user_detail_item.dart';
import 'package:loginpage/domain/user_details/user_model.dart';
import 'package:loginpage/application/auth/auth_bloc.dart';
import 'package:loginpage/infrastructure/api_services/authservice.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final AuthRepository repository = AuthRepository();

  UserDataModel? user;

  final List<IconData> icons = [
    Icons.person_outline,
    Icons.work_outline,
    Icons.apartment_outlined,
    Icons.phone_outlined,
    Icons.person_add_alt_outlined,
    Icons.public,
    Icons.currency_rupee,
  ];

  final List<Color> colors = [
    Colors.blue,
    Colors.deepPurple,
    Colors.teal,
    Colors.orange,
    Colors.pink,
    Colors.lightBlue,
    Colors.amber,
  ];

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final data = await repository.getUserDetails();

    setState(() {
      user = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    final List<UserDetailItem> userDetails = user!.details;

    return Scaffold(
      backgroundColor: const Color(0xfff5f6fb),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 55,
              left: 16,
              right: 16,
              bottom: 25,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 204, 38, 5), Color(0xff8B5CF6)],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            child: Row(
              children: [
                const Spacer(),
                const Text(
                  "User Details",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: Colors.white54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      const AuthEvent.logoutPressed(),
                    );
                  },
                  icon: const Icon(Icons.logout, size: 18),
                  label: const Text("Logout"),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(14),
              itemCount: userDetails.length,
              itemBuilder: (context, index) {
                final item = userDetails[index];
                final color = colors[index % colors.length];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(.08),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        decoration: BoxDecoration(
                          color: color.withOpacity(.12),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(icons[index], color: color, size: 28),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Color.fromARGB(255, 112, 111, 111),
                                // color: Colors.grey.shade700,
                                // fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              item.value,
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                 color: Color.fromARGB(255, 105, 111, 223),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
