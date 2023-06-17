import 'package:flutter/material.dart';
import 'package:impact_hack/ui/location_detail/location_detail.dart';
import 'package:impact_hack/ui/location_detail/location_detail_state.dart';
import 'package:impact_hack/ui/location_search/location_search_page.dart';
import 'package:provider/provider.dart';

import '../../services/business_service.dart';

class LocationSearch extends StatelessWidget {
  final _businessService = BusinessService();

  LocationSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String lang = Localizations.localeOf(context).languageCode;
    final state = context.watch<LocationSearchState>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0, // Remove the shadow
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Search", style: Theme.of(context).textTheme.titleMedium),
        ),
        backgroundColor: const Color.fromARGB(255, 214, 184, 191),
        body: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(40, 0, 40, 40),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: Image.asset(
                  'assets/images/5.jpg',
                ).image,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Find your new home",
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 600,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(7, 7),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: state.searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.close),
                                color: Colors.black,
                                onPressed: () {
                                  state.searchController.clear();
                                })
                            : null,
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12.0)), borderSide: BorderSide.none),
                        hintText: "Where is your location?",
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      controller: state.searchController,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  SizedBox(
                    width: 600,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) {
                                  return ChangeNotifierProvider(
                                    create: (context) => LocationDetailState(context, ''), // TODO: Remove string
                                    child: const LocationDetail(),
                                  );
                                })
                              );
                            },
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.search),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Text('Search'),
                              ],
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}