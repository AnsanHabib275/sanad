class JobsListModel {
  bool? isSuccessfull;
  String? message;
  List<Jobs>? jobs;

  JobsListModel({this.isSuccessfull, this.message, this.jobs});

  factory JobsListModel.fromJson(Map<String, dynamic> json) {
    return JobsListModel(
      isSuccessfull: json["IsSuccessfull"],
      message: json["message"],
      jobs:
          json["myJobs"] != null
              ? List<Jobs>.from(json["myJobs"].map((x) => Jobs.fromJson(x)))
              : [],
    );
  }
}

class Jobs {
  int? jobId;
  String? jobName;
  bool? isPrivate;
  String? companyName;
  String? jobLocation;
  String? jobType;
  String? salaryRange;

  Jobs({
    this.jobId,
    this.jobName,
    this.isPrivate,
    this.companyName,
    this.jobLocation,
    this.jobType,
    this.salaryRange,
  });

  factory Jobs.fromJson(Map<String, dynamic> json) {
    return Jobs(
      jobId: json['JobId'],
      jobName: json['JobName'],
      isPrivate: json['IsPrivate'],
      companyName: json['CompanyName'],
      jobLocation: json['JobLocation'],
      jobType: json['JobType'],
      salaryRange: json['SalaryRange'],
    );
  }
}
