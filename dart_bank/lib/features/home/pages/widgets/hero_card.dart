import 'package:flutter/material.dart';

import '../../models/card_detail_model.dart';
import '../card_detail.dart';

class CardDetailWidget extends StatefulWidget {
  const CardDetailWidget({
    super.key,
    required this.cardDetail,
  });

  final CardDetailModel? cardDetail;

  @override
  State<CardDetailWidget> createState() => _CardDetailWidgetState();
}

class _CardDetailWidgetState extends State<CardDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CardDetail(cardDetail: widget.cardDetail!),
            ));
      },
      child: Hero(
        tag: widget.cardDetail!.id,
        child: Card(
          elevation: 8,
          shadowColor: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.network(
                      widget.cardDetail!.url,
                      height: 20,
                    ),
                    Text(
                      widget.cardDetail!.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.cardDetail!.text,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal)),
                Container(
                    width: double.infinity,
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Ler Mais",
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
