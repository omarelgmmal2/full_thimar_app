class FaqsData {
  late final List<FaqsModel> list;
  late final String status;
  late final String message;

  FaqsData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']).map((e)=>FaqsModel.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }
}

class FaqsModel {
  late final int id;
  late final String question;
  late final String answer;

  FaqsModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
  }
}