class JobsModel {
  final int jobId;
  final String jobName;
  final bool isPrivate;
  final String agencyName;
  final String jobLocation;
  final String jobType;
  final String salaryRange;

  JobsModel(
    this.jobId,
    this.jobName,
    this.isPrivate,
    this.agencyName,
    this.jobLocation,
    this.jobType,
    this.salaryRange,
  );
}
