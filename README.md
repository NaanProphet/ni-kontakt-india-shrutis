# ni-kontakt-india-shrutis
Modifications to the Native Instruments "Discovery Series: India" instruments to support 22 Shrutis.

<a href="https://www.native-instruments.com/en/products/komplete/world/india/" target="_blank">https://www.native-instruments.com/en/products/komplete/world/india/</a>

# How to Use

Manually copy/paste the scripts in the respective slot. Currently only Slots 2 and 4 have modifications.

Note: modifying instrument settings requires a paid version of Kontakt.

# Features

1. Dhaivat Tanpura Tuning (6-12-1-1)
2. Customize Tanpura tuning via Scale Tuning

# FAQ

** Which instruments do these scripts work with? **

Bansuri, Harmonium, Santur, Sitar, Tanpura, and Tumbi. All the Kontakt India melodic instruments share the same scripts.

** Do all melodic instruments really use the same scripts? **

Yes! The stock Bansuri, Harmonium, Santur, Sitar, Tanpura, and Tumbi instruments all have four scripts, and they are identical. (I confirmed this by copy/pasting the contents of each script for each instrument and applying a diff tool them.)


# Schematics

## Scale File Format

The `.nka` entries determine which scale degrees are "included" in the octave. These are used in mapped MIDI mode, where playing a wrong note automatically maps to one in the Raga.

![Kontakt India nka Scale Format Diagram](/schematics/Kontakt%20India%20nka%20Scale%20Format%20Diagram.png)

Each `.nka` scale file has 21 (7x3) entries. The first 7 specify the scale mapping to the 12 notes on the keyboard.

The values are either 0, 1, or 2. Those that are not included are automatically mapped to neighbors.

Some entries have conditional logic with each other. These are namely II and III; and VI and VII.

To verify/test mapping with new Raga definitions, use the `scale-test.sh` shell script written in zsh. 

For the original code, see function `change_scale` in the `India MEL Slot 2.txt` script.


# Helpful Resources

1. Kontakt 6 Reference Manual, basically works for Kontakt 5 as well <a href="https://www.native-instruments.com/fileadmin/ni_media/downloads/manuals/kontakt/KSP_Reference_Manual_26_08_2020_ENGLISH.pdf" target="_blank">https://www.native-instruments.com/fileadmin/ni_media/downloads/manuals/kontakt/KSP_Reference_Manual_26_08_2020_ENGLISH.pdf</a>
2. Sublime Text KSP Syntax Plugin <a href="https://nilsliberg.se/ksp/" target="_blank">https://nilsliberg.se/ksp/</a>
3. Kontakt Scripting Tutorial <a href="https://nilsliberg.se/ksp/scripts/tutorial/" target="_blank">https://nilsliberg.se/ksp/scripts/tutorial/</a>
