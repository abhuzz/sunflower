part of 'team_bloc.dart';

enum TeamStatus { initial, success, failure }

class TeamState extends Equatable {
  const TeamState({
    this.status = TeamStatus.initial,
    this.teams = const <TeamModel>[],
    this.hasReachedMax = false,
  });

  final TeamStatus status;
  final List<TeamModel> teams;
  final bool hasReachedMax;

  TeamState copyWith({
    TeamStatus? status,
    List<TeamModel>? teams,
    bool? hasReachedMax,
  }) {
    return TeamState(
      status: status ?? this.status,
      teams: teams ?? this.teams,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''GroupState { status: $status, hasReachedMax: $hasReachedMax, teams: ${teams.length} }''';
  }

  @override
  List<Object> get props => [status, teams, hasReachedMax];
}
