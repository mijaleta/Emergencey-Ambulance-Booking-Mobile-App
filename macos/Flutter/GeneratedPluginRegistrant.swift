//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import geolocator_apple
<<<<<<< HEAD
=======
import location
>>>>>>> c2c783442a787ca86e5c28a5753a45df08a796fa
import path_provider_foundation
import shared_preferences_foundation
import sqflite
import url_launcher_macos

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  GeolocatorPlugin.register(with: registry.registrar(forPlugin: "GeolocatorPlugin"))
<<<<<<< HEAD
=======
  LocationPlugin.register(with: registry.registrar(forPlugin: "LocationPlugin"))
>>>>>>> c2c783442a787ca86e5c28a5753a45df08a796fa
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
  SqflitePlugin.register(with: registry.registrar(forPlugin: "SqflitePlugin"))
  UrlLauncherPlugin.register(with: registry.registrar(forPlugin: "UrlLauncherPlugin"))
}
