import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:vou_user/constant/useful_function.dart';
import 'package:vou_user/di/service_locator.dart';
import 'package:vou_user/presentation/profile/stores/profile_store.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileStore profileStore = getIt<ProfileStore>();

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{

      await profileStore.getProfile();
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    // WidgetsBinding.instance.addPostFrameCallback((_) async{
    //   await profileStore.getProfile();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context){
      return profileStore.isLoading?
      UsefulFunction.buildProgressIndicator() :
        Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profileStore.profile.avatar??""),
            ),
            const SizedBox(height: 16),

            // Username
            Text(
              profileStore.profile.name??"",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Phone number
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.phone, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  profileStore.profile.phone??"",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Gender
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person, color: Colors.purple),
                const SizedBox(width: 8),
                Text(
                  profileStore.profile.gender! ? 'Male' : 'Female',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Birthday
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.cake, color: Colors.pink),
                const SizedBox(width: 8),
                Text(
                  DateFormat('dd/MM/yyyy').format(profileStore.profile.dob??DateTime.now()), // Chuỗi ngày sinh
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Facebook URL (optional)
            if (profileStore.profile.facebook != null &&
                profileStore.profile.facebook!.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.link, color: Colors.green),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      // Action khi bấm vào URL
                    },
                    child: Text(
                      profileStore.profile.facebook!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

          ],
        ),
      );
    });
  }
}
