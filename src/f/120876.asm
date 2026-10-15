; ---------------------------------------------------------------------------
; BasicBioSentinel_SetFrame - set a frame from one of four sprite banks: 0-$3F Art_BasicBioSentinelSpr2, $40-$5F Art_SavageBioSpr, $60-$7F Art_BasicBioSentinelSpr3, $80+ Art_BasicBioSentinelSpr ($FF = none), flagging a re-upload when the bank or frame changes (class slot 20, +$56; does not call the parent)
; In:  8(a6) = this  $F(a6) = byte frame index ($FF = none)
; Out: none
; Evidence: method 20 of class descriptor $123562 (name string "BASICBIOSENTINEL", parent BIONPC)
; ---------------------------------------------------------------------------
BasicBioSentinel_SetFrame:
	link.w	a6,#$FFFC
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.w	$E(a6),d7
	lea.l	$2E(a3),a4
	move.l	$2(a4),-$4(a6)
	cmpi.w	#$FF,d7
	bne.s	loc_12089C
	move.w	#$FF,d7
	bra.s	loc_1208F4
loc_12089C:
	cmpi.w	#$80,d7
	blt.s	loc_1208B6
	move.w	d7,d0
	sub.w	#$80,d0
	move.w	d0,d7
	lea.l	$3582(a5),a0
	move.l	$2(a0),$2(a4)
	bra.s	loc_1208F4
loc_1208B6:
	cmpi.w	#$60,d7
	blt.s	loc_1208D0
	move.w	d7,d0
	sub.w	#$60,d0
	move.w	d0,d7
	lea.l	$359A(a5),a0
	move.l	$2(a0),$2(a4)
	bra.s	loc_1208F4
loc_1208D0:
	cmpi.w	#$40,d7
	blt.s	loc_1208EA
	move.w	d7,d0
	sub.w	#$40,d0
	move.w	d0,d7
	lea.l	$35A2(a5),a0
	move.l	$2(a0),$2(a4)
	bra.s	loc_1208F4
loc_1208EA:
	lea.l	$358A(a5),a0
	move.l	$2(a0),$2(a4)
loc_1208F4:
	move.l	$2(a4),d0
	cmp.l	-$4(a6),d0
	beq.s	loc_120908
	andi.b	#$DF,(a4)
	move.b	#$FF,$A(a4)
loc_120908:
	move.b	d7,$1(a4)
	cmpi.w	#$FF,d7
	beq.s	loc_120922
	moveq	#$0,d0
	move.b	$A(a4),d0
	cmp.w	d7,d0
	bne.s	loc_120922
	ori.b	#$20,(a4)
	bra.s	loc_12092C
loc_120922:
	andi.b	#$DF,(a4)
	ori.w	#$8,$4(a3)
loc_12092C:
	movem.l	-$10(a6),d7/a3-a4
	unlk	a6
	rts
