// ignore_for_file: prefer_const_constructors

import 'package:sa3ada_app/ui/screens/expenses/expenses_screen.dart';
import 'package:sa3ada_app/ui/screens/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/ui/screens/login/login_screen.dart';
import 'package:sa3ada_app/ui/screens/traders/traders_screen.dart';
import 'package:sa3ada_app/ui/screens/transfer_deposit/transfer_deposit_screen.dart';
import 'package:sa3ada_app/utils/services/firebase.dart';

class AppRoutes {
  static String initialRoute =
      FirebaseService.firebaseAuth.currentUser == null ? "/login" : "/home";

  static List<GetPage> routes = [
    GetPage(name: "/login", page: () => LoginScreen()),
    GetPage(name: "/home", page: () => HomeScreen()),
    GetPage(name: "/traders", page: () => TradersScreen()),
    GetPage(
        name: "/actions/transfer-deposit", page: () => TransferDepositScreen()),
    GetPage(name: "/actions/expenses", page: () => ExpensesScreen()),
  ];
}
