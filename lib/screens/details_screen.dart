import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

import '../core/app_colors.dart';
import '../models/planet.dart';
import '../widgets/header_banner.dart';

/// Screen Two : Planet details.
/// Receives the selected [Planet] as a route argument.
class DetailsScreen extends StatefulWidget {
  static const String routeName = '/details';

  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final Flutter3DController _controller = Flutter3DController();
  Future<bool>? _hasModel;
  late Planet _planet;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_hasModel == null) {
      _planet = ModalRoute.of(context)!.settings.arguments as Planet;
      _hasModel = _modelExists(_planet.model);
    }
  }

  /// Checks that the .glb file was added to assets/models/.
  Future<bool> _modelExists(String path) async {
    try {
      await rootBundle.load(path);
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderBanner(
              topTitle: _planet.name,
              bottomTitle: _planet.title,
              showBack: true,
              bottomTitleCentered: true,
            ),
            // 3D model (flutter_3d_controller) with image fallback
            SizedBox(
              height: 320,
              width: double.infinity,
              child: FutureBuilder<bool>(
                future: _hasModel,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(
                      child: CircularProgressIndicator(color: AppColors.red),
                    );
                  }
                  if (snapshot.data == true) {
                    return Flutter3DViewer(
                      controller: _controller,
                      src: _planet.model,
                      progressBarColor: AppColors.red,
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(24),
                    child: Hero(
                      tag: _planet.name,
                      child: Image.asset(_planet.image, fit: BoxFit.contain),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About', style: textTheme.titleLarge),
                  const SizedBox(height: 8),
                  Text(_planet.about, style: textTheme.bodyLarge),
                  const SizedBox(height: 24),
                  _InfoRow('Distance from Sun (km)', _planet.distanceFromSun),
                  _InfoRow('Length of Day (hours)', _planet.lengthOfDay),
                  _InfoRow('Orbital Period (Earth years)', _planet.orbitalPeriod),
                  _InfoRow('Radius (km)', _planet.radius),
                  _InfoRow('Mass (kg)', _planet.mass),
                  _InfoRow('Gravity (m/s²)', _planet.gravity),
                  _InfoRow('Surface Area (km²)', _planet.surfaceArea),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyLarge!;
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: label,
              style: style.copyWith(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.white,
              ),
            ),
            TextSpan(
              text: ' : $value',
              style: style.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
