; ---------------------------------------------------------------------------
; XNpc_Explode - death effect by stats byte 2: sound $38, then 2 ExplodeFx_BurstMedium, 4 ExplodeFx_TrailArc, 8 ExplodeFx_Bounce, anything else ExplodeFx_BurstSmall (XNPC base of slot 30, +$7E)
; In:  8(a6) = this
; Out: none
; Evidence: stats record = +$8C; method 30 of class descriptor $113A88 (name string "XNPC", parent ACTOR)
; ---------------------------------------------------------------------------
XNpc_Explode:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	movea.l	$8C(a4),a0
	move.b	$2(a0),d0
	subq.b	#$1,d0
	lea.l	$C(a7),a7
	beq.s	loc_113C70
	subq.b	#$1,d0
	beq.s	loc_113C66
	subq.b	#$2,d0
	beq.s	loc_113C5C
	subq.b	#$4,d0
	bne.s	loc_113C70
	move.l	a4,-(a7)
	jsr	$3AE2(a5)	; -> ExplodeFx_Bounce
	addq.w	#$4,a7
	bra.s	loc_113C78
loc_113C5C:
	move.l	a4,-(a7)
	jsr	$3ADA(a5)	; -> ExplodeFx_TrailArc
	addq.w	#$4,a7
	bra.s	loc_113C78
loc_113C66:
	move.l	a4,-(a7)
	jsr	$3ACA(a5)	; -> ExplodeFx_BurstMedium
	addq.w	#$4,a7
	bra.s	loc_113C78
loc_113C70:
	move.l	a4,-(a7)
	jsr	$3AD2(a5)	; -> ExplodeFx_BurstSmall
	addq.w	#$4,a7
loc_113C78:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
