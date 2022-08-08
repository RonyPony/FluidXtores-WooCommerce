import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

T getProvider<T>({bool listen = false, BuildContext? context}) {
  final ctx = context ?? Get.context;
  return Provider.of<T>(ctx!, listen: listen);
}