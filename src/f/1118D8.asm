; ---------------------------------------------------------------------------
; loc_1118D8	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_1118D8:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	bne.s	loc_1118EE
	move.w	#$400,$16(a4)
	move.w	#$A,$1E(a4)
	bra.s	loc_1118FA
loc_1118EE:
	move.w	#$FC00,$16(a4)
	move.w	#$FFF6,$1E(a4)
loc_1118FA:
	move.w	#$90,$18(a4)
	move.w	#$FFEC,$20(a4)
	move.b	#$3,$AE(a4)
	lea.l	$2ACA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	addq.w	#$8,a7
	bra.w	$111BA0
