import 'package:amun/core/extensions/context_extention.dart';
import 'package:amun/features/auth/presentation/pages/select_auth.dart';
import 'package:amun/features/profile/presentation/navigation/auth_navigation.dart';
import 'package:flutter/cupertino.dart';

import '../../../Flight/presentation/pages/aire.dart';

class AuthNavigationImpl implements AuthNavigation{
  final BuildContext context;
  AuthNavigationImpl(this.context);
  @override
  void goToFlights() {
    context.pushNamed(FlightScreen.routeName);
  }

  @override
  void logout() {
    context.pushReplacementNamed(SelectAuthScreen.routeName);
  }

}