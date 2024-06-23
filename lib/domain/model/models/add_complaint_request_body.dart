

class AddComplaintRequestModel {
  AddComplaintRequestModel({
   required this.name,
    required this.phone,
    required this.email,
    required this.propertyId,
    required this.complaintTitle,
    required this.complaint,
  });

  String name;
  String phone;
  String email;
  int propertyId;
  String complaintTitle;
  String complaint;



  Map<String, dynamic> toJson() => {
    "name":name,
    "phone":phone,
    "email":email,
    "property_id":propertyId,
    "complaint_title":complaintTitle,
    "complaint":complaint

  };
}

