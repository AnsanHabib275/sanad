class ApplyJobModel {
  String fullName;
  String email;
  String phone;
  String experience;
  DateTime? dob;
  String resumePath;

  ApplyJobModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.experience,
    this.dob,
    required this.resumePath,
  });
}
