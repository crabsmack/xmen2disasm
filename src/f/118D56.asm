; ---------------------------------------------------------------------------
; GaussBullet_Nop0A - GaussBullet: empty method 1 (+$0A)
; In:  none
; Out: none
; Evidence: method 1 of GAUSSBULLET; body is link/unlk/rts
; ---------------------------------------------------------------------------
GaussBullet_Nop0A:
	link.w	a6,#$FFFC
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	movem.l	-$C(a6),a3-a4
	unlk	a6
	rts
