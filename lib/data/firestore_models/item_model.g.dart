// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

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
abstract class ItemModelCollectionReference
    implements
        ItemModelQuery,
        FirestoreCollectionReference<ItemModelQuerySnapshot> {
  factory ItemModelCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$ItemModelCollectionReference;

  static ItemModel fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return ItemModel.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    ItemModel value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  ItemModelDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ItemModelDocumentReference> add(ItemModel value);
}

class _$ItemModelCollectionReference extends _$ItemModelQuery
    implements ItemModelCollectionReference {
  factory _$ItemModelCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$ItemModelCollectionReference._(
      firestore.collection('items').withConverter(
            fromFirestore: ItemModelCollectionReference.fromFirestore,
            toFirestore: ItemModelCollectionReference.toFirestore,
          ),
    );
  }

  _$ItemModelCollectionReference._(
    CollectionReference<ItemModel> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<ItemModel> get reference =>
      super.reference as CollectionReference<ItemModel>;

  @override
  ItemModelDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return ItemModelDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ItemModelDocumentReference> add(ItemModel value) {
    return reference.add(value).then((ref) => ItemModelDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ItemModelCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ItemModelDocumentReference
    extends FirestoreDocumentReference<ItemModelDocumentSnapshot> {
  factory ItemModelDocumentReference(DocumentReference<ItemModel> reference) =
      _$ItemModelDocumentReference;

  DocumentReference<ItemModel> get reference;

  /// A reference to the [ItemModelCollectionReference] containing this document.
  ItemModelCollectionReference get parent {
    return _$ItemModelCollectionReference(reference.firestore);
  }

  @override
  Stream<ItemModelDocumentSnapshot> snapshots();

  @override
  Future<ItemModelDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    num coverPrice,
    List<String> images,
    String? barcode,
    int? customCode,
    String? grade,
    String? semester,
  });

  Future<void> set(ItemModel value);
}

class _$ItemModelDocumentReference
    extends FirestoreDocumentReference<ItemModelDocumentSnapshot>
    implements ItemModelDocumentReference {
  _$ItemModelDocumentReference(this.reference);

  @override
  final DocumentReference<ItemModel> reference;

  /// A reference to the [ItemModelCollectionReference] containing this document.
  ItemModelCollectionReference get parent {
    return _$ItemModelCollectionReference(reference.firestore);
  }

  @override
  Stream<ItemModelDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return ItemModelDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<ItemModelDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return ItemModelDocumentSnapshot._(
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
    Object? name = _sentinel,
    Object? coverPrice = _sentinel,
    Object? images = _sentinel,
    Object? barcode = _sentinel,
    Object? customCode = _sentinel,
    Object? grade = _sentinel,
    Object? semester = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
      if (coverPrice != _sentinel) "coverPrice": coverPrice as num,
      if (images != _sentinel) "images": images as List<String>,
      if (barcode != _sentinel) "barcode": barcode as String?,
      if (customCode != _sentinel) "customCode": customCode as int?,
      if (grade != _sentinel) "grade": grade as String?,
      if (semester != _sentinel) "semester": semester as String?,
    };

    return reference.update(json);
  }

  Future<void> set(ItemModel value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemModelDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class ItemModelDocumentSnapshot extends FirestoreDocumentSnapshot {
  ItemModelDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<ItemModel> snapshot;

  @override
  ItemModelDocumentReference get reference {
    return ItemModelDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final ItemModel? data;
}

abstract class ItemModelQuery
    implements QueryReference<ItemModelQuerySnapshot> {
  @override
  ItemModelQuery limit(int limit);

  @override
  ItemModelQuery limitToLast(int limit);

  ItemModelQuery whereName({
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
  ItemModelQuery whereCoverPrice({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num>? whereIn,
    List<num>? whereNotIn,
  });
  ItemModelQuery whereImages({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  });
  ItemModelQuery whereBarcode({
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
  ItemModelQuery whereCustomCode({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  });
  ItemModelQuery whereGrade({
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
  ItemModelQuery whereSemester({
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

  ItemModelQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ItemModelDocumentSnapshot? startAtDocument,
    ItemModelDocumentSnapshot? endAtDocument,
    ItemModelDocumentSnapshot? endBeforeDocument,
    ItemModelDocumentSnapshot? startAfterDocument,
  });

  ItemModelQuery orderByCoverPrice({
    bool descending = false,
    num startAt,
    num startAfter,
    num endAt,
    num endBefore,
    ItemModelDocumentSnapshot? startAtDocument,
    ItemModelDocumentSnapshot? endAtDocument,
    ItemModelDocumentSnapshot? endBeforeDocument,
    ItemModelDocumentSnapshot? startAfterDocument,
  });

  ItemModelQuery orderByImages({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    ItemModelDocumentSnapshot? startAtDocument,
    ItemModelDocumentSnapshot? endAtDocument,
    ItemModelDocumentSnapshot? endBeforeDocument,
    ItemModelDocumentSnapshot? startAfterDocument,
  });

  ItemModelQuery orderByBarcode({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ItemModelDocumentSnapshot? startAtDocument,
    ItemModelDocumentSnapshot? endAtDocument,
    ItemModelDocumentSnapshot? endBeforeDocument,
    ItemModelDocumentSnapshot? startAfterDocument,
  });

  ItemModelQuery orderByCustomCode({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    ItemModelDocumentSnapshot? startAtDocument,
    ItemModelDocumentSnapshot? endAtDocument,
    ItemModelDocumentSnapshot? endBeforeDocument,
    ItemModelDocumentSnapshot? startAfterDocument,
  });

  ItemModelQuery orderByGrade({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ItemModelDocumentSnapshot? startAtDocument,
    ItemModelDocumentSnapshot? endAtDocument,
    ItemModelDocumentSnapshot? endBeforeDocument,
    ItemModelDocumentSnapshot? startAfterDocument,
  });

  ItemModelQuery orderBySemester({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ItemModelDocumentSnapshot? startAtDocument,
    ItemModelDocumentSnapshot? endAtDocument,
    ItemModelDocumentSnapshot? endBeforeDocument,
    ItemModelDocumentSnapshot? startAfterDocument,
  });
}

class _$ItemModelQuery extends QueryReference<ItemModelQuerySnapshot>
    implements ItemModelQuery {
  _$ItemModelQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<ItemModel> reference;

  ItemModelQuerySnapshot _decodeSnapshot(
    QuerySnapshot<ItemModel> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return ItemModelQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<ItemModelDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: ItemModelDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return ItemModelQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<ItemModelQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<ItemModelQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  ItemModelQuery limit(int limit) {
    return _$ItemModelQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  ItemModelQuery limitToLast(int limit) {
    return _$ItemModelQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  ItemModelQuery whereName({
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
    return _$ItemModelQuery(
      reference.where(
        'name',
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

  ItemModelQuery whereCoverPrice({
    num? isEqualTo,
    num? isNotEqualTo,
    num? isLessThan,
    num? isLessThanOrEqualTo,
    num? isGreaterThan,
    num? isGreaterThanOrEqualTo,
    bool? isNull,
    List<num>? whereIn,
    List<num>? whereNotIn,
  }) {
    return _$ItemModelQuery(
      reference.where(
        'coverPrice',
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

  ItemModelQuery whereImages({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  }) {
    return _$ItemModelQuery(
      reference.where(
        'images',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  ItemModelQuery whereBarcode({
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
    return _$ItemModelQuery(
      reference.where(
        'barcode',
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

  ItemModelQuery whereCustomCode({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  }) {
    return _$ItemModelQuery(
      reference.where(
        'customCode',
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

  ItemModelQuery whereGrade({
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
    return _$ItemModelQuery(
      reference.where(
        'grade',
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

  ItemModelQuery whereSemester({
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
    return _$ItemModelQuery(
      reference.where(
        'semester',
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

  ItemModelQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ItemModelDocumentSnapshot? startAtDocument,
    ItemModelDocumentSnapshot? endAtDocument,
    ItemModelDocumentSnapshot? endBeforeDocument,
    ItemModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: descending);

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

    return _$ItemModelQuery(query, _collection);
  }

  ItemModelQuery orderByCoverPrice({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ItemModelDocumentSnapshot? startAtDocument,
    ItemModelDocumentSnapshot? endAtDocument,
    ItemModelDocumentSnapshot? endBeforeDocument,
    ItemModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('coverPrice', descending: descending);

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

    return _$ItemModelQuery(query, _collection);
  }

  ItemModelQuery orderByImages({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ItemModelDocumentSnapshot? startAtDocument,
    ItemModelDocumentSnapshot? endAtDocument,
    ItemModelDocumentSnapshot? endBeforeDocument,
    ItemModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('images', descending: descending);

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

    return _$ItemModelQuery(query, _collection);
  }

  ItemModelQuery orderByBarcode({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ItemModelDocumentSnapshot? startAtDocument,
    ItemModelDocumentSnapshot? endAtDocument,
    ItemModelDocumentSnapshot? endBeforeDocument,
    ItemModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('barcode', descending: descending);

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

    return _$ItemModelQuery(query, _collection);
  }

  ItemModelQuery orderByCustomCode({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ItemModelDocumentSnapshot? startAtDocument,
    ItemModelDocumentSnapshot? endAtDocument,
    ItemModelDocumentSnapshot? endBeforeDocument,
    ItemModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('customCode', descending: descending);

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

    return _$ItemModelQuery(query, _collection);
  }

  ItemModelQuery orderByGrade({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ItemModelDocumentSnapshot? startAtDocument,
    ItemModelDocumentSnapshot? endAtDocument,
    ItemModelDocumentSnapshot? endBeforeDocument,
    ItemModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('grade', descending: descending);

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

    return _$ItemModelQuery(query, _collection);
  }

  ItemModelQuery orderBySemester({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ItemModelDocumentSnapshot? startAtDocument,
    ItemModelDocumentSnapshot? endAtDocument,
    ItemModelDocumentSnapshot? endBeforeDocument,
    ItemModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('semester', descending: descending);

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

    return _$ItemModelQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$ItemModelQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ItemModelQuerySnapshot
    extends FirestoreQuerySnapshot<ItemModelQueryDocumentSnapshot> {
  ItemModelQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<ItemModel> snapshot;

  @override
  final List<ItemModelQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ItemModelDocumentSnapshot>> docChanges;
}

class ItemModelQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements ItemModelDocumentSnapshot {
  ItemModelQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<ItemModel> snapshot;

  @override
  ItemModelDocumentReference get reference {
    return ItemModelDocumentReference(snapshot.reference);
  }

  @override
  final ItemModel data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      name: json['name'] as String,
      coverPrice: json['coverPrice'] as num,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      barcode: json['barcode'] as String?,
      customCode: json['customCode'] as int?,
      grade: json['grade'] as String?,
      semester: json['semester'] as String?,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'name': instance.name,
      'coverPrice': instance.coverPrice,
      'images': instance.images,
      'barcode': instance.barcode,
      'customCode': instance.customCode,
      'grade': instance.grade,
      'semester': instance.semester,
    };
