import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watery/controllers/dashboard_controller.dart';
import 'package:watery/models/drinks_model.dart';
import 'package:watery/utils/images.dart';
import 'package:get/get.dart';

class DrinksList extends StatelessWidget {
  const DrinksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<DashboardController>();
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Obx(() => controller.drinkList.value.isEmpty
        ? noList()
        : RefreshIndicator(
            onRefresh: controller.refresh,
            child: ListView.separated(
              itemCount: controller.drinkList.value.length,
              itemBuilder: (BuildContext ctx, int index) {
                var qty = controller.drinkList.value[index].qty!;
                return Dismissible(
                  background: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.red),
                    child: const Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        Spacer(),
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  ),
                  onDismissed: (DismissDirection slide) {
                    controller.dismiss(index,context);
                  },
                  key: Key(controller.drinkList.value[index].id!.toString()),
                  child: InkWell(
                    onTap: () {

                      controller.updateDialog(context,controller.drinkList.value[index]);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                qty > 499
                                    ? bottleIcon
                                    : qty > 149
                                        ? bigGlassIcon
                                        : smalllassIcon,
                                width: qty > 499
                                    ? w * 0.07
                                    : qty > 149
                                        ? w * 0.058
                                        : w * 0.05,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '$qty ${controller.drinkList.value[index].type}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '${controller.drinkList.value[index].time}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(500),
                                  onTap: () {},
                                  child: Container(
                                      width: w * 0.08,
                                      height: w * 0.08,
                                      padding: EdgeInsets.all(5),
                                      margin: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(500),
                                          border: Border.all(
                                              width: 0.5, color: Colors.white)),
                                      child: Center(
                                          child: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                        size: w * 0.03,
                                      ))),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(
                    color: Colors.white10,
                  ),
                );
              },
            ),
          ));
  }

  Widget noList() {
    return Center(
        child: Text(
      "Add Drinks",
      style: TextStyle(color: Colors.white),
    ));
  }
}
