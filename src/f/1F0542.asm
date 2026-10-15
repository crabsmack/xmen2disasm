; ---------------------------------------------------------------------------
; XPlayer_TetherClamp - two-player tether helper: set a clamped coordinate, re-follow the ground and record which side blocked
; In:  8(a6) = player, $C(a6) = pointer to x or y long, $10(a6) = clamped value, $14(a6) = +$90 flag to set
; Out: none
; Evidence: when on the ground calls $1F71F2(segment, obj) and $1F6D76(obj); +$90 |= flag; used by XPlayer_TetherToPartner
; ---------------------------------------------------------------------------
XPlayer_TetherClamp:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$C(a6),a0
	move.l	$10(a6),(a0)
	move.w	#$1000,d0
	and.w	$4(a4),d0
	bne.s	loc_1F0572
	move.l	a4,-(a7)
	move.l	$76(a4),-(a7)
	jsr	$4EF2(a5)	; -> sub_1F71F2
	move.l	a4,-(a7)
	jsr	$4EDA(a5)	; -> sub_1F6D76
	lea.l	$C(a7),a7
loc_1F0572:
	move.l	$14(a6),d0
	or.l	d0,$90(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
