; ---------------------------------------------------------------------------
; loc_01C1B0
; ---------------------------------------------------------------------------
loc_01C1B0:
	move.l	-$14(a6),-(a7)
	pea.l	$9A(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	move.w	$C(a3),d7
	addq.w	#$8,a7
	beq.s	loc_01C1CA
	move.w	d7,$B6(a4)
	bra.s	loc_01C1D0
loc_01C1CA:
	move.w	#$50,$B6(a4)
loc_01C1D0:
	movem.l	-$24(a6),d6-d7/a3-a4
	unlk	a6
	rts
