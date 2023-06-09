import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather_flutter/src/forecast/presentation/view/forecast_date_view.dart';

class ForecastBox extends StatelessWidget {
  const ForecastBox({
    super.key,
    required this.title,
    required this.image,
    required this.date,
  });

  final String title;
  final String image;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final sizeFactor = MediaQuery.of(context).textScaleFactor;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Theme.of(context).primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 8,
        ),
        child: Column(
          children: [
            AutoSizeText(
              title,
              maxLines: 1,
              style: textTheme.labelLarge?.copyWith(
                color: Colors.white,
                fontSize: Theme.of(context).textTheme.labelLarge?.fontSize ?? 0 / sizeFactor,
              ),
            ),
            Image.network(
              image,
            ),
            AutoSizeText(
              date.formattedForecastDate,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: textTheme.labelSmall?.copyWith(
                color: Colors.white,
                fontSize: 10 / sizeFactor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
