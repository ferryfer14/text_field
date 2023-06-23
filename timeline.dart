import 'package:auto_route/auto_route.dart';
import 'package:kilats/common/functions/app_functions.dart';
import 'package:kilats/domain/transaction/transaction_model.dart';
import 'package:kilats/persentation/core/functions/unfocus_widget.dart';
import 'package:flutter/material.dart';
import 'package:kilats/persentation/core/utils/export_utils.dart';
import 'package:kilats/persentation/core/utils/spacing/padding.dart';
import 'package:kilats/persentation/core/utils/styles/colors.dart';
import 'package:kilats/persentation/core/widgets/custom_appbar.dart';
import 'package:kilats/persentation/home/pages/history/components/history_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kilats/persentation/transaction/components/card_status.dart';
import 'package:timelines/timelines.dart';

class TimelineStatus extends StatelessWidget {
  TimelineStatus({Key? key, required this.transactionModel}) : super(key: key);
  final TransactionModel transactionModel;
  final _key = GlobalKey<FormState>();

  Widget doneTimeline(
      TransactionModel transactionModel, index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          index == 0
              ? AppLocalizations.of(context)!.booked_at
              : (index == 1
                  ? AppLocalizations.of(context)!.swapped_at
                  : AppLocalizations.of(context)!.verified_at),
          style: ts12second,
        ),
        siboh8,
        Text(
          index == 0
              ? convertDateTimeFormatZ(
                  'MMM d, HH:mm', transactionModel.booked_at!)
              : (index == 1
                  ? convertDateTimeFormatZ(
                      'MMM d, HH:mm', transactionModel.swapped_at!)
                  : convertDateTimeFormatZ(
                      'MMM d, HH:mm', transactionModel.verified_at!)),
          style: ts14Black,
        ),
        siboh16
      ],
    );
  }
Widget swappingTimeline(
      TransactionModel transactionModel, index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          index == 0
              ? AppLocalizations.of(context)!.booked_at
              : (index == 1
                  ? AppLocalizations.of(context)!.swapped_at
                  : AppLocalizations.of(context)!.verified_at),
          style: ts12second,
        ),
        siboh8,
        Text(
          index == 0
              ? convertDateTimeFormatZ(
                  'MMM d, HH:mm', transactionModel.booked_at!)
              : (index == 1
                  ? convertDateTimeFormatZ(
                      'MMM d, HH:mm', transactionModel.swapped_at!)
                  : '-'),
          style: ts14Black,
        ),
        siboh16
      ],
    );
  }
  
  Widget ongoingTimeline(
      TransactionModel transactionModel, index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          index == 0
              ? AppLocalizations.of(context)!.booked_at
              : (index == 1
                  ? AppLocalizations.of(context)!.swapped_at
                  : AppLocalizations.of(context)!.verified_at),
          style: ts12second,
        ),
        siboh8,
        Text(
          index == 0
              ? convertDateTimeFormatZ(
                  'MMM d, HH:mm', transactionModel.booked_at!)
              : (index == 1 ? '-' : '-'),
          style: ts14Black,
        ),
        siboh16
      ],
    );
  }

  Widget canceledTimeline(
      TransactionModel transactionModel, index, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          index == 0
              ? AppLocalizations.of(context)!.booked_at
              : (index == 1
                  ? AppLocalizations.of(context)!.swapped_at
                  : AppLocalizations.of(context)!.canceled_at),
          style: ts12second,
        ),
        siboh8,
        Text(
          index == 0
              ? convertDateTimeFormatZ(
                  'MMM d, HH:mm', transactionModel.booked_at!)
              : (index == 1
                  ? '-'
                  : convertDateTimeFormatZ(
                      'MMM d, HH:mm', transactionModel.canceled_at!)),
          style: ts14Black,
        ),
        siboh16
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      physics: neverScroll,
      shrinkWrap: true,
      theme: TimelineThemeData(
        nodePosition: 0,
        connectorTheme: const ConnectorThemeData(
          thickness: 1.0,
          color: primaryColor,
        ),
        indicatorTheme: const IndicatorThemeData(size: 16),
      ),
      builder: TimelineTileBuilder.connected(
        itemCount: 3,
        contentsBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: transactionModel.booking_status == 'Done'
                ? doneTimeline(transactionModel, index, context)
                : (transactionModel.booking_status == 'On Going'
                    ? ongoingTimeline(transactionModel, index, context)
                    : (transactionModel.booking_status == 'Swapping'
                        ? swappingTimeline(transactionModel, index, context)
                        : canceledTimeline(transactionModel, index, context))),
          );
        },
        connectorBuilder: (_, index, __) {
          return const DashedLineConnector(
            color: primaryColor,
            thickness: 2,
            gap: 5,
          );
        },
        indicatorBuilder: (context, index) {
          return const OutlinedDotIndicator(
            position: 0,
            color: primaryColor,
          );
        },
      ),
    );
  }
}
