import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class LocalImagePicker {
  /// This method returns the image path picked from gallery
  /// Output : if operation successful returns [String] tells image is picked successfully
  Future<String> getImageFromGallery();

  /// This method returns the image path picked from gallery
  /// Input: [GetImageFromCameraParams] contains camera preference which is rear or front cameras.
  /// Output : if operation successful returns [String] tells image is picked successfully
  Future<String> getImageFromCamera(CameraDevice cameraDevice);
}

class LocalImagePickerImpl implements LocalImagePicker {
  final ImagePicker imagePicker;

  LocalImagePickerImpl({required this.imagePicker});

  @override
  Future<String> getImageFromCamera(CameraDevice cameraDevice) async {
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: cameraDevice,
    );
    if (image != null) {
      return image.path;
    }
    throw Exception();
  }

  @override
  Future<String> getImageFromGallery() async {
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image!.path.endsWith('png') || image.path.endsWith('jpg') || image.path.endsWith('jpeg')) {
      final fileSizeInBytes = await getFileSize(image.path);
      final fileSizeInKB = fileSizeInBytes / 1000;
      final fileSizeInMB = fileSizeInKB / 1000;

      if (fileSizeInMB > 5) {
        throw Exception('file_too_big');
      }

      return image.path;
    }

    throw Exception('invalid_file_format');
  }

  Future<int> getFileSize(String path) async {
    final fileBytes = await File(path).readAsBytes();

    return fileBytes.lengthInBytes;
  }
}
