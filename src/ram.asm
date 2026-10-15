; RAM / A5-world symbols. Globals are addressed as negative offsets from A5,
; e.g. `move.w #2,-$38A6(a5)`. Name them here as they are identified:
;   g_example = -$38A6	; word: what it is (evidence: sub_XXXXXX)
g_Player1 = -$1758	; obj: player 1 object ($FFEAA8), vtable at +0 = character class (sub_005FA2 sets +$9D=0 for it; TAS: Nightcrawler class from frame 180)
g_Player2 = -$1848	; obj: player 2 object ($FFE9B8), +$9D=1; vtable 0 until P2 joins (TAS frame 49140)
g_P1Lives = -$38A8	; word: player 1 lives (9 at new game; decremented on each new life)
g_P2Lives = -$38AA	; word: player 2 lives (9 at new game; decremented on each new life)
g_P1CharIndex = -$3BBC	; byte: P1 character 0 Beast 1 Cyclops 2 Gambit 3 Nightcrawler 4 Psylocke 5 Wolverine 6 Magneto, $FF = not playing (Player_CharIndexOf; TAS RAM vs screenshots)
g_P2CharIndex = -$3BBB	; byte: P2 character index (same encoding as g_P1CharIndex), $FF = not playing
g_P1Health = -$3B94	; word: P1 health carried between scenes (copied from g_Player1+$68 after each scene in sub_005CC6; $700 on a new life; 0 = out of play)
g_P2Health = -$3B96	; word: P2 health carried between scenes (from g_Player2+$68; $700 on a new life; 0 = out of play)
g_SceneIndex = -$359C	; word: current scene, index into g_SceneTable (Cerebro screens and stage parts; TAS steps 0,1,2,... per screen)
g_FrameCounter = -$35A2	; long: game frame counter (+1 per frame, +2 when -$38DE set; TAS RAM +60 per 60 frames)
g_SceneTable = -$E52	; 8-byte entries {+0 name string, +4 scene function}, filled by sub_1F9464 (scene register)
g_SceneCount = -$E54	; byte: number of registered scenes (next free g_SceneTable slot, sub_1F9464)
