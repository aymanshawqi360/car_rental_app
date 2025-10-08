import 'package:equatable/equatable.dart';

class BestCarEntity extends Equatable {
  final String? name;
  final int? id;
  final String? firstImage;
  final String? location;
  final String? seatingCapacity;
  final String? dailyRent;
  final int? averageRate;
  const BestCarEntity({
    this.name,
    this.id,
    this.firstImage,
    this.location,
    this.seatingCapacity,
    this.dailyRent,
    this.averageRate,
  });

  @override
  List<Object?> get props => [
    name,
    id,
    firstImage,
    location,
    seatingCapacity,
    dailyRent,
    averageRate,
  ];
}
