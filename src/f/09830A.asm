; ---------------------------------------------------------------------------
; EvilGambit_Init - vtable +$12 constructor: run the parent's Init, then set up a EVILGAMBIT
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the EVILGAMBIT descriptor $099E64; TAS frames 55491-55491 (1 frames active); calls parent XCLONE slot +$12
; ---------------------------------------------------------------------------
EvilGambit_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1922(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	$49A2(a5),a0
	move.l	$2(a0),$30(a4)
	lea.l	$19C2(a5),a0
	move.l	$2(a0),$A8(a4)
	lea.l	$4902(a5),a0
	move.l	$2(a0),$AC(a4)
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$8(a1),a0
	move.l	a0,-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> sub_15A6DE
	moveq	#$3,d0
	move.l	d0,-(a7)
	jsr	sub_099C36(pc)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
