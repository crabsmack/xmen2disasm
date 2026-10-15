; ---------------------------------------------------------------------------
; SmallBrood_Init_CaseDefault - SmallBrood_Init switch case 0/default: AI script jt[576] ($0840C2)
; Evidence: case of the switch on |spawn param +$E| in SmallBrood_Init; sub_15A6DE(this+$96, script)
; ---------------------------------------------------------------------------
SmallBrood_Init_CaseDefault:
	lea.l	$1222(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	addq.w	#$8,a7
	bra.s	SmallBrood_Init_SetYLimits
