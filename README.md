# LiveSplit Automatic Splitter for STATUS: INSANE

Currently only works with a modified game that exposes the currently loaded level ID.

# Installation and usage

Copy the ```Assembly-CSharp.dll``` to 
```
<SteamLibrary>/steamapps/common/STATUS INSANE/STATUS INSANE_Data/Managed
```

It's a good idea to make a backup of the old file, in case you want to revert it, but if you forget the backup, you can also use Steam's Verify Integrity -functionality to restore the game to the original version.

The only modifications done to the file is to expose the currently loaded level index as a static integer for easier access and update it on level load, as well as printing the current level index and name to screen (defaults to off, toggled with F10)


# Usage of ASL with LiveSplit

The ASL needs to be loaded with LiveSplit by adding a Scriptable Auto Splitter layout component (From Edit Layout...->[+ sign]) and adding the component from Control -menu. The settings can be reached by double clicking the component on the list. From there, selecting the ASL file from the Browse... -button should be enough. The game process should be automatically identified.

When the game is on the main menu, the timer is reset. When the first level is loaded (ie. the first frame where the current level is Igor's Room), the timer starts. All the splits are set to scene changes. 

There's no detection that the next scene change is the correct one (at least yet), so if you accidentally change scenes out of order, use the undo split key to get back on top of things (and the split key to go forwards, if you need it). The global hotkeys default to Numpad 1 for start/split and Numpad 8 for Undo Split.

The autosplit timer stops the on the first frame of the ending movie level. For reasons unknown, the last split (ie. finishing the run) disables automatic reseting. Thus, if you want to save your splits and times before your next run, press Numpad 1 (Start/Split hotkey). If you want to discard this run from the stats, press Numpad 3 (Reset). After the run has been manually reset by either saving the splits and runtime or resetting, the automatic splitter functions as it should once again.


