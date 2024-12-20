// Required imports for this code
import 'package:collection/collection.dart'; // Provides utilities for advanced collection operations
import 'package:flutter/cupertino.dart';

import 'food.dart'; // Contains widgets and tools specific to iOS design

// The AssetRegistry class, which extends ChangeNotifier to support state management
class AssetRegistry extends ChangeNotifier {
  // Private list of assets, only accessible within the AssetRegistry class
  final List<Assetd> _assets = [
    // Example: Asset of type 'Land'
    Assetd(
      name: "Greenfield Estate",
      description:
          "A 5-acre plot of fertile farmland located in the serene outskirts of the city.",
      image: "images/burger/Burger1.png", // Path to the image for this asset
      price: 150000.00, // Value of the asset
      category: AssetCategoryd.land, // Category the asset belongs to
      features: [
        // List of unique features or details
      ],
    ),

    // Example: Asset of type 'House'
    Assetd(
      name: "Maple Residence",
      description:
          "A 3-bedroom modern house with a spacious backyard and garage, located in a prime suburban area.",
      image: "images/burger/Burger1.png",
      price: 350000.00,
      category: AssetCategoryd.house,
      features: [
        // Feature(name: "Solar Panels"),
        // Feature(name: "Hardwood Flooring"),
        // Feature(name: "Central Air Conditioning"),
      ],
    ),
    // Additional assets can follow the same structure

    Assetd(
      name: "Hillside Villa",
      description:
          "A luxurious villa offering panoramic views of the mountains, complete with a private pool and garden.",
      image: "images/burger/Burger1.png",
      price: 750000.00,
      category: AssetCategoryd.house,
      features: [
        // Feature(name: "Infinity Pool"),
        // Feature(name: "Smart Home Integration"),
        // Feature(name: "Wine Cellar"),
      ],
    ),

    Assetd(
      name: "Sunny Acres",
      description:
          "A 10-acre land ideal for commercial development, located near major transportation hubs.",
      image: "images/burger/Burger1.png",
      price: 500000.00,
      category: AssetCategoryd.land,
      features: [
        // Feature(name: "Proximity to Highways"),
        // Feature(name: "Flat Terrain"),
        // Feature(name: "Utilities Available"),
      ],
    ),
  ];

  // Getter to expose the list of assets to external classes while keeping _assets private
  List<Assetd> get assets => _assets;

  // Method to filter assets by category
  List<Assetd> getAssetsByCategory(AssetCategory category) {
    return _assets.where((asset) => asset.category == category).toList();
  }

  // Notify listeners if there are any updates (useful in state management)
  void updateAssets() {
    notifyListeners();
  }
}

// Asset model class
//defining properties for each asset
class Asset {
  final String name;
  final String description;
  final String image;
  final double value;
  final AssetCategory category;
  final List<Feature> features;

  Asset({
    required this.name,
    required this.description,
    required this.image,
    required this.value,
    required this.category,
    required this.features,
  });
}

// Enumeration for asset categories
enum AssetCategory { land, house }

// Feature model class to describe specific asset features
class Feature {
  final String name;

  Feature({required this.name});
}
