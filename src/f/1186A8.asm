; ---------------------------------------------------------------------------
; ICandy_Destroy - ICandy: release sprite/handle resources and return the pool slot
; In:  8(a6) = this
; Out: none
; Evidence: method 5 of ICANDY; sub_1F9D1E/sub_1F9D38 on +$3E, sub_1F9122 on +$3C, ICandy_PoolFree
; ---------------------------------------------------------------------------
ICandy_Destroy:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	andi.b	#$DF,$1C(a4)
	tst.l	$3E(a4)
	beq.s	loc_1186C8
	move.l	$3E(a4),-(a7)
	jsr	$4FE2(a5)	; -> Timer_Stop
	addq.w	#$4,a7
loc_1186C8:
	tst.l	$3E(a4)
	beq.s	loc_1186DE
	move.l	$3E(a4),-(a7)
	jsr	$4FEA(a5)	; -> Timer_Free
	moveq	#$0,d0
	move.l	d0,$3E(a4)
	addq.w	#$4,a7
loc_1186DE:
	moveq	#-$1,d0
	cmp.w	$3C(a4),d0
	bge.s	loc_1186FA
	move.w	$3C(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$4F72(a5)	; -> DrawList_Remove
	move.w	#$FFFF,$3C(a4)
	addq.w	#$4,a7
loc_1186FA:
	move.l	a4,-(a7)
	jsr	ICandy_PoolFree(pc)
	addq.w	#$4,a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
