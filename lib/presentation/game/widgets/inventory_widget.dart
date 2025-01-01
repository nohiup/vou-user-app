import 'package:flutter/material.dart';
import 'package:vou_user/domain/entity/inventory_item.dart';
import 'package:vou_user/domain/entity/trade_item.dart';

class InventoryWidget extends StatelessWidget {
  final List<InventoryItem> items;
  final List<TradeItem> trades;

  InventoryWidget({super.key, required this.items, required this.trades});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "YOUR INVENTORY",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 5),

        Flexible(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.5,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.green, width: 2.0),
                    // Change the color and width as needed
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context, builder: (BuildContext context) {
                            TextEditingController _emailController = TextEditingController();
                            TextEditingController _quantityController = TextEditingController();
                        return AlertDialog(
                          title: Text('Send letter ${item.letter}'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  labelText: 'Recipient Email',
                                ),
                              ),
                              TextFormField(
                                controller: _quantityController,
                                decoration: const InputDecoration(
                                  labelText: 'Quantity',
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),

                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                            TextButton(
                              onPressed: () {
                                if (_emailController.text.isEmpty || _quantityController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    duration: Duration(seconds: 1), content: Text('Please fill in all fields'))
                                  );
                                  return;
                                }
                                try {
                                  final quantity = int.parse(_quantityController.text);
                                  if (quantity > item.quantity) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            duration: Duration(seconds: 1),
                                            content: Text(
                                                'You do not have enough letters'))
                                    );
                                    return;
                                  }
                                } catch (e) {
                                  return;
                                }
                                //TODO: Send the letters here
                                Navigator.of(context).pop();
                              },
                              child: const Text('Send'),
                            ),

                          ],
                        );
                      });
                    },
                    child: ListTile(
                      title: Text(
                        item.letter,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text('Amount: ${item.quantity}'),
                    ),
                  )
              );
            },
          ),
        ),

        const SizedBox(height: 10),
        const Divider(thickness: 2),
        const SizedBox(height: 20),

        const Center(
            child: Text("EVENT TRADE SHOP ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
            )
        ),
        const SizedBox(height: 5),
        Flexible(
          flex: 4,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: trades.length,
            itemBuilder: (context, index) {
              final item = trades[index];
              return Card(
                margin: const EdgeInsets.symmetric(
                    vertical: 8.0, horizontal: 16.0),
                child: ListTile(
                  title: Text(
                    item.voucher.code,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Require: "),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Vx',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: '${item.amountOfV}',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(
                                  text: ' - ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Ox',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: '${item.amountOfO}',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(
                                  text: ' - ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                const TextSpan(
                                  text: 'Ux',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                TextSpan(
                                  text: '${item.amountOfU}',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(
                                  text: ' - ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                              onPressed: (){
                                if (item.amountOfVoucher <= 0) {
                                  return;
                                }
                                if (item.amountOfV > items[0].quantity || item.amountOfO > items[1].quantity || item.amountOfU > items[2].quantity) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          duration: Duration(seconds: 1),
                                          content: Text('You do not have enough letters'))
                                  );
                                  return;
                                }
                                else {
                                  //TODO: Trade the vouchers here
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          duration: Duration(seconds: 1),
                                          content: Text('Trade successfully'))
                                  );
                                }
                          },
                              child: const Icon(
                                  Icons.card_giftcard,
                              color: Colors.green,))
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text('Amount of Vouchers: ${item.amountOfVoucher}'),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],

    );
  }
}