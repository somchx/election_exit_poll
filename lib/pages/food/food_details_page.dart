import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:election_exit_poll_620710654/helpers/platform_aware_asset_image.dart';
import 'package:election_exit_poll_620710654/models/food_item.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailsPage extends StatelessWidget {
  static const routeName = '/food_details_page';
  const FoodDetailsPage();
  @override
  Widget build(BuildContext context) {
    final foodItem = ModalRoute.of(context)!.settings.arguments as FoodItem;

    return Scaffold(
      appBar: AppBar(
        title: Text(foodItem.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 3 / 2,
              child: Image.network(
                foodItem.image,
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'ชื่อเมนู: ${foodItem.name}',
                    style: GoogleFonts.prompt(fontSize: 20.0),
                  ),
                  Text(
                    'ราคา: ${foodItem.price.toString()} บาท',
                    style: GoogleFonts.prompt(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            if (false)
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'ชื่อเมนู: ${foodItem.name}',
                        style: GoogleFonts.prompt(fontSize: 20.0),
                      ),
                      Text(
                        'ราคา: ${foodItem.price.toString()} บาท',
                        style: GoogleFonts.prompt(fontSize: 20.0),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              ElevatedButton(
                              onPressed: () {},
                              child: const Text('-', style: TextStyle(fontSize: 20)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                '123',
                                style: GoogleFonts.prompt(fontSize: 20.0),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('+', style: TextStyle(fontSize: 20)),
                            ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
