import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:image_picker/image_picker.dart';

class UpdateImage {
  final ImagePicker _picker = ImagePicker();
  final cloudinary = CloudinaryPublic('dh2srrs6l', 'vgvnvtft', cache: false);

  Future<String?> updateImgUrlByCamera() async {
    var imageCaptured = await _picker.pickImage(source: ImageSource.camera);
    try {
      CloudinaryResponse response = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(imageCaptured!.path,
              resourceType: CloudinaryResourceType.Image));
      print(response.secureUrl);
      print(response.url);
      return response.secureUrl.toString();
    } on CloudinaryException catch (e) {
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
      return response.secureUrl.toString();
    } on CloudinaryException catch (e) {
      print("Cloudinary Exception: ${e.message}");
    }
  }
}
