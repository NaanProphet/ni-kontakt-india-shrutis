# ni-kontakt-india-shrutis
Modifications to the Native Instruments "Discovery Series: India" instruments to support 22 Shrutis.

<https://www.native-instruments.com/en/products/komplete/world/india/>

# How to Use

Manually copy/paste the scripts in the respective slot. Currently only Slots 2 and 4 have modifications.

Note: requires paid Kontakt version to access instrument settings.

# Features

1. Dhaivat Tanpura Tuning (6-12-1-1)
2. Customize Tanpura tuning via Scale Tuning

# Schematics

## Scale File Format

![Kontakt India nka Scale Format Diagram](/schematics/Kontakt%20India%20nka%20Scale%20Format%20Diagram.png)

Each `.nka` scale file has 21 (7x3) entries. The first 7 specify the scale mapping to the 12 notes on the keyboard.

The `.nka` entries determine which scale degrees are "included" in the octave. The values are either 0, 1, or 2. Those that are not included are automatically mapped to neighbors.

Some entries have conditional logic with each other. These are namely II and III; and VI and VII.

To verify/test mapping with new Raga definitions, use the `scale-test.sh` shell script written in zsh. 

For the original code, see function `change_scale` in the `India MEL Slot 2.txt` script.


# Helpful Resources

1. Kontakt 6 Reference Manual <https://www.native-instruments.com/fileadmin/ni_media/downloads/manuals/kontakt/KSP_Reference_Manual_26_08_2020_ENGLISH.pdf>
2. Sublime KSP Syntax Plugin <https://nilsliberg.se/ksp/>
3. Kontakt Scripting Tutorial <https://nilsliberg.se/ksp/scripts/tutorial/>
