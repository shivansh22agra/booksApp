class Lead {
  final String firstName;
  final String lastName;
  final String email;

  Lead({required this.firstName, required this.lastName, required this.email});

  factory Lead.fromJson(Map<String, dynamic> json) {
    return Lead(
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
    );
  }
}