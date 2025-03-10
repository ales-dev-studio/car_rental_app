part of 'country_selection_cubit.dart';

class CountrySelectionState {
  CountrySelectionState({
    required this.countries,
    this.selectedCountry,
  });

  final List<Map<String, dynamic>> countries;
  final int? selectedCountry;

  CountrySelectionState copyWith({
    List<Map<String, dynamic>>? countries,
    int? selectedCountry,
  }) {
    return CountrySelectionState(
      countries: countries ?? this.countries,
      selectedCountry: selectedCountry ?? this.selectedCountry,
    );
  }
}
