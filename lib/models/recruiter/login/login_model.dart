class LoginModel {
  bool? isSuccessfull;
  String? message;
  User? user;
  int? errorcode;

  LoginModel({this.isSuccessfull, this.message, this.user, this.errorcode});

  LoginModel.fromJson(Map<String, dynamic> json) {
    isSuccessfull = json['isSuccessfull'];
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    errorcode = json['errorcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccessfull'] = isSuccessfull;
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['errorcode'] = errorcode;
    return data;
  }
}

class User {
  String? fullName;
  String? email;
  String? creationDate;
  String? eID;
  String? firstName;
  String? lastName;
  String? mobileNumbre;
  String? dOB;
  String? gender;
  String? countryCode;
  String? imageURL;
  String? street;
  String? city;
  String? postalCode;
  String? country;
  String? description;

  User({
    this.fullName,
    this.email,
    this.creationDate,
    this.eID,
    this.firstName,
    this.lastName,
    this.mobileNumbre,
    this.dOB,
    this.gender,
    this.countryCode,
    this.imageURL,
    this.street,
    this.city,
    this.postalCode,
    this.country,
    this.description,
  });

  User.fromJson(Map<String, dynamic> json) {
    fullName = json['FullName'];
    email = json['Email'];
    creationDate = json['CreationDate'];
    eID = json['E_ID'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    mobileNumbre = json['MobileNumbre'];
    dOB = json['DOB'];
    gender = json['Gender'];
    countryCode = json['CountryCode'];
    imageURL = json['ImageURL'];
    street = json['Street'];
    city = json['City'];
    postalCode = json['PostalCode'];
    country = json['Country'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FullName'] = fullName;
    data['Email'] = email;
    data['CreationDate'] = creationDate;
    data['E_ID'] = eID;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['MobileNumbre'] = mobileNumbre;
    data['DOB'] = dOB;
    data['Gender'] = gender;
    data['CountryCode'] = countryCode;
    data['ImageURL'] = imageURL;
    data['Street'] = street;
    data['City'] = city;
    data['PostalCode'] = postalCode;
    data['Country'] = country;
    data['Description'] = description;
    return data;
  }
}
