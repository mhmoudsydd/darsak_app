class Validators {
  /// Validates that input is a valid Arabic name:
/// - Arabic letters only (Unicode: \u0600-\u06FF + supplements)
/// - Allows spaces between words
/// - No numbers, English letters, or special symbols
/// - Optional: min/max length check
static String? validateArabicName(
  String? value, {
  int minLength = 2,
  int maxLength = 50,
  bool allowDiacritics = true,
}) {
  if (value == null || value.trim().isEmpty) {
    return 'يرجى إدخال الاسم'; // "Please enter your name"
  }

  final trimmed = value.trim();

  // ✅ Check length
  if (trimmed.length < minLength) {
    return 'يجب أن يكون الاسم $minLength أحرف على الأقل';
  }
  if (trimmed.length > maxLength) {
    return 'يجب ألا يتجاوز الاسم $maxLength حرف';
  }

  // ✅ Arabic Unicode ranges:
  // \u0600-\u06FF: Basic Arabic
  // \u0750-\u077F: Arabic Supplement  
  // \u08A0-\u08FF: Arabic Extended-A
  // \uFB50-\uFDFF, \uFE70-\uFEFF: Presentation Forms (for proper glyph shaping)
  // \s: Space character (for multi-word names)
  // \u064B-\u065F: Optional diacritics (tanween, fatha, damma, etc.)
  final arabicPattern = allowDiacritics
      ? r'^[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF\u064B-\u065F\s]+$'
      : r'^[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF\s]+$';

  final regex = RegExp(arabicPattern);

  if (!regex.hasMatch(trimmed)) {
    return 'يجب أن يكون الاسم باللغة العربية فقط (بدون أرقام أو رموز)';
  }

  // ✅ Optional: Reject if contains only spaces or repeated characters
  if (RegExp(r'^\s+$').hasMatch(trimmed)) {
    return 'يرجى إدخال اسم صحيح';
  }

  return null; // ✅ Valid
}

/// Validates Egyptian/Arabic phone number format:
/// - Must start with '0'
/// - Must contain exactly 11 digits
/// - Ignores formatting characters (spaces, dashes) for flexibility
static String? validatePhoneNumber(String? value,bool isParentPhone) {
  if (value == null || value.trim().isEmpty) {
    return isParentPhone?'يرجى إدخال رقم هاتف ولي الامر':'يرجى إدخال رقم الهاتف';
  }

  // Remove non-digit characters to validate pure numbers
  final digitsOnly = value.trim().replaceAll(RegExp(r'[^0-9]'), '');

  if (!digitsOnly.startsWith('0')) {
    return 'يجب أن يبدأ رقم الهاتف بـ 0';
  }

  if (digitsOnly.length != 11) {
    return 'يجب أن يتكون رقم الهاتف من 11 رقمًا بالضبط';
  }

  return null; // ✅ Valid
}




}
class StudentFormValidators {
  static const _required = 'مطلوب';

  static String? required(String? value, String fieldName) {
    if (value == null || value.isEmpty) return '$fieldName $_required';
    return null;
  }

  static String? governorate(String? value) => required(value, 'المحافظة');
  static String? stage(String? value) => required(value, 'المرحلة الدراسية');
  static String? section(String? value) => required(value, 'الشعبة');
}