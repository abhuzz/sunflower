import 'package:flutter/material.dart';
import 'package:sunflower/group/models/group_model.dart';

class GroupListItem extends StatelessWidget {
  const GroupListItem({Key? key, required this.group}) : super(key: key);

  final GroupModel group;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 4),
        child: Container(
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white
          ),
          child: Center(
            child: ListTile(
              leading: SizedBox(
                height: 30,
                width: 30,
                child: Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://dynamic.brandcrowd.com/asset/logo/021c080c-a5c6-4613-b048-2ca4a272c541/logo-search-grid-1x?v=637819710120830000'), //NetworkImage
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
              title:
              Row(
                children: [
                  Text(
                    group.name!,
                    style: textTheme.titleMedium,
                    maxLines: 2,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.attach_money_rounded,
                    size: 20,
                  ),
                  const SizedBox(
                    height: 30,
                    width: 90,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              dense: true,
            ),
          ),
        ),
      ),
    );
  }
}
