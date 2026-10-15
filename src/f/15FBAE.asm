; ---------------------------------------------------------------------------
; Intro_WaitFrame - wait for V-blank, then call the caller's optional per-frame callback
; In:  8(a6) of the caller's frame = callback or 0
; Out: none
; Evidence: VDP_WaitVBlank; uses the caller's a6 (no own link); called by Intro_SegaLogoFlash
; ---------------------------------------------------------------------------
Intro_WaitFrame:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
	move.l	$8(a6),d0
	beq.s	loc_15FBBC
	movea.l	d0,a0
	jsr	(a0)
loc_15FBBC:
	rts
