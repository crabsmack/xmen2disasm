; ---------------------------------------------------------------------------
; Platform1_Init_SetFrame1 - case of the Platform1_Init switch: animation frame 1
; In:  a4 = this (inside Platform1_Init)
; Out: -
; Evidence: target of Sw_106BF0; SetFrame(1)
; ---------------------------------------------------------------------------
Platform1_Init_SetFrame1:
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	bra.s	$106D0E
