import 'package:chatter/feature/User%20Profile/ui/Widgets/custom_TextFormFieldIn_user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserProfile extends StatelessWidget {
  final String phoneNumber;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserProfile({super.key, required this.phoneNumber});
  final auth = FirebaseAuth.instance.currentUser!.uid;
  final TryphoneNumber =
      Supabase.instance.client
          .from('users')
          .select('phone_number')
          .eq('id', FirebaseAuth.instance.currentUser!.uid)
          .single();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
              labelText: TryphoneNumber.toString(),
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
      ),
    );
  }
}
