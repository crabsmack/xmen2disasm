; ---------------------------------------------------------------------------
; ApocBomb_Attack - call the target's TakeDamage with the same arguments, then blow itself up (live-bomb count -$3B08 -1, ExplodeFx_BurstSmall) (APOCBOMB override of slot +$22 Attack; no hit cooldown)
; In:  8(a6) = this (APOCBOMB object), $C(a6) = target, $13(a6)/$17(a6) = byte hit type/damage, $1A/$1E(a6) = hit point
; Out: none
; Evidence: class descriptor APOCBOMB slot +$22 (tools/classes.py); TAS frames 24507-24783 (4 active)
; ---------------------------------------------------------------------------
ApocBomb_Attack:
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
	move.w	-$3B08(a5),d0
	subq.w	#$1,-$3B08(a5)
	move.l	a4,-(a7)
	jsr	$3AD2(a5)	; -> ExplodeFx_BurstSmall
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
