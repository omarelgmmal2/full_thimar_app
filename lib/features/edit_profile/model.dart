class EditProfileData {
  late final String status;
  late final String message;
  late final Data data;

  EditProfileData.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late final int id;
  late final String fullName;
  late final String phone;
  late final String image;
  late final Null city;
  late final int isVip;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    fullName = json['fullname'];
    phone = json['phone'];
    image = json['image'];
    city = null;
    isVip = json['is_vip'];
  }
}