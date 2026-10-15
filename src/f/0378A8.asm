; ---------------------------------------------------------------------------
; MagnetoBoss_StateShoot - MAGNETOBOSS: play the throwing pose for direction +$9C and fire a magnetic globe
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: sub_159092(dir) animation; sub_1595EE(x, y, dir, ...) globe (MAGNETICGLOB code); next MagnetoBoss_StateShootRecover
; ---------------------------------------------------------------------------
MagnetoBoss_StateShoot:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.b	$9C(a4),d7
	moveq	#$0,d0
	move.b	d7,d0
	move.l	d0,-(a7)
	jsr	$3E2A(a5)	; -> sub_159092
	movea.l	d0,a3
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	move.w	$AE(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$4,d1
	and.b	$2E(a4),d1
	beq.s	loc_0378E4
	moveq	#$1,d1
	bra.s	loc_0378E6
loc_0378E4:
	moveq	#$0,d1
loc_0378E6:
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.b	$9C(a4),d1
	move.l	d1,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	jsr	$3E4A(a5)	; -> sub_1595EE
	lea.l	$2C(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	MagnetoBoss_StateShootRecover(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
