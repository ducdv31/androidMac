import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';

StreamSubscription<List<PurchaseDetails>>? _subscription;

void initPurchase() {
  final Stream purchaseUpdated = InAppPurchase.instance.purchaseStream;
  _subscription = purchaseUpdated.listen((purchaseDetailsList) {
    // _listenToPurchaseUpdated(purchaseDetailsList);
  }, onDone: () {
    _subscription?.cancel();
  }, onError: (error) {
    // handle error here.
  }) as StreamSubscription<List<PurchaseDetails>>?;
}

// void _listenToPurchaseUpdated(List<PurchaseDetails> purchaseDetailsList) {
//   purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
//     if (purchaseDetails.status == PurchaseStatus.pending) {
//       _showPendingUI();
//     } else {
//       if (purchaseDetails.status == PurchaseStatus.error) {
//         _handleError(purchaseDetails.error!);
//       } else if (purchaseDetails.status == PurchaseStatus.purchased ||
//           purchaseDetails.status == PurchaseStatus.restored) {
//         bool valid = await _verifyPurchase(purchaseDetails);
//         if (valid) {
//           _deliverProduct(purchaseDetails);
//         } else {
//           _handleInvalidPurchase(purchaseDetails);
//         }
//       }
//       if (purchaseDetails.pendingCompletePurchase) {
//         await InAppPurchase.instance
//             .completePurchase(purchaseDetails);
//       }
//     }
//   });
// }

Future<void> listenStore() async {
  final bool available = await InAppPurchase.instance.isAvailable();
  if (!available) {
    // The store cannot be reached or accessed. Update the UI accordingly.
  }
}

void disposePurchase() {
  _subscription?.cancel();
}
