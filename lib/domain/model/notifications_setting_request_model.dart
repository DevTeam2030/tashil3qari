class NotificationsSettingRequestModel {
  int emailNotifications;
  int emailMarketingNotifications;
  int textMarketingNotifications;

  NotificationsSettingRequestModel({
    required this.emailNotifications,
    required this.emailMarketingNotifications,
    required this.textMarketingNotifications,
  });

  factory NotificationsSettingRequestModel.fromJson(Map<String, dynamic> json) => NotificationsSettingRequestModel(
    emailNotifications: json["email_notifications"],
    emailMarketingNotifications: json["email_marketing_notifications"],
    textMarketingNotifications: json["text_marketing_notifications"],
  );

  Map<String, dynamic> toJson() => {
    "email_notifications": emailNotifications,
    "email_marketing_notifications": emailMarketingNotifications,
    "text_marketing_notifications": textMarketingNotifications,
  };
}
