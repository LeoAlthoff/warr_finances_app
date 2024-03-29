import 'package:flutter/material.dart';

void alertDialog(context, String title, String content) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromRGBO(238, 46, 93, 1)),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Ok',
                style: TextStyle(color: Colors.white),
              ))
        ],
      );
    },
  );
}

List<bool> isSelected = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];
List<IconData> iconList = [
  Icons.ac_unit,
  Icons.access_alarm_outlined,
  Icons.account_balance,
  Icons.agriculture_outlined,
  Icons.support_agent_rounded,
  Icons.backpack_outlined,
  Icons.bakery_dining_outlined,
  Icons.balance_rounded,
  Icons.bathroom_outlined,
  Icons.beach_access_outlined,
  Icons.bed,
  Icons.bedroom_baby_outlined,
  Icons.blender_outlined,
  Icons.cabin,
  Icons.cake,
  Icons.calendar_month_outlined,
  Icons.camera_alt_outlined,
  Icons.campaign_sharp,
  Icons.cases_outlined,
  Icons.casino_outlined,
  Icons.deck_outlined,
  Icons.delete_outline,
  Icons.delivery_dining_outlined,
  Icons.desktop_mac_outlined,
  Icons.diamond_outlined,
  Icons.directions_boat_filled_outlined,
  Icons.eco_outlined,
  Icons.emoji_events_outlined,
  Icons.fastfood_outlined,
  Icons.restaurant_rounded,
  Icons.factory_outlined,
  Icons.festival_outlined,
  Icons.golf_course_rounded,
  Icons.handyman_outlined,
  Icons.headphones_outlined,
  Icons.icecream_rounded,
  Icons.import_contacts_sharp,
  Icons.kayaking_outlined,
  Icons.landscape_outlined,
  Icons.medication_liquid_sharp,
  Icons.nightlife_outlined,
  Icons.outdoor_grill_outlined,
  Icons.phone_in_talk_outlined,
  Icons.local_pizza_outlined,
  Icons.palette_outlined,
  Icons.phishing_outlined,
  Icons.phone_iphone_rounded,
  Icons.paid_outlined,
  Icons.request_quote_outlined,
  Icons.radio,
  Icons.ramen_dining_outlined,
  Icons.receipt_long_rounded,
  Icons.sailing_outlined,
  Icons.temple_buddhist_outlined,
];
