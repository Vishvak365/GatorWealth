class Transactions {
  int amountSpent;
  String transactionName;
  String date;
  Transactions(this.amountSpent, this.transactionName, this.date);
  Transactions.fromJson(Map<String, dynamic> json) {
    amountSpent = json['transactions_amount'];
    transactionName = json['transactions_name'];
    date = json['transactions_date'];
  }
}
