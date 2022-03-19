class Contact {
  final int id;
  final String nameReceived;
  final int accountReceived;

  Contact(this.id,this.nameReceived, this.accountReceived);

  @override
  String toString() {
    return 'id: {$id}Contact{nameReceived: $nameReceived, accountReceived: $accountReceived}';
  }
}