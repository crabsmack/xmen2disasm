; ---------------------------------------------------------------------------
; TechWallGun_Fire_Spawn - TechWallGun_Fire tail: place the bullet at the barrel offset with the chosen velocity and acceleration, play the shot sound
; In:  a4 = bullet slot, d4/d5 = velocity, d6/d7 = acceleration, -4(a6)/-2(a6) = barrel offset
; Out: d0
; Evidence: +$F = 0, x/y = gun position + offset << 8, +8/+$A velocity, +$C/+$D accel; Snd_Play $F3
; ---------------------------------------------------------------------------
TechWallGun_Fire_Spawn:
	clr.b	$F(a4)
	move.w	-$4(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	$8(a3),d0
	move.l	d0,(a4)
	move.w	-$2(a6),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	$C(a3),d0
	move.l	d0,$4(a4)
	move.w	d4,$8(a4)
	move.w	d5,$A(a4)
	move.b	d6,$C(a4)
	move.b	d7,$D(a4)
	pea.l	($F3).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($F3).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.w	#$8,a7
