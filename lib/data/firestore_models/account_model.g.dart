// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

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
abstract class AccountModelCollectionReference
    implements
        AccountModelQuery,
        FirestoreCollectionReference<AccountModelQuerySnapshot> {
  factory AccountModelCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$AccountModelCollectionReference;

  static AccountModel fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return AccountModel.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    AccountModel value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  AccountModelDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<AccountModelDocumentReference> add(AccountModel value);
}

class _$AccountModelCollectionReference extends _$AccountModelQuery
    implements AccountModelCollectionReference {
  factory _$AccountModelCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$AccountModelCollectionReference._(
      firestore.collection('accounts').withConverter(
            fromFirestore: AccountModelCollectionReference.fromFirestore,
            toFirestore: AccountModelCollectionReference.toFirestore,
          ),
    );
  }

  _$AccountModelCollectionReference._(
    CollectionReference<AccountModel> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<AccountModel> get reference =>
      super.reference as CollectionReference<AccountModel>;

  @override
  AccountModelDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return AccountModelDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<AccountModelDocumentReference> add(AccountModel value) {
    return reference
        .add(value)
        .then((ref) => AccountModelDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$AccountModelCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class AccountModelDocumentReference
    extends FirestoreDocumentReference<AccountModelDocumentSnapshot> {
  factory AccountModelDocumentReference(
          DocumentReference<AccountModel> reference) =
      _$AccountModelDocumentReference;

  DocumentReference<AccountModel> get reference;

  /// A reference to the [AccountModelCollectionReference] containing this document.
  AccountModelCollectionReference get parent {
    return _$AccountModelCollectionReference(reference.firestore);
  }

  @override
  Stream<AccountModelDocumentSnapshot> snapshots();

  @override
  Future<AccountModelDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String? ownerId,
    String type,
    double activeBalance,
    double creditBalance,
  });

  Future<void> set(AccountModel value);
}

class _$AccountModelDocumentReference
    extends FirestoreDocumentReference<AccountModelDocumentSnapshot>
    implements AccountModelDocumentReference {
  _$AccountModelDocumentReference(this.reference);

  @override
  final DocumentReference<AccountModel> reference;

  /// A reference to the [AccountModelCollectionReference] containing this document.
  AccountModelCollectionReference get parent {
    return _$AccountModelCollectionReference(reference.firestore);
  }

  @override
  Stream<AccountModelDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return AccountModelDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<AccountModelDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return AccountModelDocumentSnapshot._(
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
    Object? type = _sentinel,
    Object? activeBalance = _sentinel,
    Object? creditBalance = _sentinel,
  }) async {
    final json = {
      if (ownerId != _sentinel) "ownerId": ownerId as String?,
      if (type != _sentinel) "type": type as String,
      if (activeBalance != _sentinel) "activeBalance": activeBalance as double,
      if (creditBalance != _sentinel) "creditBalance": creditBalance as double,
    };

    return reference.update(json);
  }

  Future<void> set(AccountModel value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is AccountModelDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class AccountModelDocumentSnapshot extends FirestoreDocumentSnapshot {
  AccountModelDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<AccountModel> snapshot;

  @override
  AccountModelDocumentReference get reference {
    return AccountModelDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final AccountModel? data;
}

abstract class AccountModelQuery
    implements QueryReference<AccountModelQuerySnapshot> {
  @override
  AccountModelQuery limit(int limit);

  @override
  AccountModelQuery limitToLast(int limit);

  AccountModelQuery whereOwnerId({
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
  AccountModelQuery whereType({
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
  AccountModelQuery whereActiveBalance({
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
  AccountModelQuery whereCreditBalance({
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

  AccountModelQuery orderByOwnerId({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    AccountModelDocumentSnapshot? startAtDocument,
    AccountModelDocumentSnapshot? endAtDocument,
    AccountModelDocumentSnapshot? endBeforeDocument,
    AccountModelDocumentSnapshot? startAfterDocument,
  });

  AccountModelQuery orderByType({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    AccountModelDocumentSnapshot? startAtDocument,
    AccountModelDocumentSnapshot? endAtDocument,
    AccountModelDocumentSnapshot? endBeforeDocument,
    AccountModelDocumentSnapshot? startAfterDocument,
  });

  AccountModelQuery orderByActiveBalance({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    AccountModelDocumentSnapshot? startAtDocument,
    AccountModelDocumentSnapshot? endAtDocument,
    AccountModelDocumentSnapshot? endBeforeDocument,
    AccountModelDocumentSnapshot? startAfterDocument,
  });

  AccountModelQuery orderByCreditBalance({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    AccountModelDocumentSnapshot? startAtDocument,
    AccountModelDocumentSnapshot? endAtDocument,
    AccountModelDocumentSnapshot? endBeforeDocument,
    AccountModelDocumentSnapshot? startAfterDocument,
  });
}

class _$AccountModelQuery extends QueryReference<AccountModelQuerySnapshot>
    implements AccountModelQuery {
  _$AccountModelQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<AccountModel> reference;

  AccountModelQuerySnapshot _decodeSnapshot(
    QuerySnapshot<AccountModel> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return AccountModelQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<AccountModelDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: AccountModelDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return AccountModelQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<AccountModelQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<AccountModelQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  AccountModelQuery limit(int limit) {
    return _$AccountModelQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  AccountModelQuery limitToLast(int limit) {
    return _$AccountModelQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  AccountModelQuery whereOwnerId({
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
    return _$AccountModelQuery(
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

  AccountModelQuery whereType({
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
    return _$AccountModelQuery(
      reference.where(
        'type',
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

  AccountModelQuery whereActiveBalance({
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
    return _$AccountModelQuery(
      reference.where(
        'activeBalance',
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

  AccountModelQuery whereCreditBalance({
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
    return _$AccountModelQuery(
      reference.where(
        'creditBalance',
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

  AccountModelQuery orderByOwnerId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AccountModelDocumentSnapshot? startAtDocument,
    AccountModelDocumentSnapshot? endAtDocument,
    AccountModelDocumentSnapshot? endBeforeDocument,
    AccountModelDocumentSnapshot? startAfterDocument,
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

    return _$AccountModelQuery(query, _collection);
  }

  AccountModelQuery orderByType({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AccountModelDocumentSnapshot? startAtDocument,
    AccountModelDocumentSnapshot? endAtDocument,
    AccountModelDocumentSnapshot? endBeforeDocument,
    AccountModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('type', descending: descending);

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

    return _$AccountModelQuery(query, _collection);
  }

  AccountModelQuery orderByActiveBalance({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AccountModelDocumentSnapshot? startAtDocument,
    AccountModelDocumentSnapshot? endAtDocument,
    AccountModelDocumentSnapshot? endBeforeDocument,
    AccountModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('activeBalance', descending: descending);

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

    return _$AccountModelQuery(query, _collection);
  }

  AccountModelQuery orderByCreditBalance({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AccountModelDocumentSnapshot? startAtDocument,
    AccountModelDocumentSnapshot? endAtDocument,
    AccountModelDocumentSnapshot? endBeforeDocument,
    AccountModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('creditBalance', descending: descending);

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

    return _$AccountModelQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$AccountModelQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class AccountModelQuerySnapshot
    extends FirestoreQuerySnapshot<AccountModelQueryDocumentSnapshot> {
  AccountModelQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<AccountModel> snapshot;

  @override
  final List<AccountModelQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<AccountModelDocumentSnapshot>> docChanges;
}

class AccountModelQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements AccountModelDocumentSnapshot {
  AccountModelQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<AccountModel> snapshot;

  @override
  AccountModelDocumentReference get reference {
    return AccountModelDocumentReference(snapshot.reference);
  }

  @override
  final AccountModel data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      ownerId: json['ownerId'] as String?,
      type: json['type'] as String,
      activeBalance: (json['activeBalance'] as num).toDouble(),
      creditBalance: (json['creditBalance'] as num).toDouble(),
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'ownerId': instance.ownerId,
      'type': instance.type,
      'activeBalance': instance.activeBalance,
      'creditBalance': instance.creditBalance,
    };
