/// Asset paths for the application
/// This class provides centralized access to all asset paths
class Assets {
  Assets._();

  // Base paths
  static const String _images = 'assets/images';
  static const String _icons = '$_images/icons';
  static const String _logos = '$_images/logos';
  static const String _gifs = '$_images/gifs';
  static const String _illustrations = '$_images/illustrations';
  static const String _animations = 'assets/animations';
  static const String _lottie = 'assets/lottie';
  static const String _videos = 'assets/videos';
  static const String _sounds = 'assets/sounds';

  // GIFs
  static const String googleGif = '$_gifs/google.gif';

  // Icons
  static const String appIcon = '$_icons/app_icon.png';
  // Add your icon paths here as they are added to the project
  // Example: static const String homeIcon = '$_icons/home.png';

  // Logos
  // Add your logo paths here as they are added to the project
  // Example: static const String appLogo = '$_logos/app_logo.png';

  // Illustrations
  // Add your illustration paths here as they are added to the project
  // Example: static const String onboarding1 = '$_illustrations/onboarding_1.svg';

  // Animations
  // Add your animation paths here as they are added to the project
  // Example: static const String loadingAnimation = '$_animations/loading.json';

  // Lottie
  // Add your lottie animation paths here as they are added to the project
  // Example: static const String successLottie = '$_lottie/success.json';

  // Videos
  // Add your video paths here as they are added to the project
  // Example: static const String introVideo = '$_videos/intro.mp4';

  // Sounds
  // Add your sound paths here as they are added to the project
  // Example: static const String clickSound = '$_sounds/click.mp3';
}
