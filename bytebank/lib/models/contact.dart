class Contact {
  final int id;
  final String name;
  final int accountnumber;

  Contact(this.id,this.name, this.accountnumber);

  @override
  String toString() {
    return 'id: {$id}Contact{nameReceived: $name, accountReceived: $accountnumber}';
  }

  Contact.fromJson(Map<String, dynamic> json) :
      id = json['id'] ?? 0,
      name = json['name'],
      accountnumber = json['accountNumber'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'accountNumber': accountnumber,
      };

}