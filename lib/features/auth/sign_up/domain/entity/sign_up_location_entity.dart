import 'package:equatable/equatable.dart';

class SignUpLocationEntity extends Equatable {
  final int? id;
  final String? name;
  final double? lat;
  final double? lng;
  const SignUpLocationEntity({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
  });

  @override
  List<Object?> get props => [id, name, lat, lng];
}
