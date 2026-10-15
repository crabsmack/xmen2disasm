; ---------------------------------------------------------------------------
; BioSentinel_StateFireDown - BIOSENTINEL: shoot down-diagonal (frame $17); out of shots -> think, else aim again
; In:  8(a6) = this
; Out: d0
; Evidence: next StateAimDown or StateThink
; ---------------------------------------------------------------------------
BioSentinel_StateFireDown:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	BioSentinel_FireBullet(pc)
	moveq	#$17,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	tst.w	$A2(a4)
	lea.l	$10(a7),a7
	ble.s	loc_120FA6
	move.w	#$C,$6C(a4)
	lea.l	BioSentinel_StateAimDown(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_120FC0
loc_120FA6:
	move.w	$9E(a4),$6E(a4)
	move.w	#$19,$6C(a4)
	lea.l	BioSentinel_StateThink(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_120FC0:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
