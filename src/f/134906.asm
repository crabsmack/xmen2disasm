; ---------------------------------------------------------------------------
; FlyBrood_ClassInit - FlyBrood: per-class hook run at level start before the spawn pass (static, class slot 22, +$5E; ClassList_InitAll)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $134518 (name string "FLYBROOD", parent ACTOR)
; ---------------------------------------------------------------------------
FlyBrood_ClassInit:
	link.w	a6,#$0
	jsr	FlyBrood_EmptyStub(pc)
	moveq	#$0,d0
	move.b	-$3B5C(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	beq.s	loc_134930
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$37B2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$1A84(a5)
	addq.w	#$8,a7
loc_134930:
	unlk	a6
	rts
