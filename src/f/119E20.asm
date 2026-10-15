; ---------------------------------------------------------------------------
; SyncActor_MemberInWindow - SyncActor slot 26 (+$6E): ACTOR's InActivateWindow test, used by the Synchronizer instead of the member's own
; In:  8(a6) = this
; Out: d0.b = 1 if in the activation window
; Evidence: calls the parent (ACTOR) +$3A via Tbl_SyncActor_vtable; caller Synchronizer_WaitMembers
; ---------------------------------------------------------------------------
SyncActor_MemberInWindow:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	lea.l	$2F72(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$3A(a0),a1
	jsr	(a1)
	unlk	a6
	rts
