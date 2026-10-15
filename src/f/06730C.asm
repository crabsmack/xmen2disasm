; ---------------------------------------------------------------------------
; ScalingActor_SetFrame_part1 - part 1 of ScalingActor_SetFrame: code block split off by the code-flow tools (not a separate function)
; In:  registers/frame of ScalingActor_SetFrame
; Out: continues in ScalingActor_SetFrame
; Evidence: only reached by branches from ScalingActor_SetFrame
; ---------------------------------------------------------------------------
ScalingActor_SetFrame_part1:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$4322(a5)	; -> Beast_SetFrame
	addq.w	#$8,a7
	bra.s	ScalingActor_SetFrame_part3
loc_06731A:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$4092(a5)	; -> Actor_SetFrame
	addq.w	#$8,a7
	bra.s	ScalingActor_SetFrame_part3
loc_067328:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$4972(a5)	; -> Gambit_SetFrame
	addq.w	#$8,a7
	bra.s	ScalingActor_SetFrame_part3
loc_067336:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$452A(a5)	; -> Nightcrawler_SetFrame
	addq.w	#$8,a7
	bra.s	ScalingActor_SetFrame_part3
loc_067344:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$4622(a5)	; -> Psylocke_SetFrame
	addq.w	#$8,a7
	bra.s	ScalingActor_SetFrame_part3
loc_067352:
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$4422(a5)	; -> Wolverine_SetFrame
	addq.w	#$8,a7
	bra.s	ScalingActor_SetFrame_part3
