import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState(position: 0));

  void onPageChanged(final int position){
    emit(state.copyWith(position: position));
  }

  void onPreviousPressed() {
    state.pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void onNextPressed() {
    state.pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void goToSpecificPosition(final int position) {
    state.pageController.animateToPage(
      position,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Future<void> close() {
    state.pageController.dispose();
    return super.close();
  }
}
