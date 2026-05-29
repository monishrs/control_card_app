import 'package:flutter/material.dart';
import 'package:control_card_prototype/config/localization/l10n/app_localizations.dart';
import 'package:control_card_prototype/core/constants/enums.dart';

/// Status Message Mapper
class StatusMessageMapper {
  static final Map<StatusCode, String Function(AppLocalizations)>
  _statusMessageMap = <StatusCode, String Function(AppLocalizations p1)>{
    StatusCode.success: (AppLocalizations l) => l.response_000,
    StatusCode.snsSuccess: (AppLocalizations l) => l.response_001,
    StatusCode.otherSuccess: (AppLocalizations l) => l.response_000,
    StatusCode.loginFailure: (AppLocalizations l) => l.response_900,
    StatusCode.temporaryRegisterExpiry: (AppLocalizations l) => l.response_901,
    StatusCode.registerFailure: (AppLocalizations l) => l.response_902,
    StatusCode.versionFailure: (AppLocalizations l) => l.response_903,
    StatusCode.fileFormatError: (AppLocalizations l) => l.response_904,
    StatusCode.orderError: (AppLocalizations l) => l.response_905,
    StatusCode.parameterError: (AppLocalizations l) => l.response_920,
    StatusCode.accessTokenExpired: (AppLocalizations l) => l.response_921,
    StatusCode.accessTokenOtherError: (AppLocalizations l) => l.response_922,
    StatusCode.clientIDError: (AppLocalizations l) => l.response_930,
    StatusCode.noDataError: (AppLocalizations l) => l.response_931,
    StatusCode.requestMethodError: (AppLocalizations l) => l.response_940,
    StatusCode.connectionLimitError: (AppLocalizations l) => l.response_950,
    StatusCode.serverError: (AppLocalizations l) => l.response_999,
    StatusCode.internetError: (AppLocalizations l) => l.noInternet,
    StatusCode.internalError: (AppLocalizations l) => l.somethingWentWrong,
  };

  /// Get message based on status code
  static String getMessage(BuildContext context, {StatusCode? statusCode}) {
    final AppLocalizations local = AppLocalizations.of(context)!;
    return _statusMessageMap[statusCode] != null
        ? _statusMessageMap[statusCode]!(local)
        : local.somethingWentWrong;
  }
}
