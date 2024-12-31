import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

DateTime? converteData(String data) {
  // converta uma data no padrão brasileiro dd/mm/yyyy para o padrão americano de data MM/DD/YYYY
  final List<String> parts = data.split('/');
  if (parts.length != 3) {
    return null;
  }
  final int day = int.tryParse(parts[0]) ?? 0;
  final int month = int.tryParse(parts[1]) ?? 0;
  final int year = int.tryParse(parts[2]) ?? 0;
  if (day == 0 || month == 0 || year == 0) {
    return null;
  }
  return DateTime(year, month, day);
}

double? converteParaDouble(String? texto) {
  // converta para double uma valor que virá no formato e moeda brasileira R$ 0,00
  if (texto == null) {
    return null;
  }
  final onlyNumbers = texto.replaceAll(RegExp(r'[^0-9]'), '');
  final value = double.tryParse(onlyNumbers) ?? 0.0;
  return value / 100.0;
}

String? converteParaReal(String? texto) {
  // remova todos caracteres não numéricos, deixa apenas os numéricos e formate como moeda brasil (R$)
  if (texto == null) {
    return null;
  }
  final onlyNumbers = texto.replaceAll(RegExp(r'[^0-9]'), '');
  final value = int.tryParse(onlyNumbers) ?? 0;
  final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return formatter.format(value / 100);
}

DateTime? converteStringdata(String? data) {
  // converta uma  string no formato DD/MM/YYYY para data
  if (data == null || data.isEmpty) {
    return null;
  }

  List<String> parts = data.split('/');
  if (parts.length != 3) {
    return null;
  }

  int day = int.tryParse(parts[0]) ?? 0;
  int month = int.tryParse(parts[1]) ?? 0;
  int year = int.tryParse(parts[2]) ?? 0;

  if (day == 0 || month == 0 || year == 0) {
    return null;
  }

  return DateTime(year, month, day);
}

String? mascaraCPFCNPJ(
  String? tipo,
  String? texto,
) {
  // formate a  string texto com base no parametro tipo, se for CPF use a mascara ###.###.###-## se tipo for CNPJ use ##.###.###/####-##
  if (tipo == 'CPF') {
    return texto!.replaceAllMapped(RegExp(r'^(\d{3})(\d{3})(\d{3})(\d{2})$'),
        (Match m) => '${m[1]}.${m[2]}.${m[3]}-${m[4]}');
  } else if (tipo == 'CNPJ') {
    return texto!.replaceAllMapped(
        RegExp(r'^(\d{2})(\d{3})(\d{3})(\d{4})(\d{2})$'),
        (Match m) => '${m[1]}.${m[2]}.${m[3]}/${m[4]}-${m[5]}');
  } else {
    return null;
  }
}
