; ---------------------------------------------------------------------------
; PlayerSelect_AllocCharBuffers_Cases - switch cases of PlayerSelect_AllocCharBuffers: fetch character N's select sprite and frame
; In:  d7 = character index
; Out: none
; Evidence: targets of Sw_064638
; ---------------------------------------------------------------------------
PlayerSelect_AllocCharBuffers_Cases:
	jsr	$432A(a5)	; -> Beast_SelectSpriteDef
	movea.l	d0,a4
	jsr	$4332(a5)	; -> Beast_SelectFrame
	move.w	d0,d7
	bra.s	$646DE
loc_064682:
	jsr	$4B32(a5)	; -> Cyclops_SelectSpriteDef
	movea.l	d0,a4
	jsr	$4B3A(a5)	; -> Cyclops_SelectFrame
	move.w	d0,d7
	bra.s	$646DE
loc_064690:
	jsr	$4992(a5)	; -> Gambit_SelectSpriteDef
	movea.l	d0,a4
	jsr	$499A(a5)	; -> Gambit_SelectFrame
	move.w	d0,d7
	bra.s	$646DE
loc_06469E:
	jsr	$453A(a5)	; -> Nightcrawler_SelectSpriteDef
	movea.l	d0,a4
	jsr	$4542(a5)	; -> Nightcrawler_SelectFrame
	move.w	d0,d7
	bra.s	$646DE
loc_0646AC:
	jsr	$463A(a5)	; -> Psylocke_SelectSpriteDef
	movea.l	d0,a4
	jsr	$4642(a5)	; -> Psylocke_SelectFrame
	move.w	d0,d7
	bra.s	$646DE
loc_0646BA:
	jsr	$442A(a5)	; -> Wolverine_SelectSpriteDef
	movea.l	d0,a4
	jsr	$4432(a5)	; -> Wolverine_SelectFrame
	move.w	d0,d7
	bra.s	$646DE
loc_0646C8:
	jsr	$4842(a5)	; -> Magneto_SelectSpriteDef
	movea.l	d0,a4
	jsr	$484A(a5)	; -> Magneto_SelectFrame
	move.w	d0,d7
	bra.s	$646DE
