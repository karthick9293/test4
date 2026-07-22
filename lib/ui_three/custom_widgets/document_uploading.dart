import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/flavours/constants.dart';

class DocumentUploading extends StatelessWidget {
  const DocumentUploading({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: 350,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(top: 100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color: AppConfigs.w,
            gradient: LinearGradient(
              colors: [AppConfigs.primaryColor, AppConfigs.accentColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Please wait while your\nfiles is being uploaded ",
                style: TS.f18.copyWith(color: AppConfigs.w, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Icon(
                  Icons.cloud_upload,
                  size: 90,
                  color: AppConfigs.w,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: CupertinoActivityIndicator(
                  radius: 20,
                  color: AppConfigs.w,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
