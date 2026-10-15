; ---------------------------------------------------------------------------
; EvilWolverine_Init - vtable +$12 constructor: run the parent's Init, then set up a EVILWOLVERINE
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the EVILWOLVERINE descriptor $09A0B4; TAS frames 52266-54629 (3 frames active); calls parent XCLONE slot +$12
; ---------------------------------------------------------------------------
EvilWolverine_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1942(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	$4442(a5),a0
	move.l	$2(a0),$30(a4)
	lea.l	$1A0A(a5),a0
	move.l	$2(a0),$A8(a4)
	lea.l	$43D2(a5),a0
	move.l	$2(a0),$AC(a4)
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$8(a1),a0
	move.l	a0,-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	moveq	#$1,d0
	move.l	d0,-(a7)
	jsr	XClone_SetBgPalette(pc)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
