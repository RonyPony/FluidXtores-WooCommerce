import 'dart:io';

import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUtil {
  static void getImage(BuildContext context, Function(File) callback) {
    showAdaptiveActionSheet(
      context: context,
      actions: [
        BottomSheetAction(
            title: 'camera',
            onPressed: () async {
              final image = await _getImage(ImageSource.camera);
              Navigator.of(context).pop();
              callback(image);
            }),
        BottomSheetAction(
            title: 'photoLibrary',
            onPressed: () async {
              final image = await _getImage(ImageSource.gallery);
              Navigator.of(context).pop();
              callback(image);
            }),
      ],
      cancelAction: CancelAction(
        title: 'cancel',
      ),
    );
  }

  static Future<File> _getImage(ImageSource source) async {
    PickedFile pickedFile =
        await ImagePicker().getImage(source: source, imageQuality: 50);
    File image = File(pickedFile.path);
    if (image != null) return image;
    return null;
  }
}
