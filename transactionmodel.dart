class Transactionmodel {
  final double  amount;
  final String transactiontype;
  final String category;
  final DateTime date;
  final String? notes;

Transactionmodel({
  required this. amount,
  required this.transactiontype,
  required this.category,
  required this.date,
 this.notes,

});
}