import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;
  const TransactionList(this.transaction, this.deleteTx);
  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                const Text(
                  'No transactions added yet!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'OpenSans',
                    color: Color.fromARGB(255, 119, 119, 119),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          'assets/images/no-money.PNG',
                          fit: BoxFit.cover,
                        ))),
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text(
                          '${transaction[index].amount}৳',
                          style: const TextStyle(
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.bold,
                          ),
                        ))),
                  ),
                  title: Text(
                    transaction[index].title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transaction[index].date)),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? TextButton.icon(
                          icon: const Icon(
                            Icons.delete,
                            color: Color.fromARGB(
                                255, 183, 33, 22), //for icon color
                          ),
                          label: const Text(
                            'Delete',
                            style: TextStyle(
                              color: Color.fromARGB(
                                  255, 183, 33, 22), //for text color
                            ),
                          ),
                          onPressed: () => deleteTx(transaction[index].id),
                        )
                      : IconButton(
                          icon: const Icon(Icons.delete),
                          color: const Color.fromARGB(255, 183, 33, 22),
                          onPressed: () => deleteTx(transaction[index].id),
                        ),
                ),
              );
            },
            itemCount: transaction.length,
          );
  }
}
