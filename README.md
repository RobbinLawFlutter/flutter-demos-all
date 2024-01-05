# Environment Setup for Flutter Dev (Windows10)

## Download Git

- [Git Website](https://git-scm.com/)
- Download the latest version. Allow all the defaults on download. The path should be updated automatically, so that `git` is available from any directory.
- Open a PowerShell or CMD terminal. In the shell run `git –version` to make sure that git is installed and accessible from this directory. Note that it is two minus bars before version. If a version number is not returned, the path must be set so that `git` is available from any directory. To set the path, in the search area at the bottom of the windows task bar type `env` and select `Edit Environment Variables for your Account`. Then edit the `PATH` and add new `C:\Program Files\Git\cmd`. You could add this to the system environments alternatively. Now you can run the `git` command from a terminal anywhere.
  
----

## Download Visual Studio Code & the Flutter/Dart Extension

- [Visual Studio Code Website](https://code.visualstudio.com)
- Download Visual Studio Code if you do not already have it on your machine.
- From VS Code install the extension `flutter` which will also load the `dart` extension.

---

## Setup Folder Structure

- Create the following folders in the C drive:
  - C:\FlutterDev
  - C:\FlutterDev\FlutterSDK
  - C:\FlutterDev\AndroidStudio
  - C:\FlutterDev\AndroidSDK
  - C:\FlutterDev\FlutterRepos

---

## Clone My Demos to Your Machine

- [My Demos Repo on GitHub](https://github.com/RobbinLawFlutter/flutter-demos-all)
- From the link above, clone my repo to your machine.
  - from the green dropdown copy the link to your clipboard.
  - in VSCode run the command `View/CommandPallet/Git:Clone`
  - clone the repo to `C:\FlutterDev\FlutterRepos`

---

## Create a GitHub Account

- [GitHub Website](https://github.com)
- Go to GitHub and create an account. Choose an appropriate username that has your first and last name in it. Remember the username that you create the account with as well as the email that you use. You will need this information to complete the setup.

---

## Download GitHub CLI

- [GitHub CLI Website](https://cli.github.com/) (*Command-Line Interface*)
- Download the latest version. Allow all the defaults on download. The path should be updated automatically, so that `gh` is available from any directory.

----

## Download the Flutter SDK (Software Development Kit)

- Go to the contents of the C:\FlutterDev folder, then `shift` and `right mouse` on FlutterSDK, then start a power shell from here.
- In the shell with FlutterSDK as the active folder, run `git clone https://github.com/flutter/flutter.git -b stable`. This assumes that `git` is installed on the machine and the path environment variable for the user or system is set properly.
- Run `C:\FlutterDev\FlutterSDK\flutter\flutter_console.bat`, and within the console run `flutter doctor -v`. The `-v` in this case stands for `verbose`. This will download the DartSDK, and some other things.
- Notice that the doctor is complaining that there is no Android tool chain if that has not already been done.
- Add `C:\FlutterDev\FlutterSDK\flutter\bin` to the PATH environment of this user. To do this in the search area at the bottom of the windows task bar type `env` and select `Edit Environment Variables for your Account`. Then edit the `PATH` and add new `C:\FlutterDev\FlutterSDK\flutter\bin`. Now you can run the `flutter doctor` and `flutter upgrade` from a terminal anywhere.

----

## Download Android Studio and the Android SDK

- [Android Studio Website](https://developer.android.com/studio/releases)
- Download `Android Studio` from the link above or using the instructions at `flutter.dev`. Note `Android Studio` is to be stored in `C:\FlutterDev\AndroidStudio`.
- Start `Android Studio` and if this is the first time a `wizard` should help you `configure Android Studio` and download the `AndroidSDK`. The `AndroidSDK` is to be stored in `C:\FlutterDev\AndroidSDK`. Also you must tell Android Studio where the `Android SDK` is located.
- With `Android Studio` started and at the `landing page`, under `more actions` click on the `SDK Manager`.
- While in the `SDK Manager` make sure that the location of the `Android SDK` is correct, `C:\FlutterDev\AndroidSDK`. Also under the `SDK Tools tab`, make sure that the check box is checked for `Android SDK Command Line Tools`, and then click `Apply` and then `OK`.
- With `Android Studio` started and at the `landing page`, under `more actions` click on the `virtual device manager` and create a virtual device if one has not already been created for you. Use the instructions as per document called `Create a Virtual Machine` located at `flutter.dev`. Launch the new Virtual Machine.
- From any terminal run `flutter config --android-sdk C:\FlutterDev\AndroidSDK`. Note that it is two minus bars before android-sdk. This will also download the Dart SDK from the Flutter engine and run pub upgrade as well.
- From any terminal run `flutter doctor -v` to see that now the flutter sdk sees the android sdk but there may be some license issues.
- From any terminal run `flutter doctor --android-licenses` and choose `y` for all. There are about 10 licenses to say yes to.
- From any terminal run `flutter doctor -v` to see that now the doctor is happy with the android tool chain.

---

## Test Setup with Visual Studio Code

- From VS Code start a terminal and run the `flutter doctor -v` again, to see that it is happy and if the Virtual Machine is running it will see a connected device. Note that you can only run the doctor from here if your path is set correctly. Otherwise, you must navigate to and run `C:\FlutterDev\FlutterSDK\flutter\flutter_console.bat` and then within the console run `flutter doctor -v`.

---

## Test Drive Tool Chain

- Test drive our tools. When within VS Code go to `View/CommandPallet/Flutter: New Project`, name it `testdrive1` and store it in `C:\FlutterDev\FlutterRepos`.
- Start an android virtual machine from `Android Studio` if not already started.
- If needed connect VS Code to the virtual machine by clicking on `No Device` in the lower right corner of VS Code.
- Run the app without debugging. The first time it will take a while to compile and download to the vm.

---

## Other Notes

- Use `pwd` in a bash terminal to see the path of the working folder in Linux style, or run `pwd` in a powershell/cmd terminal to see the path of the working folder in Windows style.

- Use `which flutter` in a bash terminal to see the path in Linux style, /c/flutter, or `where flutter` in a bash or cmd terminal to see the path in Windows style C:\flutter. Both the `which` and `where` commands do not work in a powershell terminal.

- If you have already got the FlutterSDK and want to update it start a terminal and run `flutter upgrade`, assuming that the FlutterSDK location is in your PATH environment variable. Otherwise, you must find and run the `flutter-console.bat` first and within it then run `flutter upgrade`.

- If you have Android Studio and AndroidSDK installed then you have to go to the users folder (ex. C:\Users\robbi) and delete the `.Android` and `.AndroidStudioX.0` and `AndroidStudioProjects` directories to reset to factory default so the setup wizard will run when Android Studio is launched the next time. Be aware that if you do this, all your present virtual machines will be destroyed.
