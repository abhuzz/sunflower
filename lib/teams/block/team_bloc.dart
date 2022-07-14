import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import 'package:equatable/equatable.dart';
import 'package:sunflower/utils/api/api.dart';
import 'package:stream_transform/stream_transform.dart';

import '../models/team_model.dart';


part 'team_event.dart';
part 'team_state.dart';


const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}


class TeamBloc extends Bloc<TeamEvent, TeamState> {
  TeamBloc() : super(const TeamState()) {
    on<TeamFetched>(_onTeamFetched, transformer: throttleDroppable(throttleDuration),);
  }

  Future<void> _onTeamFetched(TeamFetched event,
      Emitter<TeamState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == TeamStatus.initial) {
        final teams = await _fetchTeams();
        return emit(state.copyWith(
          status: TeamStatus.success,
          teams: teams,
          hasReachedMax: false,
        ));
      }
    } catch (_) {
      emit(state.copyWith(status: TeamStatus.failure));
    }
  }

  Future<List<TeamModel>> _fetchTeams() async {
    final response = await Api.fetchTeam('Sport');
    if (response.statusCode == 200) {
      final body = json.decode(response.data);
      return List<TeamModel>.from(body.map((i) => TeamModel.fromJson(i))).toList();
    }
    throw Exception('error fetching Teams');
  }
}
