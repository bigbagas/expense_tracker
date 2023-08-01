import 'dart:math';

import 'package:expense_tracker/widgets/expense_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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
    Expense(
      title: 'Jajan',
      amount: 16.3,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _listExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _listExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Chart'),
          const Text("List"),
          Expanded(
              child: ExpensesList(
            expenses: _listExpenses,
            onRemoveExpense: _removeExpense,
          ))
        ],
      ),
    );
  }
}
