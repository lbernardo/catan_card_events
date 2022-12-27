import 'dart:math';

class Event {
  String title;
  String imageUrl;
  List<String> actions;
  int value;
  int dice;
  bool none;
  bool newYear;
  Event(
      {required this.title,
      required this.imageUrl,
      required this.actions,
      required this.value,
      required this.dice,
      this.none = false,
      this.newYear = false});
}

none() {
  return Event(
      none: true,
      title: "Inicie o jogo",
      imageUrl: "assets/events/none.png",
      actions: [],
      value: 0,
      dice: 0);
}

newYear() {
  return Event(
      none: true,
      newYear: true,
      title: "Inicie o jogo",
      imageUrl: "assets/events/new_year.png",
      actions: [],
      value: 0,
      dice: 0);
}

ladraoAtaca(int value, int dice) {
  return Event(
      title: "Ladrão ataca",
      imageUrl: "assets/events/ladrao.png",
      actions: [
        "1. Cada jogador com mais que 7 cartas descarta metada",
        "2. Mova o ladrão para um hexágono e retire aleatoriamente uma carta de 1 jogador qualquer com uma aldeia e/ou cidade no novo hexágono do Ladrão"
      ],
      value: value,
      dice: dice);
}

epidemia(int value, int dice) {
  return Event(
      title: "Epidemia",
      imageUrl: "assets/events/epidemia.png",
      actions: [
        "Cada jogador recebe somente 1 recurso de cada cidade sua que produza nesse turno"
      ],
      value: value,
      dice: dice);
}

colonizadoresTrabalham(int value, int dice) {
  return Event(
      title: "Trabalho",
      imageUrl: "assets/events/trabalho.png",
      actions: ["Os colonizadores trabalham e Catam prospera!"],
      value: value,
      dice: dice);
}

bonsVizinhos(int value, int dice) {
  return Event(
      title: "Bons vizinhos",
      imageUrl: "assets/events/bons_vizinhos.png",
      actions: [
        "Cada jogador da ao jogador a sua esqueda 1 recurso a sua escolha (se tiver um)"
      ],
      value: value,
      dice: dice);
}

terremoto(int value, int dice) {
  return Event(
      title: "Terremoto",
      imageUrl: "assets/events/terremoto.png",
      actions: [
        "Cada jogador gira uma de suas estradas, deixando-as na horizontal. Vocês não podem construir estradas até que sua estrada girada esteja reparada. O reparo custa o mesmo valor de construção. Esse evento não afeta a carta de maior estrada construida"
      ],
      value: value,
      dice: dice);
}

maresCalmos(int value, int dice) {
  return Event(
      title: "Mares calmos",
      imageUrl: "assets/events/mares_calmos.png",
      actions: [
        "O(s) jogador(es) com mais portos recebe 1 recurso a sua escolha. Se houver mais de um com a mesma quantidade de portos, os 2 ou mais ganham!"
      ],
      value: value,
      dice: dice);
}

assistenciaDaVizinhanca(int value, int dice) {
  return Event(
      title: "Assistência da vizinhança",
      imageUrl: "assets/events/assistencia_vizinhanca.png",
      actions: [
        "O jogador com mais pontos de vitória (se houver) da ao com menos pontos, 1 carta de recurso a sua escolha. Se você não tiver recursos, eleja um dos jogadores para dar 1 recurso"
      ],
      value: value,
      dice: dice);
}

anoDeAbundancia(int value, int dice) {
  return Event(
      title: "Ano de abundancia",
      imageUrl: "assets/events/ano_de_abundancia.png",
      actions: ["Cada jogador pode pegar 1 recurso a sua escolha"],
      value: value,
      dice: dice);
}

ladraoFoge(int value, int dice) {
  return Event(
      title: "Ladrão foge",
      imageUrl: "assets/events/ladrao_foge.png",
      actions: [
        "O ladrão retorna para o deserto. Sem retirar uma carta de recurso de qualquer jogador"
      ],
      value: value,
      dice: dice);
}

vantagemComercial(int value, int dice) {
  return Event(
      title: "Vantagem comercial",
      imageUrl: "assets/events/vantagem_comercial.png",
      actions: [
        "O jogador com a carta de 'Maior estrada' (se não existir, o jogador com mais estrada que qualquer outro jogador) pode pegar uma carta de recurso, aleatoriamente,  de qualquer jogador."
      ],
      value: value,
      dice: dice);
}

torneio(int value, int dice) {
  return Event(
      title: "Torneio",
      imageUrl: "assets/events/torneio.png",
      actions: ["O jogador com mais cavaleiros pega 1 recurso a sua escolha."],
      value: value,
      dice: dice);
}

conflito(int value, int dice) {
  return Event(
      title: "Conflito",
      imageUrl: "assets/events/conflito.png",
      actions: [
        "O jogador com mais cavaleiros pega uma carta de recurso aleatoriamente de qualquer jogador."
      ],
      value: value,
      dice: dice);
}

carestia() {
  return Event(
      title: "Carestia",
      imageUrl: "assets/events/carestia.png",
      actions: [
        "São tempos dificies! Cada jogador deve devolver um recurso a sua escolha para banco!"
      ],
      value: 0,
      dice: Random().nextInt(6) + 1);
}

escambo() {
  return Event(
      title: "Escambo",
      imageUrl: "assets/events/escambo.png",
      actions: ["Todos os jogadores podem realizar uma troca 1:1 com o banco"],
      value: 0,
      dice: Random().nextInt(6) + 1);
}

vacas_gordas() {
  return Event(
      title: "Vacas gordas",
      imageUrl: "assets/events/vacas_gordas.png",
      actions: [
        "Cada jogador pega um recurso adjacente a cada cidade/aldeia que tenha"
      ],
      value: 0,
      dice: Random().nextInt(6) + 1);
}

List<Event> createDeck() {
  return [
    ladraoAtaca(7, 1),
    epidemia(6, 1),
    ladraoAtaca(7, 4),
    colonizadoresTrabalham(6, 4),
    bonsVizinhos(6, 3),
    ladraoAtaca(7, 3),
    assistenciaDaVizinhanca(11, 5),
    colonizadoresTrabalham(9, 3),
    epidemia(8, 2),
    assistenciaDaVizinhanca(10, 4),
    maresCalmos(12, 6),
    ladraoAtaca(7, 2),
    terremoto(6, 2),
    ladraoAtaca(7, 5),
    colonizadoresTrabalham(6, 5),
    ladraoAtaca(7, 6),
    colonizadoresTrabalham(8, 3),
    colonizadoresTrabalham(9, 4),
    colonizadoresTrabalham(10, 5),
    colonizadoresTrabalham(11, 6),
    colonizadoresTrabalham(4, 1),
    carestia(),
    colonizadoresTrabalham(10, 6),
    colonizadoresTrabalham(9, 5),
    colonizadoresTrabalham(8, 4),
    colonizadoresTrabalham(8, 6),
    anoDeAbundancia(2, 1),
    escambo(),
    colonizadoresTrabalham(3, 2),
    ladraoFoge(4, 3),
    vantagemComercial(5, 4),
    vacas_gordas(),
    torneio(5, 3),
    ladraoFoge(4, 2),
    conflito(3, 1),
    maresCalmos(9, 6),
    colonizadoresTrabalham(8, 5),
  ];
}
