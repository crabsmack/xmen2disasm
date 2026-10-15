; ---------------------------------------------------------------------------
; BrainRocket_Attack - hit the target (its TakeDamage), then blow up: camera shake (vertical for headings 90/270, else Tbl_BrainRocketQuake), explosion at the box centre, Kill, sound $38 (BRAINROCKET override of slot 7, +$22; no hit cooldown)
; In:  8(a6) = this  $C(a6) = target actor  $13(a6) = byte hit type  $17(a6) = byte damage  $1A/$1E(a6) = words passed on
; Out: none
; Evidence: method 7 of class descriptor $133CFC (name string "BRAINROCKET", parent ACTOR)
; ---------------------------------------------------------------------------
BrainRocket_Attack:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a3
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
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	moveq	#$5A,d0
	cmp.w	$8C(a4),d0
	beq.s	loc_1338F8
	cmpi.w	#$10E,$8C(a4)
	bne.s	loc_133904
loc_1338F8:
	lea.l	$3652(a5),a0
	move.l	$2(a0),g_CamShake(a5)
	bra.s	loc_13390E
loc_133904:
	lea.l	$3642(a5),a0
	move.l	$2(a0),g_CamShake(a5)
loc_13390E:
	moveq	#$0,d0
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
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$38,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
