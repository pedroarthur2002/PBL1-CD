module pblnp1(H,M,L,Ua,Us,T,E,Al,Bs,Vs);
	input H,M,L,Ua,Us,T;
	output E,Al,Bs,Vs;
	wire Al_bar,E_bar,Us_bar,Ua_bar,T_bar,M_bar,L_bar,T1,T2,T3,T4,T5,T6,T7;
	
	not inv0(M_bar,M);
	not inv1(L_bar,L);
	not inv2(T_bar,T);
	not inv3(Us_bar,Us);
	not inv4(Ua_bar,Ua);
	not inv5(E_bar,E);
	not inv6(Al_bar,Al);
	
	
	and and0(T1,H,M_bar);
	and and1(T2,M,L_bar);
	
	or or0(E,T1,T2);
	or or1(Al,E,L_bar);
	
	and and3(T3,T_bar,M);
	or or2(T4,T3,Ua_bar);
	and and4(T5,T4,Us_bar);
	and and5(Bs,T5,E_bar,Al_bar);
	and and6(T6,Us_bar,Ua);
	or or3(T7,T,M_bar);
	and and7(Vs,T6,T7,E_bar,Al_bar);
endmodule 