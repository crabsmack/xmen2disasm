; ---------------------------------------------------------------------------
; EvilMagneto_Init - vtable +$12 constructor: run the parent's Init, then set up a EVILMAGNETO
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the EVILMAGNETO descriptor $099EF6; never runs in the corpus; calls parent XCLONE slot +$12
; ---------------------------------------------------------------------------
EvilMagneto_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$192A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	$3D8A(a5),a0
	move.l	$2(a0),$30(a4)
	lea.l	$19D2(a5),a0
	move.l	$2(a0),$A8(a4)
	lea.l	$47BA(a5),a0
	move.l	$2(a0),$AC(a4)
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$8(a1),a0
	move.l	a0,-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	moveq	#$2,d0
	move.l	d0,-(a7)
	jsr	XClone_SetBgPalette(pc)
	move.w	#$FFFF,$BA(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
