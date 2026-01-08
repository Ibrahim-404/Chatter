// ignore: file_names
import 'package:chatter/feature/User%20Profile/domain/enums/image_source_type.dart';
import 'package:chatter/feature/User%20Profile/presentation/controllers/profile_picture_bloc/bloc/profile_picture_bloc.dart';
import 'package:chatter/feature/User%20Profile/ui/Widgets/custom_text_form_field_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  // late String changeablePirctureUserProfile;
  late ValueNotifier<String> profilePictureNotifier;

  @override
  void initState() {
    profilePictureNotifier = ValueNotifier<String>(
      'assets/anonymous_male_user.png',
    );
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    bioController.dispose();
    profilePictureNotifier.dispose();
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
          BlocConsumer<ProfilePictureBloc, ProfilePictureState>(
            listener: (context, state) {
              if (state is DefaultProfilePictureFemale) {
                profilePictureNotifier.value = state.imageProfile;
              } else if (state is DefaultProfilePictureMale) {
                profilePictureNotifier.value = state.imageProfile;
              }
            },
            builder: (context, state) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  ValueListenableBuilder(
                    valueListenable: profilePictureNotifier,
                    builder: (context, value, child) {
                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: CircleAvatar(
                          key: ValueKey(value),
                          radius: 50,
                          backgroundImage: AssetImage(value),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.green,
                      child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            
                            builder: (context) {
                              return Container(
                                height: 120,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Icon(Icons.camera),
                                      title: Text('Take Photo'),
                                      onTap: () {
                                        context.read<ProfilePictureBloc>().add(
                                          SelectProfilePictureEvent(
                                            userid: 'userId',
                                            source: ImageSourceType.camera,
                                          ),
                                        );
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.photo_library),
                                      title: Text('Choose from Gallery'),
                                      onTap: () {
                                        context.read<ProfilePictureBloc>().add(
                                          SelectProfilePictureEvent(
                                            userid: 'userId',
                                            source: ImageSourceType.gallery,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.add_a_photo, size: 15),
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 20),
          CustomTextFormFieldInUserProfile(
            labelText: 'Name',
            controller: nameController,
            isnum: false,
          ),

          Card(
            child: DropdownButton<String>(
              // borderRadius: BorderRadius.circular(10),
              items: [
                DropdownMenuItem(value: 'Male', child: Text('Male')),
                DropdownMenuItem(value: 'Female', child: Text('Female')),
              ],

              onChanged: (value) {
                context.read<ProfilePictureBloc>().add(
                  DefaultProfilePictureEvent(genderValue: value!),
                );
              },
            ),
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
