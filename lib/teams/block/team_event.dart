part of 'team_bloc.dart';

abstract class TeamEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class TeamFetched extends TeamEvent {}
