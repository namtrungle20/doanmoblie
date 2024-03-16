import 'dart:convert';


import 'package:doanmobile/model/exercises.dart';
import 'package:flutter/services.dart' ;
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../model/workout.dart';

class WorkoutCubit extends HydratedCubit<List<Workout>> {
  WorkoutCubit() : super([]);

  getWorkouts() async {
    final List<Workout> workouts = [];

    final workoutsJson =
        jsonDecode(await rootBundle.loadString("assets/workouts.json"));
    for (var el in (workoutsJson as Iterable)) {
      workouts.add(Workout.fromJson(el));
    }
    emit(workouts);
  }

  SaveWorkout(Workout workout, int index) {
    Workout newWorkout = Workout(exercises: [], title: workout.title);
    int exIndex = 0;
    int startTime = 0;
    for (var ex in workout.exercises) {
      newWorkout.exercises.add(Exercises(
          title: ex.title,
          prelude: ex.prelude,
          duration: ex.duration,
          index: ex.index,
          startTime: ex.startTime));
          exIndex++;
          startTime += ex.prelude!+ ex.duration!;
    }
    state[index]=newWorkout;
    emit([...state]);
  }
  @override
  List<Workout>? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    List<Workout> workouts =[];
    json['workouts'].forEach((el)=> workouts.add(Workout.fromJson(el)));
  }
  
  @override
  Map<String, dynamic>? toJson(List<Workout> state) {
    // TODO: implement toJson
    if(state is List<Workout>){
      var json ={
        'workouts':[]
      };
      for(var workout in state){
        json['workouts']!.add(workout.toJson());
      }
      return json;
    }else {
      return null;
    }
  }
}
