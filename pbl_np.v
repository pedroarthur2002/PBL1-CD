module pbl_np(H,M,L,Ua,Us,T,E,Al,Bs,Vs,d2,d3,d4,a,b,c,d,e,f,g,dp,a_caixa,b_caixa,c_caixa,d_caixa,e_caixa,f_caixa,g_caixa,S,X_a,X_b,X_c,X_d,X_e,X_f,X_g);
	input H,M,L,Ua,Us,T,S;
	output E,Al,Bs,Vs,d2,d3,d4,a,b,c,d,e,f,g,dp,a_caixa,b_caixa,c_caixa,d_caixa,e_caixa,f_caixa,g_caixa,X_a,X_b,X_c,X_d,X_e,X_f,X_g;
	wire Vs_bar,Bs_bar,Al_bar,E_bar,Us_bar,Ua_bar,T_bar,M_bar,L_bar
	wire a1_caixa, b1_caixa, c1_caixa, d1_caixa, e1_caixa, f1_caixa, g1_caixa;
	wire a1_irri, b1_irri, c1_irri, d1_irri, e1_irri, f1_irri, g1_irri;
	wire T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15, T16, T17, T18, T19, T20;
	
	not inv(H_bar,H);
	not inv0(M_bar,M);
	not inv1(L_bar,L);
	not inv2(T_bar,T);
	not inv3(Us_bar,Us);
	not inv4(Ua_bar,Ua);
	not inv5(E_bar,E);
	not inv6(Al_bar,Al);
	not inv7(Vs_bar,Vs);
	not inv8(Bs_bar,Bs);
	
	//Dígitos não usados
	not second_digit (d2,0);
	not third_digit (d3,0);
	not fourth_digit (d4,0);
	
	//expressão 'a' da caixa d'água
	and and_a_1(T8,H_bar,M_bar);
	and and_a_2(T9,H,M,L);
	or or_a(a_caixa,T8,T9);
	
	//expressão 'b' da caixa d'água
	or or_b(b_caixa,M_bar,L_bar);
	
	//expressão 'c' da caixa d'água
	or or_c(c_caixa,M_bar,L_bar);
	
	//expressão 'd' da caixa d'água
	and and_d_1(T10,H_bar,M_bar,L_bar);
	and and_d_2(T11,M,L);
	or or_d(d_caixa,T10,T11);
	
	//expressão 'e' da caixa d'água
	and and_e(e_caixa,H_bar,M_bar,L_bar);
	
	//expressão 'f' da caixa d'água
	and and_f(f_caixa,H_bar,M_bar,L_bar);
	
	//expressão 'g' da caixa d'água
	or or_g_1(T12,M_bar,L);
	and and_g(g_caixa,T12,H_bar);
	
	//expressão 'a' da irrigação
	and and_a_irri(a,Vs_bar,Bs_bar);
	
	//expressão 'b' da irrigação
	not not_b_irri(b,Bs);
	
	//expressão 'c' da irrigação
	and and_c_irri(c,Vs_bar,Bs_bar);
	
	//expressão 'd' da irrigação
	not not_d_irri(d,Vs);
	
	//expressão 'e' da irrigação
	and and_e_irri(e,Vs_bar,Bs_bar);
	
	//expressão 'f' da irrigação
	and and_f_irri(f,Vs_bar,Bs_bar);
	
	//expressão 'g' da irrigação 
	and and_g_irri(g,Vs_bar,Bs_bar);
	
	//expressão ponto
	not inv_p(dp,0);
	
	//MULTIPLEXADORES
		
	//Multiplexador 'a'
	not u1(S_inv,S);
	and u2( a1_caixa, S_inv, a_caixa );
	and u3(a1_irri, S, a);
	or  u4(X_a, a1_caixa, a1_irri);
	
		
	//Multiplexador 'b'
	and u5(b1_caixa,S_inv,b_caixa );
	and u6(b1_irri, S, b);
	or  u7( X_b, b1_caixa, b1_irri);
	
		
	//Multiplexador 'c'
	and u8( c1_caixa, S_inv, c_caixa );
	and u9(c1_irri, S, c);
	or  u10( X_c, c1_caixa, c1_irri);
	
	
	//Multiplexador 'd'
	and u11( d1_caixa, S_inv, d_caixa );
	and u12(d1_irri, S, d);
	or  u13( X_d, d1_caixa, d1_irri);
	
	//Multiplexador 'e'	
	and u14(e1_caixa,S_inv,e_caixa);
	and u15(e1_irri,S,e);
	or  u16(X_e,e1_caixa,e1_irri);

	//Multiplexador 'f'
	and u17(f1_caixa,S_inv,f_caixa);
	and u18(f1_irri,S,f);
	or  u19(X_f,f1_caixa,f1_irri);
	
	//Multiplexador 'g'
	and u20(g1_caixa,S_inv,g_caixa);
	and u21(g1_irri,S,g);
	or  u22(X_g,g1_caixa,g1_irri);
	
	
	//PROGRAMA PRINCIPAL
	
	//Erro
	and and_erro_1(T16, H,M_bar);
	and and_erro_2(T17,M,L_bar);
	or or_erro(E,T16,T17);
	
	//Alarme
	and and0(T1,H,M_bar);
	or or1(Al,E,L_bar);
	
	and and3(T3,T_bar,M);
	or or2(T4,T3,Ua_bar);
	and and4(T5,T4,Us_bar);
	and and5(Bs,T5,E_bar,Al_bar);
	and and6(T6,Us_bar,Ua);
	or or3(T7,T,M_bar);
	and and7(Vs,T6,T7,E_bar,Al_bar);
	
endmodule

