; ---------------------------------------------------------------------------
; ShootAcolyte_StateAim - SHOOTACOLYTE: play the aiming animation (jt $186E6), then fire
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: Obj_SetAnim; delay $FF = until the animation ends; next ShootAcolyte_StateFire
; ---------------------------------------------------------------------------
ShootAcolyte_StateAim:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$3AA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	ShootAcolyte_StateFire(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
