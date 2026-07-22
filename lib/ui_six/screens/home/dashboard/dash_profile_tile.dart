import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_six_pages.dart';
import '../../../../core/flavours/constants.dart';
import '../../../custom_widgets/base64_to_image.dart';

Widget dashProfileTile(
    {Color? c1,
    Color? c2,
    bool preLogin = false,
    void Function()? onTap,
    // Color? bc,
    bool isDark = false,
    File? image,
    bool isDrawer = false,
    double size = 66}) {
  String shortForm = '';
  if (Box3.customerDetailsFZ != null && Box3.customerDetailsFZ!.data != null) {
    final profile = Box3.customerDetailsFZ!.data!;
    shortForm = [profile.firstName, profile.middleName ?? '', profile.lastName ?? '']
        .where((name) => name.trim().isNotEmpty)
        .map((name) => name.trim()[0].toUpperCase())
        .join();
  }
  final accountController = Get.find<AccountController>();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    accountController.ensureSelfieImageLoaded();
  });

  return Obx(
    () {
      final selfieImage = accountController.selfieImage.value;
      String fullName = (Box3.customerDetailsFZ?.data?.name ?? 'LINU POTTAKKAL PAUL').toUpperCase();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              // margin: const EdgeInsets.only(left: 20, right: 20),
              height: size,
              width: size,
              decoration: BoxDecoration(
                // border: Border.all(color: isDrawer ? AppConfigs.w : (isDark ? AppConfigs.accentColor : AppConfigs.primaryColor), width: 1.5),
                color: const Color(0xFFF2EADC),
                borderRadius: BorderRadius.circular(10)
              ),

              // alignment: Alignment.center,
              child: accountController.appStatus != AppStatus.loggedIn
                  ? Center(
                      child: Text(
                        shortForm.substring(0, shortForm.length > 2 ? 2 : shortForm.length),
                        style:
                            TS.f22B.copyWith(color: isDrawer ? (isDark ? AppConfigs.primaryColor : AppConfigs.b) : AppConfigs.accentColor),
                      ),
                    )
                  : (Box3.customerDetailsFZ != null && selfieImage != null)
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Base64Image(
                            image: selfieImage
                            // ??
                            //     Box3.customerDetailsFZ?.data?.profilePic ??
                            //     "",
                            ,
                            fit: BoxFit.cover,
                            errorWidget: Center(
                              child: Text(
                                shortForm.substring(0, shortForm.length > 2 ? 2 : shortForm.length),
                                style: TS.f22B.copyWith(
                                  color: isDrawer ? (isDark ? AppConfigs.primaryColor : AppConfigs.b) : AppConfigs.accentColor,
                                ),
                              ),
                            ),
                          ),
                        )
                      // : accountController.customerDetails!.profImage != null
                      //     ? AspectRatio(
                      //         aspectRatio: 1,
                      //         child: ClipRRect(
                      //           borderRadius: const BorderRadius.all(Radius.circular(33)),
                      //           child: Image.network(
                      //             accountController.customerDetails!.profImage!,
                      //             fit: BoxFit.cover,
                      //             alignment: Alignment.center,
                      //             errorBuilder: (context, error, stackTrace) => Center(
                      //               child: Text(
                      //                 shortForm.substring(0, shortForm.length > 2 ? 2 : shortForm.length),
                      //                 style: TextStyles.font20
                      //                     .copyWith(color: isDrawer ? (isDark ? AppConfigs.primaryColor : AppConfigs.w) : AppConfigs.primaryColor),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       )
                      : Center(
                          child: Text(
                            shortForm.substring(0, shortForm.length > 2 ? 2 : shortForm.length),
                            style: TS.f22B
                                .copyWith(color: isDrawer ? (isDark ? AppConfigs.primaryColor : AppConfigs.b) : AppConfigs.accentColor),
                          ),
                        ),
            ),
          ),
          SizedBox(height: 10,),
          // Text(
          //   cms(Fields.SideMenu_HiText).textHeading!,
          //   style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          // ),
          Text(
            '${preLogin ? 'User'.tr : (isDrawer ? Box3.customerDetailsFZ?.data?.firstName : Box3.customerDetailsFZ?.data?.name)}',
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
              color: Color(0xFF3B0D20),
              letterSpacing: 0.5,
            ),
          ),
          Text(
            preLogin ?"":"${Box3.customerDetailsFZ?.data?.customerCode} · Since ${Box3.customerDetailsFZ?.data?.idExpiryDate}",
            style: TextStyle(color: AppConfigs.primaryColor.withOpacity(0.5), fontSize: 14),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2.5),
                decoration: BoxDecoration(
                  color: Color(0xff00b894).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text("✓ KYC Tier 3",style: TextStyle(color: Color(0xff00b894)),),
              ),
              SizedBox(width: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2.5),
                decoration: BoxDecoration(
                    color: Color(0xff7c3aed).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text("2,847 pts",style: TextStyle(color: Color(0xff7c3aed)),),
              ),
              SizedBox(width: 10,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2.5),
                decoration: BoxDecoration(
                    color: Color(0xffd4a017).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text("Gold Member",style: TextStyle(color: Color(0xffd4a017)),),
              )
            ],
          ),
          SizedBox(height: 10,),
        ],
      );
    },
  );
}
