; ---------------------------------------------------------------------------
; PlayerSelect_LoadCharFrame - decode the select-screen frame of the character under a cursor into the shared buffer
; In:  8(a6) = cursor (+$3C = character index)
; Out: none
; Evidence: switch Sw_0647D0 on the index (7 per-character sprite getters), then Spr_RenderToBitmap and Cerebro_BigSpriteInit
; ---------------------------------------------------------------------------
PlayerSelect_LoadCharFrame:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a3
	move.b	$3C(a3),d0
	bmi.w	PlayerSelect_LoadCharFrame_part1
	cmpi.b	#$6,d0
	bgt.s	PlayerSelect_LoadCharFrame_part1
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_0647D0(pc,d1.w),d1
	jmp	Sw_0647D0-2(pc,d1.w)
