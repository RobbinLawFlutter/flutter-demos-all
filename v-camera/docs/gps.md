

Upgrade pre 1.12 Android projects

Since version 5.0.0 this plugin is implemented using the Flutter 1.12 Android plugin APIs. Unfortunately this means App developers also need to migrate their Apps to support the new Android infrastructure. You can do so by following the Upgrading pre 1.12 Android projects migration guide. Failing to do so might result in unexpected behaviour.

AndroidX

The geolocator plugin requires the AndroidX version of the Android Support Libraries. This means you need to make sure your Android project supports AndroidX. Detailed instructions can be found here.

The TL;DR version is:

Add the following to your "gradle.properties" file:
android.useAndroidX=true
android.enableJetifier=true
Make sure you set the compileSdkVersion in your "android/app/build.gradle" file to 31:
android {
  compileSdkVersion 31

  ...
}
Make sure you replace all the android. dependencies to their AndroidX counterparts (a full list can be found here: Migrating to AndroidX).
Permissions

On Android you'll need to add either the ACCESS_COARSE_LOCATION or the ACCESS_FINE_LOCATION permission to your Android Manifest. To do so open the AndroidManifest.xml file (located under android/app/src/main) and add one of the following two lines as direct children of the <manifest> tag (when you configure both permissions the ACCESS_FINE_LOCATION will be used by the geolocator plugin):

<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

Starting from Android 10 you need to add the ACCESS_BACKGROUND_LOCATION permission (next to the ACCESS_COARSE_LOCATION or the ACCESS_FINE_LOCATION permission) if you want to continue receiving updates even when your App is running in the background (note that the geolocator plugin doesn't support receiving an processing location updates while running in the background):

<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION" />
NOTE: Specifying the ACCESS_COARSE_LOCATION permission results in location updates with an accuracy approximately equivalent to a city block. It might take a long time (minutes) before you will get your first locations fix as ACCESS_COARSE_LOCATION will only use the network services to calculate the position of the device. More information can be found here.