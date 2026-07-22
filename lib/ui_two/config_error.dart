import 'package:flutter/material.dart';
import '../core/flavours/constants.dart';

class ConfigError extends StatelessWidget {
  const ConfigError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: const Color(0xFF23459F),
          width: double.infinity,
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Unexpected Error',
                style: TS.f28.copyWith(color: Colors.white),
              ),
              Text(
                'We encountered an unexpected error and we\'re unable to call the API. Please try again after sometime',
                style: TS.f14.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
