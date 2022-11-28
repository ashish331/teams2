// To parse this JSON data, do
//
//     final teams = teamsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Teams teamsFromJson(String str) => Teams.fromJson(json.decode(str));

String teamsToJson(Teams data) => json.encode(data.toJson());

class Teams {
    Teams({
        required this.errorFlag,
        required this.message,
        required this.data,
    });

    String errorFlag;
    String message;
    Data data;

    factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        errorFlag: json["error_flag"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "error_flag": errorFlag,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        required this.contacts,
        required this.invites,
    });

    List<Contact> contacts;
    List<Invite> invites;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        contacts: List<Contact>.from(json["contacts"].map((x) => Contact.fromJson(x))),
        invites: List<Invite>.from(json["invites"].map((x) => Invite.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "contacts": List<dynamic>.from(contacts.map((x) => x.toJson())),
        "invites": List<dynamic>.from(invites.map((x) => x.toJson())),
    };
}

class Contact {
    Contact({
        required this.contactId,
        required this.email,
        required this.firstname,
        required this.lastname,
        required this.mobile,
        required this.dob,
        required this.contactAddressLine1,
        required this.contactAddressLine2,
        required this.city,
        required this.countyId,
        required this.countryId,
        required this.isactive,
        required this.role,
        required this.roleName,
    });

    String contactId;
    String email;
    String firstname;
    String lastname;
    String mobile;
    DateTime dob;
    String contactAddressLine1;
    String contactAddressLine2;
    String city;
    dynamic countyId;
    dynamic countryId;
    bool isactive;
    int role;
    Name ? roleName;

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        contactId: json["contact_id"],
        email: json["email"],
        firstname: json["firstname"] == null ? "" : json["firstname"],
        lastname: json["lastname"] == null ? "" : json["lastname"],
        mobile: json["mobile"] == null ? "" : json["mobile"],
        dob: json["dob"] == null ? DateTime(2017, 9, 7, 17, 30) : DateTime.parse(json["dob"]),
        contactAddressLine1: json["contact_address_line_1"] == null ? "" : json["contact_address_line_1"],
        contactAddressLine2: json["contact_address_line_2"] == null ? "" : json["contact_address_line_2"],
        city: json["city"] == null ? "" : json["city"],
        countyId: json["county_id"],
        countryId: json["country_id"],
        isactive: json["isactive"],
        role: json["role"],
        roleName:   nameValues.map[json["role_name"]],
    );

    Map<String, dynamic> toJson() => {
        "contact_id": contactId,
        "email": email,
        "firstname": firstname == null ? "" : firstname,
        "lastname": lastname == null ? "" : lastname,
        "mobile": mobile == null ? "" : mobile,
        "dob": dob == null ? "" : dob.toIso8601String(),
        "contact_address_line_1": contactAddressLine1 == null ? "" : contactAddressLine1,
        "contact_address_line_2": contactAddressLine2 == null ? "" : contactAddressLine2,
        "city": city == null ? "" : city,
        "county_id": countyId,
        "country_id": countryId,
        "isactive": isactive,
        "role": role,
        "role_name": nameValues.reverse[roleName],
    };
}

enum Name { ADMIN, PREPARER, VIEWER, EMPLOYEE, APPROVER }

final nameValues = EnumValues({
    "Admin": Name.ADMIN,
    "Approver": Name.APPROVER,
    "Employee": Name.EMPLOYEE,
    "Preparer": Name.PREPARER,
    "Viewer": Name.VIEWER
});

class Invite {
    Invite({
        required this.inviteId,
        required this.email,
        required this.configName,
    });

    String inviteId;
    String email;
    Name configName;

    factory Invite.fromJson(Map<String, dynamic> json) => Invite(
        inviteId: json["invite_id"],
        email: json["email"],
        configName: json["config_name"] != null ? nameValues.map[json["config_name"]]: json["config_name"],
    );

    Map<String, dynamic> toJson() => {
        "invite_id": inviteId,
        "email": email,
        "config_name": nameValues.reverse[configName],
    };
}

class EnumValues<T> {
    Map<String, T>  map = {};
    Map<T, String> reverseMap = {};

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
