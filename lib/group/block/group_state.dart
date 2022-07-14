part of 'group_bloc.dart';

enum GroupStatus { initial, success, failure }

class GroupState extends Equatable {
  const GroupState({
    this.status = GroupStatus.initial,
    this.groups = const <GroupModel>[],
    this.hasReachedMax = false,
  });

  final GroupStatus status;
  final List<GroupModel> groups;
  final bool hasReachedMax;

  GroupState copyWith({
    GroupStatus? status,
    List<GroupModel>? groups,
    bool? hasReachedMax,
  }) {
    return GroupState(
      status: status ?? this.status,
      groups: groups ?? this.groups,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''GroupState { status: $status, hasReachedMax: $hasReachedMax, groups: ${groups.length} }''';
  }

  @override
  List<Object> get props => [status, groups, hasReachedMax];
}
