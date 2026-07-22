import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobiremit/core/flavours/constants.dart';
import 'package:mobiremit/models/form_rules/form_rules_response_fz.dart';

class FormLogger extends StatelessWidget {
  final String formName;
  final FormRulesData? formRuleData;

  const FormLogger({super.key, required this.formName, this.formRuleData});

  @override
  Widget build(BuildContext context) {
    return AppConfigs.env != Environment.prod
        ? FormLoggerView(
            formName: formName,
            formRuleData: formRuleData,
          )
        : SizedBox();
  }
}

class FormLoggerView extends StatefulWidget {
  final String formName;
  final FormRulesData? formRuleData;

  const FormLoggerView({super.key, required this.formName, this.formRuleData});

  @override
  State<FormLoggerView> createState() => _FormLoggerViewState();
}

class _FormLoggerViewState extends State<FormLoggerView> {
  Map logs = {
    "event": "UserLogin",
    "status": "success",
    "user": {
      "id": 101,
      "name": "Vijay",
      "roles": ["admin", "editor"]
    },
    "timestamp": DateTime.now().toIso8601String(),
  };

  @override
  void initState() {
    super.initState();
    convertInLog();
  }

  void convertInLog() {
    // List<Map<String, dynamic>> ll = [];
    if (widget.formRuleData != null) {
      logs = widget.formRuleData!.toJson();
    }
  }

  @override
  Widget build(BuildContext context) {
    return (kDebugMode && Box3.isFormRuleNameShow)
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (kDebugMode)
                IconButton(
                    onPressed: () {
                      if (widget.formRuleData != null) {
                        show(context);
                      }
                    },
                    icon: Icon(
                      CupertinoIcons.ant_circle,
                      color: Colors.redAccent,
                      size: 18,
                    )),
              SelectableText(
                widget.formName,
                style: TS.f16.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          )
        : SizedBox();
  }

  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.7,
          minChildSize: 0,
          maxChildSize: 0.9,
          builder: (_, controller) {
            final prettyJson = const JsonEncoder.withIndent('  ').convert(logs);
            return SingleChildScrollView(
              controller: controller,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                      child: Text(
                    widget.formName,
                    style: TS.f16.copyWith(color: Colors.greenAccent, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  SelectableText(
                    prettyJson,
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontFamily: 'monospace',
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
