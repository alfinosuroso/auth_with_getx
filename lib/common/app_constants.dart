import 'package:flutter/material.dart';

class AppConstants {
  static const List<String> jalurSidangList = ['Reguler', 'Publikasi'];

  static final List<DropdownMenuItem<String>> bidangKajianDropdownItems = [
    const DropdownMenuItem(value: "SC", child: Text("SC")),
    const DropdownMenuItem(value: "RPLD", child: Text("RPLD")),
    const DropdownMenuItem(value: "SK3D", child: Text("SK3D")),
  ];

  static final List<DropdownMenuItem<String>> bidangKajianDropdownAltItems = [
    const DropdownMenuItem(value: "SC", child: Text("Sistem Cerdas")),
    const DropdownMenuItem(
        value: "RPLD", child: Text("Rekayasa Perangkat Lunak dan Data")),
    const DropdownMenuItem(
        value: "SK3D", child: Text("Sistem Komputer, Keamanan, dan Komputasi Terdistribusi")),
  ];

  static final List<DropdownMenuItem<String>> jalurTaItems = [
    const DropdownMenuItem(value: "reguler", child: Text("Reguler")),
    const DropdownMenuItem(value: "publikasi", child: Text("Publikasi")),
  ];

  static const List<String> pengajuanTooltips = ['SC', 'RPLD', 'SK3D'];
  static const List<String> sidangTa1Tooltips = [
    'Form Pengajuan Sidang TA 1',
    'Status Pengajuan Sidang TA 1',
  ];

  static const List<String> sidangTa2Tooltips = [
    'Form Pengajuan Sidang TA 2',
    'Status Pengajuan Sidang TA 2',
  ];

  static const List<DropdownMenuItem<String>> babItems = [
    DropdownMenuItem(value: "1", child: Text("Bab 1")),
    DropdownMenuItem(value: "2", child: Text("Bab 2")),
    DropdownMenuItem(value: "3", child: Text("Bab 3")),
    DropdownMenuItem(value: "4", child: Text("Bab 4")),
    DropdownMenuItem(value: "5", child: Text("Bab 5")),
  ];
  
  static const List<DropdownMenuItem<String>> statusJurnalItems = [
    DropdownMenuItem(value: "draft", child: Text("Draft")),
    DropdownMenuItem(value: "submit", child: Text("Submit")),
    DropdownMenuItem(value: "publish", child: Text("Publish")),
  ];

  static const String linkHint = "https://...";
  
  static const String linkDriveHint = "https://drive.google.com/...";

  static const String telephoneHint = "Contoh: 08123456789";
  
}
