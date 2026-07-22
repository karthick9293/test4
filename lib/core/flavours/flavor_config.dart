import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../../flavors.dart';
import 'app_config.dart';
import 'image_paths.dart';

// align with casmex flavor. For Demo purpose only.

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final String appKey;

  /// Country / region label shown in the demo UI
  final String subtitle;

  /// Asset path for the client logo shown in the demo UI
  final String logoAsset;

  FlavorConfig({
    required this.flavor,
    required this.name,
    required this.appKey,
    required this.subtitle,
    required this.logoAsset,
  });

  // ──────────────────────────────────────────────────────────────────────────
  // Single source of truth for all flavors.
  // Add a new entry here → it automatically appears in the demo selector UI.
  // ──────────────────────────────────────────────────────────────────────────

  /// Map of flavor → (displayName, country)
  static const _flavorMeta = <Flavor, _FlavorMeta>{
    Flavor.casmex: _FlavorMeta(
      name: 'Casmex',
      subtitle: '',
    ),
    Flavor.lmpay: _FlavorMeta(
      name: 'LM Pay',
      subtitle: 'UAE',
    ),
    Flavor.globalexchange: _FlavorMeta(
      name: 'Global Exchange',
      subtitle: 'Qatar',
    ),
    Flavor.cityexchangeuae: _FlavorMeta(
      name: 'City Exchange UAE',
      subtitle: 'UAE',
    ),
    Flavor.lakhoos: _FlavorMeta(
      name: 'Lakhoos',
      subtitle: 'UAE',
    ),
    Flavor.kabayanremit: _FlavorMeta(
      name: 'Kabayan Remit',
      subtitle: 'Philippines',
    ),
    Flavor.alzamanexchange: _FlavorMeta(
      name: 'Alzaman Exchange',
      subtitle: 'Qatar',
    ),
  };

  /// Loads all configured flavors, reading each APP_KEY from its asset .env file.
  /// Adding a new flavor to [_flavorMeta] is all that's needed — no other file changes.
  static Future<List<FlavorConfig>> loadAvailableFlavors() async {
    final List<FlavorConfig> result = [];

    for (final entry in _flavorMeta.entries) {
      final flavor = entry.key;
      final meta = entry.value;

      // Get the correct environment suffix dynamically from AppConfigs
      final envSuffix = AppConfigs.flavorEnvironments[flavor]?.name ?? 'uat';

      // Get the correct logo asset dynamically from ImagePath
      final logoAsset =
          ImagePath.flavorLogos[flavor] ?? 'assets/images/casmex.png';

      final appKey = await _readAppKeyFromEnv(flavor.name, envSuffix);

      result.add(FlavorConfig(
        flavor: flavor,
        name: meta.name,
        appKey: appKey,
        subtitle: meta.subtitle,
        logoAsset: logoAsset,
      ));
    }

    return result;
  }

  /// Reads `assets/env/<flavorName>/.env.<envSuffix>` and extracts APP_KEY.
  static Future<String> _readAppKeyFromEnv(
      String flavorName, String envSuffix) async {
    try {
      final raw =
          await rootBundle.loadString('assets/env/$flavorName/.env.$envSuffix');
      for (final line in raw.split('\n')) {
        final trimmed = line.trim();
        if (trimmed.startsWith('APP_KEY=')) {
          return trimmed.substring('APP_KEY='.length).trim();
        }
      }
    } catch (e) {
      debugPrint('[FlavorConfig] Failed to load env for $flavorName: $e');
    }
    return '';
  }
}

/// Internal metadata holder — not exposed outside this file.
class _FlavorMeta {
  final String name;
  final String subtitle;

  const _FlavorMeta({
    required this.name,
    required this.subtitle,
  });
}
