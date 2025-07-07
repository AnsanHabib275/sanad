class MyJobsModel {
  final int jobId;
  final String jobName;
  final bool isPrivate;
  final String companyName;
  final String jobLocation;
  final String jobType;
  final String salaryRange;
  final String applied;

  MyJobsModel(
    this.jobId,
    this.jobName,
    this.isPrivate,
    this.companyName,
    this.jobLocation,
    this.jobType,
    this.salaryRange,
    this.applied,
  );
}
