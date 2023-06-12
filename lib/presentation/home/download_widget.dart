import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:store/presentation/home/blocs/app_cubit.dart';
import 'package:store/presentation/home/blocs/app_state.dart';

class DownloadWidget extends StatefulWidget {
  const DownloadWidget({
    super.key,
    required this.url,
    required this.domain,
  });
  final String url;
  final String domain;

  @override
  State<DownloadWidget> createState() => _DownloadWidgetState();
}

class _DownloadWidgetState extends State<DownloadWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<AppProgressCubit>().download(widget.url);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocBuilder<AppProgressCubit, AppProgressState>(
          builder: (context, state) {
        return AlertDialog(
          scrollable: true,
          title: const Center(child: Text("Download Application")),
          content: CircularPercentIndicator(
            radius: 48.0,
            lineWidth: 5.0,
            percent: state.percent?.toDouble() ?? 0,
            center: Text(
              "${((state.percent ?? 0) * 100).roundToDouble().toStringAsFixed(0)} %",
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            progressColor: Colors.blueAccent,
            circularStrokeCap: CircularStrokeCap.round,
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          actionsPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          actions: [
            if (state.apkName?.isNotEmpty == true)
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await context
                        .read<AppProgressCubit>()
                        .installApp(widget.domain);
                  },
                  child: const SizedBox(
                    width: 120,
                    height: 24,
                    child: Center(
                      child: Text(
                        "Install",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        );
      });
    });
  }
}
