(* ::Package:: *)

RubiNotLoaded = True
AlbiNotLoaded = True

(* Mathematica Raw Program *)
IntegrateU[f_,x_]:=Module[
	{e=f,ans,subans,i,anoans},
	ans=0;
	(*Get[CWD<>"/IntegralFunctions.m"];
	Get[CWD<>"/Rubi/init.m"];
	Get[CWD<>"/Albi/init.m"];*)
Catch[
	If[Head[f]===Plus,
		For[i=1,i<=Length[f],i++,
			Print["Integrating : ",f[[i]]];
			subans=IntegrateAR[f[[i]],x];
			If[subans==$Failed,ans=$Failed;Break[];];
			ans=ans+subans;];
			Print["seperate end",ans];
			If[(ans!=$Failed)&&(IntLength[ans]<2*IntLength[f]),Throw[ans];];
			anoans=IntegrateAR[f,x];
			If[(IntLength[ans]<=IntLength[anoans])||(anoans==$Failed),Throw[ans];,Print["anoans",anoans];Throw[anoans];],
		Return[IntegrateAR[f,x]];]]
	
(*	If[RubiNotLoaded,
		Get[Calculus`CWD <> "Rubi/init.m"];
		RubiNotLoaded = False
	];
	ans = Calculus`Rubi`Int[e,x];*)

	(*If[FreeQ[ans,Calculus`Rubi`Int], Return[ans],
		(*Print["Rubi Failed!"];*)
		If[AlbiNotLoaded,
			Get[Calculus`CWD <> "Albi/init.m"];
			AlbiNotLoaded = False
		];
		ans = Calculus`Albi`Risch`pmint[e,x];
		If[FreeQ[ans,Calculus`Albi`Risch], Return[ans],
			Print["Albi Failed!"];
			ans = ConstIntTable[e,x];
			If[ans =!= "NotMatch",
				Return[ans],
				Return[$Failed]
			]
		]
	]*)
]
IntegrateAR[f_,x_]:=Module[{e=f,ans},
	Print["AR Integrating : ",f];
	If[CheckAlbi[f],
		LoadAlbi[];
		ans = Calculus`Albi`Risch`pmint[e,x];
		Print[ans];
		If[FreeQ[ans,Calculus`Albi`Risch`Private`INT], Return[ans];];];
			Print["Albi failed"];
			LoadRubi[];
			ans = Calculus`Rubi`Int[e,x];
			If[FreeQ[ans,Calculus`Rubi`Int], Print[ans];Return[ans],Print["Rubi failed"];Return[$Failed]]]
IntLength[f_]:=Length[Level[f,15]];
	
LoadAlbi[]:=If[AlbiNotLoaded,
			Get[Calculus`CWD <> "Albi/init.m"];
			AlbiNotLoaded = False
		];
LoadRubi[]:=If[RubiNotLoaded,
				Get[Calculus`CWD <> "Rubi/init.m"];
				RubiNotLoaded = False
			];

CheckHead[f_]:=Module[
	{e,flag=False},
	e=Head[f];
	If[(e===Plus)||(e===Times)||((e===Power)&&(Quiet[IntegerQ[f[[2]]]]))||(e===Sin)||(e===Cos)||(e===Tan)||(e===Cot)||(e===Sec)||(e===Csc)||(e===Log),flag=True;];
flag
];
CheckAlbi[_Symbol | _Integer | _Rational | _Real | _Complex] := True;
CheckAlbi[f_]:=Module[
	{e=f,i,flag=True},
	If[!CheckHead[e],
		flag=False;,
		For[i=1;,i<=Length[e];,i++;,
			flag=CheckAlbi[e[[i]]];
			If[!flag,Break[];];
		];
	];
	Return[flag];
];





IntegrateList = {
A[Sqrt[1+(2 x_)/(1+x_^2)]/(1+x_^2),x_] :> ((-1+x) Sqrt[1+(2 x)/(1+x^2)])/(1+x),
A[1/((1+x_^4) Sqrt[-x_^2+Sqrt[1+x_^4]]),x_] :> ArcCot[Sqrt[-x^2+Sqrt[1+x^4]]/x],
A[Sqrt[1+(2 x_)/(1+x_^2)],x_] :> (Sqrt[(1+x)^2/(1+x^2)] (1+x^2+Sqrt[1+x^2] ArcSinh[x]))/(1+x),
A[1/Sqrt[1+(2 x_)/(1+x_^2)],x_] :> ((1+x) (Sqrt[1+x^2]-ArcSinh[x]+Sqrt[2] Log[1+x]-Sqrt[2] Log[1-x+Sqrt[2] Sqrt[1+x^2]]))/(Sqrt[(1+x)^2/(1+x^2)] Sqrt[1+x^2]),
A[(x_^2+2 x_ Log[x_]+Log[x_]^2+(1+x_) Sqrt[x_+Log[x_]])/(x_^3+2 x_^2 Log[x_]+x_ Log[x_]^2),x_] :> Log[x]-2/Sqrt[x+Log[x]],
A[(Cos[x_]+Sin[x_])/(E^-x_+Sin[x_]),x_] :> Log[1+E^x Sin[x]],
A[E^Sin[x_] Sec[x_]^2 (x_ Cos[x_]^3-Sin[x_]),x_] :> E^Sin[x] (-1+x Cos[x]) Sec[x],
A[E^x_^x_ x_^(2 x_) (1+Log[x_]),x_] :> E^x^x (-1+x^x),
A[x_^(-2-1/x_) (1-Log[x_]),x_] :> -x^(-1/x),
A[(x_ Cos[x_]-Sin[x_])/(x_-Sin[x_])^2,x_] :> -(x/(-x+Sin[x])),
A[1/(Cos[x_]^(3/2) Sqrt[3 Cos[x_]+Sin[x_]]),x_] :> (2 Sqrt[3 Cos[x]+Sin[x]])/Sqrt[Cos[x]],
A[(Csc[x_] Sqrt[Cos[x_]+Sin[x_]])/Cos[x_]^(3/2),x_] :> (2 (Cos[x]+Sin[x]-ArcCoth[Sqrt[Cos[x]+Sqrt[Sin[x]^2]]/Sqrt[Cos[x]]] Sqrt[Cos[x]] Sqrt[Cos[x]+Sqrt[Sin[x]^2]]))/(Sqrt[Cos[x]] Sqrt[Cos[x]+Sin[x]]),
A[(-3+10 x_+4 x_^3-30 x_^5)/(3+x_+x_^4)^3-(3 (1+4 x_^3) (2-3 x_+5 x_^2+x_^4-5 x_^6))/(3+x_+x_^4)^4,x_] :> (2-3 x+5 x^2+x^4-5 x^6)/(3+x+x^4)^3,
A[1/(x_ Log[E^x_]),x_] :> (-Log[x]+Log[Log[E^x]])/(x-Log[E^x]),
A[Cot[x_]/Log[E^Sin[x_]],x_] :> (Log[Log[E^Sin[x]]]-Log[Sin[x]])/(-Log[E^Sin[x]]+Sin[x]),
A[x_/(Sqrt[-1+x_] Sqrt[1+x_] ArcCosh[x_]),x_] :> CoshIntegral[ArcCosh[x]],
A[(x_ Cosh[x_]-Sinh[x_])/(x_-Sinh[x_])^2,x_] :> -(x/(-x+Sinh[x]))
};

ConstIntTable[f_,x_]:=Module[
    {},
    ret=A[f,x]//.IntegrateList;
    If[Head[ret]===A,Return["NotMatch"],Return[ret]];
	Return["NotMatch"]
];
