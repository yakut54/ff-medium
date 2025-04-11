import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/firebase_auth/auth_util.dart';

bool isTextLessThen(
  String? text,
  int length,
) {
  return (text ?? '').replaceAll(' ', '').length < length;
}

String? tierSecondaryCEValidator(
  String name,
  String amount,
) {
  String e = '';

  if (name.isEmpty) e += 'Введите название подписки\n';
  if (amount.isEmpty)
    e += 'Введите стоимость\n';
  else if (int.parse(amount) < 1) e += 'Стоимость не может быть равна нулю\n';

  return e.isEmpty ? null : e;
}

String? tierPrimaryCEValidator(
  String name,
  String amount,
  bool switcher,
  String banner,
  String period,
) {
  String e = '';

  if (name.isEmpty) e += 'Введите название подписки\n';
  if (amount.isEmpty)
    e += 'Введите стоимость\n';
  else if (int.parse(amount) < 1) e += 'Стоимость не может быть равен нулю\n';
  if (period.isEmpty)
    e += 'Введите период\n';
  else if (int.parse(period) < 1) e += 'Период не может быть равен нулю\n';
  if (switcher && banner.isEmpty) e += 'Введите текст баннера\n';

  return e.isEmpty ? null : e;
}

int tiersGetTrialPeriod(TierStruct tier) {
  final int hours = tier.period;
  final int days = hours ~/ 24;
  final int weeks = days ~/ 7;
  final int months = days ~/ 30;

  if (months > 0) {
    return weeks;
  } else if (weeks > 0) {
    return days;
  }
  return hours;
}

String tiersGetTextEnding(TierStruct tier) {
  final period = tier.period;
  final interval = tier.interval;

  String text = '';

  bool isLessThenTen(int value) => value % 10 == 1 && value % 100 != 11;

  bool isALittle(int value) => (value % 10 >= 2 &&
      value % 10 <= 4 &&
      (value % 100 < 10 || value % 100 >= 20));

  if (interval == TierInterval.Day) {
    if (isLessThenTen(period)) {
      text = 'день';
    } else if (isALittle(period)) {
      text = 'дня';
    } else {
      text = 'дней';
    }
  } else if (interval == TierInterval.Month) {
    if (period > 0) {
      if (isLessThenTen(period)) {
        text = 'месяц';
      } else if (isALittle(period)) {
        text = 'месяца';
      } else {
        text = 'месяцев';
      }
    }
  } else if (interval == TierInterval.Week) {
    if (period > 0) {
      if (isLessThenTen(period)) {
        text = 'неделя';
      } else if (isALittle(period)) {
        text = 'недели';
      } else {
        text = 'недель';
      }
    }
  } else {
    if (period > 0) {
      if (isLessThenTen(period)) {
        text = 'час';
      } else if (isALittle(period)) {
        text = 'часа';
      } else {
        text = 'часов';
      }
    }
  }
  return text;
}

String tiersGetTrialTextEnding(TierStruct tier) {
  final hours = tier.period;
  final int days = hours ~/ 24;
  final int weeks = days ~/ 7;
  final int months = days ~/ 30;

  String text = '';

  bool isLessThenTen(int value) => value % 10 == 1 && value % 100 != 11;

  bool isALittle(int value) => (value % 10 >= 2 &&
      value % 10 <= 4 &&
      (value % 100 < 10 || value % 100 >= 20));

  if (months > 0) {
    if (isLessThenTen(weeks))
      text = 'неделя';
    else if (isALittle(weeks)) {
      text = 'недели';
    } else {
      text = 'недель';
    }
  } else if (weeks > 0) {
    if (isLessThenTen(days))
      text = 'день';
    else if (isALittle(days)) {
      text = 'дня';
    } else {
      text = 'дней';
    }
  } else if (days > 0) {
    if (isLessThenTen(hours))
      text = 'час';
    else if (isALittle(hours)) {
      text = 'часа';
    } else {
      text = 'часов';
    }
  }
  return text;
}

String tiersGetInitTextEnding(TierStruct tier) {
  final period = tier.initPeriod;
  final interval = tier.initInterval;

  String text = '';

  bool isLessThenTen(int value) => value % 10 == 1 && value % 100 != 11;

  bool isALittle(int value) => (value % 10 >= 2 &&
      value % 10 <= 4 &&
      (value % 100 < 10 || value % 100 >= 20));

  if (interval == TierInterval.Day) {
    if (isLessThenTen(period)) {
      text = 'день';
    } else if (isALittle(period)) {
      text = 'дня';
    } else {
      text = 'дней';
    }
  } else if (interval == TierInterval.Month) {
    if (period > 0) {
      if (isLessThenTen(period)) {
        text = 'месяц';
      } else if (isALittle(period)) {
        text = 'месяца';
      } else {
        text = 'месяцев';
      }
    }
  } else if (interval == TierInterval.Week) {
    if (period > 0) {
      if (isLessThenTen(period)) {
        text = 'неделя';
      } else if (isALittle(period)) {
        text = 'недели';
      } else {
        text = 'недель';
      }
    }
  } else {
    if (period > 0) {
      if (isLessThenTen(period)) {
        text = 'час';
      } else if (isALittle(period)) {
        text = 'часа';
      } else {
        text = 'часов';
      }
    }
  }
  return text;
}

List<CoursesRecord> homeGetCoursesForYou(
  List<CoursesRecord>? courseDocs,
  bool? shuffle,
) {
  if (courseDocs == null) return [];

  List<CoursesRecord> _filteredCourses = [];
  currentUserDocument!.onboardingList.forEach((element) => _filteredCourses = [
        ..._filteredCourses,
        ...courseDocs.where((doc) => doc.onboardings.contains(element)).toList()
      ]);
  _filteredCourses = _filteredCourses.toSet().toList();

  if (shuffle ?? false) _filteredCourses.shuffle();

  return _filteredCourses;
}

Tier getSubscriptionFromReference(DocumentReference tierReference) {
  final tier = tierReference.id;
  switch (tier) {
    case 'premium':
      return Tier.premium;
    case 'none':
      return Tier.none;
    default:
      return Tier.none;
  }
}

String? ceLessonValidator(
  String name,
  LessonStruct? lesson,
  String hours,
  String minutes,
  bool ignoreDoc,
  Attachment? attachment,
  bool isLocalAttachmentUploaded,
  String pages,
) {
  String e = '';

  if (name.isEmpty) {
    e += '- "Название занятия" не может быть пустым\n';
  }
  if (attachment != null) {
    if (attachment != Attachment.file) {
      if ((hours == '0' || hours == '00' || hours.isEmpty) &&
          (minutes == '0' || minutes == '00')) {
        e += '- Время не может быть нулевым\n';
      }
    } else {
      if (pages.isEmpty) e += '- Укажите кол-во страниц\n';
      if (int.parse(pages) == 0) {
        e += '- Количество страниц не может быть нулевым\n';
      }
      if (int.parse(pages) > 500) {
        e += '- Максимум 500 страниц\n';
      }
    }
  }
  if (lesson == null) {
    if (!isLocalAttachmentUploaded) {
      e += '- Необходимо добавить файл занятия\n';
    }
  } else {
    if (ignoreDoc && !isLocalAttachmentUploaded) {
      e += '- Необходимо добавить файл занятия';
    }
    if (getContentType(lesson) == ContentType.doc) {
      if (pages.isEmpty) e += '- Укажите кол-во страниц\n';
      if (int.parse(pages) == 0) {
        e += '- Количество страниц не может быть нулевым\n';
      }
      if (int.parse(pages) > 500) {
        e += '- Максимум 500 страниц\n';
      }
    } else {
      if ((hours == '0' || hours == '00' || hours.isEmpty) &&
          (minutes == '0' || minutes == '00')) {
        e += '- Время не может быть нулевым\n';
      }
      if (int.parse(pages) > 500) {
        e += '- Максимум 500 страниц\n';
      }
    }
  }
  return e.isEmpty ? null : e;
}

List<HitsRecord> hitsSortByTime(List<HitsRecord> hitsDocs) {
  DateTime? createdTimeA;
  DateTime? createdTimeB;

  if (hitsDocs.length > 1) {
    hitsDocs.sort((a, b) {
      createdTimeA = a.modifiedTime ?? a.createdTime;
      createdTimeB = b.modifiedTime ?? b.createdTime;
      return createdTimeB!.compareTo(createdTimeA!);
    });
  }

  return hitsDocs;
}

String convertVideoToString(String videoPath) {
  return videoPath;
}

String? ceAdditionalDocValidator(
  String name,
  LessonStruct? lesson,
  bool ignoreDoc,
  bool isLocalAttachmentUploaded,
  String pages,
) {
  String e = '';

  if (name.isEmpty) {
    e += '- Укажите название\n';
  }
  if (pages.isEmpty) e += '- Укажите кол-во страниц\n';
  if (int.parse(pages) == 0) {
    e += '- Количество страниц не может быть нулевым\n';
  }
  if (int.parse(pages) > 500) {
    e += '- Максимум 500 страниц\n';
  }

  if (lesson == null) {
    if (!isLocalAttachmentUploaded) {
      e += '- Необходимо добавить файл доп. материала\n';
    }
  } else {
    if (ignoreDoc && !isLocalAttachmentUploaded) {
      e += '- Необходимо добавить файл доп. материала';
    }
  }
  return e.isEmpty ? null : e;
}

List<String> convertOnboardingNullableListString(
    List<DocumentReference>? list) {
  List<String> _list = [];

  if (list != null && list.isNotEmpty) {
    list.forEach((element) => _list.add(element.id));
  }
  return _list;
}

String getMonthTextsEnding(int? months) {
  if (months == 0 || months == null) return '';
  if (months % 10 == 1 && months % 100 != 11) {
    return 'месяц';
  } else if (months % 10 >= 2 &&
      months % 10 <= 4 &&
      (months % 100 < 10 || months % 100 >= 20)) {
    return 'месяца';
  }
  return 'месяцев';
}

String? meditationCEValidator(
  String name,
  List<String> categories,
  List<LessonStruct> lessons,
  String photoUrl,
  List<String> onboardings,
) {
  String e = '';
  if (name.isEmpty) {
    e += '- Поле "Название" не может быть пустым\n';
  }
  if (photoUrl.isEmpty) {
    e += '- Обложка не загружена\n';
  }
  if (categories.isEmpty) {
    e += ('- Категории не выбраны\n');
  }
  if (lessons.isEmpty) {
    e += ('- Список занятий пуст\n');
  }
  if (lessons.length == 1 && lessons.first.isAdditional) {
    e += ('- Список занятий не может состоять только из доп. файла\n');
  }
  if (lessons.length > 1) {
    int count = 0;
    for (LessonStruct item in lessons) {
      if (!item.isAdditional) {
        count++;
      }
    }
    if (count > 1) {
      e += ('- Должно быть не более одного занятия\n');
    }
  }
  return e.isEmpty ? null : e;
}

String getPageTextsEnding(
  String pages,
  bool withPage,
) {
  if (pages.isEmpty) return '';

  int _pages = int.parse(pages);

  if (_pages % 10 == 1 && _pages % 100 != 11) {
    return '${withPage ? '$_pages ' : ''}страница';
  } else if (_pages % 10 >= 2 &&
      _pages % 10 <= 4 &&
      (_pages % 100 < 10 || _pages % 100 >= 20)) {
    return '${withPage ? '$_pages ' : ''}страницы';
  }
  return '${withPage ? '$_pages ' : ''}страниц';
}

List<String> convertCategoriesNullableListString(
    List<DocumentReference>? list) {
  List<String> _list = [];

  if (list != null && list.isNotEmpty) {
    list.forEach((element) => _list.add(element.id));
  }
  return _list;
}

bool? recaptchaKeys() {
  // reCAPTCHA v3 site key
  // 6Lf-x5gpAAAAAPt56XpJlS0UFHxCn0VCjqqsKTw2
  // reCAPTCHA v3 secret key
  // 6Lf-x5gpAAAAAMI2GilbjrmZ258_lCaLpFvi-ZCu

  // reCAPTCHA Enterprise site key
  // 6LeKLZgpAAAAAM4pYAVBnsIFoVcjhBfI4FgniGq1
  return null;
}

bool onboardingIsEmpty(List<DocumentReference> onboardingList) {
  return onboardingList.isEmpty;
}

List<DocumentReference> getOnboardingReferencesFromIDs(List<String> ids) {
  final db = FirebaseFirestore.instance;
  List<DocumentReference> list = [];
  ids.forEach((element) => list.add(db.doc('onboardings/$element')));
  return list;
}

int coursesCountVideoInLessons(List<LessonStruct> lessons) {
  int counter = 0;
  lessons.forEach((lesson) => lesson.video != '' ? counter++ : counter);
  return counter;
}

int coursesCountPdfInLessons(List<LessonStruct> lessons) {
  int counter = 0;
  lessons.forEach((lesson) => lesson.doc != '' ? counter++ : counter);
  return counter;
}

List<CoursesRecord> homeGetNewCourses(List<CoursesRecord>? coursesDocs) {
  if (coursesDocs == null) return [];

  coursesDocs = coursesDocs.where((doc) => doc.isNew).toList();

  if (coursesDocs.length > 1) {
    DateTime? createdTimeA;
    DateTime? createdTimeB;
    coursesDocs.sort((a, b) {
      createdTimeA = a.modifiedTime ?? a.createdTime;
      createdTimeB = b.modifiedTime ?? b.createdTime;
      return createdTimeB!.compareTo(createdTimeA!);
    });
  }
  return coursesDocs;
}

String convertMillisToHM(
  int millis,
  ConverterGet converterGet,
) {
  if (millis < 0) {
    throw ArgumentError('Milliseconds must be non-negative');
  }

  Duration duration = Duration(milliseconds: millis);
  String result = '';

  if (duration.inHours > 0) {
    result +=
        '${duration.inHours} ${_pluralize(TimeType.hours, duration.inHours)} ';
  }

  if (duration.inMinutes % 60 > 0) {
    result +=
        '${duration.inMinutes % 60} ${_pluralize(TimeType.minutes, duration.inMinutes % 60)}';
  }

  switch (converterGet) {
    case ConverterGet.h:
      return '${duration.inHours}';
    case ConverterGet.m:
      return '${duration.inMinutes % 60}';
    case ConverterGet.hm:
      return result.trim();
  }
}

String _pluralize(TimeType timeType, int value) => isOne(value)
    ? timeType.time[0]
    : isTwo(value)
        ? timeType.time[1]
        : timeType.time[2];

bool isOne(int value) => value % 10 == 1 && value % 100 != 11;

bool isTwo(int value) =>
    value % 10 >= 2 &&
    value % 10 <= 4 &&
    (value % 100 < 10 || value % 100 >= 20);

enum TimeType {
  hours(['час', 'часа', 'часов']),
  minutes(['минута', 'минуты', 'минут']);

  final List<String> time;
  const TimeType(this.time);
}

List<CoursesRecord> homeGetPopularCourses(
  List<CoursesRecord>? coursesDocs,
  bool? sortByTime,
  bool? shuffle,
) {
  if (coursesDocs == null) return [];

  if (shuffle! && sortByTime!)
    throw Exception(
        'shuffle == true && sortByTime == true. You have to choose one thing!');

  coursesDocs = coursesDocs.where((doc) => doc.isPopural).toList();

  if (sortByTime ?? false) {
    if (coursesDocs.length > 1) {
      DateTime? createdTimeA;
      DateTime? createdTimeB;
      coursesDocs.sort((a, b) {
        createdTimeA = a.modifiedTime ?? a.createdTime;
        createdTimeB = b.modifiedTime ?? b.createdTime;
        return createdTimeB!.compareTo(createdTimeA!);
      });
    }
  }

  if (shuffle) coursesDocs.shuffle();
  return coursesDocs;
}

String convertAudioToString(String audioPath) {
  return audioPath;
}

List<LessonStruct> lessonsAdditionalDoc(
  String? uploadedFile,
  LessonStruct? lesson,
  String? name,
  List<LessonStruct> lessonList,
  String? pages,
) {
  bool pathIsNotEmpty(String? file) => file != null && file != '';

  final _doc = pathIsNotEmpty(uploadedFile)
      ? uploadedFile
      : pathIsNotEmpty(lesson?.doc)
          ? lesson!.doc
          : null;
  final _newLesson = LessonStruct(
      isAdditional: true,
      name: name,
      doc: _doc,
      pages: int.parse(pages ?? '1'));

  if (lesson == null) {
    lessonList.add(_newLesson);
  } else {
    final _index = lessonList.indexOf(lesson);
    lessonList[_index] = _newLesson;
  }
  return lessonList;
}

bool hasVideo(String? videoPath) {
  return (videoPath ?? '').isNotEmpty;
}

int convertHMToMillis(
  String hours,
  String minutes,
) {
  return int.parse(hours.isEmpty ? '0' : hours) * 3600000 +
      int.parse(minutes.isEmpty ? '0' : minutes) * 60000;
}

List<DocumentReference> getCategoryReferencesFromIDs(List<String> ids) {
  final db = FirebaseFirestore.instance;
  List<DocumentReference> list = [];
  ids.forEach((element) => list.add(db.doc('categories/$element')));
  return list;
}

ContentType getNextContentType(
  List<LessonStruct> lessons,
  DocumentReference userRef,
) {
  for (LessonStruct l in lessons) {
    if (!l.views.contains(userRef)) {
      return getContentType(l);
    }
  }
  return getContentType(lessons.first);
}

String? hitsCEValidator(
  String name,
  String photoUrl,
  String link,
  bool isAvalible,
) {
  String e = '';
  // if (name.isEmpty) {
  //   e += '- Поле "Описание" не может быть пустым\n';
  // }
  if (photoUrl.isEmpty) {
    e += '- Обложка не загружена\n';
  }
  final regex = RegExp(
      r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)');
  if (link.isEmpty) {
    e += ('- Введите URL-адрес\n');
  } else if (!regex.hasMatch(link)) {
    e += '- Некорректная ссылка\n';
  } else if (!isAvalible) {
    e += '- Нет ответа от ресурса по ссылке\n';
  }
  return e.isEmpty ? null : e;
}

bool hasAudio(String? audioPath) {
  return (audioPath ?? '').isNotEmpty;
}

List<CoursesRecord> coursesSortByTime(List<CoursesRecord> coursesDocs) {
  DateTime? createdTimeA;
  DateTime? createdTimeB;

  if (coursesDocs.length > 1) {
    coursesDocs.sort((a, b) {
      createdTimeA = a.modifiedTime ?? a.createdTime;
      createdTimeB = b.modifiedTime ?? b.createdTime;
      return createdTimeB!.compareTo(createdTimeA!);
    });
  }

  return coursesDocs;
}

List<LessonStruct> lessonsCreateList(
  String? uploadedAudio,
  String? uploadedVideo,
  String? uploadedFile,
  LessonStruct? lesson,
  String? name,
  String durationHours,
  String durationMinutes,
  List<LessonStruct> lessonList,
  String pages,
) {
  bool pathIsNotEmpty(String? file) => file != null && file != '';

  final _audio = pathIsNotEmpty(uploadedAudio)
      ? uploadedAudio
      : pathIsNotEmpty(lesson?.audio) &&
              !pathIsNotEmpty(uploadedVideo) &&
              !pathIsNotEmpty(uploadedFile)
          ? lesson!.audio
          : null;
  final _video = pathIsNotEmpty(uploadedVideo)
      ? uploadedVideo
      : pathIsNotEmpty(lesson?.video) &&
              !pathIsNotEmpty(uploadedAudio) &&
              !pathIsNotEmpty(uploadedFile)
          ? lesson!.video
          : null;
  final _doc = pathIsNotEmpty(uploadedFile)
      ? uploadedFile
      : pathIsNotEmpty(lesson?.doc) &&
              !pathIsNotEmpty(uploadedVideo) &&
              !pathIsNotEmpty(uploadedAudio)
          ? lesson!.doc
          : null;

  final _duration = _doc == null
      ? convertHMToMillis(durationHours.isEmpty ? '0' : durationHours,
          durationMinutes.isEmpty ? '15' : durationMinutes)
      : null;

  final _pages = int.tryParse(pages);
  final _newLesson = LessonStruct(
      name: name,
      duration: _duration,
      audio: _audio,
      video: _video,
      doc: _doc,
      pages: _pages);

  if (lesson == null) {
    lessonList.add(_newLesson);
  } else {
    final _index = lessonList.indexOf(lesson);
    lessonList[_index] = _newLesson;
  }
  return lessonList;
}

List<LessonStruct> lessonReorderItems(
  int oldIndex,
  int newIndex,
  List<LessonStruct> list,
) {
  // If the item is being moved to a position further down the list
  // (i.e., to a higher index), decrement the newIndex by 1.
  // This adjustment is needed because removing an item from its original
  // position will shift the indices of all subsequent items.
  if (oldIndex < newIndex) {
    newIndex -= 1;
  }

  // Remove the item from its original position in the list and store
  // it in the 'item' variable.
  final item = list.removeAt(oldIndex);

  // Insert the removed item into its new position in the list.
  list.insert(newIndex, item);

  // Return the modified list.
  return list;
}

bool additionalIsFirst(List<LessonStruct>? lessons) {
  if (lessons?.first.hasIsAdditional() ?? false) {
    return lessons?.first.isAdditional ?? false;
  }
  return false;
}

bool hasLesson(List<LessonStruct>? lessons) {
  for (LessonStruct item in lessons ?? []) {
    if (!item.hasIsAdditional() || !item.isAdditional) {
      return true;
    }
  }
  return false;
}

List<MeditationsRecord> meditationsSortByTime(
    List<MeditationsRecord> meditationsDocs) {
  if (meditationsDocs.length > 1) {
    DateTime? createdTimeA;
    DateTime? createdTimeB;
    meditationsDocs.sort((a, b) {
      createdTimeA = a.modifiedTime ?? a.createdTime;
      createdTimeB = b.modifiedTime ?? b.createdTime;
      return createdTimeB!.compareTo(createdTimeA!);
    });
  }

  return meditationsDocs;
}

int coursesCountAudioInLessons(List<LessonStruct> lessons) {
  int counter = 0;
  lessons.forEach((lesson) => lesson.audio != '' ? counter++ : counter);
  return counter;
}

DocumentReference homeGetLastPlayMeditationReference(String documentID) {
  final db = FirebaseFirestore.instance;
  return db.doc('meditations/$documentID');
}

ContentType getContentType(LessonStruct lesson) {
  bool _isExist(String? content) {
    return content != null && content.isNotEmpty;
  }

  if (_isExist(lesson.audio)) {
    return ContentType.audio;
  } else if (_isExist(lesson.video)) {
    return ContentType.video;
  } else if (_isExist(lesson.doc)) {
    return ContentType.doc;
  }
  return ContentType.none;
}

DocumentReference buildMeditationRef(String documentID) {
  return FirebaseFirestore.instance.doc('meditations/$documentID');
}

List<MeditationsRecord>? homeGetPodcastMeditatation(
  List<MeditationsRecord>? meditationsDocs,
  bool? sortByTime,
) {
  if (meditationsDocs == null) return [];

  meditationsDocs = meditationsDocs.where((doc) => doc.isPodcast).toList();

  if (sortByTime ?? false) {
    if (meditationsDocs.length > 1) {
      DateTime? createdTimeA;
      DateTime? createdTimeB;
      meditationsDocs.sort((a, b) {
        createdTimeA = a.modifiedTime ?? a.createdTime;
        createdTimeB = b.modifiedTime ?? b.createdTime;
        return createdTimeB!.compareTo(createdTimeA!);
      });
    }
  }

  return meditationsDocs;
}

int userViews(
  List<LessonStruct> lessons,
  DocumentReference userRef,
) {
  int counter = 0;
  lessons.forEach((lesson) {
    if (lesson.views.contains(userRef)) {
      counter++;
    }
  });
  return counter;
}

List<CoursesRecord> coursesScreenFilter(
  List<String>? categories,
  bool isNew,
  bool isPopular,
  List<CoursesRecord> courses,
  bool withoutCategory,
) {
  // Filter by categories
  List<CoursesRecord> filteredCourses = courses;

  // Filter by categories
  if ((categories ?? []).isNotEmpty) {
    filteredCourses = filteredCourses.where((course) {
      List<String> courseCategoriesNames =
          course.categories.map((category) => category.id).toList();
      return courseCategoriesNames
          .any((courseCategory) => categories!.contains(courseCategory));
    }).toList();
  }

  // Filter by null-categories
  if (withoutCategory) {
    filteredCourses = filteredCourses
        .where((course) => !course.hasCategories() || course.categories.isEmpty)
        .toList();
  }
  // Filter by isNew
  if (isNew) {
    filteredCourses = filteredCourses.where((course) => course.isNew).toList();
  }

  // Filter by isPopular
  if (isPopular) {
    filteredCourses =
        filteredCourses.where((course) => course.isPopural).toList();
  }

  // Remove duplicates
  filteredCourses = filteredCourses.toSet().toList();

  return filteredCourses;
}

String getDocTextsEnding(int number) {
  if (number % 10 == 1 && number % 100 != 11) {
    return '$number текст';
  } else if (number % 10 >= 2 &&
      number % 10 <= 4 &&
      (number % 100 < 10 || number % 100 >= 20)) {
    return '$number текста';
  }
  return '$number текстов';
}

LessonStruct getNextLesson(
  List<LessonStruct> lessons,
  DocumentReference userRef,
) {
  for (LessonStruct l in lessons) {
    if (!l.views.contains(userRef)) {
      return l;
    }
  }
  return lessons.first;
}

int lessonsIndexOf(
  LessonStruct lesson,
  List<LessonStruct> lessons,
) {
  return lessons.indexOf(lesson);
}

List<MeditationsRecord> meditationsScreenFilter(
  List<String>? categories,
  bool isNew,
  bool isPopular,
  List<MeditationsRecord> meditations,
  bool isPodcast,
  bool additionalMaterials,
  bool withoutCategory,
) {
  // Filter by categories
  List<MeditationsRecord> filteredMeditations = meditations;

  // Filter by categories
  if ((categories ?? []).isNotEmpty) {
    filteredMeditations = filteredMeditations.where((meditation) {
      List<String> meditationCategoriesNames =
          meditation.categories.map((category) => category.id).toList();
      return meditationCategoriesNames.any(
          (meditationCategory) => categories!.contains(meditationCategory));
    }).toList();
  }

  // Filter by null-categories

  if (withoutCategory) {
    filteredMeditations = filteredMeditations
        .where((meditation) => meditation.categories.isEmpty)
        .toList();
  }

  // Filter by isNew
  if (isNew) {
    filteredMeditations =
        filteredMeditations.where((meditation) => meditation.isNew).toList();
  }

  // Filter by isPopular
  if (isPopular) {
    filteredMeditations = filteredMeditations
        .where((meditation) => meditation.isPopular)
        .toList();
  }

  // Filter by isPodcast
  if (isPodcast) {
    filteredMeditations = filteredMeditations
        .where((meditation) => meditation.isPodcast)
        .toList();
  }

  // Filter by additionalMaterials
  if (additionalMaterials) {
    filteredMeditations = filteredMeditations
        .where((meditation) => meditation.lessons.length > 1)
        .toList();
  }

  // Remove duplicates
  filteredMeditations = filteredMeditations.toSet().toList();

  return filteredMeditations;
}

String smscMessage(String code) {
  return 'Ваш код: $code. Не сообщайте его никому!';
}

List<MeditationsRecord> homeGetPopularMeditations(
  List<MeditationsRecord>? meditationsDocs,
  bool? sortByTime,
  bool? shuffle,
) {
  if (meditationsDocs == null) return [];

  if ((shuffle ?? false) && (sortByTime ?? false))
    throw Exception(
        'shuffle == true && sortByTime == true. You have to choose one thing!');

  meditationsDocs = meditationsDocs.where((doc) => doc.isPopular).toList();

  if (sortByTime ?? false) {
    if (meditationsDocs.length > 1) {
      DateTime? createdTimeA;
      DateTime? createdTimeB;
      meditationsDocs.sort((a, b) {
        createdTimeA = a.modifiedTime ?? a.createdTime;
        createdTimeB = b.modifiedTime ?? b.createdTime;
        return createdTimeB!.compareTo(createdTimeA!);
      });
    }
  }

  if (shuffle ?? false) meditationsDocs.shuffle();

  return meditationsDocs;
}

List<MeditationsRecord> homeGetMeditationsForYou(
  List<MeditationsRecord>? meditationsDocs,
  bool? shuffle,
) {
  List<MeditationsRecord> filteredDocs = [];
  if (meditationsDocs == null) return [];
  currentUserDocument!.onboardingList.forEach((element) => filteredDocs = [
        ...filteredDocs,
        ...meditationsDocs
            .where((doc) => doc.onboardings.contains(element))
            .toList()
      ]);
  filteredDocs = filteredDocs.toSet().toList();

  if (shuffle ?? false) filteredDocs.shuffle();

  return filteredDocs;
}

String smscGenerateCode() {
  var rng = new math.Random();
  return '${rng.nextInt(900000) + 100000}';
}

List<MeditationsRecord> homeGetNewMeditations(
    List<MeditationsRecord>? meditationsDocs) {
  if (meditationsDocs == null) return [];

  meditationsDocs = meditationsDocs.where((doc) => doc.isNew).toList();

  if (meditationsDocs.length > 1) {
    DateTime? createdTimeA;
    DateTime? createdTimeB;
    meditationsDocs.sort((a, b) {
      createdTimeA = a.modifiedTime ?? a.createdTime;
      createdTimeB = b.modifiedTime ?? b.createdTime;
      return createdTimeB!.compareTo(createdTimeA!);
    });
  }

  return meditationsDocs;
}

bool smscCanSendMessage(
  String phoneNumber,
  OtpStruct otp,
  DateTime now,
) {
  if (otp.phoneNumber != phoneNumber) {
    return true;
  }
  if ((otp.createdTime?.millisecondsSinceEpoch ?? 0) + 120999 <=
      now.millisecondsSinceEpoch) {
    return true;
  }
  return false;
}

int smscGetTimer(OtpStruct otp) {
  final timer = 120999;
  final now = DateTime.now();
  if (((otp.createdTime?.millisecondsSinceEpoch ?? 0) + timer) >=
      now.millisecondsSinceEpoch) {
    return (otp.createdTime!.millisecondsSinceEpoch + timer) -
        now.millisecondsSinceEpoch;
  }
  return timer;
}

bool smscCodeChecker(
  String code,
  OtpStruct otp,
) {
  final ttl = 600000;
  final now = DateTime.now().millisecondsSinceEpoch;
  final codeCreatedTime = otp.createdTime?.millisecondsSinceEpoch ?? 0;
  return otp.code == code && (now - codeCreatedTime) <= ttl;
}

List<AgreementsStruct> privacyPolicy() {
  return [
    AgreementsStruct.fromMap({
      "item": "",
      "text":
          "Настоящая Политика конфиденциальности персональной информации (далее — Политика) действует в отношении всей информации, которую Мобильное Приложение может получить о пользователе во время использования им Приложения."
    }),
    AgreementsStruct.fromMap({
      "item": "",
      "text":
          "Использование Мобильного Приложения (далее – МП) означает безоговорочное согласие пользователя с настоящей Политикой и указанными в ней условиями обработки его персональной информации; в случае несогласия с этими условиями пользователь должен воздержаться от использования Сервисов."
    }),
    AgreementsStruct.fromMap({
      "item": "1.",
      "text":
          "Персональная информация пользователей, которую получает и обрабатывает МП"
    }),
    AgreementsStruct.fromMap({
      "item": "1.1.",
      "text":
          "В рамках настоящей Политики под «персональной информацией пользователя» понимаются:"
    }),
    AgreementsStruct.fromMap({
      "item": "1.1.1.",
      "text":
          "Персональная информация – это любая информация, которую пользователь предоставляет о себе, включая непосредственно персональные данные пользователя. Обязательная для предоставления Сервисов (оказания услуг) информация помечена специальным образом. Иная информация предоставляется пользователем на его усмотрение."
    }),
    AgreementsStruct.fromMap({
      "item": "1.1.2.",
      "text":
          "Данные, которые автоматически передаются в процессе их использования с помощью установленного на устройстве пользователя программного обеспечения, в том числе IP-адрес, информация из cookie, информация о браузере пользователя (или иной программе, с помощью которой осуществляется доступ к Сервисам), время доступа, адрес запрашиваемой страницы."
    }),
    AgreementsStruct.fromMap({
      "item": "1.2.",
      "text":
          "Настоящая Политика применима только к данному Приложению. МП не контролирует и не несет ответственность за сайты и мобильные приложения третьих лиц, на которые пользователь может перейти по ссылкам, доступным в данном МП, в том числе в результатах поиска. На таких сайтах и в приложениях у пользователя может собираться или запрашиваться иная персональная информация, а также могут совершаться иные действия."
    }),
    AgreementsStruct.fromMap({
      "item": "1.3.",
      "text":
          "МП в общем случае не проверяет достоверность персональной информации, предоставляемой пользователями, и не осуществляет контроль за их дееспособностью. Однако приложение исходит из того, что пользователь предоставляет достоверную и достаточную персональную информацию по вопросам, предлагаемым МП, и поддерживает эту информацию в актуальном состоянии."
    }),
    AgreementsStruct.fromMap({
      "item": "2.",
      "text": "Цели сбора и обработки персональной информации пользователей"
    }),
    AgreementsStruct.fromMap({
      "item": "2.1.",
      "text":
          "МП собирает и хранит только те персональные данные, которые необходимы для предоставления и оказания услуг (исполнения соглашений и договоров с пользователем)."
    }),
    AgreementsStruct.fromMap({
      "item": "2.2.",
      "text":
          "Персональную информацию пользователя МП может использовать в следующих целях:"
    }),
    AgreementsStruct.fromMap({
      "item": "2.2.1.",
      "text": "Предоставление пользователю персонализированных услуг;"
    }),
    AgreementsStruct.fromMap({
      "item": "2.2.2.",
      "text":
          "Связь с пользователем, в том числе направление уведомлений, запросов и информации, касающихся использования Сервисов, оказания услуг, а также обработка запросов и заявок от пользователя;"
    }),
    AgreementsStruct.fromMap({
      "item": "2.2.3.",
      "text": "Улучшение качества, удобства их использования, разработка услуг;"
    }),
    AgreementsStruct.fromMap({
      "item": "3.",
      "text":
          "Условия обработки персональной информации пользователя и её передачи третьим лицам"
    }),
    AgreementsStruct.fromMap({
      "item": "3.1.",
      "text":
          "МП хранит персональную информацию пользователей в соответствии с внутренними регламентами конкретных сервисов."
    }),
    AgreementsStruct.fromMap({
      "item": "3.2",
      "text":
          "При обработке персональных данных пользователей МП руководствуется Федеральным законом РФ «О персональных данных»."
    }),
    AgreementsStruct.fromMap({
      "item": "4.",
      "text": "Изменение пользователем персональной информации"
    }),
    AgreementsStruct.fromMap({
      "item": "4.1.",
      "text":
          "Пользователь может в любой момент изменить (обновить, дополнить) предоставленную им персональную информацию или её часть."
    }),
    AgreementsStruct.fromMap({
      "item": "5.",
      "text":
          "Меры, применяемые для защиты персональной информации пользователей"
    }),
    AgreementsStruct.fromMap({
      "item": "5.1.",
      "text":
          "МП принимает необходимые и достаточные организационные и технические меры для защиты персональной информации пользователя от неправомерного или случайного доступа, уничтожения, изменения, блокирования, копирования, распространения, а также от иных неправомерных действий с ней третьих лиц."
    }),
    AgreementsStruct.fromMap({
      "item": "6.",
      "text":
          "Изменение Политики конфиденциальности. Применимое законодательство"
    }),
    AgreementsStruct.fromMap({
      "item": "6.1.",
      "text":
          "МП имеет право вносить изменения в настоящую Политику конфиденциальности. При внесении изменений в актуальной редакции указывается дата последнего обновления. Новая редакция Политики вступает в силу с момента ее размещения, если иное не предусмотрено новой редакцией Политики."
    }),
    AgreementsStruct.fromMap({
      "item": "6.2.",
      "text":
          "К настоящей Политике и отношениям между пользователем и МП, возникающим в связи с применением Политики конфиденциальности, подлежит применению право Российской Федерации"
    }),
  ];
}

bool hasAdditionalDoc(List<LessonStruct>? lessons) {
  for (LessonStruct item in lessons ?? []) {
    if (item.hasIsAdditional()) {
      if (item.isAdditional) return true;
    }
  }
  return false;
}

bool isAdditionalDoc(LessonStruct lesson) {
  return lesson.hasIsAdditional() && lesson.isAdditional;
}

List<LessonStruct> lessonsReverse(List<LessonStruct> lessons) {
  return lessons.reversed.toList();
}

int meditationsGetLessonIndex(List<LessonStruct> lessons) {
  for (LessonStruct item in lessons) {
    if (!item.hasIsAdditional()) {
      return lessons.indexOf(item);
    }
  }
  return 0;
}

String formattingPhoneForChange(String phoneNumber) {
  String formattedPhoneNumber = '';

  if (phoneNumber.startsWith('+7')) {
    phoneNumber = phoneNumber.substring(2);
  }

  if (phoneNumber.length >= 10) {
    formattedPhoneNumber = '${phoneNumber.substring(0, 3)} '
        '${phoneNumber.substring(3, 6)} '
        '${phoneNumber.substring(6, 8)} '
        '${phoneNumber.substring(8, 10)}';
  }

  return formattedPhoneNumber;
}

List<TierStruct> getTierList() {
  List<TierStruct> list = [];
  list.add(TierStruct.fromMap({"months": 1, "price": 129}));
  list.add(TierStruct.fromMap({"months": 6, "price": 529}));
  list.add(TierStruct.fromMap({"months": 3, "price": 329}));
  return list;
}

String? coursesCEValidator(
  String name,
  List<String> categories,
  List<LessonStruct> lessons,
  String photoUrl,
  List<String> onboardings,
) {
  String e = '';
  if (name.isEmpty) {
    e += '- Поле "Название" не может быть пустым\n';
  }
  if (photoUrl.isEmpty) {
    e += '- Обложка не загружена\n';
  }
  if (categories.isEmpty) {
    e += ('- Категории не выбраны\n');
  }
  if (lessons.isEmpty) {
    e += ('- Список занятий пуст\n');
  }
  // debugPrint('meditationValidator: $e');
  return e.isEmpty ? null : e;
}

DocumentReference homeGetLastPlayCourseReference(String documentID) {
  final db = FirebaseFirestore.instance;
  return db.doc('courses/$documentID');
}

bool hasLastPlay(LastPlayStruct lastPlay) {
  final emptyLastPlay = LastPlayStruct();
  return lastPlay != emptyLastPlay;
}

String notConnectedMessage() {
  return 'Произошла ошибка загрузки\nПроверьте интернет-соединение';
}

int tiersGetPeriod(TierStruct tier) {
  final int hours = tier.period;
  final int days = hours ~/ 24;
  final int weeks = days ~/ 7;
  final int months = days ~/ 30;

  if (months > 0) {
    return months;
  } else if (weeks > 0) {
    return weeks;
  } else if (days > 0) {
    return days;
  }
  return hours;
}

DocumentReference appRecordGetReference() {
  return FirebaseFirestore.instance.doc('app/settings');
}

String tiersGetTrialButtonPeriodText(TierStruct tier) {
  final hours = tier.period;
  final int days = hours ~/ 24;
  final int weeks = days ~/ 7;
  final int months = days ~/ 30;

  String trialPeriodText = '';

  if (months > 0) {
    trialPeriodText = 'Начать $months-месячный пробный период';
  } else if (weeks > 0) {
    trialPeriodText = 'Начать $weeks-недельный пробный период';
  } else if (days > 0) {
    trialPeriodText = 'Начать $days-дневный пробный период';
  } else if (hours > 0) {
    trialPeriodText = 'Начать $hours-часовой пробный период';
  } else {
    trialPeriodText = 'Начать пробный период';
  }
  return trialPeriodText;
}

int tiersIndexOf(
  List<TierStruct> tiers,
  TierStruct tier,
) {
  return tiers.indexOf(tier);
}

SubscriptionsRecord? subscriptionFromJson(dynamic subscriptionSnapshot) {
  final reference =
      FirebaseFirestore.instance.doc('subscriptions/$currentUserUid');
  // ignore: undefined_method
  return SubscriptionsRecord.getDocumentFromData(
      subscriptionSnapshot, reference);
}

int tiersCalculateAmountPerWeek(TierStruct tier) {
  final int price = tier.price;
  final int period = tier.period;
  final TierInterval interval = tier.interval!;
  switch (interval) {
    case TierInterval.Month:
      return (price / (period * 4).floor()).round();
    case TierInterval.Week:
      return (price / period.floor()).round();
    default:
      return 0;
  }
}

List<TierStruct> tierUpdateList(
  int index,
  TierStruct newTier,
  List<TierStruct> tierList,
) {
  tierList[index] = newTier;
  return tierList;
}

DocumentReference userGetSubscroptionRef() {
  return FirebaseFirestore.instance.doc('subscriptions/$currentUserUid');
}

String? removeLineBreaks(String? text) {
  //return text != null && text.isNotEmpty
  //    ? text
  //        .replaceAll('\n', ' ')
  //        .replaceAll('\r', ' ')
  //        .replaceAll(RegExp(r'\s+'), ' ')
  //    : null;
  return text;
}

DocumentReference getWomensMeditationsRef() {
  return FirebaseFirestore.instance.doc('categories/NAjvV1EYdRGmvu6PvHow');
}

List<String> getEmptyCategoryList() {
  return ['NAjvV1EYdRGmvu6PvHow'];
}

List<CategoriesRecord> categoriesAdminSort(List<CategoriesRecord> list) {
  List<CategoriesRecord> documentsWithoutSubcategory = [];
  List<CategoriesRecord> documentsWithSubcategory = [];
  CategoriesRecord? primaryCategoryDocuemnt;

  for (var doc in list) {
    if (doc.undeletable) {
      primaryCategoryDocuemnt = doc;
    } else if (!doc.hasSubcategoryOf()) {
      documentsWithoutSubcategory.add(doc);
    } else {
      documentsWithSubcategory.add(doc);
    }
  }

  // Concatenate both lists to get the sorted order
  documentsWithoutSubcategory.add(primaryCategoryDocuemnt!);
  List<CategoriesRecord> sortedDocuments =
      documentsWithoutSubcategory + documentsWithSubcategory;

  return sortedDocuments;
}
