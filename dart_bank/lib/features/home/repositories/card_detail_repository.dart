import 'package:dart_bank/features/home/models/card_detail_model.dart';

class CardDetailRepository {
  Future<CardDetailModel> get() async {
    await Future.delayed(const Duration(seconds: 3));
    return CardDetailModel(
      1,
      "Menor de idade (menores de 18 anos,doravante denominado MENOR) poderá abrir CONTA em ienes, mediante apresentação do Formulário de Solicitação de Transação Por Meio de Representante Legal pelo seu representante legal, desde que este conclua os procedimentos determinados pelo BANCO",
      "Aviso",
      "assets/icon/logo.png",
    );
  }
}
