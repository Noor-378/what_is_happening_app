import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:what_is_happening_app/shared/cubit/cubit.dart';
import 'package:what_is_happening_app/shared/cubit/states.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key, required this.url});
  final String url;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final controller = WebViewController();
        AppCubit.get(context).webView(url, controller);
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).colorScheme.errorContainer,
              ),
            ),
          ),
          body: WebViewWidget(
            controller: controller,
          ),
        );
      },
    );
  }
}
