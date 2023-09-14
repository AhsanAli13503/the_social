import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:super_booking_consumer/core/network_calls/dio_wrapper/index.dart';
import 'package:super_booking_consumer/core/utils/utitily_methods/utils.dart';

abstract class LocalImagePicker {
  /// This method returns the image path picked from gallery
  /// Output : if operation successful returns [String] tells image is picked successfully
  Future<String> getImageFromGallery();

  /// This method returns the image path picked from gallery
  /// Input: [GetImageFromCameraParams] contains camera preference which is rear or front cameras.
  /// Output : if operation successful returns [String] tells image is picked successfully
  Future<String> getImageFromCamera(CameraDevice cameraDevice);
}

@LazySingleton(as: LocalImagePicker)
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
    throw UnableToPickImage();
  }

  @override
  Future<String> getImageFromGallery() async {
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (image!.path.endsWith('png') || image.path.endsWith('jpg') || image.path.endsWith('jpeg')) {
      final fileSizeInBytes = await Utility.getFileSize(image.path);
      final fileSizeInKB = fileSizeInBytes / 1000;
      final fileSizeInMB = fileSizeInKB / 1000;

      if (fileSizeInMB > 5) {
        throw const FileTooBigFailure('file_too_big');
      }

      return image.path;
    }

    throw const InvalidFileFormat('invalid_file_format');
  }
}
