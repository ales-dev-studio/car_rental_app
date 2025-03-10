import 'package:bloc/bloc.dart';
import 'package:car_rental_app/features/authentication_feature/data/data_source/local/sample_data.dart';

part 'country_selection_state.dart';

class CountrySelectionCubit extends Cubit<CountrySelectionState> {
  CountrySelectionCubit()
      : super(
          CountrySelectionState(countries: countries),
        );

  void selectCountry(final int index) {
    emit(state.copyWith(selectedCountry: index));
  }

  void searchCountries(final String query) {
    if (query.isEmpty) {
      emit(state.copyWith(countries: countries));
      return;
    }

    List<Map<String, dynamic>> result = countries
        .where(
          (country) => country['name'].toString().toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    emit(state.copyWith(countries: result));
  }
}
