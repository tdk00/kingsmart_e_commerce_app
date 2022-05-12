class Validators{
  String? validateMobile(String? value) {
    if (value!.length < 19) {
      return 'Zəhmət olmasa nömrəni tam yazın';
    }
    return null;
  }
}