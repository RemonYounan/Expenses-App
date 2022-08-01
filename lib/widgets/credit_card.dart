import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  const CreditCard(
      {required this.creditType, required this.creditNumbers, Key? key})
      : super(key: key);
  final String creditType;
  final String creditNumbers;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.blueAccent,
            Colors.redAccent,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/chip.png',
                    alignment: Alignment.topLeft,
                    scale: 1.7,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    creditNumbers,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withAlpha(170),
                        ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_box,
                          color: Colors.green,
                          size: 18,
                        ),
                        Text(
                          'Active card',
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w500,
                                  ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Image.asset(
              creditType == 'Master Card'
                  ? 'assets/images/master_card.png'
                  : 'assets/images/visa.png',
              alignment: Alignment.topLeft,
              fit: BoxFit.cover,
              scale: 1.2,
            ),
          ],
        ),
      ),
    );
  }
}
