class Budgetmodel{
  final double amount;
  final DateTime startdate;
  final DateTime enddate;
  final String? note;

Budgetmodel({
 required this.amount,
 required this.startdate,
 required this.enddate,
 this.note,
});
}