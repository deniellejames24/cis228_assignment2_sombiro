import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CIS 228 Assignment 3',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // Interest checkboxes state
  bool _musicInterest = false;
  bool _cyclingInterest = false;
  bool _watchingMoviesInterest = false;

  void _submitData() {
    // Get selected interests
    List<String> selectedInterests = [];
    if (_musicInterest) selectedInterests.add('Music');
    if (_cyclingInterest) selectedInterests.add('Cycling');
    if (_watchingMoviesInterest) selectedInterests.add('Watching Movies');

    // Print data to console
    print('=== Profile Data ===');
    print('Name: ${_nameController.text}');
    print('Email: ${_emailController.text}');
    print('Interests: ${selectedInterests.join(', ')}');
    print('==================');

    // Show confirmation snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profile data printed to console!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://scontent.fcgy2-2.fna.fbcdn.net/v/t39.30808-6/441927382_1913368925800611_1742155134938278907_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeHaSHQsf7FJXzJ-uCPyHUFejmGWvCEx_JmOYZa8ITH8mbFD9VjYbG8_H4rf6PSxL9WNOrrtfA6qvo_pzadYgApD&_nc_ohc=6MRkd0jvPdcQ7kNvwFQkieF&_nc_oc=Adka3ke4iKm7Jd3n0j574N3B_HBfpKzTKZTRlv6xNKgerMFOEo2qbCIVgi-hKb_YWjY&_nc_zt=23&_nc_ht=scontent.fcgy2-2.fna&_nc_gid=u3nEpyN1FWGuzMgSb89k2w&oh=00_AfOD8ewAAxIfNkORiV_tfKTKi1KPlc4cMMosuP8nMt93mg&oe=68491020',
              ),
            ),
            const SizedBox(height: 30),

            // Name Text Field
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Full Name',
                hintText: 'Enter your full name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),

            // Email Text Field
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email Address',
                hintText: 'Enter your email address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 30),

            // Interests Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Interests:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Music Checkbox
            CheckboxListTile(
              title: const Text('Music'),
              subtitle: const Text('I enjoy listening to music'),
              value: _musicInterest,
              onChanged: (bool? value) {
                setState(() {
                  _musicInterest = value ?? false;
                });
              },
              secondary: const Icon(Icons.music_note),
            ),

            // Cycling Checkbox
            CheckboxListTile(
              title: const Text('Cycling'),
              subtitle: const Text('I enjoy cycling and bike rides'),
              value: _cyclingInterest,
              onChanged: (bool? value) {
                setState(() {
                  _cyclingInterest = value ?? false;
                });
              },
              secondary: const Icon(Icons.directions_bike),
            ),

            // Watching Movies Checkbox
            CheckboxListTile(
              title: const Text('Watching Movies'),
              subtitle: const Text('I love watching movies and TV shows'),
              value: _watchingMoviesInterest,
              onChanged: (bool? value) {
                setState(() {
                  _watchingMoviesInterest = value ?? false;
                });
              },
              secondary: const Icon(Icons.movie),
            ),

            const SizedBox(height: 30),

            // Submit Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _submitData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Submit Profile',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}