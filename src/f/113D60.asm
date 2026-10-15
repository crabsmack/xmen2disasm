; ---------------------------------------------------------------------------
; XNpc_TakeDamage_Type4 - XNpc_TakeDamage case hit type 4: treat as type 12, then the hurt path
; In:  inside XNpc_TakeDamage (a4 = this, d7 = type, d6 = damage)
; Out: -
; Evidence: first target of Sw_113D20
; ---------------------------------------------------------------------------
XNpc_TakeDamage_Type4:
	moveq	#$C,d7
	bra.s	XNpc_TakeDamage_Hurt
