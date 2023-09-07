/// Default list of icons that are rendered in the bottom row, indicating
/// the attributes available to modify.
///
/// These icons come bundled with the library and the paths below
/// are indicative of that.
const List<String> defaultAttributeIcons = [
  "assets/attributeicons/hair.svg",
  "assets/attributeicons/haircolor.svg",
  "assets/attributeicons/beard.svg",
  "assets/attributeicons/beardcolor.svg",
  "assets/attributeicons/outfit.svg",
  "assets/attributeicons/outfitcolor.svg",
  "assets/attributeicons/eyes.svg",
  "assets/attributeicons/eyebrow.svg",
  "assets/attributeicons/mouth.svg",
  "assets/attributeicons/skin.svg",
  "assets/attributeicons/accessories.svg",
];

/// Default list of titles that are rendered at the top of the widget, indicating
/// which attribute the user is customizing.
const List<String> defaultAttributeTitles = [
  "Hairstyle",
  "Hair Colour",
  "Facial Hair",
  "Facial Hair Colour",
  "Outfit",
  "Outfit Colour",
  "Eyes",
  "Eyebrows",
  "Mouth",
  "Skin",
  "Accessories"
];

/// List of keys used internally by this library to dereference
/// attributes and their values in the business logic.
///
/// This aspect is not modifiable by you at any stage of the app.
const List<String> attributeKeys = [
  "topType",
  "hairColor",
  "facialHairType",
  "facialHairColor",
  "clotheType",
  "clotheColor",
  "eyeType",
  "eyebrowType",
  "mouthType",
  "skinColor",
  "accessoriesType",
];
