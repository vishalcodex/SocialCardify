import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:get/get.dart';

import '../../../../common/color_pallete.dart';
import '../../../models/api_response.dart';
import '../../../models/user_model.dart';
import '../../../repositories/user_repository.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import '../../../../../../../common/transalations/translation_keys.dart'
    as translations;

class AuthController extends GetxController {
  Rx<User> user = User().obs;
  late UserRepository _userRepository;
  RxBool isLoading = false.obs;
  // RxBool isLogin = true.obs;
  RxBool showPassword = false.obs;

  RxBool isError = false.obs;
  RxBool isVisible = false.obs;
  RxString errorMessage = "".obs;
  RxBool agreeTermsNConditions = false.obs;

  AuthController() {
    _userRepository = UserRepository();
  }

  Map creds = {
    // "email": "karomhatre@gmail.com",
    // "phone": "9969383542",
  };
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future signIn({bool? toRsd}) async {
    isLoading.value = true;
    errorMessage.value = creds["email"] == "" || creds["email"] == null
        ? translations.emailIsEmpty.tr
        : creds["password"] == "" || creds["password"] == null
            ? translations.passwordIsEmpty.tr
            : "";
    if (errorMessage.value != "") {
      isLoading.value = false;
      return;
    }
    _userRepository.login(
        {"email": creds["email"], "password": creds["password"]}).then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        Get.showSnackbar(
          GetSnackBar(
            duration: const Duration(seconds: 2),
            message: translations.successfulLoginMsg.tr,
          ),
        );
        Get.find<AuthService>().saveUser(value.data).then((value) {
          Future.delayed(const Duration(seconds: 2), () {
            Get.offAllNamed(
              Routes.HOME,
              predicate: (route) => Get.currentRoute == "/home",
            );
          });
        });
      } else {
        errorMessage.value = value.message ?? translations.invalidCreds.tr;
      }
    });
  }

  Future register() async {
    isLoading.value = true;

    errorMessage.value = creds["name"] == "" || creds["name"] == null
        ? "Name should not be Empty"
        : creds["email"] == "" || creds["email"] == null
            ? translations.emailIsEmpty.tr
            : creds["password"] == "" || creds["password"] == null
                ? translations.passwordIsEmpty.tr
                : creds["username"] == "" || creds["username"] == null
                    ? "Username should not be empty"
                    : "";
    if (errorMessage.value != "") {
      isLoading.value = false;
      return;
    }

    errorMessage.value = "";
    _userRepository.register({
      "name": creds["name"],
      "phone_number": user.value.phoneNumber,
      "email": creds["email"],
      "password": creds["password"],
      "username": creds["username"],
      "referred_by": creds["referred_by"],
    }).then((value) {
      isLoading.value = false;
      if (value.status == Status.COMPLETED) {
        Get.showSnackbar(
          GetSnackBar(
            duration: const Duration(seconds: 5),
            message: translations.registeredSuccessfully.tr,
          ),
        );
        Get.find<AuthService>().saveUser(value.data).then((value) {
          Future.delayed(const Duration(seconds: 2), () {
            Get.offAllNamed(Routes.HOME);
          });
        });
      } else {
        errorMessage.value =
            value.message ?? translations.errorUpdatingDetails.tr;
      }
    });
  }

  void forgotPassword() async {
    if (creds["email"] != null &&
        creds["email"] != "" &&
        creds["number"] != null &&
        creds["number"] != "") {
      isLoading.value = true;
      await _userRepository.forgotPassword({
        "email": creds["email"],
        "phone_number": creds["number"],
      }).then((value) {
        isLoading.value = false;
        if (value.status == Status.COMPLETED) {
          Get.showSnackbar(GetSnackBar(
            duration: const Duration(seconds: 3),
            message: value.data["message"],
          ));
          Future.delayed(const Duration(seconds: 5), () {
            Get.back();
          });
        } else {
          Get.showSnackbar(GetSnackBar(
            duration: const Duration(seconds: 3),
            message: value.message,
          ));
        }
      });
    } else {
      Get.showSnackbar(const GetSnackBar(
        duration: Duration(seconds: 3),
        message: "Invalid Email",
      ));
    }
  }

  String verifyId = "";
  void sendOTP() async {
    if (user.value.phoneNumber == null ||
        user.value.phoneNumber!.length != 10) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: ColorPallete.red,
        duration: const Duration(seconds: 3),
        message: translations.invalidPhoneNumber.tr,
      ));
    } else {
      // Future.delayed(const Duration(seconds: 1), () {
      //   Get.showSnackbar(const GetSnackBar(
      //     backgroundColor: ColorPallete.primary,
      //     duration: Duration(seconds: 3),
      //     message: "Your OTP is 123456",
      //   ));
      // });
      // Get.toNamed(Routes.OTP_VERIFY);
      isLoading.value = true;
      await fb.FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${user.value.phoneNumber}",
        verificationCompleted: (phoneAuthCredential) async {
          await fb.FirebaseAuth.instance
              .signInWithCredential(phoneAuthCredential)
              .then(
            (value) {
              // otpSent.value = false;
              creds["number"] = "";
              Get.showSnackbar(GetSnackBar(
                  duration: const Duration(seconds: 3),
                  message: translations.phoneNumberVerified.tr));
            },
          );
        },
        verificationFailed: (error) {
          isLoading.value = false;
          log(error.message!);
        },
        codeSent: (verificationId, forceResendingToken) {
          isLoading.value = false;
          verifyId = verificationId;
          Get.toNamed(Routes.OTP_VERIFY);
        },
        codeAutoRetrievalTimeout: (verificationId) {
          verifyId = verificationId;
        },
      );
    }
  }

  void verifyOTP() async {
    isLoading.value = true;
    if (creds["otp"].toString().length == 6
        // &&    creds["otp"].toString() == "123456"
        ) {
      // isLoading.value = false;
      // Get.toNamed(Routes.REGISTER);
      fb.PhoneAuthCredential credential = fb.PhoneAuthProvider.credential(
          verificationId: verifyId, smsCode: creds["otp"]);
      try {
        await fb.FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
          isLoading.value = false;
          agreeTermsNConditions.value = false;
          Get.toNamed(Routes.REGISTER);
          Get.showSnackbar(
            GetSnackBar(
              backgroundColor: ColorPallete.primary,
              duration: const Duration(seconds: 3),
              message: translations.phoneNumberVerified.tr,
            ),
          );
        });
      } catch (e) {
        isLoading.value = false;
        Get.showSnackbar(GetSnackBar(
          duration: const Duration(seconds: 3),
          message: translations.invalidOtp.tr,
        ));
      }
    } else {
      isLoading.value = false;
      Get.showSnackbar(GetSnackBar(
        backgroundColor: ColorPallete.red,
        duration: const Duration(seconds: 3),
        message: translations.invalidOtp.tr,
      ));
    }
  }

  void hasAgreedTerms() {
    if (agreeTermsNConditions.value) {
      sendOTP();
    } else {
      Get.showSnackbar(const GetSnackBar(
        backgroundColor: ColorPallete.primary,
        duration: Duration(seconds: 3),
        message: "Agree Terms & Policy to proceed !",
      ));
    }
  }
}
