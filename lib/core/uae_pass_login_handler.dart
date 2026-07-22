import 'package:flutter/foundation.dart';
import 'package:flutter_uae_pass/flutter_uae_pass.dart';
import 'package:get/get.dart';

import '../models/uae_pass/uae_pass_profile_fz.dart';
import '../network/api_service_new.dart';
import '../ui_one/screens/sign_up/nid_alerts.dart';
import 'flavours/constants.dart';

class UAEPassLoginHandler {
  String? uaePassAccessToken;
  String? uaePassAuthToken;
  String? uaePassAuthTokenType;
  String? uaePassError;

  Future<Map<String, dynamic>> signUpUAEPass(bool isDark, {required Function(bool status) setLoading}) async {
    final uaePassPlugin = UaePass();
    UaePassProfileFz? profile;

    if (Get.isDialogOpen == true) {
      Get.back();
    }

    _resetTokens();

    await uaePassPlugin.setUpEnvironment(
      isProduction: false,
      state: AppConfigs.uaePassState,
      redirectUri: AppConfigs.uaePassRedirectURL,
      scope: AppConfigs.uaePassScope,
      clientId: AppConfigs.uaePassClientId,
      clientSecret: AppConfigs.uaePassClientSecret,
      urlScheme: AppConfigs.uaePassUrlScheme,
    );

    try {
      setLoading(true);
      uaePassAccessToken = await uaePassPlugin.signIn();
      logger.i("UAE Pass AccessToken: $uaePassAccessToken");
    } catch (e) {
      _handleError(
        e,
        setLoading,
        isDark,
        message: 'User cancelled the login'.tr,
        title: 'Error'.tr,
      );
      return _buildResult(profile);
    }

    if (uaePassAccessToken == null) {
      setLoading(false);
      return _buildResult(profile);
    }

    final tokenCreated = await _createTokenFromCode(setLoading);
    if (!tokenCreated) {
      return _buildResult(profile);
    }

    profile = await _fetchUserProfile(setLoading);
    return _buildResult(profile);
  }

  void _resetTokens() {
    uaePassAccessToken = null;
    uaePassAuthToken = null;
    uaePassAuthTokenType = null;
    uaePassError = null;
  }

  Future<bool> _createTokenFromCode(Function(bool) setLoading) async {
    final headers = {"Authorization": AppConfigs.uaePassBasic};
    final body = {
      "grant_type": "authorization_code",
      "redirect_uri": AppConfigs.uaePassRedirectURL,
      "code": uaePassAccessToken!,
    };

    try {
      final tokenMap = await ApiService().createUaePassToken(data: body, header: headers);
      uaePassAuthToken = tokenMap['access_token'];
      uaePassAuthTokenType = tokenMap['token_type'];

      if (kDebugMode) {
        print('AuthToken: $uaePassAuthToken');
        print('TokenType: $uaePassAuthTokenType');
      }
      return uaePassAuthToken != null && uaePassAuthTokenType != null;
    } catch (e) {
      uaePassError = e.toString();
      setLoading(false);
      return false;
    }
  }

  Future<UaePassProfileFz?> _fetchUserProfile(Function(bool) setLoading) async {
    final headers = {"Authorization": "$uaePassAuthTokenType $uaePassAuthToken"};

    try {
      final profile = await ApiService().getUserInfoUaePass(header: headers);
      if (kDebugMode) {
        logger.i(profile);
        logger.i(profile?.toJson());
      }
      return profile;
    } catch (e) {
      uaePassError = e.toString();
      return null;
    } finally {
      setLoading(false);
    }
  }

  void _handleError(
    Object error,
    Function(bool) setLoading,
    bool isDark, {
    required String message,
    required String title,
  }) async {
    uaePassError = error.toString();
    setLoading(false);
    await Get.dialog(kycPendingAlert(isDark, message, title: title));
  }

  Map<String, dynamic> _buildResult(UaePassProfileFz? profile) {
    return {
      "data": profile,
      "uaePassAuthToken": uaePassAuthToken,
      "uaePassError": uaePassError,
    };
  }
}
