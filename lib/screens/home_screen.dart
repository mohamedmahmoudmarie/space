import 'package:flutter/material.dart';

import '../data/planets_data.dart';
import '../models/planet.dart';
import '../widgets/action_button.dart';
import '../widgets/header_banner.dart';
import '../widgets/primary_button.dart';
import 'details_screen.dart';

/// Screen One : Explore
class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Planet> _planets = PlanetsData.planets;
  late final PageController _pageController;
  int _currentIndex = PlanetsData.initialIndex;

  static const _duration = Duration(milliseconds: 450);
  static const _curve = Curves.easeInOut;

  Planet get _currentPlanet => _planets[_currentIndex];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _next() {
    if (_currentIndex < _planets.length - 1) {
      _pageController.nextPage(duration: _duration, curve: _curve);
    }
  }

  void _previous() {
    if (_currentIndex > 0) {
      _pageController.previousPage(duration: _duration, curve: _curve);
    }
  }

  void _openDetails() {
    Navigator.of(context).pushNamed(
      DetailsScreen.routeName,
      arguments: _currentPlanet,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Column(
        children: [
          const HeaderBanner(
            topTitle: 'Explore',
            bottomTitle: 'Which planet\nwould you like to explore?',
          ),
          // Page view : swipe page by page
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _planets.length,
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemBuilder: (context, index) {
                // Smooth scale/fade animation while swiping
                return AnimatedBuilder(
                  animation: _pageController,
                  builder: (context, child) {
                    double page = _currentIndex.toDouble();
                    if (_pageController.hasClients &&
                        _pageController.position.haveDimensions) {
                      page = _pageController.page ?? page;
                    }
                    final distance = (page - index).abs().clamp(0.0, 1.0);
                    return Opacity(
                      opacity: 1 - distance * 0.5,
                      child: Transform.scale(
                        scale: 1 - distance * 0.3,
                        child: child,
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 8,
                    ),
                    child: Hero(
                      tag: _planets[index].name,
                      child: Image.asset(
                        _planets[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SafeArea(
            top: false,
            minimum: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      ActionButton(
                        icon: Icons.arrow_back,
                        onPressed: _currentIndex > 0 ? _previous : null,
                      ),
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: Text(
                            _currentPlanet.name,
                            key: ValueKey(_currentPlanet.name),
                            textAlign: TextAlign.center,
                            style: textTheme.titleLarge,
                          ),
                        ),
                      ),
                      ActionButton(
                        icon: Icons.arrow_forward,
                        onPressed: _currentIndex < _planets.length - 1
                            ? _next
                            : null,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  PrimaryButton(
                    title: 'Explore ${_currentPlanet.name}',
                    onPressed: _openDetails,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
