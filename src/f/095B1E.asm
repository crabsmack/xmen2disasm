; ---------------------------------------------------------------------------
; XClone_ActOpenBioBalls - XCLONE script action: hide the clone and open a BIOBALLS effect object on it (sound $F2), then wait for it
; In:  8(a6) = this
; Out: d0
; Evidence: frame $FF; reuses +$9C or creates one via BIOBALLS ($1203AC) +$0E; copies the h-flip, sets its animations/script (sub_11F2F2, jt[$1B62]), state sub_11F0C6; next XClone_StateWaitChild; jt 725
; Found: jt 725
; ---------------------------------------------------------------------------
XClone_ActOpenBioBalls:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,$44(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	tst.l	$9C(a4)
	addq.w	#$8,a7
	beq.s	loc_095B4C
	movea.l	$9C(a4),a3
	bra.s	loc_095B76
loc_095B4C:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	lea.l	$33F2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$33F2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	lea.l	$14(a7),a7
loc_095B76:
	move.l	a3,d0
	beq.w	loc_095C06
	pea.l	($F2).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($F2).w
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$10,d0
	and.b	$2E(a4),d0
	addq.w	#$8,a7
	bne.s	loc_095B9E
	andi.b	#$EF,$2E(a3)
	bra.s	loc_095BA4
loc_095B9E:
	ori.b	#$10,$2E(a3)
loc_095BA4:
	lea.l	$1A82(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$3392(a5)	; -> sub_11F2F2
	lea.l	$1962(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$8C(a3)
	jsr	$3ED2(a5)	; -> AiScript_Set
	move.l	$8(a4),$8(a3)
	move.l	$C(a4),$C(a3)
	clr.w	$9E(a3)
	move.w	#$FFE4,$A0(a3)
	lea.l	$32EA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a3,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	clr.b	$96(a3)
	lea.l	$3362(a5),a0
	move.l	a0,$5C(a3)
	move.w	#$FF,$6C(a3)
	ori.w	#$100,$98(a3)
	move.l	a3,$9C(a4)
	lea.l	$18(a7),a7
loc_095C06:
	clr.w	$6C(a4)
	lea.l	XClone_StateWaitChild(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
