import 'dart:convert';

class Graminea {
  final int id;
  final String nomeCientifico;
  final String nomeComum;
  final String genero;
  final String origem;
  final int exigenciaFertilidade;
  final int precipiticaoMinima;
  final bool toleranciaAlagamento;
  final int toleranciaSeca;
  final int toleranciaFrio;

  Graminea({
    this.id,
    this.nomeCientifico,
    this.nomeComum,
    this.genero,
    this.origem,
    this.exigenciaFertilidade,
    this.precipiticaoMinima,
    this.toleranciaAlagamento,
    this.toleranciaSeca,
    this.toleranciaFrio,
  });

  Graminea copyWith({
    int id,
    String nomeCientifico,
    String nomeComum,
    String genero,
    String origem,
    int exigenciaFertilidade,
    int precipiticaoMinima,
    bool toleranciaAlagamento,
    int toleranciaSeca,
    int toleranciaFrio,
  }) {
    return Graminea(
      id: id ?? this.id,
      nomeCientifico: nomeCientifico ?? this.nomeCientifico,
      nomeComum: nomeComum ?? this.nomeComum,
      genero: genero ?? this.genero,
      origem: origem ?? this.origem,
      exigenciaFertilidade: exigenciaFertilidade ?? this.exigenciaFertilidade,
      precipiticaoMinima: precipiticaoMinima ?? this.precipiticaoMinima,
      toleranciaAlagamento: toleranciaAlagamento ?? this.toleranciaAlagamento,
      toleranciaSeca: toleranciaSeca ?? this.toleranciaSeca,
      toleranciaFrio: toleranciaFrio ?? this.toleranciaFrio,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nomeCientifico': nomeCientifico,
      'nomeComum': nomeComum,
      'genero': genero,
      'origem': origem,
      'exigenciaFertilidade': exigenciaFertilidade,
      'precipiticaoMinima': precipiticaoMinima,
      'toleranciaAlagamento': toleranciaAlagamento,
      'toleranciaSeca': toleranciaSeca,
      'toleranciaFrio': toleranciaFrio,
    };
  }

  factory Graminea.fromMap(Map<String, dynamic> map) {
    return Graminea(
      id: map['id'],
      nomeCientifico: map['nomeCientifico'],
      nomeComum: map['nomeComum'],
      genero: map['genero'],
      origem: map['origem'],
      exigenciaFertilidade: map['exigenciaFertilidade'],
      precipiticaoMinima: map['precipiticaoMinima'],
      toleranciaAlagamento: map['toleranciaAlagamento'],
      toleranciaSeca: map['toleranciaSeca'],
      toleranciaFrio: map['toleranciaFrio'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Graminea.fromJson(String source) =>
      Graminea.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Graminea(id: $id, nomeCientifico: $nomeCientifico, nomeComum: $nomeComum, genero: $genero, origem: $origem, exigenciaFertilidade: $exigenciaFertilidade, precipiticaoMinima: $precipiticaoMinima, toleranciaAlagamento: $toleranciaAlagamento, toleranciaSeca: $toleranciaSeca, toleranciaFrio: $toleranciaFrio)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Graminea &&
        other.id == id &&
        other.nomeCientifico == nomeCientifico &&
        other.nomeComum == nomeComum &&
        other.genero == genero &&
        other.origem == origem &&
        other.exigenciaFertilidade == exigenciaFertilidade &&
        other.precipiticaoMinima == precipiticaoMinima &&
        other.toleranciaAlagamento == toleranciaAlagamento &&
        other.toleranciaSeca == toleranciaSeca &&
        other.toleranciaFrio == toleranciaFrio;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nomeCientifico.hashCode ^
        nomeComum.hashCode ^
        genero.hashCode ^
        origem.hashCode ^
        exigenciaFertilidade.hashCode ^
        precipiticaoMinima.hashCode ^
        toleranciaAlagamento.hashCode ^
        toleranciaSeca.hashCode ^
        toleranciaFrio.hashCode;
  }
}
