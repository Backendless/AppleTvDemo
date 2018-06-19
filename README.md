# About this project
This project is a sample tvOS application demonstrating the usage of the Backendless Real-Time Database feature. You can see a demo of this app in the following video.

[![Backendless SDK for tvOS ](https://img.youtube.com/vi/B5iaEHNZWSU/0.jpg)](https://www.youtube.com/watch?v=B5iaEHNZWSU)

Follow the instructions below to clone the repo and run the app on your device:

## How to Run the Project
1. Open a Terminal window and run the following command
   ```
   git clone https://github.com/Backendless/AppleTvDemo.git'
   ```
2. Change the current directory to the directory of the repo by running the following command:
   ```
   cd AppleTvDemo
   ```
3. Install cocoapods which includes Backendless SDK and its dependendencies:
   ```
   pod install
   ```
   It is recommended to run the following command too to make sure you have the latest version of the pod:
   ```
   pod update
   ```
4. Once all of the pods are downloaded / updated, an Xcode project workspace file is created. This is the file you use to work with your app.
5. Open the AppleTvDemo.xcworkspace file with Xcode
6. Open the ViewController.swift file and change the `APP_ID` and `API_KEY` values to include yours from the Backendless Console Manage tab.
