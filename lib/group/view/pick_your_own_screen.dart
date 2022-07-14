import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunflower/teams/block/team_bloc.dart';
import 'package:sunflower/teams/view/team_list.dart';

import '../block/group_bloc.dart';
import 'group_list.dart';

class PickYourOwnScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Pick your own'),
        backgroundColor: Colors.red,
      ),

      body: Stack(
        children: [

          Container(
            height: 150,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)
              ),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [

                Container(
                  margin: const EdgeInsets.all(16.0),
                  height: 60,
                  width: double.infinity,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 100,
                        child: Text('Team Break',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.left, ),
                      ),
                      const Spacer(),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Total Amount',
                              style: TextStyle(
                                // fontWeight: FontWeight.w100,
                                color: Colors.white,
                                fontSize: 9,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Icon(Icons.attach_money_rounded,
                                  color: Colors.white,
                                ),
                                Text('204.0',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],)
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 10,),

                BlocProvider(
                  create: (_) => TeamBloc()..add(TeamFetched()),
                  child: TeamList(),
                ),

                const SizedBox(height: 10,),

                BlocProvider(
                  create: (_) => GroupBloc()..add(GroupFetched()),
                  child: GroupList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
