; ---------------------------------------------------------------------------
; Deathbird_StateSwoopDown - Deathbird swoop: descend until 120 px below the camera top, then hover
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: SetMoveMode(3), cooldown 8, next Deathbird_StateHoverPause
; ---------------------------------------------------------------------------
Deathbird_StateSwoopDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	moveq	#$78,d2
	add.l	d2,d1
	cmp.l	d0,d1
	bgt.s	loc_112B76
	moveq	#$3,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	move.w	#$8,$6E(a4)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Deathbird_StateHoverPause(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_112B88
loc_112B76:
	clr.w	$6C(a4)
	lea.l	Deathbird_StateSwoopDown(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_112B88:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
