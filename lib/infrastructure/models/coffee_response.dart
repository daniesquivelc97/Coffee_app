import 'dart:convert';

CoffeeResponse coffeeResponseFromJson(String str) =>
    CoffeeResponse.fromJson(json.decode(str));

String coffeeResponseToJson(CoffeeResponse data) => json.encode(data.toJson());

class CoffeeResponse {
  String file;

  CoffeeResponse({
    required this.file,
  });

  factory CoffeeResponse.fromJson(Map<String, dynamic> json) => CoffeeResponse(
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "file": file,
      };
}
