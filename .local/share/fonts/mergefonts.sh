#!/usr/bin/fontforge

Open($1)
SelectAll()
ScaleToEm(1792)
Generate("1.ttf")
Close()
Open($2)
SelectAll()
ScaleToEm(2048)
Generate("2.ttf")
Close()
Open("1.ttf")
MergeFonts("2.ttf")
Generate("my_custom_font.ttf")
Close()