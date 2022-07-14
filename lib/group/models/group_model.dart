
import 'package:equatable/equatable.dart';

class GroupModel extends Equatable{
 String? name;

 GroupModel({required this.name});

  GroupModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }

  @override
  List<Object?> get props => [name];
}