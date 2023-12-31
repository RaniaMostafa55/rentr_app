// A screen that allows users to take a picture using a given camera.
import 'package:renta_app/controller/imports.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
    required this.camera,
  });

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Fill this out in the next steps.
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(_controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Provide an onPressed callback.
        onPressed: () async {
          try {
            // Ensure that the camera is initialized.
            await _initializeControllerFuture;
            print("Doneeeeeeeeeeeeeee");

            // Attempt to take a picture and then get the location
            // where the image file is saved.
            final image = await _controller.takePicture();

            if (!mounted) return;

            print('yessssssssssssssssssssssss');

            await bLoC
                .addImage(filepath: image.path)
                .then((value) => Navigator.of(context).pop());
            // Navigator.pop(context);
          } catch (e) {
            // If an error occurs, log the error to the console.
            print('errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrror  $e');
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
