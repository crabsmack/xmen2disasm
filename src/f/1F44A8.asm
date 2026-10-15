; ---------------------------------------------------------------------------
; Boot_RegionCheck - compare the console region with the header region codes; on mismatch draw a lockout message and hang
; In:  none
; Out: jumps to Boot_StartApp when the region matches
; Evidence: reads $A10001 bits 6-7, maps through the byte table at $1F45E4, searches the header region string at $1F0; else sets up the VDP, expands a 1bpp font and prints strings with Boot_DrawText, then loops forever
; ---------------------------------------------------------------------------
Boot_RegionCheck:
	tst.w	($C00004).l
	clr.l	d0
	move.b	($A10001).l,d0
	lsr.b	#$6,d0
	andi.b	#$3,d0
	lea.l	RegionCheck_Data(pc),a0
	move.b	(a0,d0.w),d0
	tst.b	d0
	beq.w	loc_1F45AC
	lea.l	(Header_Regions).l,a0
	move.w	#$F,d1
loc_1F44D4:
	cmp.b	(a0),d0
	beq.w	Boot_StartApp
	addq.l	#$1,a0
	dbra	d1,loc_1F44D4
	lea.l	($C00000).l,a4
	lea.l	($C00004).l,a5
	move.w	#$8164,(a5)
	move.w	#$8230,(a5)
	move.w	#$8C81,(a5)
	move.w	#$8F02,(a5)
	move.w	#$9001,(a5)
	move.l	#$C0020000,(a5)
	move.w	#$EEE,(a4)
	move.l	#$40000000,(a5)
	lea.l	RegionCheck_Data+$82(pc),a0
	move.w	#$3A,d0
	move.l	#$10000000,d2
loc_1F451E:
	move.w	#$7,d6
loc_1F4522:
	move.b	(a0)+,d1
	move.l	#$0,d4
	move.w	#$7,d5
loc_1F452E:
	rol.l	#$4,d2
	ror.b	#$1,d1
	bcc.s	loc_1F4536
	or.l	d2,d4
loc_1F4536:
	dbra	d5,loc_1F452E
	move.l	d4,(a4)
	dbra	d6,loc_1F4522
	dbra	d0,loc_1F451E
	move.b	#$8,d1
	lea.l	RegionCheck_Data+$18(pc),a0
	move.b	(a0)+,d0
	bsr.w	Boot_DrawText
	lea.l	(Header_Regions).l,a1
loc_1F4558:
	cmpi.b	#$20,(a1)
	beq.s	loc_1F45A0
	lea.l	RegionCheck_Data+$4(pc),a2
loc_1F4562:
	move.w	(a2)+,d4
	tst.b	d4
	beq.s	loc_1F459C
	cmp.b	(a1),d4
	bne.s	loc_1F4598
	cmpi.b	#$20,$1(a1)
	bne.s	loc_1F4588
	cmpa.l	#$1F0,a1
	beq.s	loc_1F4588
	lea.l	RegionCheck_Data+$35(pc),a0
	move.b	(a0)+,d0
	addq.w	#$1,d1
	bsr.w	Boot_DrawText
loc_1F4588:
	lea.l	RegionCheck_Data(pc),a0
	adda.l	(a2)+,a0
	move.b	(a0)+,d0
	addq.w	#$1,d1
	bsr.w	Boot_DrawText
	bra.s	loc_1F459C
loc_1F4598:
	addq.l	#$4,a2
	bra.s	loc_1F4562
loc_1F459C:
	addq.l	#$1,a1
	bra.s	loc_1F4558
loc_1F45A0:
	lea.l	RegionCheck_Data+$38(pc),a0
	move.b	(a0)+,d0
	addq.w	#$1,d1
	bsr.w	Boot_DrawText
loc_1F45AC:
	bra.s	loc_1F45AC
