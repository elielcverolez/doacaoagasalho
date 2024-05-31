import '../database.dart';

class PontoTable extends SupabaseTable<PontoRow> {
  @override
  String get tableName => 'ponto';

  @override
  PontoRow createRow(Map<String, dynamic> data) => PontoRow(data);
}

class PontoRow extends SupabaseDataRow {
  PontoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PontoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get rua => getField<String>('rua');
  set rua(String? value) => setField<String>('rua', value);

  String? get numero => getField<String>('numero');
  set numero(String? value) => setField<String>('numero', value);

  String? get bairro => getField<String>('bairro');
  set bairro(String? value) => setField<String>('bairro', value);

  String? get cidade => getField<String>('cidade');
  set cidade(String? value) => setField<String>('cidade', value);

  String? get estado => getField<String>('estado');
  set estado(String? value) => setField<String>('estado', value);
}
