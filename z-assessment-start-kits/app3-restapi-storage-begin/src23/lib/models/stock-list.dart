// ignore_for_file: unnecessary_import, use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './stock.dart';

//This module takes in a list and converts it to
//a ListView Widget populated with
//Cards made with ListTiles.

//ListView Widget of the Week
//https://www.youtube.com/watch?v=KJpkjHGiI5A&vl=en

class StockList extends StatefulWidget {
  const StockList({required this.stocks});

  final List<Stock> stocks;

  @override
  State<StatefulWidget> createState() {
    return _StockListState();
  }
}

class _StockListState extends State<StockList> {
  @override
  Widget build(BuildContext context) {
    return _buildStockList(context, widget.stocks);
  }

  ListView _buildStockList(context, List<Stock> stocks) {
    return ListView.builder(
      itemCount: stocks.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title:
              Text('Symbol: ${stocks[index].symbol}'),
            subtitle: 
              Text('Name: ${stocks[index].name}'),
            trailing: 
              Text('Price: \$${stocks[index].price} USD'),
          ),
        );
      },
    );
  }
}
