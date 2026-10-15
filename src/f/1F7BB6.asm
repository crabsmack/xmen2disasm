; ---------------------------------------------------------------------------
; Seg_Setup - initialise a floor segment with type, layer and endpoints, then compute its length and slope
; In:  8(a6) = segment  $E(a6) = word type  $12(a6) = word layer  $16/$1A/$1E/$22(a6) = words x1, y1, x2, y2
; Out: none
; Evidence: Seg_InitDefaults, Seg_SetEndpoints, Seg_ComputeSlope
; ---------------------------------------------------------------------------
Seg_Setup:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$12(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	Seg_InitDefaults(pc)
	move.w	$22(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$16(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	Seg_SetEndpoints(pc)
	move.l	a4,-(a7)
	jsr	Seg_ComputeSlope(pc)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
