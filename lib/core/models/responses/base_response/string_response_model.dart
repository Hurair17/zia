import 'package:recrutment_help_app/core/models/responses/base_response/base_response.dart';

class StringResponse extends BaseResponse {
  String? accessToken;

  /// Default constructor
  StringResponse(succes, {error, this.accessToken})
      : super(succes, error: error);

  /// Named Constructor
  StringResponse.fromJson(json) : super.fromJson(json) {
    if (json['body'] != null) this.accessToken = json['body'];
  }
}
