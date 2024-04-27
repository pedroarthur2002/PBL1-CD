module pbl-np(H,M,L,Ua,Us,T,E,Al);
	input H,M,L,Ua,Us,T;
	output E,Al;
	wire M_bar,L_bar,T1,T2;
	
	not inv0(M_bar,M);
	not inv1(L_bar,L);
	and and0(T1,H,M_bar);
	and and1(T2,M,L_bar);
	or or0(E,T1,T2);
	or or1(Al,E,L_bar);
endmodule                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     module pbl-np(H,M,L,Ua,Us,T,E,Al);
	input H,M,L,Ua,Us,T;
	output E,Al;
	wire M_bar,L_bar,T1,T2;
	
	not inv0(M_bar,M);
	not inv1(L_bar,L);
	and and0(T1,H,M_bar);
	and and1(T2,M,L_bar);
	or or0(E,T1,T2);
	or or1(Al,E,L_bar);
endmodule