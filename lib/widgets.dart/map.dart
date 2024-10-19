
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
// import 'package:url_launcher/url_launcher.dart';

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}

class HomePage extends StatefulWidget {
  static const String route = '/';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double currentLat = 23.8859 ;
  double currentLong = 45.0792 ;
  @override
  void initState() {


    super.initState();
    // showIntroDialogIfNeeded();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: ,
      body: Stack(
        children: [
          /* FlutterMap(
            options: MapOptions(
              onPositionChanged: (position, hasGesture) {
                setState(() {
                  currentLat = position.center!.latitude.toPrecision(4);
                  currentLong = position.center!.longitude.toPrecision(4);                  
                });
                
              },
              initialCenter: const LatLng(24.6616, 46.7282),
              initialZoom: 15,
              cameraConstraint: CameraConstraint.contain(
                bounds: LatLngBounds(
                  const LatLng(-90, -180),
                  const LatLng(90, 180),
                ),
              ),
            ),
            children: [
              openStreetMapTileLayer,
              RichAttributionWidget(
                popupInitialDisplayDuration: const Duration(seconds: 5),
                animationConfig: const ScaleRAWA(),
                showFlutterMapAttribution: false,
                attributions: [
                  TextSourceAttribution(
                    'OpenStreetMap contributors',
                    onTap: () async => launchUrl(
                      Uri.parse('https://openstreetmap.org/copyright'),
                    ),
                  ),
                  const TextSourceAttribution(
                    'This attribution is the same throughout this app, except '
                    'where otherwise specified',
                    prependCopyright: false,
                  ),
                ],
              ),
            ],
          ),*/
          const FloatingActionButton(onPressed: null,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                alignment: Alignment.bottomRight,
                width: MediaQuery.of(context).size.width / 2, height: MediaQuery.of(context).size.width % 40,
                child: Text("$currentLat -    $currentLong"),)],
                )
        ],
      ),
    );
  }

  // void showIntroDialogIfNeeded() {
  //   const seenIntroBoxKey = 'seenIntroBox(a)';
  //   if (kIsWeb && Uri.base.host.trim() == 'demo.fleaflet.dev') {
  //     SchedulerBinding.instance.addPostFrameCallback(
  //       (_) async {
  //         final prefs = await SharedPreferences.getInstance();
  //         if (prefs.getBool(seenIntroBoxKey) ?? false) return;

  //         if (!mounted) return;

  //         await showDialog<void>(
  //           context: context,
  //           builder: (context) => const FirstStartDialog(),
  //         );
  //         await prefs.setBool(seenIntroBoxKey, true);
  //       },
  //     );
  //   }
  // }

  TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.Real-Estate.app',
      // Use the recommended flutter_map_cancellable_tile_provider package to
      // support the cancellation of loading tiles.
      tileProvider: CancellableNetworkTileProvider(),
    );
}



