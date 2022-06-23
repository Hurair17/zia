import 'package:recrutment_help_app/core/models/other_model/user_profile.dart';

import 'base_response/base_response.dart';

class UserProfileResponse extends BaseResponse {
  UserProfile? profile;

  UserProfileResponse(success, {error}) : super(success, error: error);

  UserProfileResponse.fromJson(json) : super.fromJson(json) {
    if (json['body'] != null)
      this.profile = UserProfile.fromJson(json['body']['profile'][0]);
  }
}
