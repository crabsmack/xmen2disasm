; ---------------------------------------------------------------------------
; Wolverine_Init - WOLVERINE slot +$12: XCLIMBER Init plus Wolverine's record, states, heal timer and sprite
; In:  8(a6) = player, $C/$10/$14(a6) = Init args
; Out: none
; Evidence: parent +$12, own +$6A Reset; +$8C = char record (jt $64F4 thunk data); +$5C/+$64 = +$A6, +$60 = XPlayer_StateHurt; +$C0 |= $80 (can hang from ceilings); +$C4 = 900; Spr_Init at +$2E with the per-player VRAM base
; ---------------------------------------------------------------------------
Wolverine_Init:
	link.w	a6,#$0
	movem.l	d3/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2BB2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	lea.l	$2BB2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$6A(a0),a1
	jsr	(a1)
	lea.l	$43D2(a5),a0
	move.l	$2(a0),$8C(a4)
	movea.l	(a4),a0
	move.l	$A6(a0),$5C(a4)
	move.l	$A6(a0),$64(a4)
	lea.l	$4D22(a5),a0
	move.l	a0,$60(a4)
	clr.l	$16(a4)
	clr.w	$1E(a4)
	movea.l	$8C(a4),a0
	move.w	$E(a0),$20(a4)
	move.w	$18(a0),$22(a4)
	move.w	$18(a0),$24(a4)
	ori.w	#$80,$C0(a4)
	move.w	#$384,$C4(a4)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	g_Player1(a5),a0
	cmpa.l	a4,a0
	seq.b	d3
	neg.b	d3
	beq.s	loc_197B66
	move.w	-$3BB2(a5),d1
	bra.s	loc_197B6A
loc_197B66:
	move.w	-$3BB4(a5),d1
loc_197B6A:
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#-$1,d1
	move.l	d1,-(a7)
	lea.l	$4442(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$506A(a5)	; -> Spr_Init
	lea.l	$30(a7),a7
	movem.l	-$8(a6),d3/a4
	unlk	a6
	rts
