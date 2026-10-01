import 'package:flutter/material.dart';

import 'models/stationery_item.dart';

class DetailPage extends StatefulWidget {
  final int stationeryIndex;

  const DetailPage({super.key, required this.stationeryIndex});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final TextEditingController _qtyController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final stationery = StationeryItem.sampleData[widget.stationeryIndex];

    if (_qtyController.text.isEmpty) {
      _qtyController.text = stationery.stock.toString();
    }

    if (_descController.text.isEmpty) {
      _descController.text = stationery.description.toString();
    }
    if (_priceController.text.isEmpty) {
      _priceController.text = stationery.price.toString();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(stationery.name),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(stationery.imageUrl, height: 250, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stationery.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rp ${stationery.formattedPrice}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),
                  const Text('Deskripsi'),
                  TextField(
                    controller: _descController,
                    onChanged: (value) {
                      final parsed = int.tryParse(value);
                      if (parsed != null && parsed >= 0) {
                        setState(() {
                          stationery.description;
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 16),
                  const Text('Stok Tersedia'),
                  TextField(
                    controller: _qtyController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final parsed = int.tryParse(value);
                      if (parsed != null && parsed >= 0) {
                        setState(() {
                          stationery.stock = parsed;
                        });
                      }
                    },
                  ),

                  const SizedBox(height: 16),
                  const Text('Harga Tersedia (pcs)'),
                  TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      final parsed = int.tryParse(value);
                      if (parsed != null && parsed >= 0) {
                        setState(() {
                          stationery.price = parsed;
                        });
                      }
                    },
                  ),

                  // const SizedBox(height: 16),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     const Text(
                  //       'Total',
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //     Text(
                  //       'Rp ${stationery.formattedPrice}',
                  //       style: const TextStyle(
                  //         color: Colors.green,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Simpan Pesanan'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
