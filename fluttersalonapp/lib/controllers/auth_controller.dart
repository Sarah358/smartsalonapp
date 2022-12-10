import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttersalonapp/screens/BMWalkThroughScreen.dart';
import 'package:get/get.dart';
import 'package:fluttersalonapp/screens/BMLoginScreen.dart';
import 'package:fluttersalonapp/screens/BMDashboardScreen.dart';
import 'package:fluttersalonapp/screens/BMWalkThroughScreen.dart';





class AuthService extends GetxController {
    //AuthController.instance..
  static AuthService instance = Get.find();
  //contains email,password,name ..
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    //casting
    _user = Rx<User?>(auth.currentUser);
    //user would be notified
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      print('login page');
      Get.offAll(() => BMWalkThroughScreen());
    } else {
      print('user logged in');
      //forward to home page
      Get.offAll(() => BMDashboardScreen(flag: false,));

    }
  }
  Future<String?> registration({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    }
  }
}