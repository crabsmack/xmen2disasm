; ---------------------------------------------------------------------------
; CoreShields_TakeDamage - CoreShields: receive a hit from an attacker: damage, hurt state, invulnerability timer (class slot 8, +$26)
; In:  8(a6) = this  $C(a6) = attacker  $13(a6) = byte hit type  $17(a6) = byte damage  $1A/$1E(a6) = words
; Out: none
; Evidence: method 8 of class descriptor $0EBE7E (name string "CORESHIELDS", parent ACTOR)
; ---------------------------------------------------------------------------
CoreShields_TakeDamage:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	movea.l	$8(a6),a4
	clr.b	d6
	move.b	$90(a4),d0
	ext.w	d0
	lea.l	$92(a4),a0
	tst.b	(a0,d0.w)
	bne.s	loc_0EBAC6
	move.b	$90(a4),d0
	ext.w	d0
	lea.l	$92(a4),a0
	move.b	#$1,(a0,d0.w)
	moveq	#$1,d6
	bra.s	loc_0EBAEC
loc_0EBAC6:
	move.b	$90(a4),d0
	ext.w	d0
	move.w	d0,d7
	subq.w	#$1,d7
	tst.w	d7
	bge.s	loc_0EBAD6
	moveq	#$7,d7
loc_0EBAD6:
	lea.l	$92(a4),a0
	tst.b	(a0,d7.w)
	bne.s	loc_0EBAEC
	lea.l	$92(a4),a0
	move.b	#$1,(a0,d7.w)
	moveq	#$1,d6
loc_0EBAEC:
	tst.b	d6
	beq.s	loc_0EBB36
	move.w	#$B4,$6A(a4)
	pea.l	($D0).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($D0).w
	jsr	$521A(a5)	; -> Snd_Play
	moveq	#$1,d0
	move.l	d0,-(a7)
	move.w	$4C(a4),d1
	ext.l	d1
	move.w	$50(a4),d2
	ext.l	d2
	add.l	d1,d2
	lsl.l	#$7,d2
	move.l	d2,-(a7)
	move.w	$52(a4),d1
	ext.l	d1
	move.w	$4E(a4),d2
	ext.l	d2
	add.l	d1,d2
	lsl.l	#$7,d2
	move.l	d2,-(a7)
	jsr	$2DCA(a5)	; -> Explosion_Spawn
	lea.l	$14(a7),a7
loc_0EBB36:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
