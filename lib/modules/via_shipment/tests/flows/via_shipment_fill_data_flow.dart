import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> viaShipmentFillDataFlow(
  WidgetTester tester, {
  String shipmentId = 'Shipment123',
  String type = 'TypeA',
  String client = 'ClientX',
  String package = 'PackageY',
  double weight = 10.0,
  String description = 'Description here',
  String state = 'Pending',
  bool isInvoiced = false,
  DateTime? createdDateTime,
  String deliveryPlace = 'PlaceZ',
}) async {
  final shipmentIdField = find.byKey(const Key('shipmentIdField'));
  final typeField = find.byKey(const Key('typeField'));
  final clientField = find.byKey(const Key('clientField'));
  final packageField = find.byKey(const Key('packageField'));
  final weightField = find.byKey(const Key('weightField'));
  final descriptionField = find.byKey(const Key('descriptionField'));
  final stateField = find.byKey(const Key('stateField'));
  final isInvoicedField = find.byKey(const Key('isInvoicedField'));
  final createdDateTimeField = find.byKey(const Key('createdDateTimeField'));
  final deliveryPlaceField = find.byKey(const Key('deliveryPlaceField'));

  await tester.enterText(shipmentIdField, shipmentId);
  await tester.enterText(typeField, type);
  await tester.enterText(clientField, client);
  await tester.enterText(packageField, package);
  await tester.enterText(weightField, weight.toString());
  await tester.enterText(descriptionField, description);
  await tester.enterText(stateField, state);
  await tester.enterText(isInvoicedField, isInvoiced.toString());
  await tester.enterText(createdDateTimeField, createdDateTime.toString());
  await tester.enterText(deliveryPlaceField, deliveryPlace);
}
