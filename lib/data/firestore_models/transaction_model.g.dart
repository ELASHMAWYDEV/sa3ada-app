// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

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
abstract class TransactionModelCollectionReference
    implements
        TransactionModelQuery,
        FirestoreCollectionReference<TransactionModelQuerySnapshot> {
  factory TransactionModelCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$TransactionModelCollectionReference;

  static TransactionModel fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return TransactionModel.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    TransactionModel value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  TransactionModelDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<TransactionModelDocumentReference> add(TransactionModel value);
}

class _$TransactionModelCollectionReference extends _$TransactionModelQuery
    implements TransactionModelCollectionReference {
  factory _$TransactionModelCollectionReference(
      [FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$TransactionModelCollectionReference._(
      firestore.collection('transactions').withConverter(
            fromFirestore: TransactionModelCollectionReference.fromFirestore,
            toFirestore: TransactionModelCollectionReference.toFirestore,
          ),
    );
  }

  _$TransactionModelCollectionReference._(
    CollectionReference<TransactionModel> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<TransactionModel> get reference =>
      super.reference as CollectionReference<TransactionModel>;

  @override
  TransactionModelDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return TransactionModelDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<TransactionModelDocumentReference> add(TransactionModel value) {
    return reference
        .add(value)
        .then((ref) => TransactionModelDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$TransactionModelCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class TransactionModelDocumentReference
    extends FirestoreDocumentReference<TransactionModelDocumentSnapshot> {
  factory TransactionModelDocumentReference(
          DocumentReference<TransactionModel> reference) =
      _$TransactionModelDocumentReference;

  DocumentReference<TransactionModel> get reference;

  /// A reference to the [TransactionModelCollectionReference] containing this document.
  TransactionModelCollectionReference get parent {
    return _$TransactionModelCollectionReference(reference.firestore);
  }

  @override
  Stream<TransactionModelDocumentSnapshot> snapshots();

  @override
  Future<TransactionModelDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String ownerId,
    double amount,
    String sourceAccountId,
    String destinationAccountId,
    bool? isDeleted,
  });

  Future<void> set(TransactionModel value);
}

class _$TransactionModelDocumentReference
    extends FirestoreDocumentReference<TransactionModelDocumentSnapshot>
    implements TransactionModelDocumentReference {
  _$TransactionModelDocumentReference(this.reference);

  @override
  final DocumentReference<TransactionModel> reference;

  /// A reference to the [TransactionModelCollectionReference] containing this document.
  TransactionModelCollectionReference get parent {
    return _$TransactionModelCollectionReference(reference.firestore);
  }

  @override
  Stream<TransactionModelDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return TransactionModelDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<TransactionModelDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return TransactionModelDocumentSnapshot._(
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
    Object? ownerId = _sentinel,
    Object? amount = _sentinel,
    Object? sourceAccountId = _sentinel,
    Object? destinationAccountId = _sentinel,
    Object? isDeleted = _sentinel,
  }) async {
    final json = {
      if (ownerId != _sentinel) "ownerId": ownerId as String,
      if (amount != _sentinel) "amount": amount as double,
      if (sourceAccountId != _sentinel)
        "sourceAccountId": sourceAccountId as String,
      if (destinationAccountId != _sentinel)
        "destinationAccountId": destinationAccountId as String,
      if (isDeleted != _sentinel) "isDeleted": isDeleted as bool?,
    };

    return reference.update(json);
  }

  Future<void> set(TransactionModel value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionModelDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class TransactionModelDocumentSnapshot extends FirestoreDocumentSnapshot {
  TransactionModelDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<TransactionModel> snapshot;

  @override
  TransactionModelDocumentReference get reference {
    return TransactionModelDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final TransactionModel? data;
}

abstract class TransactionModelQuery
    implements QueryReference<TransactionModelQuerySnapshot> {
  @override
  TransactionModelQuery limit(int limit);

  @override
  TransactionModelQuery limitToLast(int limit);

  TransactionModelQuery whereOwnerId({
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
  TransactionModelQuery whereAmount({
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
  TransactionModelQuery whereSourceAccountId({
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
  TransactionModelQuery whereDestinationAccountId({
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
  TransactionModelQuery whereIsDeleted({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  });

  TransactionModelQuery orderByOwnerId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TransactionModelDocumentSnapshot? startAtDocument,
    TransactionModelDocumentSnapshot? endAtDocument,
    TransactionModelDocumentSnapshot? endBeforeDocument,
    TransactionModelDocumentSnapshot? startAfterDocument,
  });

  TransactionModelQuery orderByAmount({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    TransactionModelDocumentSnapshot? startAtDocument,
    TransactionModelDocumentSnapshot? endAtDocument,
    TransactionModelDocumentSnapshot? endBeforeDocument,
    TransactionModelDocumentSnapshot? startAfterDocument,
  });

  TransactionModelQuery orderBySourceAccountId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TransactionModelDocumentSnapshot? startAtDocument,
    TransactionModelDocumentSnapshot? endAtDocument,
    TransactionModelDocumentSnapshot? endBeforeDocument,
    TransactionModelDocumentSnapshot? startAfterDocument,
  });

  TransactionModelQuery orderByDestinationAccountId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TransactionModelDocumentSnapshot? startAtDocument,
    TransactionModelDocumentSnapshot? endAtDocument,
    TransactionModelDocumentSnapshot? endBeforeDocument,
    TransactionModelDocumentSnapshot? startAfterDocument,
  });

  TransactionModelQuery orderByIsDeleted({
    bool descending = false,
    bool? startAt,
    bool? startAfter,
    bool? endAt,
    bool? endBefore,
    TransactionModelDocumentSnapshot? startAtDocument,
    TransactionModelDocumentSnapshot? endAtDocument,
    TransactionModelDocumentSnapshot? endBeforeDocument,
    TransactionModelDocumentSnapshot? startAfterDocument,
  });
}

class _$TransactionModelQuery
    extends QueryReference<TransactionModelQuerySnapshot>
    implements TransactionModelQuery {
  _$TransactionModelQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<TransactionModel> reference;

  TransactionModelQuerySnapshot _decodeSnapshot(
    QuerySnapshot<TransactionModel> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return TransactionModelQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<TransactionModelDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: TransactionModelDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return TransactionModelQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<TransactionModelQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<TransactionModelQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  TransactionModelQuery limit(int limit) {
    return _$TransactionModelQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  TransactionModelQuery limitToLast(int limit) {
    return _$TransactionModelQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  TransactionModelQuery whereOwnerId({
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
    return _$TransactionModelQuery(
      reference.where(
        'ownerId',
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

  TransactionModelQuery whereAmount({
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
    return _$TransactionModelQuery(
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

  TransactionModelQuery whereSourceAccountId({
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
    return _$TransactionModelQuery(
      reference.where(
        'sourceAccountId',
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

  TransactionModelQuery whereDestinationAccountId({
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
    return _$TransactionModelQuery(
      reference.where(
        'destinationAccountId',
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

  TransactionModelQuery whereIsDeleted({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool?>? whereIn,
    List<bool?>? whereNotIn,
  }) {
    return _$TransactionModelQuery(
      reference.where(
        'isDeleted',
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

  TransactionModelQuery orderByOwnerId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TransactionModelDocumentSnapshot? startAtDocument,
    TransactionModelDocumentSnapshot? endAtDocument,
    TransactionModelDocumentSnapshot? endBeforeDocument,
    TransactionModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('ownerId', descending: descending);

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

    return _$TransactionModelQuery(query, _collection);
  }

  TransactionModelQuery orderByAmount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TransactionModelDocumentSnapshot? startAtDocument,
    TransactionModelDocumentSnapshot? endAtDocument,
    TransactionModelDocumentSnapshot? endBeforeDocument,
    TransactionModelDocumentSnapshot? startAfterDocument,
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

    return _$TransactionModelQuery(query, _collection);
  }

  TransactionModelQuery orderBySourceAccountId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TransactionModelDocumentSnapshot? startAtDocument,
    TransactionModelDocumentSnapshot? endAtDocument,
    TransactionModelDocumentSnapshot? endBeforeDocument,
    TransactionModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('sourceAccountId', descending: descending);

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

    return _$TransactionModelQuery(query, _collection);
  }

  TransactionModelQuery orderByDestinationAccountId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TransactionModelDocumentSnapshot? startAtDocument,
    TransactionModelDocumentSnapshot? endAtDocument,
    TransactionModelDocumentSnapshot? endBeforeDocument,
    TransactionModelDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy('destinationAccountId', descending: descending);

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

    return _$TransactionModelQuery(query, _collection);
  }

  TransactionModelQuery orderByIsDeleted({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TransactionModelDocumentSnapshot? startAtDocument,
    TransactionModelDocumentSnapshot? endAtDocument,
    TransactionModelDocumentSnapshot? endBeforeDocument,
    TransactionModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('isDeleted', descending: descending);

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

    return _$TransactionModelQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$TransactionModelQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class TransactionModelQuerySnapshot
    extends FirestoreQuerySnapshot<TransactionModelQueryDocumentSnapshot> {
  TransactionModelQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<TransactionModel> snapshot;

  @override
  final List<TransactionModelQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<TransactionModelDocumentSnapshot>>
      docChanges;
}

class TransactionModelQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot
    implements TransactionModelDocumentSnapshot {
  TransactionModelQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<TransactionModel> snapshot;

  @override
  TransactionModelDocumentReference get reference {
    return TransactionModelDocumentReference(snapshot.reference);
  }

  @override
  final TransactionModel data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    TransactionModel(
      ownerId: json['ownerId'] as String,
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
      amount: (json['amount'] as num).toDouble(),
      status: $enumDecode(_$TransactionStatusEnumMap, json['status']),
      sourceAccountId: json['sourceAccountId'] as String,
      destinationAccountId: json['destinationAccountId'] as String,
      isDeleted: json['isDeleted'] as bool?,
    );

Map<String, dynamic> _$TransactionModelToJson(TransactionModel instance) =>
    <String, dynamic>{
      'ownerId': instance.ownerId,
      'type': _$TransactionTypeEnumMap[instance.type],
      'amount': instance.amount,
      'status': _$TransactionStatusEnumMap[instance.status],
      'sourceAccountId': instance.sourceAccountId,
      'destinationAccountId': instance.destinationAccountId,
      'isDeleted': instance.isDeleted,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.invoice: 'invoice',
  TransactionType.expenses: 'expenses',
  TransactionType.transfer: 'transfer',
};

const _$TransactionStatusEnumMap = {
  TransactionStatus.completed: 'completed',
  TransactionStatus.canceled: 'canceled',
};
