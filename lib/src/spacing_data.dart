import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'spacing_data.freezed.dart';

/// Defines the configuration of the overall visual [Spacing] for a
/// widget subtree within the app.
@freezed
abstract class SpacingData with _$SpacingData {
  /// Generates all [spaces] and [insets] from a given
  /// [normal] base space value.
  ///
  /// Several types of spaces are available :
  ///
  /// * [spaces] : `double` values
  /// * [insets] : `EdgeInsets` values
  ///
  /// The values follows this calculation :
  ///
  //  * extraSmall: `normal * 0.2`
  //  * small: `normal * 0.4`
  //  * semiSmall: `normal * 0.8`
  //  * semiBig: `normal * 1.5`
  //  * big: `normal * 2.5`
  //  * extraBig: `normal * 5.0`
  factory SpacingData.generate(double normal) {
    return SpacingData.fromSpaces(
      extraSmall: normal * 0.2,
      small: normal * 0.4,
      semiSmall: normal * 0.6,
      normal: normal,
      semiBig: normal * 1.5,
      big: normal * 2.5,
      extraBig: normal * 5.0,
      margin: normal * 2.4,
    );
  }

  /// Generates all [insets] from the given [spaces].
  factory SpacingData.fromSpaces({
    required double extraSmall,
    required double small,
    required double semiSmall,
    required double normal,
    required double semiBig,
    required double big,
    required double extraBig,
    required double margin,
  }) {
    final spaces = SizeSet(
      extraSmall: extraSmall,
      small: small,
      semiSmall: semiSmall,
      normal: normal,
      semiBig: semiBig,
      big: big,
      extraBig: extraBig,
      margin: margin,
    );
    return SpacingData(
      spaces: spaces,
      insets: SpacingInsetsData.fromSpaces(spaces),
    );
  }

  /// A spacing configuration from the given [spaces] and [insets].
  const factory SpacingData({
    required SpacingInsetsData insets,
    required SizeSet<double> spaces,
  }) = _SpacingData;
}

/// Defines the edge insets configuration.
///
/// A set of presets are available :
///
/// * [all] equivalent of `EdgeInsets.all(<size>)`
/// * [vertical] equivalent of `EdgeInsets.symmetric(vertical: <size>)`
/// * [horizontal] equivalent of `EdgeInsets.symmetric(horizontal: <size>)`
/// * [onlyRight] equivalent of `EdgeInsets.only(right: <size>)`
/// * [onlyLeft] equivalent of `EdgeInsets.only(left: <size>)`
/// * [onlyTop] equivalent of `EdgeInsets.only(top: <size>)`
/// * [onlyBottom] equivalent of `EdgeInsets.only(bottom: <size>)`
/// * [exceptRight] equivalent of `EdgeInsets.fromLTRB(<size>,<size>,0,<size>)`
/// * [exceptLeft] equivalent of `EdgeInsets.fromLTRB(0,<size>,<size>,<size>)`
/// * [exceptTop] equivalent of `EdgeInsets.fromLTRB(<size>,0,<size>,<size>)`
/// * [exceptBottom] equivalent of `EdgeInsets.fromLTRB(<size>,<size>,<size>,0)`
@freezed
abstract class SpacingInsetsData with _$SpacingInsetsData {
  factory SpacingInsetsData.fromSpaces(SizeSet<double> spaces) {
    return SpacingInsetsData(
      all: SizeSet(
        extraSmall: EdgeInsets.all(spaces.extraSmall),
        small: EdgeInsets.all(spaces.small),
        semiSmall: EdgeInsets.all(spaces.semiSmall),
        normal: EdgeInsets.all(spaces.normal),
        semiBig: EdgeInsets.all(spaces.semiBig),
        big: EdgeInsets.all(spaces.big),
        extraBig: EdgeInsets.all(spaces.extraBig),
        margin: EdgeInsets.all(spaces.margin),
      ),
      vertical: SizeSet(
        extraSmall: EdgeInsets.symmetric(vertical: spaces.extraSmall),
        small: EdgeInsets.symmetric(vertical: spaces.small),
        semiSmall: EdgeInsets.symmetric(vertical: spaces.semiSmall),
        normal: EdgeInsets.symmetric(vertical: spaces.normal),
        semiBig: EdgeInsets.symmetric(vertical: spaces.semiBig),
        big: EdgeInsets.symmetric(vertical: spaces.big),
        extraBig: EdgeInsets.symmetric(vertical: spaces.big),
        margin: EdgeInsets.symmetric(vertical: spaces.margin),
      ),
      horizontal: SizeSet(
        extraSmall: EdgeInsets.symmetric(horizontal: spaces.extraSmall),
        small: EdgeInsets.symmetric(horizontal: spaces.small),
        semiSmall: EdgeInsets.symmetric(horizontal: spaces.semiSmall),
        normal: EdgeInsets.symmetric(horizontal: spaces.normal),
        semiBig: EdgeInsets.symmetric(horizontal: spaces.semiBig),
        big: EdgeInsets.symmetric(horizontal: spaces.big),
        extraBig: EdgeInsets.symmetric(horizontal: spaces.extraBig),
        margin: EdgeInsets.symmetric(horizontal: spaces.margin),
      ),
      onlyRight: SizeSet(
        extraSmall: EdgeInsets.only(right: spaces.extraSmall),
        small: EdgeInsets.only(right: spaces.small),
        semiSmall: EdgeInsets.only(right: spaces.semiSmall),
        normal: EdgeInsets.only(right: spaces.normal),
        semiBig: EdgeInsets.only(right: spaces.semiBig),
        big: EdgeInsets.only(right: spaces.big),
        extraBig: EdgeInsets.only(right: spaces.extraBig),
        margin: EdgeInsets.only(right: spaces.margin),
      ),
      onlyLeft: SizeSet(
        extraSmall: EdgeInsets.only(left: spaces.extraSmall),
        small: EdgeInsets.only(left: spaces.small),
        semiSmall: EdgeInsets.only(left: spaces.semiSmall),
        normal: EdgeInsets.only(left: spaces.normal),
        semiBig: EdgeInsets.only(left: spaces.semiBig),
        big: EdgeInsets.only(left: spaces.big),
        extraBig: EdgeInsets.only(left: spaces.extraBig),
        margin: EdgeInsets.only(left: spaces.margin),
      ),
      onlyBottom: SizeSet(
        extraSmall: EdgeInsets.only(bottom: spaces.extraSmall),
        small: EdgeInsets.only(bottom: spaces.small),
        semiSmall: EdgeInsets.only(bottom: spaces.semiSmall),
        normal: EdgeInsets.only(bottom: spaces.normal),
        semiBig: EdgeInsets.only(bottom: spaces.semiBig),
        big: EdgeInsets.only(bottom: spaces.big),
        extraBig: EdgeInsets.only(bottom: spaces.extraBig),
        margin: EdgeInsets.only(bottom: spaces.margin),
      ),
      onlyTop: SizeSet(
        extraSmall: EdgeInsets.only(top: spaces.extraSmall),
        small: EdgeInsets.only(top: spaces.small),
        semiSmall: EdgeInsets.only(top: spaces.semiSmall),
        normal: EdgeInsets.only(top: spaces.normal),
        semiBig: EdgeInsets.only(top: spaces.semiBig),
        big: EdgeInsets.only(top: spaces.big),
        extraBig: EdgeInsets.only(top: spaces.extraBig),
        margin: EdgeInsets.only(top: spaces.margin),
      ),
      exceptBottom: SizeSet(
        extraSmall: EdgeInsets.fromLTRB(
          spaces.extraSmall,
          spaces.extraSmall,
          spaces.extraSmall,
          0,
        ),
        small: EdgeInsets.fromLTRB(
          spaces.small,
          spaces.small,
          spaces.small,
          0,
        ),
        semiSmall: EdgeInsets.fromLTRB(
          spaces.semiSmall,
          spaces.semiSmall,
          spaces.semiSmall,
          0,
        ),
        normal: EdgeInsets.fromLTRB(
          spaces.normal,
          spaces.normal,
          spaces.normal,
          0,
        ),
        semiBig: EdgeInsets.fromLTRB(
          spaces.semiBig,
          spaces.semiBig,
          spaces.semiBig,
          0,
        ),
        big: EdgeInsets.fromLTRB(
          spaces.big,
          spaces.big,
          spaces.big,
          0,
        ),
        extraBig: EdgeInsets.fromLTRB(
          spaces.extraBig,
          spaces.extraBig,
          spaces.extraBig,
          0,
        ),
        margin: EdgeInsets.fromLTRB(
          spaces.margin,
          spaces.margin,
          spaces.margin,
          0,
        ),
      ),
      exceptLeft: SizeSet(
        extraSmall: EdgeInsets.fromLTRB(
          0,
          spaces.extraSmall,
          spaces.extraSmall,
          spaces.extraSmall,
        ),
        small: EdgeInsets.fromLTRB(
          0,
          spaces.small,
          spaces.small,
          spaces.small,
        ),
        semiSmall: EdgeInsets.fromLTRB(
          0,
          spaces.semiSmall,
          spaces.semiSmall,
          spaces.semiSmall,
        ),
        normal: EdgeInsets.fromLTRB(
          0,
          spaces.normal,
          spaces.normal,
          spaces.normal,
        ),
        semiBig: EdgeInsets.fromLTRB(
          0,
          spaces.semiBig,
          spaces.semiBig,
          spaces.semiBig,
        ),
        big: EdgeInsets.fromLTRB(
          0,
          spaces.big,
          spaces.big,
          spaces.big,
        ),
        extraBig: EdgeInsets.fromLTRB(
          0,
          spaces.extraBig,
          spaces.extraBig,
          spaces.extraBig,
        ),
        margin: EdgeInsets.fromLTRB(
          0,
          spaces.margin,
          spaces.margin,
          spaces.margin,
        ),
      ),
      exceptRight: SizeSet(
        extraSmall: EdgeInsets.fromLTRB(
          spaces.extraSmall,
          spaces.extraSmall,
          0,
          spaces.extraSmall,
        ),
        small: EdgeInsets.fromLTRB(
          spaces.small,
          spaces.small,
          0,
          spaces.small,
        ),
        semiSmall: EdgeInsets.fromLTRB(
          spaces.semiSmall,
          spaces.semiSmall,
          0,
          spaces.semiSmall,
        ),
        normal: EdgeInsets.fromLTRB(
          spaces.normal,
          spaces.normal,
          0,
          spaces.normal,
        ),
        semiBig: EdgeInsets.fromLTRB(
          spaces.semiBig,
          spaces.semiBig,
          0,
          spaces.semiBig,
        ),
        big: EdgeInsets.fromLTRB(
          spaces.big,
          spaces.big,
          0,
          spaces.big,
        ),
        extraBig: EdgeInsets.fromLTRB(
          spaces.extraBig,
          spaces.extraBig,
          0,
          spaces.extraBig,
        ),
        margin: EdgeInsets.fromLTRB(
          spaces.margin,
          spaces.margin,
          0,
          spaces.margin,
        ),
      ),
      exceptTop: SizeSet(
        extraSmall: EdgeInsets.fromLTRB(
          spaces.extraSmall,
          0,
          spaces.extraSmall,
          spaces.extraSmall,
        ),
        small: EdgeInsets.fromLTRB(
          spaces.small,
          0,
          spaces.small,
          spaces.small,
        ),
        semiSmall: EdgeInsets.fromLTRB(
          spaces.semiSmall,
          0,
          spaces.semiSmall,
          spaces.semiSmall,
        ),
        normal: EdgeInsets.fromLTRB(
          spaces.normal,
          0,
          spaces.normal,
          spaces.normal,
        ),
        semiBig: EdgeInsets.fromLTRB(
          spaces.semiBig,
          0,
          spaces.semiBig,
          spaces.semiBig,
        ),
        big: EdgeInsets.fromLTRB(
          spaces.big,
          0,
          spaces.big,
          spaces.big,
        ),
        extraBig: EdgeInsets.fromLTRB(
          spaces.extraBig,
          0,
          spaces.extraBig,
          spaces.extraBig,
        ),
        margin: EdgeInsets.fromLTRB(
          spaces.margin,
          0,
          spaces.margin,
          spaces.margin,
        ),
      ),
    );
  }

  const factory SpacingInsetsData({
    required SizeSet<EdgeInsets> all,
    required SizeSet<EdgeInsets> horizontal,
    required SizeSet<EdgeInsets> vertical,
    required SizeSet<EdgeInsets> onlyRight,
    required SizeSet<EdgeInsets> onlyTop,
    required SizeSet<EdgeInsets> onlyBottom,
    required SizeSet<EdgeInsets> onlyLeft,
    required SizeSet<EdgeInsets> exceptLeft,
    required SizeSet<EdgeInsets> exceptRight,
    required SizeSet<EdgeInsets> exceptTop,
    required SizeSet<EdgeInsets> exceptBottom,
  }) = _SpacingInsetsData;
}

/// A set of size variants, from [extraSmall] to [extraBig]
@freezed
abstract class SizeSet<T> with _$SizeSet<T> {
  /// The user is currently updating the login form.
  const factory SizeSet({
    required T extraSmall,
    required T small,
    required T semiSmall,
    required T normal,
    required T semiBig,
    required T big,
    required T extraBig,
    required T margin,
  }) = _SizeSet;
}

enum SpaceSize {
  extraSmall,
  small,
  semiSmall,
  normal,
  semiBig,
  big,
  extraBig,
  margin,
}
