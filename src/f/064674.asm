; ---------------------------------------------------------------------------
; PlayerSelect_AllocCharBuffers_Cases - switch cases of PlayerSelect_AllocCharBuffers: fetch character N's select sprite and frame
; In:  d7 = character index
; Out: none
; Evidence: targets of Sw_064638
; ---------------------------------------------------------------------------
PlayerSelect_AllocCharBuffers_Cases:
	jsr	$432A(a5)	; -> sub_1841E4
	movea.l	d0,a4
	jsr	$4332(a5)	; -> sub_1841F4
	move.w	d0,d7
	bra.s	$646DE
loc_064682:
	jsr	$4B32(a5)	; -> sub_1E3C5A
	movea.l	d0,a4
	jsr	$4B3A(a5)	; -> sub_1E3C6A
	move.w	d0,d7
	bra.s	$646DE
loc_064690:
	jsr	$4992(a5)	; -> sub_1D0744
	movea.l	d0,a4
	jsr	$499A(a5)	; -> sub_1D0754
	move.w	d0,d7
	bra.s	$646DE
loc_06469E:
	jsr	$453A(a5)	; -> sub_1A7CAC
	movea.l	d0,a4
	jsr	$4542(a5)	; -> sub_1A7CBC
	move.w	d0,d7
	bra.s	$646DE
loc_0646AC:
	jsr	$463A(a5)	; -> sub_1BA006
	movea.l	d0,a4
	jsr	$4642(a5)	; -> sub_1BA016
	move.w	d0,d7
	bra.s	$646DE
loc_0646BA:
	jsr	$442A(a5)	; -> sub_197C22
	movea.l	d0,a4
	jsr	$4432(a5)	; -> sub_197C32
	move.w	d0,d7
	bra.s	$646DE
loc_0646C8:
	jsr	$4842(a5)	; -> sub_1CEC28
	movea.l	d0,a4
	jsr	$484A(a5)	; -> sub_1CEC38
	move.w	d0,d7
	bra.s	$646DE
