//
// Generated file. Do not edit.
//

// ignore: unused_import
import 'dart:ui';

import 'package:cloud_functions_web/cloud_functions_web.dart';
import 'package:firebase_core_web/firebase_core_web.dart';

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins(PluginRegistry registry) {
  CloudFunctionsWeb.registerWith(registry.registrarFor(CloudFunctionsWeb));
  FirebaseCoreWeb.registerWith(registry.registrarFor(FirebaseCoreWeb));
  registry.registerMessageHandler();
}
