import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunflower/group/block/group_bloc.dart';
import 'package:sunflower/teams/block/team_bloc.dart';
import 'package:sunflower/widgets/group_list_item.dart';
import 'package:sunflower/widgets/team_list_item.dart';

class TeamList extends StatefulWidget {
  const TeamList({Key? key}) : super(key: key);

  @override
  _TeamListState createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeamBloc, TeamState>(
      builder: (context, state) {
        switch (state.status) {
          case TeamStatus.failure:
            return const Center(child: Text('failed to fetch teams'));
          case TeamStatus.success:
            if (state.teams.isEmpty) {
              return const Center(child: Text('no Teams'));
            }
            return Container(
              height: 100,
              color: Colors.transparent,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return TeamListItem(team: state.teams[index]);
                },
                itemCount: state.teams.length,
                controller: _scrollController,
              ),
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<TeamBloc>().add(TeamFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
