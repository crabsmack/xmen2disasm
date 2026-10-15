; ---------------------------------------------------------------------------
; Deathbird_SetMoveMode_Case2 - Deathbird_SetMoveMode cases 2-3: circle (polar flight set-up) / hover animation
; In:  inside Deathbird_SetMoveMode
; Out: -
; Evidence: Sw_1117A0 targets Deathbird_SetMoveMode_Case2/loc_1118B2
; ---------------------------------------------------------------------------
Deathbird_SetMoveMode_Case2:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_111878
	move.w	#$350,$8C(a4)
	clr.w	$8E(a4)
	move.l	#$13100,-$3B20(a5)
	move.l	#$500,-$3B24(a5)
	moveq	#$0,d0
	move.l	d0,-$3B28(a5)
	bra.s	loc_111898
loc_111878:
	move.w	#$350,$8C(a4)
	clr.w	$8E(a4)
	move.l	#$EB00,-$3B20(a5)
	move.l	#$FFFFFB00,-$3B24(a5)
	moveq	#$0,d0
	move.l	d0,-$3B28(a5)
loc_111898:
	move.b	#$4,$AE(a4)
	lea.l	$2AD2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	bra.w	$111BA0
loc_1118B2:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.b	#$3,$AE(a4)
	lea.l	$2ACA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
	bra.w	$111BA0
