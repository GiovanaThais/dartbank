import 'package:dart_bank/features/home/models/card_detail_model.dart';

import 'package:dart_bank/features/home/pages/widgets/hero_card.dart';
import 'package:flutter/material.dart';

import '../repositories/card_detail_repository.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetailModel? cardDetail;
  final cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    loadingData();
  }

  void loadingData() async {
    cardDetail = await cardDetailRepository.get();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.all(16),
            width: double.infinity,
            child: cardDetail == null
                ? const LinearProgressIndicator()
                : CardDetailWidget(cardDetail: cardDetail)),
      ],
    );
  }
}
