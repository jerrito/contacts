import 'package:contacts/src/features/contacts/domain/entities/contact.dart';

class ContactModel extends Contact {
  const ContactModel(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.phoneNumber});

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      phoneNumber: json["phone_number"]);

  Map<String, dynamic> toMap() => {
        "first_name": firstName,
        "last_name": lastName,
        "phone_number":phoneNumber,
        "email": email,
        "id": id
      };
}
