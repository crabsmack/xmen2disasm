; ---------------------------------------------------------------------------
; XClone_ActCloseBioBalls - XCLONE script action: remove the BIOBALLS child (sound $F2) and restore the clone's animation
; In:  8(a6) = this
; Out: none
; Evidence: child slot +$52 Kill; Obj_ChangeAnim(this, record + word 4); next step; jt 726
; Found: jt 726
; ---------------------------------------------------------------------------
XClone_ActCloseBioBalls:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$9C(a4)
	beq.s	loc_095C6C
	pea.l	($F2).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($F2).w
	jsr	$521A(a5)	; -> Snd_Play
	movea.l	$9C(a4),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$9C(a4)
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$4(a1),a0
	move.l	a0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	lea.l	$14(a7),a7
loc_095C6C:
	tst.l	$98(a4)
	bne.s	loc_095C7E
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_095CAA
loc_095C7E:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_095C92
	clr.w	$96(a4)
loc_095C92:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_095CAA:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
