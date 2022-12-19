import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/controllers/controllers.dart';
import 'package:flutter_making_friends_app_2/widgets/alert.dart';
import 'package:flutter_making_friends_app_2/widgets/custom_text_form_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Change password',
          style: Theme.of(context).textTheme.headline4,
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
        ),
      ),
      body: Form(
        key: userController.updatePasswordFormKey,
        autovalidateMode: AutovalidateMode.always,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                controller: userController.currentPasswordController,
                validator: (value) {
                  userController.validatecurrentPassword(value!);
                },
                onSaved: (value) {
                  userController.currentPassword = value!;
                },
                labelText: 'Current password',
              ),
              const SizedBox(height: 10),
              Obx(() {
                return CustomTextFormField(
                  controller: userController.newPasswordController,
                  validator: (value) {
                    userController.validatePassword(value!);
                  },
                  onSaved: (value) {
                    userController.newPassword = value!;
                  },
                  isObscure: userController.isHidden.value ? true : false,
                  labelText: 'New password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      userController.isHidden.value =
                          !userController.isHidden.value;
                    },
                    icon: userController.isHidden.value
                        ? FaIcon(FontAwesomeIcons.eye)
                        : FaIcon(FontAwesomeIcons.eyeSlash),
                  ),
                );
              }),
              const SizedBox(height: 10),
              CustomTextFormField(
                controller: userController.retypeNewPasswordController,
                validator: (value) {
                  userController.validateRetpyePassword(value!);
                },
                onSaved: (value) {
                  userController.retypePassword = value!;
                },
                labelText: 'Retype password',
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                ),
                onPressed: () async {
                  Alert.showLoadingIndicatorDialog(context);
                  Get.back();
                  await userController.updatePassword(context);
                },
                child: const Text('Update password'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
