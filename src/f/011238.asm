; ---------------------------------------------------------------------------
; BigAcolyte_StateBecomeSprite - BIGACOLYTE: switch from the rendered picture to its normal sprite, draw layer 1, face left, start moving to x $1B49
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: Spr_Init on its own sprite fields; +$A9 = 0; DrawList_SetPriority(+$88, 1); x += $12 px, y += $11 px; animation jt $119C6; next BigAcolyte_StateJoinList
; ---------------------------------------------------------------------------
BigAcolyte_StateBecomeSprite:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.w	$34(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	moveq	#$3,d1
	and.b	$2E(a4),d1
	moveq	#$0,d2
	move.b	d1,d2
	move.l	d2,-(a7)
	moveq	#-$1,d1
	move.l	d1,-(a7)
	move.l	$30(a4),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	$2E(a4)
	jsr	$506A(a5)	; -> Spr_Init
	clr.b	$A9(a4)
	ori.b	#$4,$2E(a4)
	moveq	#$8,d0
	and.w	$6(a4),d0
	moveq	#$0,d1
	move.w	d0,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.b	$42(a4),d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	$88(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$4F7A(a5)	; -> DrawList_SetPriority
	ori.b	#$10,$2E(a4)
	addi.l	#$1200,$8(a4)
	addi.l	#$1100,$C(a4)
	lea.l	$1D2(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	pea.l	($1B49).w
	move.l	a4,-(a7)
	jsr	BigAcolyte_SetTargetX(pc)
	lea.l	$3C(a7),a7
	clr.w	$6C(a4)
	lea.l	BigAcolyte_StateJoinList(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
