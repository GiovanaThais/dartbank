import 'package:dart_bank/features/home/models/card_detail_model.dart';
import 'package:flutter/material.dart';

class CardDetail extends StatefulWidget {
  final CardDetailModel cardDetail;

  const CardDetail({super.key, required this.cardDetail});

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.cardDetail.id,
      child: SafeArea(
        child: Scaffold(
            //appBar: AppBar(),
            body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close)),
              Row(
                children: [
                  Image.network(
                    widget.cardDetail.url,
                    height: 100,
                  ),
                ],
              ),
              Text(
                widget.cardDetail.title,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Text(widget.cardDetail.text,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal)),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
