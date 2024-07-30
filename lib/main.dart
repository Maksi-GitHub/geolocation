import 'dart:async';
import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:geolocation/data/DTOs/points_dto.dart';
import 'package:geolocation/data/data_providers/points_data_providers/api/points_http_api.dart';
import 'package:geolocation/data/data_providers/points_data_providers/implementations/points_data_provider_impl.dart';
import 'package:geolocation/data/repositories/implementations/points_repository_impl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'location_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    FlutterForegroundTask.stopService();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      FlutterForegroundTask.stopService();
    }
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LocationService _locationService = LocationService();
  bool _isTracking = false;
  List<Position> _positions = [];
  int _distanceFilter = 3;

  @override
  void initState() {
    super.initState();
    _initializeForegroundTask();
    _requestPermission();
  }

  void _initializeForegroundTask() {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'location_channel',
        channelName: 'Location Tracking',
        channelDescription:
            'This notification appears when the foreground service is running.',
        channelImportance: NotificationChannelImportance.HIGH,
        priority: NotificationPriority.HIGH,
        visibility: NotificationVisibility.VISIBILITY_PUBLIC,
        enableVibration: true,
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: true,
        playSound: false,
      ),
      foregroundTaskOptions: const ForegroundTaskOptions(
        interval: 5000,
        autoRunOnBoot: true,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );

    _locationService.onPositionUpdate = (positions) {
      setState(() {
        _positions = positions;
      });
    };
  }

  Future<void> _toggleTracking() async {
    if (_isTracking) {
      await FlutterForegroundTask.stopService();
      _locationService.stopTracking();
      await _sendPoints();
      setState(() {
        _isTracking = false;
      });
    } else {
      if (await _requestPermission()) {
        FlutterForegroundTask.startService(
          notificationTitle: 'Отслеживание местоположения',
          notificationText: 'Сбор данных о местоположении...',
          callback: _startLocationUpdates,
        );
        _locationService.startTracking(_distanceFilter);
        setState(() {
          _isTracking = true;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Разрешение на использование геолокации отклонено'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _startLocationUpdates() {
    _locationService.startTracking(_distanceFilter);
  }

  Future<bool> _requestPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied || status.isRestricted || status.isPermanentlyDenied) {
      status = await Permission.location.request();
    }

    if (status.isGranted) {
      var backgroundStatus = await Permission.locationAlways.status;
      if (backgroundStatus.isDenied ||
          backgroundStatus.isRestricted ||
          backgroundStatus.isPermanentlyDenied) {
        backgroundStatus = await Permission.locationAlways.request();
      }
      return backgroundStatus.isGranted;
    }
    return false;
  }

  void _clearPositions() {
    setState(() {
      _positions.clear();
    });
  }

  Future<void> _sendPoints() async {
    final pointsDtoList = _positions.map((position) {
      return PointsDTO(lat: position.latitude, lng: position.longitude);
    }).toList();

    final pointsRepository = PointsRepositoryImpl(
      pointsDataProvider: PointsDataProviderImpl(
        pointsHttpApi:
            PointsHttpApi(Dio(BaseOptions(contentType: 'application/json'))),
      ),
    );

    try {
      await pointsRepository.sendPoints(points: pointsDtoList);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Точки успешно отправлены'),
            backgroundColor: Colors.green),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ошибка при отправке точек: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showDistanceInputDialog() {
    showDialog(
      context: context,
      builder: (context) {
        int localDistanceFilter = _distanceFilter;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: const Text(
                'С какой переодичностью обновлять геолокацию?',
                style: TextStyle(fontSize: 18),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      if (localDistanceFilter == 1)
                        const Text('Каждый', style: TextStyle(fontSize: 18)),
                      if (localDistanceFilter > 1)
                        const Text('Каждые', style: TextStyle(fontSize: 18)),
                      const SizedBox(
                        width: 10,
                      ),
                      DropdownButton<int>(
                        value: localDistanceFilter,
                        items: List.generate(10, (index) => index + 1)
                            .map((value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text('$value'),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            if (value != null) {
                              localDistanceFilter = value;
                            }
                          });
                        },
                      ),
                      const SizedBox(width: 10),
                      if (localDistanceFilter == 1)
                        const Text('метр', style: TextStyle(fontSize: 18)),
                      if (localDistanceFilter > 1 && localDistanceFilter < 5)
                        const Text('метра', style: TextStyle(fontSize: 18)),
                      if (localDistanceFilter >= 5)
                        const Text('метров', style: TextStyle(fontSize: 18))
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _distanceFilter = localDistanceFilter;
                    });
                    Navigator.of(context).pop();
                    _toggleTracking();
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever_rounded, color: Colors.red),
            onPressed: _clearPositions,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Сохраненные точки: ${_positions.length}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _positions.length,
                itemBuilder: (context, index) {
                  final position = _positions[index];
                  return ListTile(
                    title: Text(
                        'lat: ${position.latitude}, lng: ${position.longitude}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _isTracking ? Colors.red[400] : Colors.green[400],
        onPressed: () {
          if (_isTracking == false) {
            _showDistanceInputDialog();
          } else {
            _toggleTracking();
          }
        },
        child: Icon(
          _isTracking ? Icons.stop_rounded : Icons.play_arrow_rounded,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
