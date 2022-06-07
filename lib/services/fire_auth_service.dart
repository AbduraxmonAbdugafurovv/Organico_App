import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:organico/core/init/service/navigation_service.dart';

class FirebaseAuthService {
  static final auth = FirebaseAuth.instance;
  static String verificationID = "";

  //todo Sign In with Phone number
  static loginWithPhone(String phoneNumber) async {
    auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) async {
            if (value.user != null) {
              print("User already logged in");
            }
          });
        },
        verificationFailed: (FirebaseException e) {
          debugPrint(e.message);
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationID = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  //todo Verify OTP
  static Future<bool> verifyOTP(String sentCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationID, smsCode: sentCode);
      await auth.signInWithCredential(credential);
      debugPrint("Sucsesfully sign up");
      return true;
    } catch (e) {
      debugPrint("Error while SMS ${Exception(e)}");
      return false;
    }
  }

  //todo Sign In width Email
  static Future<bool> signInWithEmail(String email, String password) async {
    try {
      auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      debugPrint(Exception(e).toString());
      return false;
    }
  }

  static Future<bool> createEmailAndPassword(
      String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }

  static logAut(BuildContext context) async {
    await FirebaseAuthService.auth.currentUser!.delete();
    NavigationService.instance.pushnamedRemuveUntill("sign_up");
  }
}