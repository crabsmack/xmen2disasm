; ---------------------------------------------------------------------------
; FlyBrood_Init_Case0 - FlyBrood_Init spawn type 0: script jt $36F2, speed/side from the spawn record
; In:  inside FlyBrood_Init (a3 = spawn record, a4 = this)
; Out: -
; Evidence: first target of Sw_134934
; ---------------------------------------------------------------------------
FlyBrood_Init_Case0:
	lea.l	$36F2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
	bra.w	FlyBrood_Init_Tail
