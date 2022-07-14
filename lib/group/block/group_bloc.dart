import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import 'package:equatable/equatable.dart';
import 'package:sunflower/utils/api/api.dart';
import 'package:stream_transform/stream_transform.dart';

import '../models/group_model.dart';


part 'group_event.dart';
part 'group_state.dart';


const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}


class GroupBloc extends Bloc<GroupEvent, GroupState> {
  GroupBloc() : super(const GroupState()) {
    on<GroupFetched>(_onGroupFetched, transformer: throttleDroppable(throttleDuration),);
  }

  Future<void> _onGroupFetched(GroupFetched event,
      Emitter<GroupState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == GroupStatus.initial) {
        final groups = await _fetchGroups();
        return emit(state.copyWith(
          status: GroupStatus.success,
          groups: groups,
          hasReachedMax: false,
        ));
      }
    } catch (_) {
      emit(state.copyWith(status: GroupStatus.failure));
    }
  }

  Future<List<GroupModel>> _fetchGroups() async {
    final response = await Api.fetchGroups('Sport', 'Rugby');
    if (response.statusCode == 200) {
      final body = json.decode(response.data);
      return List<GroupModel>.from(body['content'].map((i) => GroupModel.fromJson(i))).toList();
    }
    throw Exception('error fetching Groups');
  }
}
