; ---------------------------------------------------------------------------
; Hologram_SeqA_Pose1b - Hologram sequence A step 3: pose 1 for 10 frames
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: chains to SeqA_Pose0
; ---------------------------------------------------------------------------
Hologram_SeqA_Pose1b:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$1,d0
	move.l	d0,-(a7)
	jsr	Hologram_SetPose(pc)
	addq.w	#$4,a7
	move.w	#$A,$6C(a4)
	lea.l	Hologram_SeqA_Pose0(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
