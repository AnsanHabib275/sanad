class MyJobsListModel {
  bool? isSuccessfull;
  String? message;
  List<MyJobs>? myJobs;

  MyJobsListModel({this.isSuccessfull, this.message, this.myJobs});

  factory MyJobsListModel.fromJson(Map<String, dynamic> json) {
    return MyJobsListModel(
      isSuccessfull: json["IsSuccessfull"],
      message: json["message"],
      myJobs:
          json["myJobs"] != null
              ? List<MyJobs>.from(json["myJobs"].map((x) => MyJobs.fromJson(x)))
              : [],
    );
  }
}

class MyJobs {
  int? jobId;
  String? jobName;
  bool? isPrivate;
  String? companyName;
  String? jobLocation;
  String? jobType;
  String? salaryRange;
  String? applied;

  MyJobs({
    this.jobId,
    this.jobName,
    this.isPrivate,
    this.companyName,
    this.jobLocation,
    this.jobType,
    this.salaryRange,
    this.applied,
  });

  factory MyJobs.fromJson(Map<String, dynamic> json) {
    return MyJobs(
      jobId: json['JobId'],
      jobName: json['JobName'],
      isPrivate: json['IsPrivate'],
      companyName: json['CompanyName'],
      jobLocation: json['JobLocation'],
      jobType: json['JobType'],
      salaryRange: json['SalaryRange'],
      applied: json['applied'],
    );
  }
}
