; ---------------------------------------------------------------------------
; BigAcolyte_ActMoveToWall - BIGACOLYTE intro step 3: move to its wall position (target x, y $3D2), then wait in BigAcolyte_StateWaitArrive
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: BigAcolyte_SetTargetX/SetTargetY; state BigAcolyte_StateWaitArrive
; ---------------------------------------------------------------------------
BigAcolyte_ActMoveToWall:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($1B12).w
	move.l	a4,-(a7)
	jsr	BigAcolyte_SetTargetX(pc)
	pea.l	($3D2).w
	move.l	a4,-(a7)
	jsr	BigAcolyte_SetTargetY(pc)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	BigAcolyte_StateWaitArrive(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
