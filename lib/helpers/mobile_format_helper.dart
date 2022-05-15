class MobileFormatHelper{
    String olymposFormat( mobile ){
    mobile = mobile.toString()
        .replaceAll('+994', '0')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('-', '')
        .replaceAll(' ', '');
    return mobile;
  }

}