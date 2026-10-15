; ---------------------------------------------------------------------------
; HornetBullet_ClassInit - register g_HornetBulletSprDef from Art_HornetBulletSpr (static, class slot 22, +$5E; does not call the parent)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: first calls the empty HornetBullet_NopStatic; method 22 of class descriptor $137708 (name string "HORNETBULLET", parent ACTOR)
; ---------------------------------------------------------------------------
HornetBullet_ClassInit:
	link.w	a6,#$0
	jsr	HornetBullet_NopStatic(pc)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$3842(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_HornetBulletSprDef(a5)
	unlk	a6
	rts
