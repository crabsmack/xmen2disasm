; ---------------------------------------------------------------------------
; loc_134AFA	[runtime: executed in tas]
; ---------------------------------------------------------------------------
loc_134AFA:
	lea.l	$36FA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
	bra.w	loc_134BE6
loc_134B10:
	lea.l	$3702(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
	bra.w	loc_134BE6
loc_134B26:
	lea.l	$370A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	move.w	#$3,$A8(a4)
	addq.w	#$8,a7
	bra.w	loc_134BE6
