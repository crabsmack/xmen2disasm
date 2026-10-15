; ---------------------------------------------------------------------------
; FloatBio_Init_Case1 - FloatBio_Init cases 1-3: vertical range from the spawn record (default +-48) with script FloatBio_Script1, or scripts 2/3
; In:  inside FloatBio_Init (a3 = spawn record)
; Out: -
; Evidence: Sw_11DACC targets; +$B2/+$B0 top/bottom; jt $3042/$304A/$303A
; ---------------------------------------------------------------------------
FloatBio_Init_Case1:
	move.w	$6(a3),d7
	beq.s	loc_11DB80
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_11DB78
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_11DB82
loc_11DB78:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	bra.s	loc_11DB82
loc_11DB80:
	moveq	#$30,d0
loc_11DB82:
	move.w	$4(a3),d1
	sub.w	d0,d1
	move.w	d1,$B2(a4)
	move.w	$8(a3),d7
	beq.s	loc_11DBA8
	tst.w	d7
	sge.b	d3
	neg.b	d3
	beq.s	loc_11DBA0
	ext.l	d7
	move.l	d7,d0
	bra.s	loc_11DBAA
loc_11DBA0:
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	bra.s	loc_11DBAA
loc_11DBA8:
	moveq	#$30,d0
loc_11DBAA:
	add.w	$4(a3),d0
	move.w	d0,$B0(a4)
	lea.l	$3042(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
	bra.s	FloatBio_Init_Tail
loc_11DBC6:
	lea.l	$304A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
	bra.s	FloatBio_Init_Tail
loc_11DBDA:
	move.l	a3,d0
	beq.s	loc_11DBE8
	move.w	$6(a3),d7
	beq.s	loc_11DBE8
	move.w	d7,$BC(a4)
loc_11DBE8:
	lea.l	$303A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	addq.w	#$8,a7
