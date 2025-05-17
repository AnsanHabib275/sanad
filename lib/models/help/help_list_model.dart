class HelpListModel {
  bool? isSuccessfull;
  String? message;
  List<Help>? help;

  HelpListModel({this.isSuccessfull, this.message, this.help});

  factory HelpListModel.fromJson(Map<String, dynamic> json) {
    return HelpListModel(
      isSuccessfull: json["IsSuccessfull"],
      message: json["message"],
      help:
          json["help"] != null
              ? List<Help>.from(json["help"].map((x) => Help.fromJson(x)))
              : [],
    );
  }
}

class Help {
  int? helpID;
  String? helpText;

  Help({
    this.helpID,
    this.helpText,
  });

  factory Help.fromJson(Map<String, dynamic> json) {
    return Help(
      helpID: json['helpID'],
      helpText: json['helpText'],
    );
  }
}
