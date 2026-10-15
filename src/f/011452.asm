; ---------------------------------------------------------------------------
; BigAcolyte_StateShootAnim - BIGACOLYTE: play the shooting animation (jt $3DA), then BigAcolyte_StateShoot
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: sub_1F626A animation; delay +$6C = $FF (until the animation ends)
; ---------------------------------------------------------------------------
BigAcolyte_StateShootAnim:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$1DA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	addq.w	#$8,a7
	move.w	#$FF,$6C(a4)
	lea.l	BigAcolyte_StateShoot(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
