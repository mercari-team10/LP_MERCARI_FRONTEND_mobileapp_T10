import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hms_patient_frontend/infrastructure/models/patient.dart';
import 'package:hms_patient_frontend/providers/auth/auth_cubit.dart';
import 'package:hms_patient_frontend/routes/routes.dart';
import 'package:hms_patient_frontend/ui/widgets/drawer_tile.dart';
import '../../theme/colors.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     CircleAvatar(
                      child: Text(
												context.read<Patient>().name[0],
                          style: const TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold)),
                      radius: 30,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      context.read<Patient>().name,
                      style: TextStyle(
                          color: CustomColors(context).textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 40),
                    ),
                  ],
                ),
              )),
          const ProfileBody()
        ],
      ),
    )
        );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const Padding(
        // 	padding: EdgeInsets.only(top: 16.0),
        // 	child: UserCard(),
        // ),
        DrawerTile(
          title: 'Reports',
          icon: Icons.assignment_outlined,
          onTap: () => context.router.push(const ReportsRoute()),
        ),
        DrawerTile(
            title: 'Bills',
            icon: Icons.business_outlined,
            onTap: () {
              // getIt<ApiCubit>().getBills(nhid: nhid)
            }
            // => context.router.push(const BillsRoute()),
            ),
        DrawerTile(title: 'About Us', onTap: () {}, icon: Icons.info_outline),

        DrawerTile(
          title: 'Logout',
          icon: AntDesign.logout,
          onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Row(
                      children: const [
                        Icon(
                          Icons.warning,
                          color: Colors.red,
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Confirm logout?",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    actions: [
                      RaisedButton(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Dismiss"),
                      ),
                      const SizedBox(width: 4),
                      FlatButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          // UserModel data = userData.toMap()[0];
                          // subscribeUnsubsTopic([], data.prefs??[]);
                          await context.read<AuthCubit>().signOut();
                          context.read<AuthCubit>().authCheckRequested();
                        },
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: const Text("Logout"),
                      ),
                    ],
                  )),
        )
      ],
    );
  }
}
