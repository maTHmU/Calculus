(* ::Package:: *)

(************************************************************************)
(* This file was generated automatically by the Mathematica front end.  *)
(* It contains Initialization cells from a Notebook file, which         *)
(* typically will have the same name as this file except ending in      *)
(* ".nb" instead of ".m".                                               *)
(*                                                                      *)
(* This file is intended to be loaded into the Mathematica kernel using *)
(* the package loading commands Get or Needs.  Doing so is equivalent   *)
(* to using the Evaluate Initialization Cells menu command in the front *)
(* end.                                                                 *)
(*                                                                      *)
(* DO NOT EDIT THIS FILE.  This entire file is regenerated              *)
(* automatically each time the parent Notebook file is saved in the     *)
(* Mathematica front end.  Any changes you make to this file will be    *)
(* overwritten.                                                         *)
(************************************************************************)



(* ::Code:: *)
Int[ArcSec[a_.+b_.*x_],x_Symbol] :=
  (a+b*x)*ArcSec[a+b*x]/b - 
  Int[1/((a+b*x)*Sqrt[1-1/(a+b*x)^2]),x] /;
FreeQ[{a,b},x]


(* ::Code:: *)
Int[x_^m_.*ArcSec[a_+b_.*x_],x_Symbol] :=
  Dist[1/b,Subst[Int[(-a/b+x/b)^m*ArcSec[x],x],x,a+b*x]] /;
FreeQ[{a,b},x] && IntegerQ[m] && m>0


(* ::Code:: *)
Int[x_^m_.*ArcSec[a_.*x_],x_Symbol] :=
  x^(m+1)*ArcSec[a*x]/(m+1) - 
  Dist[1/(a*(m+1)),Int[x^(m-1)/Sqrt[1-1/(a*x)^2],x]] /;
FreeQ[{a,m},x] && NonzeroQ[m+1]


(* ::Code:: *)
Int[x_^m_.*ArcSec[a_.+b_.*x_],x_Symbol] :=
  x^(m+1)*ArcSec[a+b*x]/(m+1) - 
  Dist[b/(m+1),Int[x^(m+1)/((a+b*x)^2*Sqrt[1-1/(a+b*x)^2]),x]] /;
FreeQ[{a,b,m},x] && NonzeroQ[m+1]


(* Int[ArcSec[a_.*x_^n_.]/x_,x_Symbol] :=
  I*ArcSec[a*x^n]^2/(2*n) - 
  ArcSec[a*x^n]*Log[1-1/(I/(x^n*a)+Sqrt[1-1/(x^(2*n)*a^2)])^2]/n + 
  I*PolyLog[2,1/(I/(x^n*a)+Sqrt[1-1/(x^(2*n)*a^2)])^2]/(2*n) /;
(* Sqrt[-1/a^2]*a*ArcCsc[a*x^n]^2/(2*n) + 
  Pi*Log[x]/2 - 
  Sqrt[-1/a^2]*a*ArcSinh[Sqrt[-1/a^2]/x^n]*Log[1-1/(Sqrt[-(1/a^2)]/x^n+Sqrt[1-1/(x^(2*n)*a^2)])^2]/n + 
  Sqrt[-1/a^2]*a*PolyLog[2, 1/(Sqrt[-1/a^2]/x^n+Sqrt[1-1/(x^(2*n)*a^2)])^2]/(2*n) *)
FreeQ[{a,n},x] *)


(* ::Code:: *)
Int[u_.*ArcSec[c_./(a_.+b_.*x_^n_.)]^m_.,x_Symbol] :=
  Int[u*ArcCos[a/c+b*x^n/c]^m,x] /;
FreeQ[{a,b,c,n,m},x]


(* ::Code:: *)
Int[ArcSec[u_],x_Symbol] :=
  x*ArcSec[u] -
  Int[Regularize[x*D[u,x]/(u^2*Sqrt[1-1/u^2]),x],x] /;
InverseFunctionFreeQ[u,x] && Not[FunctionOfExponentialOfLinear[u,x]]
