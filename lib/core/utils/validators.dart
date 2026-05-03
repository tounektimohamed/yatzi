class Validators {
  Validators._();

  static String? validateDisplayName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Display name is required';
    if (value.trim().length < 2) return 'Name must be at least 2 characters';
    if (value.trim().length > 20) return 'Name must be 20 characters or less';
    return null;
  }

  static String? validateRoomCode(String? value) {
    if (value == null || value.trim().isEmpty) return 'Room code is required';
    final code = value.trim().toUpperCase();
    if (code.length != 6) return 'Room code must be exactly 6 characters';
    if (!RegExp(r'^[A-Z0-9]{6}$').hasMatch(code)) {
      return 'Room code contains invalid characters';
    }
    return null;
  }
}
