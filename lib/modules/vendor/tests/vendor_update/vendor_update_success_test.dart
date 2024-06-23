// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../app/tests/flows/app_init_flow.dart';
import '../../../company/tests/flows/company_create_from_sign_up_flow.dart';
import '../../../company/tests/flows/open_drawer_flow.dart';
import '../flows/vendor_create_navigate_flow.dart';
import '../flows/vendor_fill_data_flow.dart';
import '../flows/vendor_list_navigate_flow.dart';
import '../flows/vendor_save_flow.dart';

void vendorUpdateAndVerifyDetailsTest(String email, String password) {
  testWidgets('Update vendor details and verify', (WidgetTester tester) async {
    String vendorName = 'Proveedor de prueba';
    String cuit = '201234567890';
    String registrationType = 'Monotributo';
    String address = 'Calle 123, 4567890';
    String phone = '1234567890';
    String observations = 'Observaciones de prueba';

    String newVendorName = 'Nuevo proveedor';
    String newCuit = '201234567890';
    String newRegistrationType = 'Exento';
    String newAddress = 'Nueva dirección';
    String newPhone = '1234567890';
    String newObservations = 'Nuevas observaciones';

    await appInitFlow(tester);
    await companyCreateFromSignUpFlow(tester, email, password);
    await openDrawerFlow(tester);
    await vendorListNavigateFlow(tester);

    await vendorCreateNavigateFlow(tester);
    await vendorFillDataFlow(tester,
        name: vendorName,
        cuit: cuit,
        registrationType: registrationType,
        address: address,
        phone: phone,
        observations: observations);
    await vendorSaveFlow(tester);

    await tester.pumpAndSettle();
    await tester.tap(find.text(vendorName));
    await tester.pumpAndSettle();

    // Presionar el botón para desbloquear los campos para edición
    await tester.tap(find.byKey(const Key('VendorEnabledFormFields')));
    await tester.pumpAndSettle();

    // Modificar los detalles del proveedor
    await vendorFillDataFlow(tester,
        name: newVendorName,
        cuit: newCuit,
        registrationType: newRegistrationType,
        address: newAddress,
        phone: newPhone,
        observations: newObservations);
    await vendorSaveFlow(tester);

    await tester.pumpAndSettle();
    await tester.tap(find.text(newVendorName));
    await tester.pumpAndSettle();

    // Verificar que los detalles se hayan actualizado correctamente
    expect(find.text(newCuit), findsOneWidget);
    expect(find.text(newRegistrationType), findsOneWidget);
    expect(find.text(newAddress), findsOneWidget);
    expect(find.text(newPhone), findsOneWidget);
    expect(find.text(newObservations), findsOneWidget);
  });
}
