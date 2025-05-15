class JobsModel {
  final int jobId;
  final String jobName;
  final bool isPrivate;
  final String companyName;
  final String jobLocation;
  final String jobType;
  final String salaryRange;

  JobsModel(
    this.jobId,
    this.jobName,
    this.isPrivate,
    this.companyName,
    this.jobLocation,
    this.jobType,
    this.salaryRange,
  );
}
