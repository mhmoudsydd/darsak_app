import 'package:darsak/core/utils/custom_drop_down_list.dart';
import 'package:flutter/material.dart';

final egyptGovernoratesItems = const [
  DropdownItem(
    labelEn: 'cairo',
    label: 'القاهرة',
    icon: Icons.location_city,
    color: Color(0xFF1E88E5),
  ),
  DropdownItem(
    labelEn: 'giza',
    label: 'الجيزة',
    icon: Icons.location_city,
    color: Color(0xFF43A047),
  ),
  DropdownItem(
    labelEn: 'qalyubia',
    label: 'القليوبية',
    icon: Icons.location_city,
    color: Color(0xFFE53935),
  ),
  DropdownItem(
    labelEn: 'suez',
    label: 'السويس',
    icon: Icons.location_city,
    color: Color(0xFFFB8C00),
  ),
  DropdownItem(
    labelEn: 'ismailiah',
    label: 'الإسماعيلية',
    icon: Icons.location_city,
    color: Color(0xFF8E24AA),
  ),
  DropdownItem(
    labelEn: 'port_said',
    label: 'بور سعيد',
    icon: Icons.location_city,
    color: Color(0xFFD81B60),
  ),
  DropdownItem(
    labelEn: 'damietta',
    label: 'دمياط',
    icon: Icons.location_city,
    color: Color(0xFF00838F),
  ),
  DropdownItem(
    labelEn: 'dakahlia',
    label: 'الدقهلية',
    icon: Icons.location_city,
    color: Color(0xFF5E35B1),
  ),
  DropdownItem(
    labelEn: 'kafrelsheikh',
    label: 'كفر الشيخ',
    icon: Icons.location_city,
    color: Color(0xFFF57C00),
  ),
  DropdownItem(
    labelEn: 'gharbia',
    label: 'الغربية',
    icon: Icons.location_city,
    color: Color(0xFF0097A7),
  ),
  DropdownItem(
    labelEn: 'menoufia',
    label: 'المنوفية',
    icon: Icons.location_city,
    color: Color(0xFF00796B),
  ),
  DropdownItem(
    labelEn: 'beheira',
    label: 'البحيرة',
    icon: Icons.location_city,
    color: Color(0xFF6A1B9A),
  ),
  DropdownItem(
    labelEn: 'alexandria',
    label: 'الإسكندرية',
    icon: Icons.location_city,
    color: Color(0xFF00695C),
  ),
  DropdownItem(
    labelEn: 'matruh',
    label: 'مطروح',
    icon: Icons.location_city,
    color: Color(0xFF455A64),
  ),
  DropdownItem(
    labelEn: 'marsa_matruh',
    label: 'مرسى مطروح',
    icon: Icons.location_city,
    color: Color(0xFF546E7A),
  ),
  DropdownItem(
    labelEn: 'sharqia',
    label: 'الشرقية',
    icon: Icons.location_city,
    color: Color(0xFFE64A19),
  ),
  DropdownItem(
    labelEn: 'isna',
    label: 'إسنا',
    icon: Icons.location_city,
    color: Color(0xFFA1887F),
  ),
  DropdownItem(
    labelEn: 'luxor',
    label: 'الأقصر',
    icon: Icons.location_city,
    color: Color(0xFFD7CCC8),
  ),
  DropdownItem(
    labelEn: 'qena',
    label: 'قنا',
    icon: Icons.location_city,
    color: Color(0xFFBCAAA4),
  ),
  DropdownItem(
    labelEn: 'aswan',
    label: 'أسوان',
    icon: Icons.location_city,
    color: Color(0xFF8D6E63),
  ),
  DropdownItem(
    labelEn: 'sohag',
    label: 'سوهاج',
    icon: Icons.location_city,
    color: Color(0xFF6D4C41),
  ),
  DropdownItem(
    labelEn: 'assiut',
    label: 'أسيوط',
    icon: Icons.location_city,
    color: Color(0xFF5D4037),
  ),
  DropdownItem(
    labelEn: 'minya',
    label: 'المنيا',
    icon: Icons.location_city,
    color: Color(0xFF4E342E),
  ),
  DropdownItem(
    labelEn: 'beni_suef',
    label: 'بني سويف',
    icon: Icons.location_city,
    color: Color(0xFF3E2723),
  ),
  DropdownItem(
    labelEn: 'fayoum',
    label: 'الفيوم',
    icon: Icons.location_city,
    color: Color(0xFF8B4513),
  ),
];

final List<DropdownItem> gender = const [
  DropdownItem(
    labelEn: 'male',
    label: 'ذكر',
    icon: Icons.male,
    color: Color(0xFF4A90E2),
  ),
  DropdownItem(
    labelEn: 'female',
    label: 'أنثى',
    icon: Icons.male,
    color: Color(0xFFE91E63),
  ),
];

final List<DropdownItem> stage = const [
  DropdownItem(labelEn: 'prep_1', label: 'الصف الأول الإعدادي'),
  DropdownItem(labelEn: 'prep_2', label: 'الصف الثاني الإعدادي'),
  DropdownItem(labelEn: 'prep_3', label: 'الصف الثالث الإعدادي'),
  DropdownItem(labelEn: 'sec_1', label: 'الصف الأول الثانوي'),
  DropdownItem(labelEn: 'sec_2', label: 'الصف الثاني الثانوي'),
  DropdownItem(labelEn: 'sec_3', label: 'الصف الثالث الثانوي'),
];


DropdownItem _item(String en, String ar, {IconData? icon, Color? color}) =>
    DropdownItem(labelEn: en, label: ar, icon: icon, color: color);

 Map<String, List<DropdownItem>> _sectionMap = {
  'prep_1': [_item('general', 'عام')],
  'prep_2': [_item('general', 'عام')],
  'prep_3': [_item('general', 'عام')],
  'sec_1':  [_item('general', 'عام')],
  'sec_2': [
    _item('scientific', 'علمي'),
    _item('literary', 'أدبي'),
  ],
  'sec_3': [
    _item('scientific_science', 'علمي علوم'),
    _item('scientific_maths', 'علمي رياضة'),
    _item('literary', 'أدبي'),
  ],
};

List<DropdownItem> section(String val) => _sectionMap[val] ?? const [];
