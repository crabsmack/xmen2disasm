; ---------------------------------------------------------------------------
; EvilBeast_Init - parent (XCLONE) Init, then the Beast look: sprite def jt $4342, clone record jt $199A (+$A8), move set jt $429A (+$AC), AI script from the record, XClone_SetBgPalette(1), +$BE = 0 (EVILBEAST override of slot +$12 Init)
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = placement entry
; Out: none
; Evidence: slot +$12 of the EVILBEAST descriptor $099D1E; TAS frames 53039-53039 (1 frames active)
; ---------------------------------------------------------------------------
EvilBeast_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$190A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	$4342(a5),a0
	move.l	$2(a0),$30(a4)
	lea.l	$199A(a5),a0
	move.l	$2(a0),$A8(a4)
	lea.l	$429A(a5),a0
	move.l	$2(a0),$AC(a4)
	movea.l	$A8(a4),a0
	movea.l	a0,a1
	adda.w	$8(a1),a0
	move.l	a0,-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	moveq	#$1,d0
	move.l	d0,-(a7)
	jsr	XClone_SetBgPalette(pc)
	clr.b	$BE(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
