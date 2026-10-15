; ---------------------------------------------------------------------------
; BigAcolyte_Init - parent Init, then health 24, sprite set jt $202, AI script jt $1EA into +$96 (first step or the default state), flags |= $1082, face the way the live player (P1, else P2) faces, max speed +-$280, both axes 'arrived' (+$A6/+$A7 = 1), timer +$6E = 1000 (BIGACOLYTE override of slot +$12 Init)
; In:  8(a6) = this (BIGACOLYTE object), $C(a6)/$10(a6) = x/y (8.8 fixed), $14(a6) = spawn param
; Out: none
; Evidence: class descriptor BIGACOLYTE slot +$12 (tools/classes.py); TAS frames 13007-13007 (1 active)
; ---------------------------------------------------------------------------
BigAcolyte_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1CA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.w	#$18,$68(a4)
	move.b	#$1,$70(a4)
	lea.l	$202(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	lea.l	$1EA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$98(a4)
	bne.s	loc_010264
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_010280
loc_010264:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_010280:
	ori.w	#$1082,$6(a4)
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0102B6
	moveq	#$4,d0
	and.b	g_Player1+$2E(a5),d0
	beq.s	loc_0102AE
	ori.b	#$4,$2E(a4)
	bra.s	loc_0102FC
loc_0102AE:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_0102FC
loc_0102B6:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_0102E6
	moveq	#$4,d0
	and.b	g_Player2+$2E(a5),d0
	beq.s	loc_0102DE
	ori.b	#$4,$2E(a4)
	bra.s	loc_0102FC
loc_0102DE:
	andi.b	#$FB,$2E(a4)
	bra.s	loc_0102FC
loc_0102E6:
	moveq	#$4,d0
	and.b	g_Player1+$2E(a5),d0
	beq.s	loc_0102F6
	ori.b	#$4,$2E(a4)
	bra.s	loc_0102FC
loc_0102F6:
	andi.b	#$FB,$2E(a4)
loc_0102FC:
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	clr.w	$9C(a4)
	move.w	#$280,$24(a4)
	move.w	#$FD80,$28(a4)
	clr.w	$9E(a4)
	move.b	#$1,$A7(a4)
	move.b	#$1,$A6(a4)
	clr.w	$A8(a4)
	move.w	#$3E8,$6E(a4)
	clr.w	$A0(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
