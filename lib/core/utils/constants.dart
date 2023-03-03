import 'package:androidrouting/app/routes/screens/not_found_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes{
  static const root = '/';
  static const homeNamedPage = '/home';
  static const homeDetailsNamedPage = 'details';
  static const profileNamedPage = '/profile';
  static const profileDetailsNamedPage = 'details';
  static const settingsNamedPage = '/settings';
  //static profileNamedPage([String? name]) => '/${name ?? ':profile'}';
  static Widget errorWidget(BuildContext context, GoRouterState state) => const NotFoundScreen();


}


