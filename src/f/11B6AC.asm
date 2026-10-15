; ---------------------------------------------------------------------------
; WallCrawlBio_Script2 - WALLCRAWLBIO AI script (table $11B6AA, 2 entries)
; In:  jmp thunks
; Out: -
; Evidence: jt $305A in WallCrawlBio_Init; count word mislabelled Tbl_WallCrawlBioAiScript_11B6AA
; ---------------------------------------------------------------------------
WallCrawlBio_Script2:
	jmp	$3272(a5)	; -> WallCrawlBio_ActStopFrame0
loc_11B6B0:
	jmp	$328A(a5)	; -> WallCrawlBio_ActCrawlHorizontal
