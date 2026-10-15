; ---------------------------------------------------------------------------
; PlayerSelect_CharSpriteDef - return the select-screen sprite definition of the character under a cursor
; In:  8(a6) = cursor (+$3C = character index)
; Out: d0 = sprite definition, 0 if none
; Evidence: switch Sw_06489A over the 7 per-character getters; callers are the cursor classes' methods
; ---------------------------------------------------------------------------
PlayerSelect_CharSpriteDef:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a0
	move.b	$3C(a0),d0
	bmi.s	PlayerSelect_CharSpriteDef_None
	cmpi.b	#$6,d0
	bgt.s	PlayerSelect_CharSpriteDef_None
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	Sw_06489A(pc,d1.w),d1
	jmp	Sw_06489A-2(pc,d1.w)
