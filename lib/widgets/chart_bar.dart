import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String lable;
  final double spebdingAmount;
  final double spendingPctOfTotal;

  const ChartBar(this.lable, this.spebdingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                    child: Text('${spebdingAmount.toStringAsFixed(0)}৳'))),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: const Color.fromARGB(220, 220, 220, 220),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ]),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
                height: constraints.maxHeight * 0.12,
                child: FittedBox(child: Text(lable))),
          ],
        );
      },
    );
  }
}
