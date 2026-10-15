; ---------------------------------------------------------------------------
; Apocalypse_SelectBombPattern - APOCALYPSE: point +$A8 at bomb pattern table 0-5 (by +$AE)
; In:  8(a6) = this
; Out: none
; Evidence: tables jt $4B2C2/$4B2CE/$4B2DE/$4B2F2/$4B306/$4B31A; entries {word bomb param, word delay}, -1 terminated
; ---------------------------------------------------------------------------
Apocalypse_SelectBombPattern:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.b	$AE(a3),d0
	cmpi.b	#$5,d0
	bhi.s	Apocalypse_SelectBombPattern_part3
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_04B344(pc,d1.w),d1
	jmp	Sw_04B344-2(pc,d1.w)
