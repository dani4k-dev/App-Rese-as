import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResenasRecord extends FirestoreRecord {
  ResenasRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "resenas" field.
  String? _resenas;
  String get resenas => _resenas ?? '';
  bool hasResenas() => _resenas != null;

  // "puntuacion" field.
  int? _puntuacion;
  int get puntuacion => _puntuacion ?? 0;
  bool hasPuntuacion() => _puntuacion != null;

  // "portada" field.
  String? _portada;
  String get portada => _portada ?? '';
  bool hasPortada() => _portada != null;

  // "trailer" field.
  String? _trailer;
  String get trailer => _trailer ?? '';
  bool hasTrailer() => _trailer != null;

  // "useref" field.
  DocumentReference? _useref;
  DocumentReference? get useref => _useref;
  bool hasUseref() => _useref != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _resenas = snapshotData['resenas'] as String?;
    _puntuacion = castToType<int>(snapshotData['puntuacion']);
    _portada = snapshotData['portada'] as String?;
    _trailer = snapshotData['trailer'] as String?;
    _useref = snapshotData['useref'] as DocumentReference?;
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('resenas');

  static Stream<ResenasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResenasRecord.fromSnapshot(s));

  static Future<ResenasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResenasRecord.fromSnapshot(s));

  static ResenasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResenasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResenasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResenasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResenasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResenasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResenasRecordData({
  String? titulo,
  String? resenas,
  int? puntuacion,
  String? portada,
  String? trailer,
  DocumentReference? useref,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'resenas': resenas,
      'puntuacion': puntuacion,
      'portada': portada,
      'trailer': trailer,
      'useref': useref,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResenasRecordDocumentEquality implements Equality<ResenasRecord> {
  const ResenasRecordDocumentEquality();

  @override
  bool equals(ResenasRecord? e1, ResenasRecord? e2) {
    return e1?.titulo == e2?.titulo &&
        e1?.resenas == e2?.resenas &&
        e1?.puntuacion == e2?.puntuacion &&
        e1?.portada == e2?.portada &&
        e1?.trailer == e2?.trailer &&
        e1?.useref == e2?.useref &&
        e1?.email == e2?.email;
  }

  @override
  int hash(ResenasRecord? e) => const ListEquality().hash([
        e?.titulo,
        e?.resenas,
        e?.puntuacion,
        e?.portada,
        e?.trailer,
        e?.useref,
        e?.email
      ]);

  @override
  bool isValidKey(Object? o) => o is ResenasRecord;
}
