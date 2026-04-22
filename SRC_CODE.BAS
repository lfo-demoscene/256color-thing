DECLARE SUB ReadPalette (paletteIndex%, r%, g%, b%)
DECLARE SUB WritePalette (paletteIndex%, r%, g%, b%)

SCREEN 12
COLOR 11
CLS
PRINT ""
PRINT " WARNING: CONTAINS FLASHING LIGHTS. PROCEED WITH CAUTION."
PRINT " coded with QuickBASIC 4.5 by lfo/VyRaL^NL^HF on 03 December 2025."
PRINT ""
PRINT " you'll at least need an Intel 8088 CPU (4.77MHz) to run this demo."
PRINT " i highly recommend running this demo on an Intel 80286 CPU (12MHz)."
PRINT " go to a psychologist if you run this on an Intel i386SX or later."
PRINT ""
PRINT " this is my first shot at graphics, so please excuse how shitty it is."
PRINT " made for Inercia 2025 size coding compo, exe size is just below 40kb!"
PRINT ""
PRINT " press the F5 key to run the demo. you can exit the demo at any time by"
PRINT " pressing any key again (even F5) to return to the DOS command line."
PRINT ""
PRINT " greetings to all of my lovely friends (in no particular order):"
PRINT " D/V, PacorexTheTrex, Platonist, psenough, Purple Motion, Psi, Skaven,"
PRINT " MikroMacaroni, Filippp, mickaleus, Kast601, E$G, Nikku4211, EnderBanana,"
PRINT " Gargaj, RepellantMold, SyntheticDreams, W.O.T.W., CEO of Salty Spitoon,"
PRINT " OctoKat77, ikarapopsicle, AlexKubrat, Phflak, reissecup, ViRiX Dreamcore,"
PRINT " Baycun, Jaklub, Sr.Duster, WAVE, NathanDAWs, Tha_Randomu, and sourthecat!"
PRINT ""
PRINT " greetings to these fantastic groups/teams (also in no particular order):"
PRINT " Future Crew, Scoopex, Razor 1911, NewLine, Hokuto Force, TEAM R2R, MoonShine,"
PRINT " PARADOX, Tristar and Red Sector, DEViANCE, Phrozen Crew, and Sound Alliance!"

DO
k$ = INKEY$
LOOP UNTIL k$ = CHR$(0) + CHR$(63)

SCREEN 13
CLS

shade = 100

DEF SEG
DEFINT A-Z


DO
    FOR i = 0 TO 247
        ReadPalette i, r, g, b
        WritePalette shade, r, g, b

        FOR D = 1 TO 2: NEXT D
        IF LEN(INKEY$) THEN END
    NEXT i
LOOP

' ReadPalette returns R,G,B (each 0–63)
' paletteIndex& is 0–255
SUB ReadPalette (paletteIndex, r, g, b)
    OUT &H3C7, paletteIndex
    r = INP(&H3C9)
    g = INP(&H3C9)
    b = INP(&H3C9)
END SUB

' Write an RGB triplet into a palette entry
SUB WritePalette (paletteIndex, r, g, b)
    OUT &H3C8, paletteIndex
    OUT &H3C9, r
    OUT &H3C9, g
    OUT &H3C9, b
END SUB

