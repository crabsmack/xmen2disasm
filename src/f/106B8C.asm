; ---------------------------------------------------------------------------
; Platform1_ClassInit - register the Platform1 sprite def from Art_Platform1Spr (unless g_Platform1SprDef is -1), then the parent (SYNCHRONIZEDACTOR) ClassInit (static, class slot 22, +$5E)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: SprDef_Add(Art_Platform1Spr, 0) -> g_Platform1SprDef; parent +$5E; then Platform1_EmptyStub; method 22 of class descriptor $1072E8 (name string "PLATFORM1", parent SYNCHRONIZEDACTOR)
; ---------------------------------------------------------------------------
Platform1_ClassInit:
	link.w	a6,#$0
	moveq	#-$1,d0
	cmp.w	g_Platform1SprDef(a5),d0
	beq.s	loc_106BAE
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$29D2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_Platform1SprDef(a5)
	addq.w	#$8,a7
loc_106BAE:
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$2A1A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$5E(a0),a1
	jsr	(a1)
	jsr	Platform1_EmptyStub(pc)
	addq.w	#$4,a7
	unlk	a6
	rts
