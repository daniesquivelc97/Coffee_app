import 'package:animate_do/animate_do.dart';
import 'package:coffee_app/domain/entities/coffee.dart';
import 'package:coffee_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoffeeCard extends StatefulWidget {
  const CoffeeCard(
      {super.key, required this.coffee, this.title, this.subtitle});
  final Coffee coffee;
  final String? title;
  final String? subtitle;

  @override
  State<CoffeeCard> createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCard> {
  @override
  Widget build(BuildContext context) {
    final deviceData = MediaQuery.of(context).size;
    return SizedBox(
      height: deviceData.height * 0.3,
      child: ListView(
        children: [
          Column(
            children: [
              if (widget.title != null || widget.subtitle != null)
                _Title(
                  title: widget.title,
                  subtitle: widget.subtitle,
                ),
              const SizedBox(height: 15),
              _Slide(coffee: widget.coffee)
            ],
          )
        ],
      ),
    );
  }
}

class _Slide extends ConsumerWidget {
  final Coffee coffee;
  const _Slide({
    required this.coffee,
  });

  @override
  Widget build(BuildContext context, ref) {
    final textStyle = Theme.of(context).textTheme;
    final deviceData = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: deviceData.width * 0.85,
            height: deviceData.height * 0.3,
            child: FutureBuilder(
              future: precacheImage(NetworkImage(coffee.file), context),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  );
                } else {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeIn(
                      child: Image.network(
                        coffee.file,
                        fit: BoxFit.cover,
                        width: 150,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          const SizedBox(
            height: 5,
          ),

          // Buttons
          SizedBox(
            width: deviceData.width * 0.85,
            child: Row(
              children: [
                Icon(
                  Icons.star_half_outlined,
                  color: Colors.yellow.shade800,
                ),
                const SizedBox(width: 3),
                Text(
                  '7',
                  style: textStyle.bodyMedium
                      ?.copyWith(color: Colors.yellow.shade800),
                ),
                const SizedBox(width: 20),
                Text(
                  '3.91k',
                  style: textStyle.bodySmall,
                ),
                const Spacer(),
                const CancelButton(),
                const SizedBox(width: 30),
                FavoriteButton(coffee),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    this.title,
    this.subtitle,
  });

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null)
            Text(
              title!,
              style: titleStyle,
            ),
          const Spacer(),
          if (subtitle != null)
            FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subtitle!),
            ),
        ],
      ),
    );
  }
}
