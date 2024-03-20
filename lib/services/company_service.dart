import 'package:botanico/config/firestore_collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/company_model.dart';
import '../utils/custom_service.dart';

/// A service to manage company-related operations with Firestore.
///
/// This class provides methods for CRUD operations on companies,
/// using Firebase Firestore as the backend.
class CompanyService extends GetxService with CustomService {
  @override
  String get logTag => 'CompanyService';

  /// Reference to the companies collection in Firestore.
  final _collectionRef = FirebaseFirestore.instance.collection(FirestoreCollections.companies);

  /// Observable for the currently selected/loaded company.
  final company$ = Rx<CompanyModel?>(null);

  /// Clears the current company observable.
  ///
  /// Resets the `company$` to null, effectively "unselecting" any company.
  void clean() => company$.value = null;

  /// Fetches a company by its ID and updates the observable `company$`.
  ///
  /// Attempts to retrieve a company from Firestore using the given [id].
  /// If a company is found, it updates `company$`; otherwise, it sets `company$` to null.
  Future<void> fetch(String id) async => company$.value = await _getCompany(id);

  /// Retrieves a company by its ID.
  ///
  /// Returns a [CompanyModel] instance if found, otherwise null.
  Future<CompanyModel?> get(String id) async => await _getCompany(id);

  /// Internal method to fetch a company document by ID.
  ///
  /// Queries Firestore for a company with the specified [id] and
  /// converts the document to a [CompanyModel] if it exists.
  Future<CompanyModel?> _getCompany(String id) async {
    final docSnapshot = await _getDocumentReference(id).get();
    return docSnapshot.exists ? CompanyModel.fromSnapshot(docSnapshot) : null;
  }

  /// Creates a new company document in Firestore and returns the updated model.
  ///
  /// This method generates a new document ID for the company, sets the `uid` of the [company] model,
  /// and writes the model data to Firestore. If a [txn] is provided, the operation is performed
  /// as part of the given transaction.
  Future<CompanyModel> create(CompanyModel company, {Transaction? txn}) async {
    DocumentReference docRef = _collectionRef.doc();
    CompanyModel newCompany = company.copyWith(uid: docRef.id);

    txn != null ? txn.set(docRef, newCompany.toMap()) : await docRef.set(newCompany.toMap());

    return newCompany;
  }

  /// Updates an existing company document in Firestore.
  ///
  /// Updates the company document identified by the `uid` of the [company] model with
  /// the model's current data. If a [txn] is provided, the operation is performed
  /// as part of the given transaction.
  Future<void> update(CompanyModel company, {Transaction? txn}) async {
    DocumentReference docRef = _collectionRef.doc(company.uid);

    txn != null ? txn.update(docRef, company.toMap()) : await docRef.update(company.toMap());
  }

  /// Helper method to get a [DocumentReference] for a company by its ID.
  DocumentReference _getDocumentReference(String id) => _collectionRef.doc(id);
}
