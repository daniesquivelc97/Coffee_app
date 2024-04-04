import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CoffeeCard extends StatefulWidget {
  const CoffeeCard(
      {super.key, required this.currentImage, this.title, this.subtitle});
  final String currentImage;
  final String? title;
  final String? subtitle;

  @override
  State<CoffeeCard> createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null || widget.subtitle != null)
            _Title(
              title: widget.title,
              subtitle: widget.subtitle,
            ),
          const SizedBox(height: 15),
          _Slide(image: widget.currentImage)
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String image;
  const _Slide({
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 350,
            height: 400,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  }
                  return FadeIn(child: child);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),

          // Buttons
          SizedBox(
            width: 350,
            child: Row(
              children: [
                Icon(
                  Icons.star_half_outlined,
                  color: Colors.yellow.shade800,
                ),
                const SizedBox(
                  width: 3,
                ),
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
                const _CancelButton(),
                const SizedBox(width: 30),
                const _FavoriteButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: IconButton(
          icon: const Icon(
            Icons.cancel_rounded,
            color: Colors.red,
            size: 25,
          ),
          onPressed: () {
            print('Botón presionado');
          },
        ),
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: Center(
        child: IconButton(
          icon: const Icon(
            Icons.favorite,
            color: Colors.green,
            size: 25,
          ),
          onPressed: () {
            print('Botón presionado');
          },
        ),
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
