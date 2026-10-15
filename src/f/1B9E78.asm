; ---------------------------------------------------------------------------
; Psylocke_SetFrame - PSYLOCKE slot +$56: set a frame from one of three sprite banks (0-$3F, $40-$C7, 200+)
; In:  8(a6) = player, $C(a6) = frame
; Out: none
; Evidence: defs jt $A020 thunk, $485A data, $1C0CF4 thunk; bank change invalidates +$38; then like Actor_SetFrame
; ---------------------------------------------------------------------------
Psylocke_SetFrame:
	link.w	a6,#$FFFC
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$E(a6),d7
	lea.l	$2E(a3),a4
	move.l	$2(a4),-$4(a6)
	cmpi.w	#$FF,d7
	bne.s	loc_1B9E9E
	move.w	#$FF,d7
	bra.s	loc_1B9EDC
loc_1B9E9E:
	cmpi.w	#$C8,d7
	blt.s	loc_1B9EB8
	move.w	d7,d0
	sub.w	#$C8,d0
	move.w	d0,d7
	lea.l	$4652(a5),a0
	move.l	$2(a0),$2(a4)
	bra.s	loc_1B9EDC
loc_1B9EB8:
	cmpi.w	#$40,d7
	blt.s	loc_1B9ED2
	move.w	d7,d0
	sub.w	#$40,d0
	move.w	d0,d7
	lea.l	$465A(a5),a0
	move.l	$2(a0),$2(a4)
	bra.s	loc_1B9EDC
loc_1B9ED2:
	lea.l	$464A(a5),a0
	move.l	$2(a0),$2(a4)
loc_1B9EDC:
	move.l	$2(a4),d0
	cmp.l	-$4(a6),d0
	beq.s	loc_1B9EF0
	andi.b	#$DF,(a4)
	move.b	#$FF,$A(a4)
loc_1B9EF0:
	move.b	d7,$1(a4)
	cmpi.w	#$FF,d7
	beq.s	loc_1B9F0A
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmp.w	d7,d0
	bne.s	loc_1B9F0A
	ori.b	#$20,(a4)
	bra.s	loc_1B9F14
loc_1B9F0A:
	andi.b	#$DF,(a4)
	ori.w	#$8,$4(a3)
loc_1B9F14:
	movem.l	-$10(a6),d7/a3-a4
	unlk	a6
	rts
