import 'package:api_exceptions_handling_flutter/data/models/beers_model.dart';
import 'package:api_exceptions_handling_flutter/di/service_locator.dart';
import 'package:api_exceptions_handling_flutter/ui/home/home_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = getIt<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beers'),
      ),
      body: RefreshIndicator(
        child: FutureBuilder<List<Beer>>(
            future: homeController.getBeers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                final error = snapshot.error;

                return Center(
                  child: Text(
                    error.toString(),
                  ),
                );
              } else if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('No data found'),
                  );
                }

                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    final beer = snapshot.data;
                    return ListTile(title: Text(beer?[index].name ?? ''));
                  },
                );
              }
              return Container();
            }),
        onRefresh: () async {
          setState(() {
            homeController.getBeers();
          });
        },
      ),
    );
  }
}
