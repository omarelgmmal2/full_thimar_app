class SuggestionsAndComplaintsData {
  late final String status;
  late final Null data;
  late final String message;

  SuggestionsAndComplaintsData.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = null;
    message = json['message'];
  }
}