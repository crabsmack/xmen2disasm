; ---------------------------------------------------------------------------
; BigAcBullet_Attach - set up a new BIGACBULLET: owner, offset from the owner and direction
; In:  8(a6) = bullet, $C(a6) = owner, $10(a6) = word dx px, $14(a6) = word dy px, $18(a6) = word direction (0 or $B4)
; Out: none
; Evidence: called by BigAcolyte_StateShoot right after BIGACBULLET +$0E New; +$8C direction, +$8E owner, +$92/+$96 offsets << 8, +$2E |= 4
; ---------------------------------------------------------------------------
BigAcBullet_Attach:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	ori.b	#$4,$2E(a4)
	move.w	$1A(a6),$8C(a4)
	move.l	$C(a6),$8E(a4)
	move.w	$12(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$92(a4)
	move.w	$16(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$96(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
