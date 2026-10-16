; ---------------------------------------------------------------------------
; MagneticGlob_New - MAGNETICGLOB slot +$0E: (re)use the single static bolt object: kill the old one, Init and Activate
; In:  8(a6) = unused, $C(a6) = descriptor, $10..$18(a6) = Init args
; Out: d0 = $FFE8AE
; Evidence: if $FFE8B2 bit 15 -> Kill; +0 = descriptor, +$12 Init, +$3E Activate
; ---------------------------------------------------------------------------
MagneticGlob_New:
	link.w	a6,#$0
	move.l	a4,-(a7)
	lea.l	g_MagneticGlobObj(a5),a4
	move.w	$4(a4),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	beq.s	loc_157C80
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_157C80:
	move.l	$C(a6),(a4)
	move.l	$18(a6),-(a7)
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$3E(a0),a1
	jsr	(a1)
	move.l	a4,d0
	lea.l	$14(a7),a7
	movea.l	-$4(a6),a4
	unlk	a6
	rts
