part of 'onboarding_cubit.dart';

class OnboardingState {
  OnboardingState({required this.position});

  final int position;
  final PageController pageController = PageController();

  OnboardingState copyWith({
    int? position,
  }) {
    return OnboardingState(
      position: position ?? this.position,
    );
  }
}
