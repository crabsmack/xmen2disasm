; ---------------------------------------------------------------------------
; Platform1_Init_SetFrame2 - case of the Platform1_Init switch on the spawn record type: animation frame 2
; In:  a4 = this, a3 = spawn record (inside Platform1_Init)
; Out: -
; Evidence: target of Sw_106BF0; vtable +$56 SetFrame(2), then the common tail
; ---------------------------------------------------------------------------
Platform1_Init_SetFrame2:
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	$106D0E
loc_106CDA:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	$106D0E
