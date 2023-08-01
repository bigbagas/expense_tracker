import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
          onDismissed: (direction) => onRemoveExpense(
            expenses[index],
          ),
          key: ValueKey(
            expenses[index],
          ),
          child: ExpenseItem(
            expenses[index],
          ),
        ),
      ),
    );
  }
}
