import 'package:doanmobile/model/workout.dart';
import 'package:equatable/equatable.dart';

abstract class WorkoutState extends Equatable {
  final Workout? workout;
  final int? elapsed;
  const WorkoutState(this.workout, this.elapsed);
}

class WorkoutInitial extends WorkoutState {
  const WorkoutInitial() : super(null, 0);

  @override
  List<Object?> get props => [];
}

class WorkoutInProgress extends WorkoutState {
  const WorkoutInProgress(Workout? workout, int? elapsed)
      : super(workout, elapsed);
      
        @override
        // TODO: implement props
        List<Object?> get props => [workout, elapsed];
}

class WorkoutEditing extends WorkoutState {
  final int index;
  final int? exIndex;
  const WorkoutEditing(Workout? workout, this.index, this.exIndex)
      : super(workout, 0);

  @override
  List<Object?> get props => [index, workout, exIndex];
}

class WorkoutPaused extends WorkoutState{
  const WorkoutPaused(Workout? workout, int ? elapsed): super(workout, elapsed);
  
  @override
  // TODO: implement props
  List<Object?> get props => [workout, elapsed];
}
