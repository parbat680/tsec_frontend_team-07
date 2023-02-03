class RoomMate {
  String? sId;
  String? user1Phone;
  String? user2Phone;
  int? percentage;
  int? iV;

  RoomMate(
      {this.sId, this.user1Phone, this.user2Phone, this.percentage, this.iV});

  RoomMate.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user1Phone = json['user1Phone'];
    user2Phone = json['user2Phone'];
    percentage = json['percentage'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user1Phone'] = this.user1Phone;
    data['user2Phone'] = this.user2Phone;
    data['percentage'] = this.percentage;
    data['__v'] = this.iV;
    return data;
  }
}
