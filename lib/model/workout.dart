import 'package:doanmobile/model/exercises.dart';
import 'package:equatable/equatable.dart';

class Workout extends Equatable {
  final String? title;
  final List<Exercises> exercises;
  const Workout({required this.exercises, required this.title});
  factory Workout.fromJson(Map<String, dynamic> json) {
    List<Exercises> exercises = [];
    int index = 0;
    int startTime = 0;
    for (var ex in json['exercises'] as Iterable) {
      exercises.add(Exercises.fromJson(ex, index, startTime));
      index++;
      startTime += exercises.last.prelude! + exercises.last.duration!;
    }
    return Workout(exercises: exercises, title: json['title'] as String?);
  }
  Map<String, dynamic> toJson() => {'title': title, 'exercises': exercises};

  copyWith({String? title}) =>
      Workout(exercises: exercises, title: title ?? this.title);

  int getTotal() =>
      exercises.fold(0, (prev, ex) => prev + ex.duration! + ex.prelude!);

  Exercises getCurrentExercise(int? elapsed) =>
      exercises.lastWhere((element) => element.startTime! <= elapsed!);

  @override
  List<Object?> get props => [title, exercises];

  @override
  bool get stringify => true;
}
