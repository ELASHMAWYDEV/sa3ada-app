// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_model.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class DepositModelCollectionReference
    implements
        DepositModelQuery,
        FirestoreCollectionReference<DepositModelQuerySnapshot> {
  factory DepositModelCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$DepositModelCollectionReference;

  static DepositModel fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return DepositModel.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    DepositModel value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  DepositModelDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<DepositModelDocumentReference> add(DepositModel value);
}

class _$DepositModelCollectionReference extends _$DepositModelQuery
    implements DepositModelCollectionReference {
  factory _$DepositModelCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$DepositModelCollectionReference._(
      firestore.collection('deposits').withConverter(
            fromFirestore: DepositModelCollectionReference.fromFirestore,
            toFirestore: DepositModelCollectionReference.toFirestore,
          ),
    );
  }

  _$DepositModelCollectionReference._(
    CollectionReference<DepositModel> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<DepositModel> get reference =>
      super.reference as CollectionReference<DepositModel>;

  @override
  DepositModelDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return DepositModelDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<DepositModelDocumentReference> add(DepositModel value) {
    return reference
        .add(value)
        .then((ref) => DepositModelDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$DepositModelCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class DepositModelDocumentReference
    extends FirestoreDocumentReference<DepositModelDocumentSnapshot> {
  factory DepositModelDocumentReference(
          DocumentReference<DepositModel> reference) =
      _$DepositModelDocumentReference;

  DocumentReference<DepositModel> get reference;

  /// A reference to the [DepositModelCollectionReference] containing this document.
  DepositModelCollectionReference get parent {
    return _$DepositModelCollectionReference(reference.firestore);
  }

  @override
  Stream<DepositModelDocumentSnapshot> snapshots();

  @override
  Future<DepositModelDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String? id,
    double amount,
    String note,
    num? depositReference,
    String status,
  });

  Future<void> set(DepositModel value);
}

class _$DepositModelDocumentReference
    extends FirestoreDocumentReference<DepositModelDocumentSnapshot>
    implements DepositModelDocumentReference {
  _$DepositModelDocumentReference(this.reference);

  @override
  final DocumentReference<DepositModel> reference;

  /// A reference to the [DepositModelCollectionReference] containing this document.
  DepositModelCollectionReference get parent {
    return _$DepositModelCollectionReference(reference.firestore);
  }

  @override
  Stream<DepositModelDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return DepositModelDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<DepositModelDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return DepositModelDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? id = _sentinel,
    Object? amount = _sentinel,
    Object? note = _sentinel,
    Object? depositReference = _sentinel,
    Object? status = _sentinel,
  }) async {
    final json = {
      if (id != _sentinel) "id": id as String?,
      if (amount != _sentinel) "amount": amount as double,
      if (note != _sentinel) "note": note as String,
      if (depositReference != _sentinel)
        "depositReference": depositReference as num?,
      if (status != _sentinel) "status": status as String,
    };

    return reference.update(json);
  }

  Future<void> set(DepositModel value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is DepositModelDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class DepositModelDocumentSnapshot extends FirestoreDocumentSnapshot {
  DepositModelDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<DepositModel> snapshot;

  @override
  DepositModelDocumentReference get reference {
    return DepositModelDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final DepositModel? data;
}

abstract class DepositModelQuery
    implements QueryReference<DepositModelQuerySnapshot> {
  @override
  DepositModelQuery limit(int limit);

  @override
  DepositModelQuery limitToLast(int limit);

  DepositModelQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  DepositModelQuery whereAmount({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  DepositModelQuery whereNote({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  DepositModelQuery whereDepositReference({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num?>? whereIn,
    List<num?>? whereNotIn,
  });
  DepositModelQuery whereStatus({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  DepositModelQuery orderById({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    DepositModelDocumentSnapshot? startAtDocument,
    DepositModelDocumentSnapshot? endAtDocument,
    DepositModelDocumentSnapshot? endBeforeDocument,
    DepositModelDocumentSnapshot? startAfterDocument,
  });

  DepositModelQuery orderByAmount({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    DepositModelDocumentSnapshot? startAtDocument,
    DepositModelDocumentSnapshot? endAtDocument,
    DepositModelDocumentSnapshot? endBeforeDocument,
    DepositModelDocumentSnapshot? startAfterDocument,
  });

  DepositModelQuery orderByNote({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    DepositModelDocumentSnapshot? startAtDocument,
    DepositModelDocumentSnapshot? endAtDocument,
    DepositModelDocumentSnapshot? endBeforeDocument,
    DepositModelDocumentSnapshot? startAfterDocument,
  });

  DepositModelQuery orderByDepositReference({
    bool descending = false,
    num? startAt,
    num? startAfter,
    num? endAt,
    num? endBefore,
    DepositModelDocumentSnapshot? startAtDocument,
    DepositModelDocumentSnapshot? endAtDocument,
    DepositModelDocumentSnapshot? endBeforeDocument,
    DepositModelDocumentSnapshot? startAfterDocument,
  });

  DepositModelQuery orderByStatus({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    DepositModelDocumentSnapshot? startAtDocument,
    DepositModelDocumentSnapshot? endAtDocument,
    DepositModelDocumentSnapshot? endBeforeDocument,
    DepositModelDocumentSnapshot? startAfterDocument,
  });
}

class _$DepositModelQuery extends QueryReference<DepositModelQuerySnapshot>
    implements DepositModelQuery {
  _$DepositModelQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<DepositModel> reference;

  DepositModelQuerySnapshot _decodeSnapshot(
    QuerySnapshot<DepositModel> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return DepositModelQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<DepositModelDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: DepositModelDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return DepositModelQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<DepositModelQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<DepositModelQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  DepositModelQuery limit(int limit) {
    return _$DepositModelQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  DepositModelQuery limitToLast(int limit) {
    return _$DepositModelQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  DepositModelQuery whereId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$DepositModelQuery(
      reference.where(
        'id',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  DepositModelQuery whereAmount({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$DepositModelQuery(
      reference.where(
        'amount',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  DepositModelQuery whereNote({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$DepositModelQuery(
      reference.where(
        'note',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  DepositModelQuery whereDepositReference({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num?>? whereIn,
    List<num?>? whereNotIn,
  }) {
    return _$DepositModelQuery(
      reference.where(
        'depositReference',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  DepositModelQuery whereStatus({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$DepositModelQuery(
      reference.where(
        'status',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  DepositModelQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DepositModelDocumentSnapshot? startAtDocument,
    DepositModelDocumentSnapshot? endAtDocument,
    DepositModelDocumentSnapshot? endBeforeDocument,
    DepositModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('id', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$DepositModelQuery(query, _collection);
  }

  DepositModelQuery orderByAmount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DepositModelDocumentSnapshot? startAtDocument,
    DepositModelDocumentSnapshot? endAtDocument,
    DepositModelDocumentSnapshot? endBeforeDocument,
    DepositModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('amount', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$DepositModelQuery(query, _collection);
  }

  DepositModelQuery orderByNote({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DepositModelDocumentSnapshot? startAtDocument,
    DepositModelDocumentSnapshot? endAtDocument,
    DepositModelDocumentSnapshot? endBeforeDocument,
    DepositModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('note', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$DepositModelQuery(query, _collection);
  }

  DepositModelQuery orderByDepositReference({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DepositModelDocumentSnapshot? startAtDocument,
    DepositModelDocumentSnapshot? endAtDocument,
    DepositModelDocumentSnapshot? endBeforeDocument,
    DepositModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('depositReference', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$DepositModelQuery(query, _collection);
  }

  DepositModelQuery orderByStatus({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    DepositModelDocumentSnapshot? startAtDocument,
    DepositModelDocumentSnapshot? endAtDocument,
    DepositModelDocumentSnapshot? endBeforeDocument,
    DepositModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('status', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$DepositModelQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$DepositModelQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class DepositModelQuerySnapshot
    extends FirestoreQuerySnapshot<DepositModelQueryDocumentSnapshot> {
  DepositModelQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<DepositModel> snapshot;

  @override
  final List<DepositModelQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<DepositModelDocumentSnapshot>> docChanges;
}

class DepositModelQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements DepositModelDocumentSnapshot {
  DepositModelQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<DepositModel> snapshot;

  @override
  DepositModelDocumentReference get reference {
    return DepositModelDocumentReference(snapshot.reference);
  }

  @override
  final DepositModel data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepositModel _$DepositModelFromJson(Map<String, dynamic> json) => DepositModel(
      id: json['id'] as String?,
      from: AccountModel.fromJson(json['from'] as Map<String, dynamic>),
      to: AccountModel.fromJson(json['to'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toDouble(),
      note: json['note'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      depositReference: json['depositReference'] as num?,
      depositDate: DateTime.parse(json['depositDate'] as String),
      status: json['status'] as String,
    );

Map<String, dynamic> _$DepositModelToJson(DepositModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from.toJson(),
      'to': instance.to.toJson(),
      'amount': instance.amount,
      'note': instance.note,
      'createdAt': instance.createdAt.toIso8601String(),
      'depositReference': instance.depositReference,
      'depositDate': instance.depositDate.toIso8601String(),
      'status': instance.status,
    };
