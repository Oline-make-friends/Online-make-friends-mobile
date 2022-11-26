import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:cometchat/cometchat_sdk.dart';

import 'package:flutter/material.dart';
import 'package:flutter_making_friends_app_2/models/models.dart';
import 'package:flutter_making_friends_app_2/repository/repository.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

import '../config/settings.dart';
import '../widgets/widgets.dart';

class UpdateProfileController extends GetxController {
  final GlobalKey<FormState> updateProfileFormKey = GlobalKey<FormState>();
  late TextEditingController fullnameController;
  late TextEditingController aboutController;
  late TextEditingController dobController;
  var genderValue = 'Male'.obs;
  late TextEditingController majorController;
  late TextEditingController locationController;
  var interests = <String>[].obs;
  var imgUrl = ''.obs;
  final cloudinary = CloudinaryPublic('dh2srrs6l', 'vgvnvtft', cache: false);
  var errorString = ''.obs;
  final ImagePicker _picker = ImagePicker();
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fullnameController = TextEditingController();
    aboutController = TextEditingController();
    dobController = TextEditingController();
    majorController = TextEditingController();
    locationController = TextEditingController();
  }

  @override
  void onClose() {
    fullnameController.dispose();
    aboutController.dispose();
    dobController.dispose();
    majorController.dispose();
    locationController.dispose();
    super.onClose();
  }

  Future<String?> updateImgUrlByCamera() async {
    var imageCaptured = await _picker.pickImage(source: ImageSource.camera);
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(imageCaptured!.path,
              resourceType: CloudinaryResourceType.Image));
      print(response.secureUrl);
      print(response.url);
      isLoading.value = false;
      return response.secureUrl.toString();
    } on CloudinaryException catch (e) {
      isLoading.value = false;
      print("Cloudinary Exception: ${e.message}");
    }
  }

  Future<String?> updateImgUrlByGallery() async {
    var imageCaptured = await _picker.pickImage(source: ImageSource.gallery);
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(imageCaptured!.path,
              resourceType: CloudinaryResourceType.Image));
      print(response.secureUrl);
      print(response.url);
      isLoading.value = false;
      return response.secureUrl.toString();
    } on CloudinaryException catch (e) {
      isLoading.value = false;
      print("Cloudinary Exception: ${e.message}");
    }
  }

  Future<void> updateProfile(BuildContext context, String userId) async {
    Alert.showLoadingIndicatorDialog(context);
    UserModel updateUser = UserModel(
      fullname: fullnameController.text,
      gender: genderValue.value,
      location: locationController.text,
      interests: interests.value,
      major: majorController.text,
      about: aboutController.text,
      dateOfBirth: dobController.text,
      avatarUrl: imgUrl.value,
    );
    print(updateUser.avatarUrl);
    var response = await UserRepository.updateProfile(
        'user/update/$userId', updateToJson(updateUser));
    await updateComet(updateUser, userId);
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Updated!')));
  }

  Future<void> updateComet(UserModel user, String uid) async {
    CometChat.updateUser(
      User(name: user.fullname!, avatar: user.avatarUrl!, uid: uid),
      apiKey,
      onSuccess: (message) {
        debugPrint('Update successfully: $message');
      },
      onError: (CometChatException ce) {
        debugPrint('Create user failed: ${ce.message}');
      },
    );
  }
}
