; ---------------------------------------------------------------------------
; Magneto_FireShot - ground shot: fire the bolt and play the follow-through (standing or crouched)
; In:  8(a6) = player
; Out: none
; Evidence: Magneto_SpawnShot(x, y, +$BC, player, crouch +$10, priority, ground, VRAM base); anim Magneto_ShotEndAnim(dir) -> XPlayer_AttackRecover, or crouch anim (jt $48D2 data) -> XPlayer_CrouchAttackRecover
; ---------------------------------------------------------------------------
Magneto_FireShot:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$34(a4),d0
	ext.l	d0
	move.w	-$3BB6(a5),d1
	ext.l	d1
	add.l	d0,d1
	subq.l	#$7,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$4,d1
	and.b	$2E(a4),d1
	beq.s	loc_1CE25A
	moveq	#$1,d1
	bra.s	loc_1CE25C
loc_1CE25A:
	moveq	#$0,d1
loc_1CE25C:
	move.l	d1,-(a7)
	move.w	$10(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	$BC(a4),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	jsr	$3E4A(a5)	; -> Magneto_SpawnShot
	movea.l	d0,a3
	tst.w	$10(a4)
	lea.l	$20(a7),a7
	beq.s	loc_1CE29C
	lea.l	$46D2(a5),a0
	movea.l	$2(a0),a3
	lea.l	$4CD2(a5),a0
	move.l	a0,$5C(a4)
	bra.s	loc_1CE2B4
loc_1CE29C:
	move.w	$BC(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$3E42(a5)	; -> Magneto_ShotEndAnim
	movea.l	d0,a3
	lea.l	$4CCA(a5),a0
	move.l	a0,$5C(a4)
	addq.w	#$4,a7
loc_1CE2B4:
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.w	#$FF,$6C(a4)
	addq.w	#$8,a7
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
