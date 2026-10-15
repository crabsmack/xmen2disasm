; ---------------------------------------------------------------------------
; Deathbird_StateDiveLow - Deathbird low pass: when 100 px below the camera top, throw the burst and fly off
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: SetMoveMode(8), Deathbird_LaunchBurst, sound $FC; TAS 44613-44631
; ---------------------------------------------------------------------------
Deathbird_StateDiveLow:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	moveq	#$64,d1
	cmp.l	d0,d1
	bge.s	loc_112D84
	moveq	#$8,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	move.l	$9E(a4),-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	pea.l	($FC).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($FC).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$18(a7),a7
	clr.w	$6C(a4)
	lea.l	Deathbird_StateFlyOff(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_112D96
loc_112D84:
	clr.w	$6C(a4)
	lea.l	Deathbird_StateDiveLow(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_112D96:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
