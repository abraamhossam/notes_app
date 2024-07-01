import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:notes_app/controller/colors_controller.dart';
import 'package:notes_app/helper/size_config.dart';
import 'package:notes_app/view/widgets/color_iteam_active.dart';
import 'package:notes_app/view/widgets/color_iteam_not_active.dart';

class ColorsListView extends StatelessWidget {
  const ColorsListView({
    super.key,
    required this.colors,
  });
  final List colors;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ColorsController>(
      init: ColorsController(),
      builder: (controller) {
        return SizedBox(
          height: SizeConfig.height! * 0.14,
          child: ListView.builder(
            itemCount: colors.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return controller.index == index
                  ? ColorIteamActive(
                      color: colors[index],
                      ontap: () {
                        controller.changeIndex(i: index);
                      },
                    )
                  : ColorIteamNotActive(
                      color: colors[index],
                      ontap: () {
                        controller.changeIndex(i: index);
                      },
                    );
            },
          ),
        );
      },
    );
  }
}
