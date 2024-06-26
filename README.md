# 🪩 midi-graph

🪩 midi-party-visualizer 🪩 is a collection of Processing & Max sketches that takes in the audio properties and use them as variables to change the visuals.

# Content
## 1. 🎼 midi-graph
🪩 midi-graph 🪩 is a pitch and amplitude based graph that is inspired by MIDI graph UI on audio processing softwares. But, instead of a plain rectangle as the MIDI notes, the program will generate continuously-captured camera images. The y-position of the image will be according to the current detected pitch, hence the images are representation of the MIDI notes. The amplitude of the audio will determine the x-position of the images (or shall we say, “MIDI note”).

## 2. 📷 slitscan-graph

## 3. 🎹 launchpad-graph


# 📸 Camera Configuration
By default Processing will take the webcam of the device it is running in. For this project purpose, we’re going to use a remote camera that is connected via wifi, called Iriun Camera.
## Steps:
1. Download Iriun Camera on the device and the phone that is going to be used as camera.
2. Open Iriun Camera in both devices and make sure they are connected on the same wifi.
3. Open Photobooth app, change the camera by going to `camera -> Iriun Camera`. This will change the default camera for the mac to Iriun Camera, and this change will take over the camera input globally, including Processing.

## 📚 Dependency to be downloaded on your device and phone camera:
- <a href="https://processing.org/download" target="_blank">Processing</a> (Version: 4.3)
- Download <b>Video</b> and <b>oscp5</b> from `Tools -> Add Tools -> Libraries` in Processing
- <a href="https://cycling74.com/downloads" target="_blank">Max MSP</a> (Version: 8)
- <a href="https://iriun.com/" target="_blank">Iriun Webcam</a>
- <a href="https://obsproject.com/download" target="_blank">OBS Studio for livestreaming</a> (optional)

#### 👯‍♂️ This project has been shown at <a href="https://e-kezia.com/call-me" target="_blank">Bad Times Disco's "Call Me"</a> party in 2023 and will be shown in M+ Asian Avant-Garde Film Festival's Amorphous Body Party on 31 May 2024.
