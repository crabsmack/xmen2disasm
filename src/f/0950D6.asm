; ---------------------------------------------------------------------------
; EvilDrop_ActRelease - EVILDROP script action: release the clone (XClone_SpawnByType from the stored record) and remove the capsule
; In:  8(a6) = this
; Out: none
; Evidence: record = {+$B0, x, y, +$B4 type..} rebuilt on the stack, XClone_SpawnByType(rec), slot +$52 Kill; jt 705
; Found: jt 705
; ---------------------------------------------------------------------------
EvilDrop_ActRelease:
	link.w	a6,#$FFF0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	-$10(a6),a0
	lea.l	$B0(a4),a1
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,-$E(a6)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,-$C(a6)
	pea.l	-$10(a6)
	jsr	$18DA(a5)	; -> XClone_SpawnByType
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	movea.l	-$14(a6),a4
	unlk	a6
	rts
