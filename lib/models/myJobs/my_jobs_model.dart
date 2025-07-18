class MyJobsModel {
  final int jobId;
  final String jobName;
  final bool isPrivate;
  final String agencyName;
  final String jobLocation;
  final String jobType;
  final String salaryRange;
  final String applied;

  MyJobsModel(
    this.jobId,
    this.jobName,
    this.isPrivate,
    this.agencyName,
    this.jobLocation,
    this.jobType,
    this.salaryRange,
    this.applied,
  );
}
