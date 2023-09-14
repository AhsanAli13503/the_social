import 'dart:io';

import 'package:permission_handler/permission_handler.dart';
import 'package:socially/permissions/permission_service.dart';

enum CustomPermission { camera, mediaLibrary, storage }

abstract class PermissionEngineGetter {
  // this is method is used to check permission
  Future<bool> hasPermission(CustomPermission permission);
}

abstract class PermissionEngineResolver {
  // this is method is used to resolve permission
  Future<bool> resolvePermission(CustomPermission permission);
}

abstract class PermissionEngine implements PermissionEngineGetter, PermissionEngineResolver {}

class PermissionEngineImp implements PermissionEngine {
  PermissionService permissionsService;

  PermissionEngineImp(this.permissionsService);

  @override
  Future<bool> resolvePermission(CustomPermission permission) async {
    switch (permission) {
      case CustomPermission.camera:
        var permissionStatus = await permissionsService.status(Permission.camera);
        await handlerPermissionStatus(customPermission: permission, permissionStatus: permissionStatus);
        var afterPermissionStatus = await permissionsService.status(Permission.camera);
        if (afterPermissionStatus.isPermanentlyDenied || afterPermissionStatus.isDenied) {
          return false;
        }
        return afterPermissionStatus.isGranted;
      case CustomPermission.mediaLibrary:
        var permissionStatus = await permissionsService.status(Permission.mediaLibrary);
        await handlerPermissionStatus(customPermission: permission, permissionStatus: permissionStatus);
        var afterPermissionStatus = await permissionsService.status(Permission.mediaLibrary);
        if (afterPermissionStatus.isPermanentlyDenied || afterPermissionStatus.isDenied) {
          return false;
        }
        return afterPermissionStatus.isGranted;
      case CustomPermission.storage:
        var permissionStatus = await permissionsService.status(Permission.storage);
        await handlerPermissionStatus(customPermission: permission, permissionStatus: permissionStatus);
        var afterPermissionStatus = await permissionsService.status(Permission.storage);
        if (afterPermissionStatus.isPermanentlyDenied || afterPermissionStatus.isDenied) {
          return false;
        }
        return afterPermissionStatus.isGranted;
    }
  }

  @override
  Future<bool> hasPermission(CustomPermission permission) async {
    switch (permission) {
      case CustomPermission.camera:
        var permissionStatus = await permissionsService.status(Permission.camera);
        return permissionStatus.isGranted;
      case CustomPermission.storage:
        var permissionStatus = await permissionsService.status(Permission.storage);
        return permissionStatus.isGranted;
      case CustomPermission.mediaLibrary:
        var permissionStatus = await permissionsService.status(Permission.mediaLibrary);
        return permissionStatus.isGranted;
    }
  }

  Future<bool> handlerPermissionStatus({required CustomPermission customPermission, required PermissionStatus permissionStatus}) async {
    if (permissionStatus.isGranted) {
      return true;
    }

    if (permissionStatus.isDenied) {
      // You can only get permanently denied on android after calling
      var permissionStatus = await requestPermission(customPermission);
      if (permissionStatus == PermissionStatus.permanentlyDenied && Platform.isAndroid) {
        await permissionsService.openAppSettings();
      }
      return false;
    }

    if (permissionStatus.isLimited) {
      await permissionsService.openAppSettings();
      return false;
    }

    if (permissionStatus.isPermanentlyDenied) {
      await permissionsService.openAppSettings();
      return false;
    }

    return false;
  }

  Future<PermissionStatus> requestPermission(CustomPermission permission) async {
    switch (permission) {
      case CustomPermission.camera:
        return await Permission.camera.request();

      case CustomPermission.mediaLibrary:
        return await Permission.photos.request();

      default:
        return PermissionStatus.denied;
    }
  }
}
