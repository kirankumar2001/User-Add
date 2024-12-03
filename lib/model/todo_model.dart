class Todo {
  final int userId;
  final String name;
  final String address;

  // Constructor
  Todo({
    required this.userId,
    required this.name,
    required this.address,
  });

  // Factory constructor to create a User instance from a map
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      name: json['name'],
      address: json['address'],
    );
  }

  // Method to convert a User instance to a map
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'address': address,
    };
  }
}
