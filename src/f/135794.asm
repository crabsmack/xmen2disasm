; ---------------------------------------------------------------------------
; FlyBrood_StateHit - FLYBROOD hurt state: explode at once (sub_13DE4A)
; In:  8(a6) = this
; Out: none
; Evidence: set as +$60 by FlyBrood_Init; sub_13DE4A is the default XNPC death effect
; ---------------------------------------------------------------------------
FlyBrood_StateHit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	$3AD2(a5)	; -> sub_13DE4A
	unlk	a6
	rts
