import 'package:expense_tracker/widgets/expense_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _listExpenses = [
    Expense(
      title: 'Flutter Quiz',
      amount: 19.9,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Vacation',
      amount: 16.3,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Chart'),
          Text("List"),
          Expanded(child: ExpensesList(expenses: _listExpenses))
        ],
      ),
    );
  }
}
