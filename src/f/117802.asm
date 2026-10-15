; ---------------------------------------------------------------------------
; SegmentPlusPowerUp_Spawn - drop a SEGMENTPLUSPOWERUP at (x, y), building its spawn record on the stack
; In:  8(a6) = x  $C(a6) = y (16.16)  $12(a6) = word record value
; Out: none
; Evidence: class New via jt $2D8A (Tbl_SegmentPlusPowerUp_vtable); callers $04E81A and NINJA code $13DA80
; ---------------------------------------------------------------------------
SegmentPlusPowerUp_Spawn:
	link.w	a6,#$FFF0
	movem.l	d6-d7/a3-a4,-(a7)
	move.l	$C(a6),d6
	move.l	$8(a6),d7
	lea.l	-$10(a6),a4
	move.l	d7,d0
	asr.l	#$8,d0
	move.w	d0,$2(a4)
	move.l	d6,d0
	asr.l	#$8,d0
	move.w	d0,$4(a4)
	move.w	$12(a6),$6(a4)
	clr.l	$8(a4)
	clr.l	$C(a4)
	move.l	a4,-(a7)
	move.l	d6,-(a7)
	move.l	d7,-(a7)
	lea.l	$2D8A(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$2D8A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	movem.l	-$20(a6),d6-d7/a3-a4
	unlk	a6
	rts
