; ---------------------------------------------------------------------------
; PlayerSelect_CharFrameNum - return the select-screen frame number of the character under a cursor
; In:  8(a6) = cursor (+$3C = character index)
; Out: d0.w = frame, $FF if none
; Evidence: switch Sw_064912 over the 7 per-character frame getters (sub_1841F4 ... sub_1CEC38)
; ---------------------------------------------------------------------------
PlayerSelect_CharFrameNum:
	link.w	a6,#$0
	move.l	d7,-(a7)
	movea.l	$8(a6),a0
	move.b	$3C(a0),d0
	bmi.s	PlayerSelect_CharFrameNum_None
	cmpi.b	#$6,d0
	bgt.s	PlayerSelect_CharFrameNum_None
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_064912(pc,d1.w),d1
	jmp	Sw_064912-2(pc,d1.w)
