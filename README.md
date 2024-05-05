# 🪩 midi-party-visualizer 

🪩 midi-party-visualizer 🪩 is a pitch and amplitude based graph that is inspired by MIDI graph UI on audio processing softwares. But, instead of a plain rectangle as the MIDI notes, the program will generate continuously-captured camera images. The y-position of the image will be according to the current detected pitch, hence the images are representation of the MIDI notes. The amplitude of the audio will determine the x-position of the images (or shall we say, “MIDI note”).

# Instruction
1. Open `/processing/midi_party_visualizer.pde` in Processing.
2. Open `/max/pitch_detector.maxpat` then click the microphone button to start picking up the audio.
3. The audio input could be assigned to your DJ controller/speaker/any audio input by going to options -> audio status or double-clicking the microphone button.
4. Run the Processing sketch by clicking the play button.
5. The Processing sketch will save / screenshot its frame to the folder `/recs` when the image has reached the end of the x-axis. These screenshots could be stitched together in post-production and be the party documentation. 

# 📸 Camera Configuration
By default Processing will take the webcam of the device it is running in. For this project purpose, we’re going to use a remote camera that is connected via wifi, called Iriun Camera.
## Steps:
1. Download Iriun Camera on the device and the phone that is going to be used as camera.
2. Open Iriun Camera in both devices and make sure they are connected on the same wifi.
3. Open Photobooth app, change the camera by going to camera->Iriun Camera. This will change the default camera for the mac to Iriun Camera, and this change will take over the camera input globally, including Processing.

# 🎻 Pitch Detector on MAX
The pitch detector file will guess the pitch with the retune library, and also get the amplitude of the audio. These data will be sent over oscEvent via the values: /pitch and /amp.

The oscEvent is connected to local network and should be identical to the network defined in the Processing sketch (default: 12001)

## 📚 Dependency to be downloaded on your device and phone camera:
- Processing
- Max 
- Iriun Camera
- OBS Studio for livestreaming (optional)

#### 👯‍♂️ This project has been shown at Bad Times Disco's "Call Me" party in 2023 and will be shown in M+ on 31 May 2024.
