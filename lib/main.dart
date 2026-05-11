import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO: await Supabase.initialize(...) and Firebase.initializeApp()
  runApp(const ProviderScope(child: LumoApp()));
}
