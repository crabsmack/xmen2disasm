; ---------------------------------------------------------------------------
; ControlBox_StartPattern - CONTROLBOX slot +$6E: (re)start its firing pattern $0DD5B4 (4-byte steps; byte +5 = delay)
; In:  8(a6) = this
; Out: none
; Evidence: +$90 pattern, +$96 = steps, +$94 = 0, +$6E delay, +$9A = 1; TAS 2772-7259
; Found: jt 1182
; ---------------------------------------------------------------------------
ControlBox_StartPattern:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	lea.l	$24DA(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$90(a3)
	move.w	(a0),d0
	ext.l	d0
	divs.w	#$4,d0
	move.w	d0,$96(a3)
	clr.w	$94(a3)
	move.w	$94(a3),d0
	ext.l	d0
	movea.l	$90(a3),a0
	asl.l	#$2,d0
	lea.l	$2(a0,d0.l),a4
	move.b	$3(a4),d0
	ext.w	d0
	move.w	d0,$6E(a3)
	move.w	#$1,$9A(a3)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
