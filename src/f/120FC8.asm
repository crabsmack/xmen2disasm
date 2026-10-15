; ---------------------------------------------------------------------------
; BioSentinel_StateFireLevel - BIOSENTINEL: shoot straight (frame 7); out of shots -> think, else aim again
; In:  8(a6) = this
; Out: d0
; Evidence: next StateAimLevel or StateThink
; ---------------------------------------------------------------------------
BioSentinel_StateFireLevel:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	BioSentinel_FireBullet(pc)
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	tst.w	$A2(a4)
	lea.l	$10(a7),a7
	ble.s	loc_12100A
	move.w	#$C,$6C(a4)
	lea.l	BioSentinel_StateAimLevel(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_121024
loc_12100A:
	move.w	$9E(a4),$6E(a4)
	move.w	#$19,$6C(a4)
	lea.l	BioSentinel_StateThink(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_121024:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
