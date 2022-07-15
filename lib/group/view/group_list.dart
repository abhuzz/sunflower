import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunflower/group/block/group_bloc.dart';
import 'package:sunflower/widgets/group_list_item.dart';

class GroupList extends StatefulWidget {
  @override
  _GroupListState createState() => _GroupListState();
}

class _GroupListState extends State<GroupList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupBloc, GroupState>(
      builder: (context, state) {
        switch (state.status) {
          case GroupStatus.failure:
            return const Center(child: Text('failed to fetch groups'));
          case GroupStatus.success:
            if (state.groups.isEmpty) {
              return const Center(child: Text('no Groups'));
            }
            return ListView.builder(
              // shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return GroupListItem(group: state.groups[index]);
              },
              itemCount: state.groups.length,
              controller: _scrollController,
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
    if (_isBottom) context.read<GroupBloc>().add(GroupFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
