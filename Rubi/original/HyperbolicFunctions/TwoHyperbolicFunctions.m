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
Int[x_*(A_+B_.*Sinh[c_.+d_.*x_])/(a_+b_.*Sinh[c_.+d_.*x_])^2,x_Symbol] :=
  B*x*Cosh[c+d*x]/(a*d*(a+b*Sinh[c+d*x])) -
  Dist[B/(a*d),Int[Cosh[c+d*x]/(a+b*Sinh[c+d*x]),x]] /;
FreeQ[{a,b,c,d,A,B},x] && ZeroQ[a*A+b*B]


(* ::Code:: *)
Int[x_*(A_+B_.*Cosh[c_.+d_.*x_])/(a_+b_.*Cosh[c_.+d_.*x_])^2,x_Symbol] :=
  B*x*Sinh[c+d*x]/(a*d*(a+b*Cosh[c+d*x])) -
  Dist[B/(a*d),Int[Sinh[c+d*x]/(a+b*Cosh[c+d*x]),x]] /;
FreeQ[{a,b,c,d,A,B},x] && ZeroQ[a*A-b*B]


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]*Tanh[a_.+b_.*x_],x_Symbol] :=
  Sinh[a+b*x]/b - Int[Sech[a+b*x],x] /;
FreeQ[{a,b},x]


(* ::Code:: *)
Int[Cosh[a_.+b_.*x_]*Coth[a_.+b_.*x_],x_Symbol] :=
  Cosh[a+b*x]/b + Int[Csch[a+b*x],x] /;
FreeQ[{a,b},x]


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_*Tanh[a_.+b_.*x_]^n_,x_Symbol]:=
  Sinh[a+b*x]^m*Tanh[a+b*x]^(n-1)/(b*m) /;
FreeQ[{a,b,m,n},x] && ZeroQ[m+n-1]


(* ::Code:: *)
Int[Cosh[a_.+b_.*x_]^m_*Coth[a_.+b_.*x_]^n_,x_Symbol] :=
  Cosh[a+b*x]^m*Coth[a+b*x]^(n-1)/(b*m) /;
FreeQ[{a,b,m,n},x] && ZeroQ[m+n-1]


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_.*Tanh[a_.+b_.*x_]^n_.,x_Symbol] :=
  Dist[1/b,Subst[Int[Regularize[(-1+x^2)^((m+n-1)/2)/x^n,x],x],x,Cosh[a+b*x]]] /;
FreeQ[{a,b},x] && IntegersQ[m,n,(m+n-1)/2]


(* ::Code:: *)
Int[Cosh[a_.+b_.*x_]^m_.*Coth[a_.+b_.*x_]^n_.,x_Symbol] :=
  Dist[1/b,Subst[Int[Regularize[(1+x^2)^((m+n-1)/2)/x^n,x],x],x,Sinh[a+b*x]]] /;
FreeQ[{a,b},x] && IntegersQ[m,n,(m+n-1)/2]


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_*Tanh[a_.+b_.*x_]^n_,x_Symbol] :=
  Sinh[a+b*x]^m*Tanh[a+b*x]^(n+1)/(b*m) - 
  Dist[(n+1)/m,Int[Sinh[a+b*x]^(m-2)*Tanh[a+b*x]^(n+2),x]] /;
FreeQ[{a,b},x] && RationalQ[{m,n}] && m>1 && n<-1


(* ::Code:: *)
Int[Cosh[a_.+b_.*x_]^m_*Coth[a_.+b_.*x_]^n_,x_Symbol] :=
  Cosh[a+b*x]^m*Coth[a+b*x]^(n+1)/(b*m) + 
  Dist[(n+1)/m,Int[Cosh[a+b*x]^(m-2)*Coth[a+b*x]^(n+2),x]] /;
FreeQ[{a,b},x] && RationalQ[{m,n}] && m>1 && n<-1


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_*Tanh[a_.+b_.*x_]^n_,x_Symbol] :=
  Sinh[a+b*x]^(m+2)*Tanh[a+b*x]^(n-1)/(b*(n-1)) - 
  Dist[(m+2)/(n-1),Int[Sinh[a+b*x]^(m+2)*Tanh[a+b*x]^(n-2),x]] /;
FreeQ[{a,b},x] && RationalQ[{m,n}] && m<-1 && n>1


(* ::Code:: *)
Int[Cosh[a_.+b_.*x_]^m_*Coth[a_.+b_.*x_]^n_,x_Symbol] :=
  -Cosh[a+b*x]^(m+2)*Coth[a+b*x]^(n-1)/(b*(n-1)) + 
  Dist[(m+2)/(n-1),Int[Cosh[a+b*x]^(m+2)*Coth[a+b*x]^(n-2),x]] /;
FreeQ[{a,b},x] && RationalQ[{m,n}] && m<-1 && n>1


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_*Tanh[a_.+b_.*x_]^n_.,x_Symbol]:=
  Sinh[a+b*x]^m*Tanh[a+b*x]^(n-1)/(b*m) - 
  Dist[(m+n-1)/m,Int[Sinh[a+b*x]^(m-2)*Tanh[a+b*x]^n,x]] /;
FreeQ[{a,b,n},x] && RationalQ[m] && m>1


(* ::Code:: *)
Int[Cosh[a_.+b_.*x_]^m_*Coth[a_.+b_.*x_]^n_.,x_Symbol] :=
  Cosh[a+b*x]^m*Coth[a+b*x]^(n-1)/(b*m) + 
  Dist[(m+n-1)/m,Int[Cosh[a+b*x]^(m-2)*Coth[a+b*x]^n,x]] /;
FreeQ[{a,b,n},x] && RationalQ[m] && m>1


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_.*Tanh[a_.+b_.*x_]^n_,x_Symbol] :=
  -Sinh[a+b*x]^m*Tanh[a+b*x]^(n-1)/(b*(n-1)) + 
  Dist[(m+n-1)/(n-1),Int[Sinh[a+b*x]^m*Tanh[a+b*x]^(n-2),x]] /;
FreeQ[{a,b,m},x] && RationalQ[n] && n>1


(* ::Code:: *)
Int[Cosh[a_.+b_.*x_]^m_.*Coth[a_.+b_.*x_]^n_,x_Symbol] :=
  -Cosh[a+b*x]^m*Coth[a+b*x]^(n-1)/(b*(n-1)) + 
  Dist[(m+n-1)/(n-1),Int[Cosh[a+b*x]^m*Coth[a+b*x]^(n-2),x]] /;
FreeQ[{a,b,m},x] && RationalQ[n] && n>1


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_*Tanh[a_.+b_.*x_]^n_.,x_Symbol]:=
  Sinh[a+b*x]^(m+2)*Tanh[a+b*x]^(n-1)/(b*(m+n+1)) - 
  Dist[(m+2)/(m+n+1),Int[Sinh[a+b*x]^(m+2)*Tanh[a+b*x]^n,x]] /;
FreeQ[{a,b,n},x] && RationalQ[m] && m<-1 && NonzeroQ[m+n+1]


(* ::Code:: *)
Int[Cosh[a_.+b_.*x_]^m_*Coth[a_.+b_.*x_]^n_.,x_Symbol] :=
  -Cosh[a+b*x]^(m+2)*Coth[a+b*x]^(n-1)/(b*(m+n+1)) + 
  Dist[(m+2)/(m+n+1),Int[Cosh[a+b*x]^(m+2)*Coth[a+b*x]^n,x]] /;
FreeQ[{a,b,n},x] && RationalQ[m] && m<-1 && NonzeroQ[m+n+1]


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_.*Tanh[a_.+b_.*x_]^n_,x_Symbol]:=
  Sinh[a+b*x]^m*Tanh[a+b*x]^(n+1)/(b*(m+n+1)) +
  Dist[(n+1)/(m+n+1),Int[Sinh[a+b*x]^m*Tanh[a+b*x]^(n+2),x]] /;
FreeQ[{a,b,m},x] && RationalQ[n] && n<-1 && NonzeroQ[m+n+1]


(* ::Code:: *)
Int[Cosh[a_.+b_.*x_]^m_.*Coth[a_.+b_.*x_]^n_,x_Symbol] :=
  Cosh[a+b*x]^m*Coth[a+b*x]^(n+1)/(b*(m+n+1)) +
  Dist[(n+1)/(m+n+1),Int[Cosh[a+b*x]^m*Coth[a+b*x]^(n+2),x]] /;
FreeQ[{a,b,m},x] && RationalQ[n] && n<-1 && NonzeroQ[m+n+1]


(* ::Code:: *)
Int[u_.*Sinh[v_]*Cosh[w_],x_Symbol] :=
  Dist[1/2,Int[u*Regularize[Sinh[v+w],x],x]] + 
  Dist[1/2,Int[u*Regularize[Sinh[v-w],x],x]] /;
(PolynomialQ[v,x] && PolynomialQ[w,x] || IndependentQ[Cancel[v/w],x]) && NonzeroQ[v+w] && NonzeroQ[v-w]


(* ::Code:: *)
Int[u_.*Sinh[v_]*Sinh[w_],x_Symbol] :=
  Dist[1/2,Int[u*Regularize[Cosh[v+w],x],x]] - 
  Dist[1/2,Int[u*Regularize[Cosh[v-w],x],x]] /;
(PolynomialQ[v,x] && PolynomialQ[w,x] || IndependentQ[Cancel[v/w],x]) && NonzeroQ[v+w] && NonzeroQ[v-w]


(* ::Code:: *)
Int[u_.*Cosh[v_]*Cosh[w_],x_Symbol] :=
  Dist[1/2,Int[u*Regularize[Cosh[v-w],x],x]] + 
  Dist[1/2,Int[u*Regularize[Cosh[v+w],x],x]] /;
(PolynomialQ[v,x] && PolynomialQ[w,x] || IndependentQ[Cancel[v/w],x]) && NonzeroQ[v+w] && NonzeroQ[v-w]


(* ::Code:: *)
Int[u_.*Sinh[v_]*Tanh[w_]^n_.,x_Symbol] :=
  Int[u*Cosh[v]*Tanh[w]^(n-1),x] - Cosh[v-w]*Int[u*Sech[w]*Tanh[w]^(n-1),x] /;
RationalQ[n] && n>0 && FreeQ[v-w,x] && NonzeroQ[v-w]


(* ::Code:: *)
Int[u_.*Cosh[v_]*Coth[w_]^n_.,x_Symbol] :=
  Int[u*Sinh[v]*Coth[w]^(n-1),x] + Cosh[v-w]*Int[u*Csch[w]*Coth[w]^(n-1),x] /;
RationalQ[n] && n>0 && FreeQ[v-w,x] && NonzeroQ[v-w]


(* ::Code:: *)
Int[u_.*Sinh[v_]*Coth[w_]^n_.,x_Symbol] :=
  Int[u*Cosh[v]*Coth[w]^(n-1),x] + Sinh[v-w]*Int[u*Csch[w]*Coth[w]^(n-1),x] /;
RationalQ[n] && n>0 && FreeQ[v-w,x] && NonzeroQ[v-w]


(* ::Code:: *)
Int[u_.*Cosh[v_]*Tanh[w_]^n_.,x_Symbol] :=
  Int[u*Sinh[v]*Tanh[w]^(n-1),x] - Sinh[v-w]*Int[u*Sech[w]*Tanh[w]^(n-1),x] /;
RationalQ[n] && n>0 && FreeQ[v-w,x] && NonzeroQ[v-w]


(* ::Code:: *)
Int[u_.*Sinh[v_]*Sech[w_]^n_.,x_Symbol] :=
  Cosh[v-w]*Int[u*Tanh[w]*Sech[w]^(n-1),x] + Sinh[v-w]*Int[u*Sech[w]^(n-1),x] /;
RationalQ[n] && n>0 && FreeQ[v-w,x] && NonzeroQ[v-w]


(* ::Code:: *)
Int[u_.*Cosh[v_]*Csch[w_]^n_.,x_Symbol] :=
  Cosh[v-w]*Int[u*Coth[w]*Csch[w]^(n-1),x] + Sinh[v-w]*Int[u*Csch[w]^(n-1),x] /;
RationalQ[n] && n>0 && FreeQ[v-w,x] && NonzeroQ[v-w]


(* ::Code:: *)
Int[u_.*Sinh[v_]*Csch[w_]^n_.,x_Symbol] :=
  Sinh[v-w]*Int[u*Coth[w]*Csch[w]^(n-1),x] + Cosh[v-w]*Int[u*Csch[w]^(n-1),x] /;
RationalQ[n] && n>0 && FreeQ[v-w,x] && NonzeroQ[v-w]


(* ::Code:: *)
Int[u_.*Cosh[v_]*Sech[w_]^n_.,x_Symbol] :=
  Sinh[v-w]*Int[u*Tanh[w]*Sech[w]^(n-1),x] + Cosh[v-w]*Int[u*Sech[w]^(n-1),x] /;
RationalQ[n] && n>0 && FreeQ[v-w,x] && NonzeroQ[v-w]


(* ::Code:: *)
Int[x_^m_.*Sinh[a_.+b_.*x_^n_.]^p_.*Cosh[a_.+b_.*x_^n_.],x_Symbol] :=
  x^(m-n+1)*Sinh[a+b*x^n]^(p+1)/(b*n*(p+1)) -
  Dist[(m-n+1)/(b*n*(p+1)),Int[x^(m-n)*Sinh[a+b*x^n]^(p+1),x]] /;
FreeQ[{a,b},x] && IntegersQ[m,n,p] && p!=-1 && 0<n<=m


(* ::Code:: *)
Int[x_^m_.*Cosh[a_.+b_.*x_^n_.]^p_.*Sinh[a_.+b_.*x_^n_.],x_Symbol] :=
  x^(m-n+1)*Cosh[a+b*x^n]^(p+1)/(b*n*(p+1)) -
  Dist[(m-n+1)/(b*n*(p+1)),Int[x^(m-n)*Cosh[a+b*x^n]^(p+1),x]] /;
FreeQ[{a,b},x] && IntegersQ[m,n,p] && p!=-1 && 0<n<=m


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_.*Cosh[a_.+b_.*x_]^n_,x_Symbol] :=
  Sinh[a+b*x]^(m+1)*Cosh[a+b*x]^(n+1)/(b*(m+1)) /;
FreeQ[{a,b,m,n},x] && ZeroQ[m+n+2] && NonzeroQ[m+1]


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_*Cosh[a_.+b_.*x_]^n_,x_Symbol] :=
  Dist[1/b,Subst[Int[Regularize[x^m*(1+x^2)^((n-1)/2),x],x],x,Sinh[a+b*x]]] /;
FreeQ[{a,b,m},x] && OddQ[n] && Not[OddQ[m] && 0<m<n]


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_*Cosh[a_.+b_.*x_]^n_,x_Symbol] :=
  Dist[1/b,Subst[Int[Regularize[x^n*(-1+x^2)^((m-1)/2),x],x],x,Cosh[a+b*x]]] /;
FreeQ[{a,b,n},x] && OddQ[m] && Not[OddQ[n] && 0<n<=m]


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_*Cosh[a_.+b_.*x_]^n_,x_Symbol] :=
  Sinh[a+b*x]^(m-1)*Cosh[a+b*x]^(n+1)/(b*(n+1)) - 
  Dist[(m-1)/(n+1),Int[Sinh[a+b*x]^(m-2)*Cosh[a+b*x]^(n+2),x]] /;
FreeQ[{a,b},x] && RationalQ[{m,n}] && m>1 && n<-1


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_*Cosh[a_.+b_.*x_]^n_,x_Symbol] :=
  Sinh[a+b*x]^(m+1)*Cosh[a+b*x]^(n-1)/(b*(m+1)) - 
  Dist[(n-1)/(m+1),Int[Sinh[a+b*x]^(m+2)*Cosh[a+b*x]^(n-2),x]] /;
FreeQ[{a,b},x] && RationalQ[{m,n}] && m<-1 && n>1


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_*Cosh[a_.+b_.*x_]^n_,x_Symbol] :=
  Sinh[a+b*x]^(m-1)*Cosh[a+b*x]^(n+1)/(b*(m+n)) -
  Dist[(m-1)/(m+n),Int[Sinh[a+b*x]^(m-2)*Cosh[a+b*x]^n,x]] /;
FreeQ[{a,b,n},x] && RationalQ[m] && m>1 && NonzeroQ[m+n]


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_*Cosh[a_.+b_.*x_]^n_,x_Symbol] :=
  Sinh[a+b*x]^(m+1)*Cosh[a+b*x]^(n-1)/(b*(m+n)) +
  Dist[(n-1)/(m+n),Int[Sinh[a+b*x]^m*Cosh[a+b*x]^(n-2),x]] /;
FreeQ[{a,b,m},x] && RationalQ[n] && n>1 && NonzeroQ[m+n]


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_*Cosh[a_.+b_.*x_]^n_,x_Symbol] :=
  Sinh[a+b*x]^(m+1)*Cosh[a+b*x]^(n+1)/(b*(m+1)) - 
  Dist[(m+n+2)/(m+1),Int[Sinh[a+b*x]^(m+2)*Cosh[a+b*x]^n,x]] /;
FreeQ[{a,b,n},x] && RationalQ[m] && m<-1 && NonzeroQ[m+n+2]


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_*Cosh[a_.+b_.*x_]^n_,x_Symbol] :=
  -Sinh[a+b*x]^(m+1)*Cosh[a+b*x]^(n+1)/(b*(n+1)) +
  Dist[(m+n+2)/(n+1),Int[Sinh[a+b*x]^m*Cosh[a+b*x]^(n+2),x]] /;
FreeQ[{a,b,m},x] && RationalQ[n] && n<-1 && NonzeroQ[m+n+2]


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_*Cosh[a_.+b_.*x_]^n_,x_Symbol] :=
  Dist[1/(b*m),Subst[Int[x^(1/m)/(1-x^(2/m)),x],x,Sinh[a+b*x]^m/Cosh[a+b*x]^m]] /;
FreeQ[{a,b},x] && ZeroQ[m+n] && IntegerQ[1/m] && 1/m>1


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_]^m_*Cosh[a_.+b_.*x_]^n_,x_Symbol] :=
  Dist[1/(b*n),Subst[Int[x^(1/n)/(1-x^(2/n)),x],x,Cosh[a+b*x]^n/Sinh[a+b*x]^n]] /;
FreeQ[{a,b},x] && ZeroQ[m+n] && IntegerQ[1/n] && 1/n>1


(* ::Code:: *)
Int[x_^m_./(a_.+b_.*Cosh[d_.+e_.*x_]^2+c_.*Sinh[d_.+e_.*x_]^2),x_Symbol] :=
  Dist[2,Int[x^m/(2*a+b-c+(b+c)*Cosh[2*d+2*e*x]),x]] /;
FreeQ[{a,b,c,d,e},x] && IntegerQ[m] && m>0 && NonzeroQ[a+b] && NonzeroQ[a+c]


(* ::Code:: *)
Int[x_^m_./(a_+b_.*Sinh[c_.+d_.*x_]*Cosh[c_.+d_.*x_]),x_Symbol] :=
  Int[x^m/(a+b*Sinh[2*c+2*d*x]/2),x] /;
FreeQ[{a,b,c,d},x] && IntegerQ[m] && m>0


(* ::Code:: *)
Int[(a_+b_.*Sinh[c_.+d_.*x_]*Cosh[c_.+d_.*x_])^n_,x_Symbol] :=
  Int[(a+b*Sinh[2*c+2*d*x]/2)^n,x] /;
FreeQ[{a,b,c,d},x] && HalfIntegerQ[n]


(* ::Code:: *)
Int[Sinh[a_.+b_.*x_^n_]^p_.*Cosh[a_.+b_.*x_^n_]^p_.,x_Symbol] :=
  Dist[1/2,Int[Sinh[2*a+2*b*x^n]^p,x]] /;
FreeQ[{a,b},x] && IntegersQ[n,p]


(* ::Code:: *)
Int[(a_.*Csch[c_.+d_.*x_]+b_.*Sinh[c_.+d_.*x_])^n_,x_Symbol] :=
  Int[(a*Cosh[c+d*x]*Coth[c+d*x])^n,x] /;
FreeQ[{a,b,c,d,n},x] && ZeroQ[a-b]


(* ::Code:: *)
Int[(a_.*Sech[c_.+d_.*x_]+b_.*Cosh[c_.+d_.*x_])^n_,x_Symbol] :=
  Int[(-a*Sinh[c+d*x]*Tanh[c+d*x])^n,x] /;
FreeQ[{a,b,c,d,n},x] && ZeroQ[a+b]


(* ::Code:: *)
Int[Sech[v_]^m_.*(a_+b_.*Tanh[v_])^n_., x_Symbol] :=
  Int[(a*Cosh[v]+b*Sinh[v])^n,x] /;
FreeQ[{a,b},x] && IntegersQ[m,n] && m+n==0 && OddQ[m]


(* ::Code:: *)
Int[Csch[v_]^m_.*(a_+b_.*Coth[v_])^n_., x_Symbol] :=
  Int[(b*Cosh[v]+a*Sinh[v])^n,x] /;
FreeQ[{a,b},x] && IntegersQ[m,n] && m+n==0 && OddQ[m]


(* ::Code:: *)
Int[x_^m_.*Csch[a_.+b_.*x_]^n_.*Sech[a_.+b_.*x_]^n_., x_Symbol] :=
  Dist[2^n,Int[x^m*Csch[2*a+2*b*x]^n,x]] /;
FreeQ[{a,b},x] && RationalQ[m] && IntegerQ[n]


(* ::Code:: *)
Int[x_^m_.*Csch[a_.+b_.*x_]^n_.*Sech[a_.+b_.*x_]^p_., x_Symbol] :=
  Module[{u=Block[{ShowSteps=False,StepCounter=Null}, Int[Csch[a+b*x]^n*Sech[a+b*x]^p,x]]},
  x^m*u - Dist[m,Int[x^(m-1)*u,x]]] /;
FreeQ[{a,b},x] && RationalQ[m] && IntegersQ[n,p] && m>0 && n!=p


(* ::Code:: *)
Int[(a_.*Tanh[v_]+b_.*Sech[v_])^n_,x_Symbol] :=
  Dist[a^n,Int[Tanh[v/2-Pi/4*a/b]^n,x]] /;
FreeQ[{a,b},x] && ZeroQ[a^2+b^2] && EvenQ[n]


(* ::Code:: *)
Int[(a_.*Coth[v_]+b_.*Csch[v_])^n_,x_Symbol] :=
  Dist[a^n,Int[Coth[v/2+Pi*I/4*(a-b)/b]^n,x]] /;
FreeQ[{a,b},x] && ZeroQ[a^2-b^2] && EvenQ[n]


(* ::Code:: *)
Int[u_.*(a_.*Sech[v_]^m_.+b_.*Tanh[v_]^m_.)^n_.,x_Symbol] :=
  Int[u*(a+b*Sinh[v]^m)^n/Cosh[v]^(m*n),x] /;
FreeQ[{a,b},x] && IntegersQ[m,n] && (OddQ[m*n] || m*n<0) && Not[m==2 && ZeroQ[a-b]]


(* ::Code:: *)
Int[u_.*(a_.*Csch[v_]^m_.+b_.*Coth[v_]^m_.)^n_.,x_Symbol] :=
  Int[u*(a+b*Cosh[v]^m)^n/Sinh[v]^(m*n),x] /;
FreeQ[{a,b},x] && IntegersQ[m,n] && (OddQ[m*n] || m*n<0) && Not[m==2 && ZeroQ[a+b]]


