import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../domain/entities/obtener_publicacion.dart';
import '../bloc/rd_publicacion/rd_publicacion_bloc.dart';

class MapaPage extends StatefulWidget {
  const MapaPage({super.key});

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  LocationData? currentLocation;
  List<Marker> markers = <Marker>[];
  Completer<GoogleMapController> controller = Completer();
  @override
  void initState() {
    getCurrentLocation();
    getPubs();
    super.initState();
  }

  getPubs() async {
    List<ObtenerPublicacion> publicaciones =
        await context.read<RdPublicacionBloc>().extraerCoordenadas();
    extraerCoordenadas(publicaciones);
  }

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then((location) {
      setState(() {
        currentLocation = location;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: (currentLocation != null && markers.isNotEmpty)
          ? mapMarkers()
          : const Center(child: CircularProgressIndicator()),
    );
  }

  GoogleMap mapMarkers() {
    //extraerCoordenadas(publicaciones);
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
        zoom: 15,
      ),
      mapType: MapType.satellite,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      markers: Set<Marker>.of(markers),
      onMapCreated: (GoogleMapController controlr) {
        controller.complete(controlr);
      },
    );
  }

  void extraerCoordenadas(List<ObtenerPublicacion> publicaciones) {
    int iterador = 0;
    for (var element in publicaciones) {
      if (element.extencion == ".map") {
        markers.add(Marker(
          markerId: MarkerId(iterador.toString()),
          infoWindow: InfoWindow(
              title: "Ubicacion de ${element.nombre}",
              snippet:
                  "Latitud:${element.latitud}, Longitud:${element.longitud}"),
          anchor: const Offset(0, 4),
          position: LatLng(
              double.parse(element.latitud), double.parse(element.longitud)),
        ));
      }
    }
    if (currentLocation != null) {
      markers.add(Marker(
        markerId: const MarkerId('currentLocation'),
        position: LatLng(
          currentLocation!.latitude!,
          currentLocation!.altitude!,
        ),
      ));
    }
    setState(() {});
  }
}
