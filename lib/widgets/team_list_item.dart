import 'package:flutter/material.dart';
import 'package:sunflower/teams/models/team_model.dart';

class TeamListItem extends StatelessWidget {
  const TeamListItem({Key? key, required this.team}) : super(key: key);

  final TeamModel team;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          width: 90,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(
                color: Colors.black12,
                width: 1.0,
                style: BorderStyle.solid), //Border.all
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
                width: 30,
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://dynamic.brandcrowd.com/asset/logo/121ff2e3-6190-4e65-8257-08218dbb0736/logo-search-grid-1x?v=637880200779200000'), //NetworkImage
                      scale: 3.0,
                    ), //DecorationImage
                    border: Border.all(
                        color: Colors.black12,
                        width: 1.0,
                        style: BorderStyle.solid), //Border.all
                    borderRadius: BorderRadius.circular(5),
                  ), //BoxDecoration
                ), //Container
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                team.name!,
                style: const TextStyle(
                    fontSize: 12,
                  fontWeight: FontWeight.w600
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        )
      ),
    );
  }
}
