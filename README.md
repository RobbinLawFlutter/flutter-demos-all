# Environment Setup for Flutter Dev Part I (Windows10)

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

- From this webpage, clone my repo to your machine.
  - from the green dropdown copy the link to your clipboard.
  - in VSCode run the command `Git:Clone`
  - clone the repo to `C:\FlutterDev\FlutterRepos`