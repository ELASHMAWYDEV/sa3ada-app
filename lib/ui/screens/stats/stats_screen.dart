// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, slash_for_doc_comments, curly_braces_in_flow_control_structures

import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:sa3ada_app/data/firestore_models/item_model.dart';
import 'package:sa3ada_app/ui/components/balance_box.dart';
import 'package:sa3ada_app/ui/components/header.dart';
import 'package:sa3ada_app/utils/constants.dart';
import 'package:sa3ada_app/data/firestore_models/account_model.dart'
    as account_model;
import 'package:sa3ada_app/utils/services/firebase.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

// ignore:
/**
 * - Total items count
 * - Total traders' active, credit balance
 * - estimated revenue of the entire semester
 * 
 */
class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<account_model.AccountModelQuerySnapshot>(
        ref: account_model.accountsRef.whereType(isEqualTo: "trader"),
        builder: (context, snapshot, _) {
          if (snapshot.hasError) return Text('error: ${snapshot.error}');
          if (!snapshot.hasData)
            return CircularProgressIndicator(
              color: kGreenColor,
            );

          account_model.AccountModelQuerySnapshot querySnapshot =
              snapshot.requireData;

          List<account_model.AccountModel> accounts = querySnapshot.docs
              .map((e) => account_model.AccountModel.fromJson(
                  {...e.data.toJson(), "id": e.id}))
              .toList();

          final double totalTradersBalance = accounts
              .where((account) => account.type == "trader")
              .fold<double>(
                  0, (sum, account) => sum + account.totalBalance!.toDouble());

          // Get each account items
          // final List<ItemModel> accountsItems = accounts.map((account)async => (await account_model.accountsRef.doc(account.id).accountItems.get()))
          //                                                   .toList()
          //                                                   .map((accountItems) => accountItems.docs.map((e) => ItemModel.fromJson({...e.data.toJson(), "id": e.id})).toList())
          //                                                   .toList();

          return FirestoreBuilder<ItemModelQuerySnapshot>(
              ref: itemsRef,
              builder: (context, snapshot, _) {
                if (snapshot.hasError) return Text('error: ${snapshot.error}');
                if (!snapshot.hasData)
                  return SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: kGreenColor,
                    ),
                  );

                ItemModelQuerySnapshot querySnapshot = snapshot.requireData;
                List<ItemModel> items = querySnapshot.docs
                    .map((e) =>
                        ItemModel.fromJson({...e.data.toJson(), "id": e.id}))
                    .toList();

                return Scaffold(
                  body: Column(
                    children: [
                      Header(
                        title: "الاحصائيات",
                      ),
                      SizedBox(
                        height: size.height -
                            kToolbarHeight -
                            MediaQuery.of(context).padding.top,
                        child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              child: Column(children: [
                                BalanceBox(
                                  title: "اجمالي التعاملات مع التجار",
                                  balance: totalTradersBalance,
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                BalanceBox(
                                  title: "اجمالي ما علينا للتجار",
                                  balance: accounts
                                      .where(
                                          (account) => account.type == "trader")
                                      .fold<double>(
                                          0,
                                          (sum, account) =>
                                              sum +
                                              account.creditBalance!.toDouble())
                                      .abs(),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                BalanceBox(
                                  title: "تقدير الارباح",
                                  balance: totalTradersBalance * 0.7 / 0.8 -
                                      totalTradersBalance * 0.7,
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                BalanceBox(
                                  title: "عدد الاصناف الكلي",
                                  balance: items.length,
                                  subTitle: "صنف",
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                BalanceBox(
                                  title: "اجمالي الاصناف المتاحة",
                                  balance: 0,
                                  subTitle: "كتاب",
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                              ])),
                        ),
                      )
                    ],
                  ),
                );
              });
        });
  }
}
