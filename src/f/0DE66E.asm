; ---------------------------------------------------------------------------
; SentinelDoor_Despawn - vtable +$36: a SENTINELDOOR leaves play (written back to its spawn record)
; In:  8(a6) = this
; Evidence: slot +$36 of the SENTINELDOOR descriptor $0DE9A0; TAS frames 2904-7103 (17 frames active); calls parent ACTOR slot +$36
; ---------------------------------------------------------------------------
SentinelDoor_Despawn:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$25BA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$36(a0),a1
	jsr	(a1)
	move.l	$94(a4),-(a7)
	jsr	$4F22(a5)	; -> Seg_Free
	moveq	#$0,d0
	move.l	d0,$94(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
