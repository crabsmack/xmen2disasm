; ---------------------------------------------------------------------------
; SentinelDoor_Despawn - parent Despawn, then Seg_Free its doorway segment (+$94 = 0) (SENTINELDOOR override of slot +$36 Despawn)
; In:  8(a6) = this, $C(a6) = spawn record
; Out: none
; Evidence: slot +$36 of the SENTINELDOOR descriptor $0DE9A0; TAS frames 2904-7103 (17 frames active)
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
