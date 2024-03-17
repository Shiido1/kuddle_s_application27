import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../pages/bookings/model/transaction_data_model.dart';
import '../../services/provider/provider_services.dart';

class TransactionListScreen extends StatefulWidget {
  final TransactionData transactions;

  TransactionListScreen({required this.transactions});

  @override
  State<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  late ProviderServices providerServices;

  @override
  void initState() {
    super.initState();
    providerServices = Provider.of<ProviderServices>(context, listen: false);
    // Uncomment the lines below if needed
    // providerServices?.getAllWalletDetails();
    // providerServices?.getUserDetails();
    providerServices.getAllWalletHistory();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ProviderServices>(
          builder: (_, provider, __) {
            // Check if provider or transactionData is null before accessing data
            if (provider.transactionData?.status != "Success") {
              return Center(child: const CircularProgressIndicator());
            }
            return Container(
              width: double.infinity,
              height: 600,
              child: ListView.builder(
                itemCount: provider.transactionData?.transactions.length,
                itemBuilder: (context, index) {
                  return _buildTransactionCard(provider.transactionData!.transactions[index]);
                },
              ),
            );
          },
        ),
      );

  }

  Widget _buildTransactionCard(TransactionInfo transaction) {
    bool isDebit = transaction.transactionType == 'debit';
    IconData icon = isDebit ? Icons.arrow_downward : Icons.arrow_upward;
    Color amountColor = isDebit ? Colors.red : Colors.green;
    String formattedAmount = '${isDebit ? '-' : ''}${transaction.amount}';

    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, color: amountColor),
        title: Text(formattedAmount, style: TextStyle(color: amountColor)),
        subtitle: Text(
          transaction.description?.toString() ?? 'booking',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Text(
          _formatDate(transaction.createdAt.toString()),
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }

  String _formatDate(String createdAt) {
    DateTime dateTime = DateTime.parse(createdAt);
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}

