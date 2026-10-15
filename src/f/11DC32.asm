; ---------------------------------------------------------------------------
; WallCrawlBio_GetSize - return sizeof(WALLCRAWLBIO object) = $C0 bytes (class slot 0, +$06)
; In:  none
; Out: d0 = $C0
; Evidence: method 0 of class descriptor $11BAA0 (name string "WALLCRAWLBIO", parent BABYBIO)
; ---------------------------------------------------------------------------
WallCrawlBio_GetSize:
	link.w	a6,#$0
	move.l	#$C0,d0
	unlk	a6
	rts
