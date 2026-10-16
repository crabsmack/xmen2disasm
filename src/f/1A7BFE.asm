; ---------------------------------------------------------------------------
; Nightcrawler_SetFrame - NIGHTCRAWLER slot +$56: set a frame from one of three sprite banks (0-$7F, $80-$C7, 200+)
; In:  8(a6) = player, $C(a6) = frame
; Out: none
; Evidence: defs Art_EvilNightcrawlerSpr (jt $454A), $1B0A56 and $1B494A thunks; bank change invalidates +$38; then like Actor_SetFrame
; ---------------------------------------------------------------------------
Nightcrawler_SetFrame:
	link.w	a6,#$FFFC
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$E(a6),d7
	lea.l	$2E(a3),a4
	move.l	$2(a4),-$4(a6)
	cmpi.w	#$FF,d7
	bne.s	loc_1A7C24
	move.w	#$FF,d7
	bra.s	loc_1A7C62
loc_1A7C24:
	cmpi.w	#$C8,d7
	blt.s	loc_1A7C3E
	move.w	d7,d0
	sub.w	#$C8,d0
	move.w	d0,d7
	lea.l	$455A(a5),a0
	move.l	$2(a0),$2(a4)
	bra.s	loc_1A7C62
loc_1A7C3E:
	cmpi.w	#$80,d7
	blt.s	loc_1A7C58
	move.w	d7,d0
	sub.w	#$80,d0
	move.w	d0,d7
	lea.l	$4552(a5),a0
	move.l	$2(a0),$2(a4)
	bra.s	loc_1A7C62
loc_1A7C58:
	lea.l	$454A(a5),a0
	move.l	$2(a0),$2(a4)
loc_1A7C62:
	move.l	$2(a4),d0
	cmp.l	-$4(a6),d0
	beq.s	loc_1A7C76
	andi.b	#$DF,(a4)
	move.b	#$FF,$A(a4)
loc_1A7C76:
	move.b	d7,$1(a4)
	cmpi.w	#$FF,d7
	beq.s	loc_1A7C90
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmp.w	d7,d0
	bne.s	loc_1A7C90
	ori.b	#$20,(a4)
	bra.s	loc_1A7C9A
loc_1A7C90:
	andi.b	#$DF,(a4)
	ori.w	#$8,$4(a3)
loc_1A7C9A:
	movem.l	-$10(a6),d7/a3-a4
	unlk	a6
	rts
