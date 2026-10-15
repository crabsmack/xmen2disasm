; ---------------------------------------------------------------------------
; FireWall_EmptyStub - FIREWALL: empty function (Reset/ClassInit body)
; In:  none
; Out: none
; Evidence: body is link/unlk/rts
; ---------------------------------------------------------------------------
FireWall_EmptyStub:
	link.w	a6,#$0
	unlk	a6
	rts
