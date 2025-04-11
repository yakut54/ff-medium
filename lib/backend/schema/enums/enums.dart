import 'package:collection/collection.dart';

enum Role {
  user,
  administrator,
  developer,
}

enum Tier {
  premium,
  none,
  guest,
}

enum CardType {
  standart,
  long,
  big,
  expanded,
  adminStandart,
  adminLong,
  adminBig,
  adminExpanded,
}

enum DocumentType {
  onboarding,
  meditation,
  category,
  course,
  user,
}

enum ConverterGet {
  h,
  m,
  hm,
}

enum Attachment {
  audio,
  video,
  file,
}

enum SnackBarType {
  success,
  error,
}

enum ContentType {
  audio,
  video,
  doc,
  none,
}

enum HomePageBlockType {
  isNew,
  isPopural,
  isHits,
  isForYou,
}

enum TierButtonType {
  unselect,
  select,
  disabled,
}

enum HitsCardType {
  standart,
  advanced,
}

enum LoadingState {
  init,
  loading,
  loaded,
  failure,
}

enum TierInterval {
  Month,
  Week,
  Day,
  Hour,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (Role):
      return Role.values.deserialize(value) as T?;
    case (Tier):
      return Tier.values.deserialize(value) as T?;
    case (CardType):
      return CardType.values.deserialize(value) as T?;
    case (DocumentType):
      return DocumentType.values.deserialize(value) as T?;
    case (ConverterGet):
      return ConverterGet.values.deserialize(value) as T?;
    case (Attachment):
      return Attachment.values.deserialize(value) as T?;
    case (SnackBarType):
      return SnackBarType.values.deserialize(value) as T?;
    case (ContentType):
      return ContentType.values.deserialize(value) as T?;
    case (HomePageBlockType):
      return HomePageBlockType.values.deserialize(value) as T?;
    case (TierButtonType):
      return TierButtonType.values.deserialize(value) as T?;
    case (HitsCardType):
      return HitsCardType.values.deserialize(value) as T?;
    case (LoadingState):
      return LoadingState.values.deserialize(value) as T?;
    case (TierInterval):
      return TierInterval.values.deserialize(value) as T?;
    default:
      return null;
  }
}
