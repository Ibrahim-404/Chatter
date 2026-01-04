// ignore: file_names
import 'package:chatter/feature/User%20Profile/ui/Widgets/custom_text_form_field_user_profile.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  final String phoneNumber;

  const UserProfile({super.key, required this.phoneNumber});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController bioController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/profile_picture.png'),
          ),
          SizedBox(height: 20),
          CustomTextFormFieldInUserProfile(
            labelText: 'Name',
            controller: nameController,
            isnum: false,
          ),
          SizedBox(height: 20),
          CustomTextFormFieldInUserProfile(
            labelText: 'Bio',
            controller: bioController,
            isnum: false,
          ),
          CustomTextFormFieldInUserProfile(
            labelText: widget.phoneNumber,
            controller: null,
            isnum: true,
          ),

          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Process data
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
