// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/teams_controller.dart';

class TeamsView extends GetView<TeamsController> {
  const TeamsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: Get.height - 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Teams',
                    style: TextStyle(
                      fontFamily: 'heebo',
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All People - ${controller.teams == null ? 0 : controller.teams!.data.contacts.length}',
                        style: TextStyle(
                          fontFamily: 'heebo',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                          fontFamily: 'heebo',
                          fontSize: 18,
                          color: Color(0xff00A0FF),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Obx(() => controller.isLoading.value
                      ? CircularProgressIndicator()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.teams == null ? 0 : 3,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 80,
                              margin: EdgeInsets.all(8),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.09),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                      child: Text(
                                    controller.teams!.data.contacts[index]
                                            .firstname[0] +
                                        controller.teams!.data.contacts[index]
                                            .lastname[0],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      '${controller.teams!.data.contacts[index].firstname} ${controller.teams!.data.contacts[index].lastname}',
                                      style: TextStyle(
                                        fontFamily: 'heebo',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Active",
                                      style: TextStyle(
                                        fontFamily: 'heebo',
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: Text(
                                  controller
                                      .teams!.data.contacts[index].roleName
                                      .toString()
                                      .replaceAll("Name.", ""),
                                  style: TextStyle(
                                    fontFamily: 'heebo',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Invited People - ${controller.teams == null ? 0 : controller.teams!.data.invites.length}',
                        style: TextStyle(
                          fontFamily: 'heebo',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                          fontFamily: 'heebo',
                          fontSize: 18,
                          color: Color(0xff00A0FF),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.teams == null ? 0 : 3,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 80,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.09),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Color(0xffAC816E),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              controller.teams!.data.invites[index].configName
                                  .toString()[0],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                controller.teams!.data.invites[index].email
                                    .replaceAll("@gmail.com", ""),
                                style: TextStyle(
                                  fontFamily: 'heebo',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                controller.teams!.data.invites[index].configName
                                    .toString()
                                    .replaceAll("Name.", ""),
                                style: TextStyle(
                                  fontFamily: 'heebo',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.toNamed(Routes.HOME);
        },
        backgroundColor: Color(0xff00A0FF),
        child: Icon(Icons.add),
      ),
    );
  }
}
