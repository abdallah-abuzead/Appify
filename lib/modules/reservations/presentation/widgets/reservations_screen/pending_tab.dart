import 'package:appify/core/utils/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/cookbooks/loading_widget.dart';
import '../../../../../core/widgets/errors/empty_widget.dart';
import '../../../../../core/widgets/errors/offline_widget.dart';
import '../../../../../core/widgets/errors/server_error_widget.dart';
import '../../../../../core/widgets/errors/unauthorized_widget.dart';
import '../../cubits/reservations/reservations_cubit.dart';
import 'reservation_card.dart';

class PendingTab extends StatelessWidget {
  const PendingTab({super.key});

  @override
  Widget build(BuildContext context) {
    ReservationsCubit reservationsCubit = ReservationsCubit.of(context);
    return RefreshIndicator(
      onRefresh: () async => reservationsCubit.getAllReservations(),
      child: BlocBuilder<ReservationsCubit, ReservationsState>(
        builder: (context, state) {
          if (state is SuccessGetAllReservationsState) {
            return state.reservations.isEmpty
                ? EmptyWidget(name: 'reservations', onPressed: () => reservationsCubit.getAllReservations())
                : ListView.separated(
                    padding: EdgeInsets.all(16.r),
                    itemCount: state.reservations.length,
                    separatorBuilder: (context, i) => 12.widthBox,
                    itemBuilder: (context, i) => ReservationCard(reservation: state.reservations[i]),
                  );
          } else if (state is OfflineReservationsState) {
            return OfflineWidget(onPressed: () => reservationsCubit.getAllReservations());
          } else if (state is UnauthorizedReservationsState) {
            return const UnauthorizedWidget();
          } else if (state is FailedGetAllReservationsState) {
            return ServerErrorWidget(
              onPressed: () => reservationsCubit.getAllReservations(),
              message: state.message,
            );
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }
}
