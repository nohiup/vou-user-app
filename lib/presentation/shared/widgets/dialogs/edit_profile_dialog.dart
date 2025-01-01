import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vou_user/di/service_locator.dart';
import 'package:vou_user/domain/entity/profile_model.dart';
import 'package:vou_user/presentation/profile/stores/profile_store.dart';

class EditProfileDialog extends StatefulWidget {
  final Profile profile;

  const EditProfileDialog({
    super.key, required this.profile,
  });

  @override
  _EditProfileDialogState createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  late TextEditingController usernameController;
  late TextEditingController phoneController;
  late TextEditingController facebookUrlController;
  late bool isMale;
  late DateTime selectedBirthday;

  final ProfileStore profileStore = getIt<ProfileStore>();

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController(text: widget.profile.username);
    phoneController = TextEditingController(text: widget.profile.phone);
    facebookUrlController = TextEditingController(text: widget.profile.facebookUrl ?? "");
    isMale = widget.profile.isMale;
    selectedBirthday = widget.profile.birthday;
  }

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    facebookUrlController.dispose();
    super.dispose();
  }

  Future<void> _selectBirthday(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedBirthday,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedBirthday) {
      setState(() {
        selectedBirthday = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Profile"),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Username
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),

            // Phone
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: "Phone"),
              keyboardType: TextInputType.phone,
            ),

            // Gender
            Row(
              children: [
                const Text("Gender: "),
                Row(
                  children: [
                    Radio<bool>(
                      value: true,
                      groupValue: isMale,
                      onChanged: (value) {
                        setState(() {
                          isMale = value!;
                        });
                      },
                    ),
                    const Text("Male"),
                  ],
                ),
                Row(
                  children: [
                    Radio<bool>(
                      value: false,
                      groupValue: isMale,
                      onChanged: (value) {
                        setState(() {
                          isMale = value!;
                        });
                      },
                    ),
                    const Text("Female"),
                  ],
                ),
              ],
            ),

            // Birthday
            Row(
              children: [
                const Text("Birthday: "),
                Text(DateFormat('dd/MM/yyyy').format(selectedBirthday)),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectBirthday(context),
                ),
              ],
            ),

            // Facebook URL
            TextField(
              controller: facebookUrlController,
              decoration: const InputDecoration(
                labelText: "Facebook URL (Optional)",
              ),
              keyboardType: TextInputType.url,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),

        ElevatedButton(
          onPressed: () async {
            Navigator.of(context).pop();
            Profile newProfile = Profile(
                id:  widget.profile.id,
                username: usernameController.text,
                avatarUrl: widget.profile.avatarUrl,
                email: widget.profile.email,
                phone: phoneController.text,
                isMale: isMale,
                birthday: selectedBirthday,
                facebookUrl: facebookUrlController.text);
            await profileStore.updateProfile(newProfile);
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}
