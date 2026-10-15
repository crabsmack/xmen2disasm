; ---------------------------------------------------------------------------
; Mine_ClassInit - set up the mine pool (Mine_InitPool) and register g_MineSprDef from Art_MineNem (static, class slot 22, +$5E; does not call the parent)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $13AF1A (name string "MINE", parent ACTOR)
; ---------------------------------------------------------------------------
Mine_ClassInit:
	link.w	a6,#$0
	jsr	Mine_InitPool(pc)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$3992(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_MineSprDef(a5)
	addq.w	#$8,a7
	unlk	a6
	rts
