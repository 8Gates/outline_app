# outline_app

outline_app started as a scratch pad for a Flutter application. It has evolved into a National Park Trails app providing a curated list of the top 7 trails for each park.

Features of note at this time include:
  - dark/light mode
  - persistent data for most recent park viewed and dark mode
    settings using shared preferences
  - SQFlite database storing park and trail data
  - Google map's static maps for trailheads
  - stateful trail list widget for expanding and compressing cards
    with trail data and maps

Widgets utilizing Google maps require an API key. The API key is referenced not just by files within lib but also build.gradle, AndroidManifest and indirectly a script
from pubspec.yaml.<br /> 
Prior to running this application:<br /> 
&nbsp;&nbsp;&nbsp;(1) create 'config.dart' with lib and place the following code on line 1:&nbsp;&nbsp;&nbsp;&nbsp; const String apiKey = "YOUR_API_KEY";<br />
&nbsp;&nbsp;&nbsp;(2) install RunPubScript(RPS) with command-line: dart pub global activate rps<br />
&nbsp;&nbsp;&nbsp;(3) generate key.properties with command-line: rps gen<br />
