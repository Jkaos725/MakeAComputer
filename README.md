## Background Information

Based on [mattbatwings BatPU-2 Redstone Computer](https://github.com/mattbatwings/BatPU-2)

This is an edited version of his where I made differences based on where I was in his [Let's Make a Redstone Computer! series](https://www.youtube.com/playlist?list=PL5LiOvrbVo8nPTtdXAdSmDWzu85zzdgRT)

I am using 26.1.2 which is the oldest version the newest version of [Redstone Tools](https://github.com/RedstoneTools/redstonetools-mod) is available for.

The documentation for the program and assembly can be found in [this sheets example](https://docs.google.com/spreadsheets/d/1Bj3wHV-JifR2vP4HRYoCWrdXYp3sGMG0Q58Nm56W4aI/edit?gid=0#gid=0) that is made by mattbatwings

Most of the code is made by mattbatwings. This is just made to edit the code to my current specifications

This is initially made to follow from Episode 5, instruction memory.

# Changes
schematic.py is the majority of the changes. I had multiple repeaters being placed in areas they shouldn't be.
I spend a good hour resetting my ALU, Register File, and connections to make sure they work again.

The main thing I saw from the previous version was two fold.

1. There were extra repeaters being placed for parts I did not have nor did not need to be reset.
2. The commands were not working whenever I did add the new code to the Instruction Memory

The byte 1 and byte 2 are flipped to follow the machine code.
Before, it would read the last 8 bits followed by the first 8 bits. 

I wired up the Instruction Memory to be the same bits as seen in machine code.
This took troubleshooting where the numbers were going, so I just swapped the two areas the array is split in python.

The next step was removing all of the rest functions in the memory. All of the features used to make sure the program is reset. 
With how simple the program is, I set it back to only submit the program to ensure no extra repeaters are placed.

# How to run?

Requirements: 
- Python installed
- Minecraft modpack with WorldEdit

Initialize Python
```
uv init
```

Install Required Addons
```
uv add mcschematic 
```

Open main.py and change 
```
program = '<current_file>'
```
to the program you want to convert.

Run to create new schematic

```
uv run main.py
```

Finally, open programs and copy the .schem file.

You want to add this to your version of modded Minecraft with 

Add this to your worldedit schematics.

Mine are found in //<modpack-base-file>/config/worldedit/schematics

Now, you can run the new command in minecraft
```
//schematic laod <<name-of-file>>.schem

//paste -as
```

Make sure to include -as as it will replace blocks without replacing everything else with air

# New Programs

Two programs were made for testing the Instruction Memory from Episode 5

1. Basic.as - initial test to ensure the Instruction Memory works by setting two values and adding them into the third register.
2. test.as - a comprehensive test to look over the different functions of the program. This was made to see where blocks were missing or repeaters were added to block results.

The test.as showed a lot of broken bits and logic in the code. The final result shows the system working, but the memory and ALU are still subject to look over. The last few registers are only to be needed testing.

# Where to Stand to paste?

From the top, back, right redstone dust is 1 block up, 2 blocks back, and 2 blocks to the right.


Side View
<img width="512" height="266" alt="side view" src="https://github.com/user-attachments/assets/fe3b8dd3-1409-4827-ba07-f3b48ea84e8d" /> 

Top View
<img width="512" height="266" alt="top view" src="https://github.com/user-attachments/assets/bd2bd767-609c-452c-9452-284c08775252" />

View looking at Instruction Memory

<img width="256" height="133" alt="2026-09-01_10 11 16" src="https://github.com/user-attachments/assets/99cef4f9-78b3-44d0-9ef8-7888d040cb98" />

Based on Matt's episode 5 video, this is 2 blocks to the right.

If you paste where Matt was for his video, it will paste blocks and repeaters inside the logic and block the redstone flow allowing for 0 instructions to get through.
