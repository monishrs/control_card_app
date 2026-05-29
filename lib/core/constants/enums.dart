import 'dart:ui';

/// An enum representing HTTP Response Codes.
enum ResponseCode {
  /// response code success
  success(200),

  /// response code bad request
  badRequest(400),

  /// response code unauthorized
  unauthorized(401),

  /// response code forbidden
  forbidden(403),

  /// response code not found
  notFound(404),

  /// response code method not allowed
  methodNotAllowed(405),

  /// response code too many requests
  tooManyRequests(429),

  /// response code internal server error
  internalServerError(500);

  const ResponseCode(this.value);

  /// The string value associated with the enum entry.
  final int value;

  /// Returns the enum entry corresponding to the given value.
  static ResponseCode? getByValue(int? value) {
    for (ResponseCode status in ResponseCode.values) {
      if (status.value == value) {
        return status;
      }
    }
    return null;
  }
}

/// An enum representing different types of status codes used in the application back end.
enum StatusCode {
  /// app level internal error
  internalError('-2'),

  /// app level internal error
  internetError('-1'),

  /// Represents a successful operation.
  success('000'),

  /// Represents a successful operation for SNS login.
  snsSuccess('001'),

  /// Represents a successful operation for other success codes.
  otherSuccess('0XX'), // variable error code

  /// Represents a failed operation for login.
  loginFailure('900'),

  /// Represents a temporary registration failure.
  temporaryRegisterExpiry('901'),

  /// Represents a failed operation for registration.
  registerFailure('902'),

  /// Represents a failed operation for version check.
  versionFailure('903'),

  /// Represents a failed operation for file format.
  fileFormatError('904'),

  /// Represents a failed operation for order.
  orderError('905'),

  /// Represents a failed operation for parameter.
  parameterError('920'),

  /// Represents a failed operation for access token.
  accessTokenExpired('921'),

  /// Represents a failed operation for access token.
  accessTokenOtherError('922'),

  /// Represents client ID error.
  clientIDError('930'),

  /// Represents no data error.
  noDataError('931'),

  /// Represents request method error.
  requestMethodError('940'),

  /// Represents connection limit error.
  connectionLimitError('950'),

  /// Represents server error.
  serverError('999');

  const StatusCode(this.value);

  /// value
  final String value;

  /// Returns the enum entry corresponding to the given value.
  static StatusCode? getByValue(String? value) {
    for (StatusCode status in StatusCode.values) {
      if (status.value == value) {
        return status;
      }
    }
    return null;
  }
}

/// Enum representing all available font families
/// used throughout the application.
///
/// Provides reusable [TextStyle] getters
/// with different font weights.
enum AppFont {
  /// Inter font family.
  inter('Inter'),

  /// JetBrains Mono font family.
  jetBrainsMono('JetBrainsMono'),

  /// Hanken Grotesk font family.
  hankenGrotesk('HankenGrotesk'),

  /// liberian font family.
  liberian('RobotoMono');

  /// Constructor for assigning font family.
  const AppFont(this.family);

  /// Stores the font family name.
  final String family;

}

// ──────────────────────────────────────────
// Semantic Font Weight Getters
// ──────────────────────────────────────────
/// Defines the visual styling variants for application buttons.
enum BtnVariant {
  /// Filled black button using [AppColors.primary].
  primary, 
  /// Filled green button using [AppColors.primaryLight].
  primaryGreen, 
  /// Outlined green border with transparent fill.
  primaryOutline, 
  /// Filled red button for danger actions.
  danger, 
  /// Outlined red button for danger actions.
  dangerOutline, 
  /// Filled amber/orange button for warnings.
  warning, 
  /// Outlined neutral button for secondary actions.
  secondary, 
  /// Button with no border and muted text.
  ghost, 
  /// Light blue filled button for info actions.
  info, 
  /// Solid black filled button.
  black, 
  /// Filled green button for success actions.
  success, 
  /// Dark navy button using [AppColors.newRollDarkBg].
  offline, 
}

/// Defines the sizing options for application buttons.
enum BtnSize { 
  /// Small size button.
  sm, 
  /// Medium size button (default).
  md, 
  /// Large size button.
  lg, 
  /// Extra large size button.
  xl 
}

/// Defines the visual styling variants for status badges.
enum BadgeVariant { 
  /// Green badge for success state.
  success, 
  /// Red badge for danger/error state.
  danger, 
  /// Amber badge for warning state.
  warning, 
  /// Blue badge for info state.
  info, 
  /// Grey badge for neutral state.
  neutral, 
  /// Specific badge styling for 'revised' status.
  revised, 
  /// Specific badge styling for 'OK' status.
  ok, 
  /// Specific badge styling for 'NG' (No Good) status.
  ng 
}
