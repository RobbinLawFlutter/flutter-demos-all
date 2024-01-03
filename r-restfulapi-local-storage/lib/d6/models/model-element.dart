// ignore_for_file: file_names

class ModelElement {
  String city = '';
  int temperature = 0;
  String condition = '';
  String message = '';

  ModelElement({required this.city, required this.temperature, required this.condition, required this.message});

  Map<String, dynamic> toMap() {
    return {
      'city': city,
      'temperature': temperature,
      'condition': condition,
      'message': message,
    };
  }
}
