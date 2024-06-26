# 🪩 midi-graph

🪩 midi-graph 🪩 is a pitch and amplitude based graph that is inspired by MIDI graph UI on audio processing softwares. But, instead of a plain rectangle as the MIDI notes, the program will generate continuously-captured camera images. The y-position of the image will be according to the current detected pitch, hence the images are representation of the MIDI notes. The amplitude of the audio will determine the x-position of the images (or shall we say, “MIDI note”).

# Instruction
1. Download `/processing` folder, then open both `/processing/midi_party_visualizer.pde` and `/processing/oscEvent.pde`in the same window in your Processing sketch.
2. Download and open `/max/pitch_detector.maxpat` on Max MSP, then click the microphone button to start picking up the audio.
3. The audio input could be assigned to your DJ controller/speaker/any audio input by going to `options -> audio status` or double-clicking the microphone button.
4. Run the Processing sketch by clicking the play button.
5. The Processing sketch will save / screenshot its frame to the folder `/recs` when the image has reached the end of the x-axis. These screenshots could be stitched together in post-production and be the party documentation. 

# 📸 Camera Configuration
By default Processing will take the webcam of the device it is running in. For this project purpose, we’re going to use a remote camera that is connected via wifi, called Iriun Camera.
## Steps:
1. Download Iriun Camera on the device and the phone that is going to be used as camera.
2. Open Iriun Camera in both devices and make sure they are connected on the same wifi.
3. Open Photobooth app, change the camera by going to `camera -> Iriun Camera`. This will change the default camera for the mac to Iriun Camera, and this change will take over the camera input globally, including Processing.

# 🎻 Pitch Detector on MAX
The pitch detector file will guess the pitch with the retune library, and also get the amplitude of the audio. These data will be sent over oscEvent via the values: /pitch and /amp.

The oscEvent is connected to local network and should be identical to the network defined in the Processing sketch (default: 12001)

## 📚 Dependency to be downloaded on your device and phone camera:
- <a href="https://processing.org/download" target="_blank">Processing</a> (Version: 4.3)
- Download <b>Video</b> and <b>oscp5</b> from `Tools -> Add Tools -> Libraries` in Processing
- <a href="https://cycling74.com/downloads" target="_blank">Max MSP</a> (Version: 8)
- <a href="https://iriun.com/" target="_blank">Iriun Webcam</a>
- <a href="https://obsproject.com/download" target="_blank">OBS Studio for livestreaming</a> (optional)

#### 👯‍♂️ This project has been shown at <a href="https://e-kezia.com/call-me" target="_blank">Bad Times Disco's "Call Me"</a> party in 2023 and will be shown in M+ on 31 May 2024.
