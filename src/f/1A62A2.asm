; ---------------------------------------------------------------------------
; Nightcrawler_WallAttackEnd - after a wall slash: back to the wall pose and cling
; In:  8(a6) = player
; Out: d0 = +4 flag 8
; Evidence: Obj_SetAnim(wall pose, jt $5FBE thunk), state Nightcrawler_StateWallCling
; ---------------------------------------------------------------------------
Nightcrawler_WallAttackEnd:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$445A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Nightcrawler_StateWallCling(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
