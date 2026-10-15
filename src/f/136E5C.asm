; ---------------------------------------------------------------------------
; Hornet_ClassInit - register g_HornetSprDef from Art_HornetSpr (static, class slot 22, +$5E; does not call the parent)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: first calls the empty Hornet_NopStatic; method 22 of class descriptor $137252 (name string "HORNET", parent XNPC)
; ---------------------------------------------------------------------------
Hornet_ClassInit:
	link.w	a6,#$0
	jsr	Hornet_NopStatic(pc)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$37C2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_HornetSprDef(a5)
	unlk	a6
	rts
