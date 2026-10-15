; ---------------------------------------------------------------------------
; Actor_Despawn - ACTOR slot +$36: remove a live object back into its spawn record at its current position
; In:  8(a6) = object   $C(a6) = spawn record
; Out: none
; Evidence: obj+4 = 0; rec+4 = 5, rec+6/+8 = x>>8, y>>8, rec+5 = $FF; Timer_Free(+$7C), +$7C = 0
; ---------------------------------------------------------------------------
Actor_Despawn:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	clr.w	$4(a4)
	move.b	#$5,$4(a3)
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	d0,$6(a3)
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	d0,$8(a3)
	move.b	#$FF,$5(a3)
	move.l	$7C(a4),-(a7)
	jsr	$4FEA(a5)	; -> Timer_Free
	moveq	#$0,d0
	move.l	d0,$7C(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
