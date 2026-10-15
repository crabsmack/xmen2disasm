; ---------------------------------------------------------------------------
; FloatBio_Init_Case0 - FloatBio_Init case 0: AI script FloatBio_Script0 ($11B630)
; In:  inside FloatBio_Init
; Out: -
; Evidence: Sw_11DACC target; jt $3032
; ---------------------------------------------------------------------------
FloatBio_Init_Case0:
	lea.l	$3032(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
	bra.w	FloatBio_Init_Tail
