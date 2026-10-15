; ---------------------------------------------------------------------------
; EvilNightcrawler_GetSize - vtable +$06: return sizeof(EVILNIGHTCRAWLER) = $BE bytes
; In:  none
; Out: d0 = $BE
; Evidence: slot +$6 of the EVILNIGHTCRAWLER descriptor $099F88; never runs in the corpus
; ---------------------------------------------------------------------------
EvilNightcrawler_GetSize:
	link.w	a6,#$0
	move.l	#$BE,d0
	unlk	a6
	rts
