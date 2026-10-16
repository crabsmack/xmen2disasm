; ---------------------------------------------------------------------------
; BigBio_ActRoarThenLaunch - BIGBIO script action: roar (Tbl_BigBioAnim (jt $346A), sound $F9), then leap
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: next StateLaunch
; ---------------------------------------------------------------------------
BigBio_ActRoarThenLaunch:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$346A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	pea.l	($F9).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($F9).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$10(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	BigBio_StateLaunch(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
