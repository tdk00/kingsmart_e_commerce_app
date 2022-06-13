class ContactUsModel{
  final String whatsapp;
  final String phone;
  final String email;

  ContactUsModel( { required this.whatsapp, required this.phone, required this.email } );

  factory ContactUsModel.fromJson(Map<String, dynamic> json) {
    return ContactUsModel(
      whatsapp: json['whatsapp'],
      phone: json['phone'],
      email: json['email']
    );
  }
  Map<String, dynamic> toJson() =>
      {
        'whatsapp': whatsapp,
        'phone': phone,
        'email': email
      };

}