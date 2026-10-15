; ---------------------------------------------------------------------------
; SmallBrood_StateFire - SMALLBROOD state: fire the shot (slot +$82 at offset $12, -$1C) and play the recoil animation
; In:  8(a6) = this
; Out: d0
; Evidence: calls SmallBrood_Shoot(this, $12, -$1C, 0), animation, then SmallBrood_StateNextStep; TAS 46564-55211
; Found: link-after-rts
; ---------------------------------------------------------------------------
SmallBrood_StateFire:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#-$1C,d1
	move.l	d1,-(a7)
	moveq	#$12,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$82(a0),a1
	jsr	(a1)
	lea.l	$11FA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	lea.l	$18(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	SmallBrood_StateNextStep(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
