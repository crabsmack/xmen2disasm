; ---------------------------------------------------------------------------
; BioBullet_SetVelocity - BIOBULLET: set velocity (+$16/+$18) and the priority bit (+$2E bit 2)
; In:  8(a6) = bullet  $E/$12(a6) = word vx, vy  $17(a6) = byte high priority
; Out: none
; Evidence: callers XCLONE code $096DF2 and BIOSENTINEL code $120E2C right after creating a bullet
; ---------------------------------------------------------------------------
BioBullet_SetVelocity:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$E(a6),$16(a4)
	move.w	$12(a6),$18(a4)
	tst.b	$17(a6)
	beq.s	loc_11E60A
	ori.b	#$4,$2E(a4)
	bra.s	loc_11E610
loc_11E60A:
	andi.b	#$FB,$2E(a4)
loc_11E610:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
