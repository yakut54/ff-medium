// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Получает список онбординга, где `'is_deleted':false`
// и складывает его со списком онбординга
// из курса/медитации с заменой одинаковых референсов

Future<List<OnboardingsRecord>> getAdminOnboardingList(
  MeditationsRecord? meditationDoc,
  CoursesRecord? courseDoc,
) async {
  List<OnboardingsRecord> onboaringsDocs = [];
  await OnboardingsRecord.collection
      .where('is_deleted', isNotEqualTo: true)
      .get()
      .then((snapshot) => snapshot.docs.forEach(
          (doc) => onboaringsDocs.add(OnboardingsRecord.fromSnapshot(doc))));
  if (meditationDoc == null && courseDoc == null) {
    return onboaringsDocs;
  }

  List<DocumentReference> documentRefs = meditationDoc != null
      ? meditationDoc.onboardings
      : courseDoc != null
          ? courseDoc.onboardings
          : [];
  if (documentRefs.isNotEmpty) {
    List<DocumentReference> onboaringsRefs = [];
    List<Future<DocumentSnapshot>> outputDocs = [];
    onboaringsDocs.forEach((doc) => onboaringsRefs.add(doc.reference));
    documentRefs.forEach((ref) {
      if (!onboaringsRefs.contains(ref)) {
        outputDocs.add(ref.get());
      }
    });

    if (outputDocs.isNotEmpty) {
      final diffOnboardingsRecordList = [];
      await Future.wait(outputDocs).then((docs) => docs.forEach((doc) =>
          diffOnboardingsRecordList.add(OnboardingsRecord.fromSnapshot(doc))));
      return [...diffOnboardingsRecordList, ...onboaringsDocs];
    }
  }
  return onboaringsDocs;
}
