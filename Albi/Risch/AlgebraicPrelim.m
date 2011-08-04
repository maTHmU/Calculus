(* ::Package:: *)

(* Integration of Elementary Function, algorithms from book 
   Symbolic Integration, by M. Bronstein 
   
   Authors: Luis A. Medina and Sasha Pavlyk
   
   Mathematica Version: 6.1
   
   Limitations: Missing The Partial Fraction Decomposition's Algorithm 
   
   Comments: I'm not using algorithms that say "slow" at the beginning.  If an 
   algorithms has a version that says "fast" at the begging then I'm using it.  
   The "slow" versions work and I keep them in case anything goes wrong
   with the faster versions (kind of a back up).  
   
   *)


(*************** Chapter 1 ************************)
PolyDivide[A_, B_, var_] := PolynomialQuotientRemainder[A, B, var];

PolyPseudoDivide[A_,B_,var_]:=Module[{b, NN, Q, R, d, T, vars},
(* Euclidean Polynomial Pseudo-Division *)
	b = lc[B, var];
	NN = deg[A, var] - deg[B, var] + 1;
	Q = 0;
	R = A;
	d = deg[R, var] - deg[B, var];
	vars = Variables[b R - T B];
	While[NonZeroPolynomialQ[R, var] && d >= 0,
		T = lc[R, var]var^d;
		NN = NN - 1;
		Q = b Q + T;
		R = Collect[b R - T B,vars];
		d = deg[R,var] - deg[B,var]
	];
	Collect[{b^NN Q,b^NN R},var]
 ]

newPolyPseudoDivide[A_,B_,var_]:=Module[{b,delta},
	delta = Max[-1, deg[A, var] - deg[B, var] ];
	b = lc[B, var];
	PolynomialQuotientRemainder[b^(delta + 1)A, B, var]
]

HalfExtendedEuclidean[A_, B_,x_] := Module[{a, b, a1, b1, r1, q, r},
  {a, b, a1, b1} = {A, B, 1, 0};
  While[ NonZeroPolynomialQ[b,x],
   {q, r} = PolyDivide[a, b, x];
   a = b;
   b = r;
   r1 = a1 - q b1;
   a1 = b1;
   b1 = r1];
  {a1, a}
  ]

ExtendedEuclidean[A_, B_,x_] := Module[{s, g, t, r},
  {s, g} = HalfExtendedEuclidean[A, B,x];
  {t, r} = PolyDivide[g - s A, B, x];
  {s, t, g}
  ]
 
HalfExtendedEuclidean[AA_, BB_, CC_, x_]:= Module[{s, g, q, r},
	{s, g} = HalfExtendedEuclidean[AA, BB, x];
	{q, r} = PolyDivide[CC, g, x];
	If[NonZeroPolynomialQ[r, x],
		Return[ Print["c is not in the ideal generated by ", AA, " and ", BB] ]
	];
	s = q*s;
	If[NonZeroPolynomialQ[s, x] && Exponent[s, x] >= Exponent[BB, x],
		{q, r} PolyDivide[s, BB];
		s = r;
	];
	s
]

ExtendedEuclidean[AA_,BB_,CC_, x_]:=Module[{s, t, r},
	s = HalfExtendedEuclidean[AA, BB, CC, x];
	{t, r} = PolyDivide[CC - s*AA, BB, x];
	{Collect[s, x, Together], Collect[t, x, Together]}
]


fastExtendedEuclidean[a_, b_, c_, x_] := Module[{g, t, s, q, r},
    {g,{t,s}} = PolynomialExtendedGCD[a, b, x];
    q = PolynomialQuotientRemainder[c, g, x];
    If[Last[q]!=0,Print[c, " is not in the ideal of ",{a,b}]];
    q = First[q];
    {t,s}=q*{t, s};
    {q,r}=PolynomialQuotientRemainder[t, b, x];
    { Collect[r, x, Together],Collect[ s + q*a, x, Together] }
] 
Clear[SquareFree];

SquareFree[res_]:=Module[{qq},
    qq = FactorSquareFreeList[res];
    qq = Sort[qq, Last[#1]<=Last[#2]&];
    DeleteCases[{Times @@ #[[ All, 1 ]], Last[First[#]]}& /@ Split[qq,Last[#1]==Last[#2]&], {1,1}, {1}]
] 

SquareFreePositiveDegrees[res_] := Module[{qq},
  qq = FactorSquareFreeList[res];
  qq = Map[Replace[#, {x_, y_Integer?Negative} :> {1/x, -y}] &, qq];
  qq = Sort[qq, Last[#1] <= Last[#2] &];
  DeleteCases[{Times @@ #[[All, 1]], Last[First[#]]} & /@
    Split[qq, Last[#1] == Last[#2] &], {1, 1}, {1}]] 

(*newSquareFree[res_]:=Module[{qq,badElement,base,exp},
	qq = SquareFree[res];
	badElement = Times@@(First[#]^Last[#]& /@ Select[qq,Last[#]<0&]);
    qq = DeleteCases[qq, y_/; Last[y]<0];
    {base,exp} = Last[qq];
    base = base * badElement;
    ReplacePart[qq, -1 -> {base,exp}]
]*)

Squarefree[A_,x_] := 
(* Musser's squarefree factorization *)
Module[{c, S, Sm, Ss, k, Y, a},
  c = PolyContent[A, x];
  S = PolyPP[A, x];
  Sm = PolynomialGCD[ S, D[S, x] ];
  Ss = PolynomialQuotient[S, Sm, x];
  k = 1;
  While[Exponent[Sm, x] > 0,
   Y = PolynomialGCD[Ss, Sm];
   a[k] = PolynomialQuotient[Ss, Y, x];
   Ss = Y;
   Sm = PolynomialQuotient[Sm, Y, x];
   k = k + 1];
  a[k] = Ss;
  If[k >= 2,
    Thread[ {Join[{(c Sm) a[1]}, Array[a, k - 1, 2] ],Range[k]} ],
    {{(c Sm) a[1],1}}
  ]
] 

YunSquarefree[A_,x_] := 
(* Yun's squarefree algorithm*)
Module[{c, Sp, Sm,S, Ss, a, Y, k, Z},
	c = content[A, x];
  	S = pp[A, x];
  	Sp = D[S, x];
  	Sm = PolynomialGCD[S, Sp];
  	Ss = PolynomialQuotient[S, Sm, x];
  	Y = PolynomialQuotient[Sp, Sm, x];
  	k = 1;
  	Z = Y - D[Ss, x];
  	While[NonZeroPolynomialQ[Z, x],
   		a[k] = PolynomialGCD[Ss, Z];
   		Ss = PolynomialQuotient[Ss, a[k], x] ;
   		Y = PolynomialQuotient[Z, a[k], x];
   		Z = Y - D[Ss, x];
   		k = k + 1];
  	a[k] = Ss;
  	If[k >= 2,
    	Join[ {(c) a[1]},Array[a, k - 1, 2] ],
    	{ (c) a[1] }
   	]
]

SubResultant[A_,B_,x_]:=
(* Given A & B in Q[x] with B!=0 and deg (A)>=deg (B), return resultant (A,B)
   and the subresultant PRS *)
Module[{Q,R,i,j,g,d,b,k,r,RR,s,c,list,TheResult},
 	R[0] = A;
   	R[1] = B;
   	{i,g[1],d[1]} = {1,-1,deg[A,x]-deg[B,x]};
   	b[1] = (-1)^(d[1] + 1);
   	While[NonZeroPolynomialQ[R[i],x],
   		r[i] = lc[R[i],x];
   		{Q,RR} = newPolyPseudoDivide[R[i-1],R[i],x];
        R[i+1] = Together[PolynomialQuotient[RR,b[i],x]];
   		i = i+1;
   		g[i] = (-r[i-1])^(d[i-1])g[i-1]^(1 - d[i-1]);
   		d[i] = deg[R[i-1],x] - deg[R[i],x];
   		b[i] = -r[i-1]g[i]^(d[i]);
   	];
   	k = i-1;
   	If[deg[R[k],x] > 0,
   		list = Join[Array[R,k+1,0],{0}];
   		TheResult = {0,list},
	   	If[deg[R[k-1],x] == 1,
   			list = Join[Array[R,k+1,0],{0}];
   			TheResult = {R[k],list},
   		s = 1;
   		c = 1;
   		j = 0;
   		While[(j = j+1) <= k-1,
   			If[OddQ[deg[R[j-1],x]] && OddQ[deg[R[j],x]],
   				s = -s
   			];
   			c = c (b[j]/r[j]^(1+d[j]))^(deg[R[j],x])*
   			  	r[j]^(deg[R[j-1],x] - deg[R[j+1],x]);
   		];
   		list = Join[Array[R,k+1,0],{0}];
   		TheResult = {Together[s c R[k]^(deg[R[k-1],x])],list}
   		];
   	];
   	TheResult
 ]

fastSubResultantPRS[A_,B_,x_]:=Module[{res,seq,list},
	If[ B===0, Return[{0,{A,B}}]];
	list = Internal`SubresultantPRS[A, B, x];
	{ Last[list]^Exponent[list[[-2]],x], list }
]

(**************************************************)
(************** End of Ch 1 ***********************)
