; ---------------------------------------------------------------------------
; BigAcBullet_Update - parent Update, then if anchored to an object (+$8E) pin the position to that object's x/y plus the offsets +$92/+$96 (BIGACBULLET override of slot +$4A Update)
; In:  8(a6) = this (BIGACBULLET object)
; Out: none
; Evidence: class descriptor BIGACBULLET slot +$4A (tools/classes.py); TAS frames 13510-13673 (161 active)
; ---------------------------------------------------------------------------
BigAcBullet_Update:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$1C2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	tst.l	$8E(a4)
	beq.s	loc_010090
	movea.l	$8E(a4),a0
	move.l	$92(a4),d0
	add.l	$8(a0),d0
	move.l	d0,$8(a4)
	move.l	$96(a4),d0
	add.l	$C(a0),d0
	move.l	d0,$C(a4)
loc_010090:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
