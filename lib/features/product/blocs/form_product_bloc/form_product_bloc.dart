import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_taminum_mobile/core/core.dart';
import 'package:flutter_taminum_mobile/features/features.dart';

part 'form_product_event.dart';

part 'form_product_state.dart';

class FormProductBloc extends Bloc<FormProductEvent, FormProductState> {
  FormProductBloc() : super(FormProductState.initial()) {
    on<ChangeFormProductEvent>((event, emit) {
      emit(
        state.copyWith(
          status: Status.initial,
          desc: event.desc,
          name: event.name,
          priceItem: event.priceItem,
          priceRegular: event.priceRegular,
          sku: event.sku,
          stock: event.stock,
          unit: event.unit,
        ),
      );
    });

    on<ChangeImageFormProductEvent>((event, emit) async {
      final image = await ImageHelper.getImage();

      emit(state.copyWith(status: Status.initial, image: image));
    });

    on<InitialFormProductEvent>((event, emit) async {
      emit(FormProductState.initial());
      emit(state.copyWith(image: event.image));
    });
  }
}
