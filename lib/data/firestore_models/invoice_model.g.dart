// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

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
abstract class InvoiceModelCollectionReference
    implements
        InvoiceModelQuery,
        FirestoreCollectionReference<InvoiceModelQuerySnapshot> {
  factory InvoiceModelCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$InvoiceModelCollectionReference;

  static InvoiceModel fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return InvoiceModel.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    InvoiceModel value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  InvoiceModelDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<InvoiceModelDocumentReference> add(InvoiceModel value);
}

class _$InvoiceModelCollectionReference extends _$InvoiceModelQuery
    implements InvoiceModelCollectionReference {
  factory _$InvoiceModelCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$InvoiceModelCollectionReference._(
      firestore.collection('invoices').withConverter(
            fromFirestore: InvoiceModelCollectionReference.fromFirestore,
            toFirestore: InvoiceModelCollectionReference.toFirestore,
          ),
    );
  }

  _$InvoiceModelCollectionReference._(
    CollectionReference<InvoiceModel> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<InvoiceModel> get reference =>
      super.reference as CollectionReference<InvoiceModel>;

  @override
  InvoiceModelDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return InvoiceModelDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<InvoiceModelDocumentReference> add(InvoiceModel value) {
    return reference
        .add(value)
        .then((ref) => InvoiceModelDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$InvoiceModelCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class InvoiceModelDocumentReference
    extends FirestoreDocumentReference<InvoiceModelDocumentSnapshot> {
  factory InvoiceModelDocumentReference(
          DocumentReference<InvoiceModel> reference) =
      _$InvoiceModelDocumentReference;

  DocumentReference<InvoiceModel> get reference;

  /// A reference to the [InvoiceModelCollectionReference] containing this document.
  InvoiceModelCollectionReference get parent {
    return _$InvoiceModelCollectionReference(reference.firestore);
  }

  late final ItemModelCollectionReference items =
      _$ItemModelCollectionReference(
    reference,
  );

  @override
  Stream<InvoiceModelDocumentSnapshot> snapshots();

  @override
  Future<InvoiceModelDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String? id,
    double total,
    double discountPercentage,
    double subTotal,
    double paidAmount,
    double? commissionPercentage,
    num? invoiceReference,
    String status,
    String? cancellationReason,
  });

  Future<void> set(InvoiceModel value);
}

class _$InvoiceModelDocumentReference
    extends FirestoreDocumentReference<InvoiceModelDocumentSnapshot>
    implements InvoiceModelDocumentReference {
  _$InvoiceModelDocumentReference(this.reference);

  @override
  final DocumentReference<InvoiceModel> reference;

  /// A reference to the [InvoiceModelCollectionReference] containing this document.
  InvoiceModelCollectionReference get parent {
    return _$InvoiceModelCollectionReference(reference.firestore);
  }

  late final ItemModelCollectionReference items =
      _$ItemModelCollectionReference(
    reference,
  );

  @override
  Stream<InvoiceModelDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return InvoiceModelDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<InvoiceModelDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return InvoiceModelDocumentSnapshot._(
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
    Object? total = _sentinel,
    Object? discountPercentage = _sentinel,
    Object? subTotal = _sentinel,
    Object? paidAmount = _sentinel,
    Object? commissionPercentage = _sentinel,
    Object? invoiceReference = _sentinel,
    Object? status = _sentinel,
    Object? cancellationReason = _sentinel,
  }) async {
    final json = {
      if (id != _sentinel) "id": id as String?,
      if (total != _sentinel) "total": total as double,
      if (discountPercentage != _sentinel)
        "discountPercentage": discountPercentage as double,
      if (subTotal != _sentinel) "subTotal": subTotal as double,
      if (paidAmount != _sentinel) "paidAmount": paidAmount as double,
      if (commissionPercentage != _sentinel)
        "commissionPercentage": commissionPercentage as double?,
      if (invoiceReference != _sentinel)
        "invoiceReference": invoiceReference as num?,
      if (status != _sentinel) "status": status as String,
      if (cancellationReason != _sentinel)
        "cancellationReason": cancellationReason as String?,
    };

    return reference.update(json);
  }

  Future<void> set(InvoiceModel value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is InvoiceModelDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class InvoiceModelDocumentSnapshot extends FirestoreDocumentSnapshot {
  InvoiceModelDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<InvoiceModel> snapshot;

  @override
  InvoiceModelDocumentReference get reference {
    return InvoiceModelDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final InvoiceModel? data;
}

abstract class InvoiceModelQuery
    implements QueryReference<InvoiceModelQuerySnapshot> {
  @override
  InvoiceModelQuery limit(int limit);

  @override
  InvoiceModelQuery limitToLast(int limit);

  InvoiceModelQuery whereId({
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
  InvoiceModelQuery whereTotal({
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
  InvoiceModelQuery whereDiscountPercentage({
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
  InvoiceModelQuery whereSubTotal({
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
  InvoiceModelQuery wherePaidAmount({
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
  InvoiceModelQuery whereCommissionPercentage({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double?>? whereIn,
    List<double?>? whereNotIn,
  });
  InvoiceModelQuery whereInvoiceReference({
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
  InvoiceModelQuery whereStatus({
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
  InvoiceModelQuery whereCancellationReason({
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

  InvoiceModelQuery orderById({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
  });

  InvoiceModelQuery orderByTotal({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
  });

  InvoiceModelQuery orderByDiscountPercentage({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
  });

  InvoiceModelQuery orderBySubTotal({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
  });

  InvoiceModelQuery orderByPaidAmount({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
  });

  InvoiceModelQuery orderByCommissionPercentage({
    bool descending = false,
    double? startAt,
    double? startAfter,
    double? endAt,
    double? endBefore,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
  });

  InvoiceModelQuery orderByInvoiceReference({
    bool descending = false,
    num? startAt,
    num? startAfter,
    num? endAt,
    num? endBefore,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
  });

  InvoiceModelQuery orderByStatus({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
  });

  InvoiceModelQuery orderByCancellationReason({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
  });
}

class _$InvoiceModelQuery extends QueryReference<InvoiceModelQuerySnapshot>
    implements InvoiceModelQuery {
  _$InvoiceModelQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<InvoiceModel> reference;

  InvoiceModelQuerySnapshot _decodeSnapshot(
    QuerySnapshot<InvoiceModel> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return InvoiceModelQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<InvoiceModelDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: InvoiceModelDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return InvoiceModelQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<InvoiceModelQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<InvoiceModelQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  InvoiceModelQuery limit(int limit) {
    return _$InvoiceModelQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  InvoiceModelQuery limitToLast(int limit) {
    return _$InvoiceModelQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  InvoiceModelQuery whereId({
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
    return _$InvoiceModelQuery(
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

  InvoiceModelQuery whereTotal({
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
    return _$InvoiceModelQuery(
      reference.where(
        'total',
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

  InvoiceModelQuery whereDiscountPercentage({
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
    return _$InvoiceModelQuery(
      reference.where(
        'discountPercentage',
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

  InvoiceModelQuery whereSubTotal({
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
    return _$InvoiceModelQuery(
      reference.where(
        'subTotal',
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

  InvoiceModelQuery wherePaidAmount({
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
    return _$InvoiceModelQuery(
      reference.where(
        'paidAmount',
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

  InvoiceModelQuery whereCommissionPercentage({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double?>? whereIn,
    List<double?>? whereNotIn,
  }) {
    return _$InvoiceModelQuery(
      reference.where(
        'commissionPercentage',
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

  InvoiceModelQuery whereInvoiceReference({
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
    return _$InvoiceModelQuery(
      reference.where(
        'invoiceReference',
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

  InvoiceModelQuery whereStatus({
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
    return _$InvoiceModelQuery(
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

  InvoiceModelQuery whereCancellationReason({
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
    return _$InvoiceModelQuery(
      reference.where(
        'cancellationReason',
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

  InvoiceModelQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
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

    return _$InvoiceModelQuery(query, _collection);
  }

  InvoiceModelQuery orderByTotal({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('total', descending: descending);

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

    return _$InvoiceModelQuery(query, _collection);
  }

  InvoiceModelQuery orderByDiscountPercentage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('discountPercentage', descending: descending);

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

    return _$InvoiceModelQuery(query, _collection);
  }

  InvoiceModelQuery orderBySubTotal({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('subTotal', descending: descending);

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

    return _$InvoiceModelQuery(query, _collection);
  }

  InvoiceModelQuery orderByPaidAmount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('paidAmount', descending: descending);

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

    return _$InvoiceModelQuery(query, _collection);
  }

  InvoiceModelQuery orderByCommissionPercentage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy('commissionPercentage', descending: descending);

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

    return _$InvoiceModelQuery(query, _collection);
  }

  InvoiceModelQuery orderByInvoiceReference({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('invoiceReference', descending: descending);

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

    return _$InvoiceModelQuery(query, _collection);
  }

  InvoiceModelQuery orderByStatus({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
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

    return _$InvoiceModelQuery(query, _collection);
  }

  InvoiceModelQuery orderByCancellationReason({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    InvoiceModelDocumentSnapshot? startAtDocument,
    InvoiceModelDocumentSnapshot? endAtDocument,
    InvoiceModelDocumentSnapshot? endBeforeDocument,
    InvoiceModelDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('cancellationReason', descending: descending);

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

    return _$InvoiceModelQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$InvoiceModelQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class InvoiceModelQuerySnapshot
    extends FirestoreQuerySnapshot<InvoiceModelQueryDocumentSnapshot> {
  InvoiceModelQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<InvoiceModel> snapshot;

  @override
  final List<InvoiceModelQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<InvoiceModelDocumentSnapshot>> docChanges;
}

class InvoiceModelQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements InvoiceModelDocumentSnapshot {
  InvoiceModelQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<InvoiceModel> snapshot;

  @override
  InvoiceModelDocumentReference get reference {
    return InvoiceModelDocumentReference(snapshot.reference);
  }

  @override
  final InvoiceModel data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ItemModelCollectionReference
    implements
        ItemModelQuery,
        FirestoreCollectionReference<ItemModelQuerySnapshot> {
  factory ItemModelCollectionReference(
    DocumentReference<InvoiceModel> parent,
  ) = _$ItemModelCollectionReference;

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

  /// A reference to the containing [InvoiceModelDocumentReference] if this is a subcollection.
  InvoiceModelDocumentReference get parent;

  @override
  ItemModelDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ItemModelDocumentReference> add(ItemModel value);
}

class _$ItemModelCollectionReference extends _$ItemModelQuery
    implements ItemModelCollectionReference {
  factory _$ItemModelCollectionReference(
    DocumentReference<InvoiceModel> parent,
  ) {
    return _$ItemModelCollectionReference._(
      InvoiceModelDocumentReference(parent),
      parent.collection('items').withConverter(
            fromFirestore: ItemModelCollectionReference.fromFirestore,
            toFirestore: ItemModelCollectionReference.toFirestore,
          ),
    );
  }

  _$ItemModelCollectionReference._(
    this.parent,
    CollectionReference<ItemModel> reference,
  ) : super(reference, reference);

  @override
  final InvoiceModelDocumentReference parent;

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
    return _$ItemModelCollectionReference(
      reference.parent.parent!.withConverter<InvoiceModel>(
        fromFirestore: InvoiceModelCollectionReference.fromFirestore,
        toFirestore: InvoiceModelCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<ItemModelDocumentSnapshot> snapshots();

  @override
  Future<ItemModelDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String? id,
    String name,
    String type,
    num coverPrice,
    List<String> images,
    String? barcode,
    int? itemReference,
    String? grade,
    String? semester,
    int? quantity,
    int year,
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
    return _$ItemModelCollectionReference(
      reference.parent.parent!.withConverter<InvoiceModel>(
        fromFirestore: InvoiceModelCollectionReference.fromFirestore,
        toFirestore: InvoiceModelCollectionReference.toFirestore,
      ),
    );
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
    Object? id = _sentinel,
    Object? name = _sentinel,
    Object? type = _sentinel,
    Object? coverPrice = _sentinel,
    Object? images = _sentinel,
    Object? barcode = _sentinel,
    Object? itemReference = _sentinel,
    Object? grade = _sentinel,
    Object? semester = _sentinel,
    Object? quantity = _sentinel,
    Object? year = _sentinel,
  }) async {
    final json = {
      if (id != _sentinel) "id": id as String?,
      if (name != _sentinel) "name": name as String,
      if (type != _sentinel) "type": type as String,
      if (coverPrice != _sentinel) "coverPrice": coverPrice as num,
      if (images != _sentinel) "images": images as List<String>,
      if (barcode != _sentinel) "barcode": barcode as String?,
      if (itemReference != _sentinel) "itemReference": itemReference as int?,
      if (grade != _sentinel) "grade": grade as String?,
      if (semester != _sentinel) "semester": semester as String?,
      if (quantity != _sentinel) "quantity": quantity as int?,
      if (year != _sentinel) "year": year as int,
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

  ItemModelQuery whereId({
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
  ItemModelQuery whereType({
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
  ItemModelQuery whereItemReference({
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
  ItemModelQuery whereQuantity({
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
  ItemModelQuery whereYear({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });

  ItemModelQuery orderById({
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

  ItemModelQuery orderByType({
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

  ItemModelQuery orderByItemReference({
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

  ItemModelQuery orderByQuantity({
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

  ItemModelQuery orderByYear({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
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

  ItemModelQuery whereId({
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

  ItemModelQuery whereType({
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

  ItemModelQuery whereItemReference({
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
        'itemReference',
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

  ItemModelQuery whereQuantity({
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
        'quantity',
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

  ItemModelQuery whereYear({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$ItemModelQuery(
      reference.where(
        'year',
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

  ItemModelQuery orderById({
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

    return _$ItemModelQuery(query, _collection);
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

  ItemModelQuery orderByType({
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

  ItemModelQuery orderByItemReference({
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
    var query = reference.orderBy('itemReference', descending: descending);

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

  ItemModelQuery orderByQuantity({
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
    var query = reference.orderBy('quantity', descending: descending);

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

  ItemModelQuery orderByYear({
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
    var query = reference.orderBy('year', descending: descending);

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

InvoiceModel _$InvoiceModelFromJson(Map<String, dynamic> json) => InvoiceModel(
      id: json['id'] as String?,
      from: AccountModel.fromJson(json['from'] as Map<String, dynamic>),
      to: AccountModel.fromJson(json['to'] as Map<String, dynamic>),
      total: (json['total'] as num).toDouble(),
      discountPercentage: (json['discountPercentage'] as num).toDouble(),
      subTotal: (json['subTotal'] as num).toDouble(),
      paidAmount: (json['paidAmount'] as num).toDouble(),
      commissionPercentage: (json['commissionPercentage'] as num?)?.toDouble(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      invoiceReference: json['invoiceReference'] as num?,
      invoiceCreator: InvoiceCreatorModel.fromJson(
          json['invoiceCreator'] as Map<String, dynamic>),
      invoiceDate: DateTime.parse(json['invoiceDate'] as String),
      status: json['status'] as String,
      cancellationReason: json['cancellationReason'] as String?,
    );

Map<String, dynamic> _$InvoiceModelToJson(InvoiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from': instance.from.toJson(),
      'to': instance.to.toJson(),
      'total': instance.total,
      'discountPercentage': instance.discountPercentage,
      'subTotal': instance.subTotal,
      'paidAmount': instance.paidAmount,
      'commissionPercentage': instance.commissionPercentage,
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
      'invoiceReference': instance.invoiceReference,
      'invoiceCreator': instance.invoiceCreator.toJson(),
      'invoiceDate': instance.invoiceDate.toIso8601String(),
      'status': instance.status,
      'cancellationReason': instance.cancellationReason,
    };
