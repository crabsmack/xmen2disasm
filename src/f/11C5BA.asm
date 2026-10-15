; ---------------------------------------------------------------------------
; BabyBio_TakeHit - BabyBio: receive a hit from an attacker: damage, hurt state, invulnerability timer (class slot 8, +$26)
; In:  8(a6) = this  $C(a6) = attacker  $13(a6) = byte hit type  $17(a6) = byte damage  $1A/$1E(a6) = words
; Out: none
; Evidence: method 8 of class descriptor $11B74C (name string "BABYBIO", parent BIONPC)
; ---------------------------------------------------------------------------
BabyBio_TakeHit:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$17(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$13(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$308A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	moveq	#$10,d0
	and.w	$4(a4),d0
	lea.l	$18(a7),a7
	bne.s	loc_11C628
	tst.l	$A8(a4)
	beq.s	loc_11C628
	movea.l	$A8(a4),a0
	move.l	a0,-(a7)
	movea.l	(a0),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$0,d0
	move.l	d0,$A8(a4)
	addq.w	#$4,a7
loc_11C628:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
