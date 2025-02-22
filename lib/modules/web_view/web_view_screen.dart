import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:what_is_happening_app/shared/cubit/cubit.dart';

class WebViewScreen extends StatelessWidget {
  WebViewScreen({super.key, required this.url});
  final String url;

  final controller = WebViewController();

  @override
  Widget build(BuildContext context) {
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
  }
}
