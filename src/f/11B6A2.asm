; ---------------------------------------------------------------------------
; WallCrawlBio_Script1 - WALLCRAWLBIO AI script (table $11B6A0, 2 entries)
; In:  jmp thunks
; Out: -
; Evidence: jt $3052 in WallCrawlBio_Init
; ---------------------------------------------------------------------------
WallCrawlBio_Script1:
	jmp	$327A(a5)	; -> WallCrawlBio_ActStopFrame11
loc_11B6A6:
	jmp	$3282(a5)	; -> WallCrawlBio_ActCrawlVertical
