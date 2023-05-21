import 'package:flutter/material.dart';
import 'package:hac_project/screens/payments_screen/payment_amount_widget.dart';
import 'package:hac_project/screens/payments_screen/payment_card.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: PaymentAmountWidget(amounts: [545, 50, 190]),
              ),
            ),
            SliverToBoxAdapter(
              child: ListView.separated(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) => const PaymentCard(
                  icon: Icon(Icons.ac_unit_rounded),
                  title: "title",
                  subtitle: "subtitle",
                  amount: 2154,
                ),
                separatorBuilder: (context, index) => const Divider(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
