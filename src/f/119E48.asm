; ---------------------------------------------------------------------------
; SyncActor_MemberOutsideWindow - SyncActor slot 27 (+$72): ACTOR's OutsideActiveWindow test for the Synchronizer
; In:  8(a6) = this
; Out: d0.b = 1 if outside
; Evidence: calls parent +$42; caller Synchronizer_RunMembers
; ---------------------------------------------------------------------------
SyncActor_MemberOutsideWindow:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	lea.l	$2F72(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$42(a0),a1
	jsr	(a1)
	unlk	a6
	rts
