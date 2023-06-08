class AppLink {
  // API LINK for  server.
  static const String server = "http://10.0.2.2:3001";
  // static const String server = "http://127.0.0.1:3001";

  // API LINK for GYM table .
  static const String addAdminPhoto = "$server/api/person/addadmin_photo/coach";
  static const String updateinfo = "$server/api/person/admin/updatedata";
  static const String getdataadmin = "$server/api/person/admin/getdataadmin";
  static const String countTrainee = "$server/api/admin/count_trainee";
  static const String countCoach = "$server/api/admin/count_trainee";
  static const String getAllTrainee = "$server/api/admin/get_all_trainee";
  static const String getAllCoaches = "$server/api/admin/get_all_coach";
  static const String getAllGYMData = "$server/api/person/admin/config/get";
  static const String updateGymdata =
      "$server/api/person/aadmin/config/data/gym";
  static const String getAllPendingRequest =
      // "$server/api/person/admin/pending_request";
      "$server/api/get_paired_request";
  static const String getAllAcceptedRequest =
      // "$server/api/person/admin/accepted_request";
      "$server/api/get_active_request";
  static const String getAllDisaledRequest =
      // "$server/api/person/admin/disapled_request";
      "$server/api/get_deactivated_req";

  static const String unPendRequest =
      "$server/api/person/admin/un_pend_request";
  static const String unEnablRequest =
      "$server/api/person/admin/disaple_request";
  static const String enablRequest = "$server/api/person/admin/enable_request";
  static const String deleteRequest =
      "$server/api/person/admin/request/delete_request";
  static const String getAllRecipe = "$server/api/get_recipes";
  static const String getAllMarketItems = "$server/api/getAllMarketItems";
  static const String getPersonsDate = "$server/api/get_persons_date";
  static const String getSubscribtionProfit =
      "$server/api/subscribtion/getprofit";
  static const String getCheckoutProfit = "$server/api/checkout/getprofit";
  static const String getAllCheckouts = "$server/api/checkout/getAllCheckouts";
  static const String getPairedReq = "$server/api/get_paired_request";
  static const String getActiveReq = "$server/api/get_active_request";
  static const String getDeactivatedReq = "$server/api/get_deactivated_req";
  static const String updateLocation =
      "$server/api/person/admin/config/updateLocation";
}
