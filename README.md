# **K2 Polyphonic Sampler**

## General Information
The K2PS is a sampler that ranges 8 octaves (C2-C9), has MIDI, keyboard and mouse support, 8 voices, and has full ASDR (Attack, Decay, Sustain, Release) controls.

This was my first coding project!. I used Godot (GDScript) for scripting and Piskel (Pixel art website) for making assets. It was originally made over the course of ~11 days whenever I had free time. I then went on to add polyphony a few months later. ASDR was horrible to implement since they all internally affected each other and made it hard to pinpoint the source. Half of the time was just coding ASDR due to this. On the second iteration of the project, polyphony took up most of the coding time. I had to optimize and rework systems that were previously across multiple scripts into one script which took a while to figure out. 

I love making music and music gear so I thought it would be fun to code a music-related program. My ambitions were way too high at the start, especially for something made in an engine made for video games.

Fun Fact! When creating the name (K2 Polyphonic Sampler), I decided to use the first letter of my fursona (Kibb) and a 2 because this project has been shipped twice to [Hackclub](https://hackclub.com/).

## Usage

To use it you, you upload a file, or use the default preloaded one, and play it on a piano using MIDI, mouse, or keyboard.

To use MIDI input, your MIDI keyboard MUST be plugged in when the program launches. You can always restart. After trying, I was not able to code a button to connect to MIDI :( Also keyboards block certain letter combinations so the keyboard controls are limited. 

[This](https://youtu.be/WEMp2iuSEoE) video is an overview of the sampler. It explains all the details and functions.

## Opening Instructions

### Versions Tested
MacOS has been tested multiple times. Windows has been tested once.
| OS      | Version        | Processor                                     |
| ------- | -------------- | --------------------------------------------- |
| MacOS   | Ventura 13.7.8 | 2.9 GHz Quad-Core Intel Core i7.              |
| Windows | Windows 11     | 13th Gen Intel(R) Core(TM) i5-1345U (1.60 GHz)|

Other versions of Windows/MacOS may potentially work.

### MacOS
To open, uncompress the zip, and right click on the file. Select "Open" and then it will open up a window. Click "Open" again and then the program will open. You will probably need to do this twice because gatekeeper usually blocks it the first time.

### Windows
Uncompress the .zip and open the file. If a windows security window shows up, click "more info" and then click "Run Anyway"

## Screenshots

<img src="README assets/ss1.png" alt="ss1" width="650" style="margin-bottom: 20px;">

<img src="README assets/ss2.png" alt="ss2" width="650">

## AI Disclosure
 - I went to AI to explain certain functions of code or do certain things (majority of this was on my first project version, since I only knew how to code for 14 days)

 - I used AI to learn how to filter through arrays

 - AI wrote the wav decoding when uploading a file because I did not want to spend like 8 hours researching and figuring out every type of wav file. 
