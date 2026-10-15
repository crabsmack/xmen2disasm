; ---------------------------------------------------------------------------
; EvilGambit_Init - parent (XCLONE) Init, then the Gambit look: sprite def jt $49A2, clone record jt $19C2 (+$A8), move set jt $4902 (+$AC), AI script from the record, XClone_SetBgPalette(3) (EVILGAMBIT override of slot +$12 Init)
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = placement entry
; Out: none
; Evidence: slot +$12 of the EVILGAMBIT descriptor $099E64; TAS frames 55491-55491 (1 frames active)
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
	jsr	$3ED2(a5)	; -> AiScript_Set
	moveq	#$3,d0
	move.l	d0,-(a7)
	jsr	XClone_SetBgPalette(pc)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
