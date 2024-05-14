import 'parents/model.dart';

class User extends Model {
  String? name;
  String? initials;
  String? phoneNumber;
  String? email;
  String? image;
  String? username;
  String? referralCode;
  String? token;

  User({this.name, this.email, this.image, this.username, this.phoneNumber}) {
    initials = name?.splitMapJoin(" ",
        onMatch: (p0) => "",
        onNonMatch: (p0) => p0.substring(0, 1).toUpperCase());
  }

  User.fromJson(Map<String, dynamic> json) {
    // super.fromJson(json);
    if (json.containsKey("id")) {
      id = stringFromJson(json, "id");
    } else {
      id = stringFromJson(json, "_id");
    }
    name = stringFromJson(json, "name");
    // initials = name?.splitMapJoin(
    //   " ",
    //   onMatch: (p0) => "",
    //   onNonMatch: (p0) => p0.substring(0, 1).toUpperCase(),
    // );

    if (json.containsKey("image")) {
      image = stringFromJson(json, "image");
    }
    email = stringFromJson(json, "email");
    phoneNumber = stringFromJson(json, "phone_number");
    username = stringFromJson(json, "username");
    referralCode = stringFromJson(json, "reffered_by");

    if (json.containsKey("token")) {
      token = stringFromJson(json, "token");
    }

    // response = stringFromJson(json, "message");
    // response =
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["id"] = id;
    data["name"] = name;
    data["image"] = image;
    data["email"] = email;
    data["mobile"] = phoneNumber;
    data["username"] = username;

    return data;
  }
}

// class User {
//   String? membregNo;
//   String? memberName;
//   String? registeredMobile;
//   String? sbaccountId;
//   String? accountName;
//   String? balance;
//   String? branchName;
//   String? subgroupName;
//   String? livebalance;
//   String? nomineeName;
//   String? token;

//   User(
//       {this.membregNo,
//       this.memberName,
//       this.registeredMobile,
//       this.sbaccountId,
//       this.accountName,
//       this.balance,
//       this.branchName,
//       this.subgroupName,
//       this.livebalance,
//       this.nomineeName});

//   User.fromJson(Map<String, dynamic> json) {
//     membregNo = json['membreg_no'];
//     memberName = json['member_name'];
//     registeredMobile = json['RegisteredMobile'];
//     sbaccountId = json['sbaccount_id'];
//     accountName = json['Account_name'];
//     balance = json['balance'];
//     branchName = json['branch_name'];
//     subgroupName = json['subgroup_name'];
//     livebalance = json['livebalance'];
//     nomineeName = json['nominee_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['membreg_no'] = this.membregNo;
//     data['member_name'] = this.memberName;
//     data['RegisteredMobile'] = this.registeredMobile;
//     data['sbaccount_id'] = this.sbaccountId;
//     data['Account_name'] = this.accountName;
//     data['balance'] = this.balance;
//     data['branch_name'] = this.branchName;
//     data['subgroup_name'] = this.subgroupName;
//     data['livebalance'] = this.livebalance;
//     data['nominee_name'] = this.nomineeName;
//     return data;
//   }
// }
