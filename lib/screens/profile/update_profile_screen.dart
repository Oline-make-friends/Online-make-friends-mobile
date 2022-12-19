import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/controllers/update_profile_controller.dart';
import 'package:flutter_making_friends_app_2/models/user_model.dart';
import 'package:flutter_making_friends_app_2/screens/bottom_navigaion/bottom_navigation_screen.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_dob_picker.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_text_form_field.dart';
import 'package:flutter_making_friends_app_2/widgets/gender_drop_down.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final updateController = Get.put(UpdateProfileController());
    final loginController = Get.put(LoginController());
    // UserModel currentUser = Get.arguments;
    updateController.interests.value =
        loginController.loginedUser.value.interests!;
    final addInterestController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Update profile',
            style: Theme.of(context).textTheme.headline5),
        elevation: 0,
        leading: updateController.statusIsBlank.value == false
            ? IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).primaryColor,
                ),
              )
            : Container(),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              //!image picker
              Center(child: Obx(
                () {
                  return Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: updateController.imgUrl == ''
                            ? NetworkImage(
                                loginController.loginedUser.value.avatarUrl!)
                            : NetworkImage(updateController.imgUrl.value),
                      ),
                    ),
                  );
                },
              )),
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Theme.of(context).primaryColor),
                    onPressed: () async {
                      await updateController.updateImgUrlByCamera().then((img) {
                        if (img == null) {
                          updateController.imgUrl.value =
                              loginController.loginedUser.value.avatarUrl!;
                        } else {
                          updateController.imgUrl.value = img;
                        }
                      });
                      // updateController.imgUrl = result;
                    },
                    child: Text('Take a photo'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Theme.of(context).primaryColor),
                    onPressed: () async {
                      await updateController
                          .updateImgUrlByGallery()
                          .then((img) {
                        if (img == null) {
                          updateController.imgUrl.value =
                              loginController.loginedUser.value.avatarUrl!;
                        } else {
                          updateController.imgUrl.value = img;
                        }
                      });
                      // updateController.imgUrl = result;
                    },
                    child: Text('Pick from gallery'),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              //!fullname
              // TextField(
              //   decoration: InputDecoration(labelText: 'fullname'),
              //   controller: updateController.fullnameController =
              //       TextEditingController(text: currentUser.fullname),
              // ),

              CustomTextFormField(
                labelText: 'Fullname',
                controller: updateController.fullnameController =
                    TextEditingController(
                        text: loginController.loginedUser.value.fullname),
              ),
              const SizedBox(height: 10),

              //!about
              TextField(
                decoration: InputDecoration(
                  labelText: 'about',
                  filled: true,
                  fillColor: Colors.white54,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Theme.of(context).primaryColor.withAlpha(90),
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                ),
                controller: updateController.aboutController =
                    TextEditingController(
                        text: loginController.loginedUser.value.about),
                minLines: 1,
                maxLines: 5,
              ),
              // const SizedBox(height: 10),

              // CustomTextFormField(
              //   labelText: 'About',
              //   controller: updateController.aboutController =
              //       TextEditingController(text: currentUser.about),

              // ),
              // TextFormField(
              //   controller: updateController.aboutController =
              //       TextEditingController(text: currentUser.about),
              //   decoration: InputDecoration(),
              // ),
              // const SizedBox(height: 10),
              //!gender and dob
              Obx(
                () {
                  return CustomGenderDropDown(
                    value: updateController.genderValue.value,
                    onChanged: (value) {
                      updateController.genderValue.value = value.toString();
                    },
                  );
                },
              ),
              // const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: CustomDoBPicker(
                    controller: updateController.dobController =
                        TextEditingController(
                            text:
                                loginController.loginedUser.value.dateOfBirth),
                    onConfirm: (date) {
                      print(date);
                      updateController.dobController.text =
                          '${date.day}-${date.month}-${date.year}';
                    }),
              ),
              const SizedBox(height: 10),

              //!major
              // TextField(
              //   decoration: InputDecoration(labelText: 'Major'),
              //   controller: updateController.majorController =
              //       TextEditingController(text: currentUser.major),
              // ),

              CustomTextFormField(
                labelText: 'Major',
                controller: updateController.majorController =
                    TextEditingController(
                        text: loginController.loginedUser.value.major),
              ),

              //!location
              const SizedBox(height: 10),
              // TextField(
              //   decoration: InputDecoration(labelText: 'Location'),
              //   controller: updateController.locationController =
              //       TextEditingController(text: currentUser.location),
              // ),

              CustomTextFormField(
                labelText: 'Location',
                controller: updateController.locationController =
                    TextEditingController(
                        text: loginController.loginedUser.value.location),
              ),
              const SizedBox(height: 10),

              //!interests
              Row(
                children: [
                  Text('Interests',
                      style: Theme.of(context).textTheme.headline3),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.all(10),
                              height: 130,
                              child: Column(
                                children: [
                                  CustomTextFormField(
                                    hintTxt: 'Add interest',
                                    controller: addInterestController,
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (addInterestController.text ==
                                              '') {
                                            Navigator.of(context).pop();
                                          } else {
                                            updateController.interests.add(
                                                addInterestController.text);
                                            addInterestController.text = '';
                                            Get.back();
                                          }
                                        },
                                        child: const Text('Add'),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.add_circle_outline_sharp,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
              Obx(
                () {
                  return Wrap(
                    children: updateController.interests
                        .map(
                          (interest) => Container(
                            height: 50,
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.only(right: 5, top: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).primaryColor,
                                  Theme.of(context).accentColor,
                                ],
                              ),
                            ),
                            child: TextButton.icon(
                              onPressed: () {
                                updateController.interests.remove(interest);
                              },
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              label: Text(
                                interest,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
              const SizedBox(height: 40),

              //!action buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor),
                    onPressed: () async {
                      if (updateController.statusIsBlank.value == false) {
                        await updateController.updateProfile(
                            context, loginController.loginedUser.value.id!);
                        await loginController.findLoginUserById(
                            userId: loginController.loginedUser.value.id!);
                        Get.back();
                      } else {
                        await updateController.updateProfile(
                            context, loginController.loginedUser.value.id!);
                        await loginController.findLoginUserById(
                            userId: loginController.loginedUser.value.id!);
                        updateController.statusIsBlank.value = false;
                        Get.offAll(BottomNavScreen());
                      }
                    },
                    icon: Icon(Icons.check),
                    label: const Text('Confirm'),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.cancel),
                    label: const Text('Cancel'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
