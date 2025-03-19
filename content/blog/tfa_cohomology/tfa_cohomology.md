+++
date = '2025-01-14T12:33:23-03:00'
draft = true
math = true
comment = true
title = "Impossible figures and aperiodic tilings: introducing cohomology for artists"
tags = ["Topology for Artists"]
toc = true
+++

# TL;DR

Bla


{{< toc >}}

# Cohomology as dual to homology

## Definition

## Origins from calculus

In more advanced calculus, integration is generally defined over what's called a "**differential form**". For our intentions, these can just be considered as expressions of the form $f(x)dx$, $f(x,y)dxdy,$ $A(x,y)dx + B(x,y)dy$ etc.: i.e., functions and the corresponding "infinitesimal amounts" that can be integrated. For example, $\int_{[a,b]}f(x)dx=\int_a^b f(x)dx$ is the usual, one-dimensional integral in the interval $[a,b]$ from basic calculus (measuring the area below the curve $f$); $\int_A f(x,y)dxdy$ represents the double integral of $f(x,y)$ in the region $A$ inside the plane (measuing the volume below the graph of $f$); $\int_C A(x,y)dx+B(x,y)dy$ is the line integral of the vector field $A(x,y)dx + B(x,y)dy$ along the curve $C$ (measuring the "flow" of the field through $C$). Such an expression is a $k$-form if it contains **only** sums of expressions $f(x_1,...,x_k)dx_1...dx_k,$  and they form the set of $k$-forms $\omega^k(\ro^n).$ $0$- forms are just functions over $\ro^n,$ and $1$-forms $f_1dx_1+...+f_ndx_n$ are closely associated to vector fields $F$ on $\ro^n$ by letting each $f_i$ be the $i$-th component of $F.$

These infinitesimals satisfy the rule $dxdy=-dydx$ and, generally, odd permutations of them change the sign, and even ones don't-- similarly to the representation of oriented simplices, which, as we'll see, isn't a coindicence. This rule has to do with how you actually use forms to define integrals, and has to do with determinants (we'll also see soon how it derives important theorems from calculus). In particular, $dxdx=-dxdx$ so that $dxdx=0.$

Thus, if you have such a differential form (an expression as above) $\omega$ and a subspace $S\subset \ro^n$ of the appropriate dimension, then the integration $\int_S \omega$ is a real number. Suggestively, we can write this integral as $\omega[S],$ and interpret $\omega$ as a function taking subspaces $S$ and giving real numbers. If $S$ is the image of a chain $\sigma: \Delta^k\rightarrow \ro^n,$ we might define $\omega[\sigma]=\omega[S],$ so that $\omega$ becomes an element of the cochains $\text{Hom}(C_k(\ro^n), \ro)= C^k(\ro^n).$

In general, if we have a manifold $M,$ then we can integrate using local coordinates, getting integrals $\int_N\omega,$ for $N\subseteq M$ a submanifold of dimension $k$ and $\omega\in \omega^k(M)$ a $k$-form over $M$ (which we may interpret as just a usual expression as above with the used coordinates). Due to the rule of change of variables, these integrals are only really well-defined for orientable manifolds. 

As above, then, $k$-forms can be integrated over submanifolds $N,$ and they can be similarly seen as elements of $\text{Hom}(C_k(M), \ro)= C^k(M).$

Since this points to a relation between forms and chains, we'd like to know how to translate the boundary operator to the form world, so that we may get a translation of homology as well. That is, we want some sort of operation $d:\omega^k(M)\rightarrow \omega^{k+1}(M)$ such that, for every $k$-form $\omega$ and submanifold $N$ seen a chain, 

$$\int_{\partial N}\omega=\int_N d\omega$$

This operation exists and is well-known from more advanced calculus, known as the **exterior derivative**. It is defined in local coordinates $x_1,...,x_n$ as 

$$d\big(f(x_1,...,x_n)dx_{i_1}...dx_{i_k}\big)=\sum_{j=1}^n \frac{\partial f}{\partial x_{i_j}}(x_1,...,x_n)dx_jdx_{i_1}...dx_{i_k},$$ 

and is linearly extended to sums. The integral formula above is then known as **Stoke's theorem**.

For example, if $f(x)$ is a function on $\ro,$ then $df=f'(x)dx.,$ and the defining property above gives us $\int_{\partial[a,b]}f(x)=\int_{[a,b]}f'(x)dx$: since $\partial[a,b]=b-a$ the first integral is just the sum $f(b)-f(a).$ That is, we have the **fundamental theorem of calculcus**: $\int_{[a,b]}f'(x)dx=f(b)-f(a)$!

To be rigorous, the proof of the Stoke's theorem actually uses the fundamental theorem of calculus, so it's the latter that proves the first, not the opposite.

Note that, in general, if $f(x_1,...,x_n)$ is a real-valued function on $\ro^n,$ then $df=f(x_1)dx_1+...+f(x_n)dx_n$-- being thus associated to the **divergent** $\nabla f$ of $f.$ If $\omega_F$ is an 1-form associated to a vector field $F$, then $d\omega_F$ is exactly the **curl** $\text{curl}\,\,F$ of $F.$

As another example, if we have the form $\omega=A(x,y)dx + B(x,y)dy$ representing a vector field in $\ro^2$, then, using our rules for the infinitesimals, we get

$$
\begin{align}
d\omega&=\pard{A}{x}(x,y)dxdx+\pard{A}{y}(x,y)dydx+\pard{B}{x}(x,y)dxdy+\pard{B}{y}(x,y)dydy\\
&=\pard{A}{y}(x,y)dydx+\pard{B}{x}(x,y)dxdy\\
&=\big(\pard{B}{x}(x,y)-\pard{A}{y}(x,y)\big)dxdy
\end{align}$$

and Stoke's theorem becomes **Green's theorem**:

$$\int_{\partial A}A(x,y)dx+B(x,y)dy=\int_A\big(\pard{B}{x}(x,y)-\pard{A}{y}(x,y)\big)dxdy$$

In respect to cohomology, cocycles are then exactly the forms $\omega$ satisfying the equation $d\omega=0$ ($\omega$ is then called **closed**), and coboundaries those such that there's some $\tau$ such that $\omega = d\tau$ ($\omega$ is then called **exact**). Your manifold has a hole, then, if there's a closed, but non-exact differential form.

For example, it is a theorem that all closed forms in $\ro^n$ are exact, which corresponds to the fact that these have null cohomology groups (for $n>0$ at least). In the 2D case, that means that all (smooth) vector fields $F$ in $\ro^2$ whose associated 1-form $\omega_F$ is closed (i.e., $\text{curl}\,\, F=0$), then there's some "potential function" $\phi$ such that $\nabla \phi = F.$ Stoke's theorem applies and gives $\int_C\omega_F=\phi(b)-\phi(a),$ for $C$ a path going from $a$ to $b.$ In particular, if $C$ is a loop, $\int_C\omega_F=0.$

You can think of $F$ as some sort of force field. In physics, a force is called "conservative" if there's a potential $\phi$ such that $\nabla \phi = \omega_F$ as above-- in which case it can be shown that the energy of the system is conserved. Gravity, for example, is conservative. The integral $\int_C\omega_F$ is the amount of work done by the force on a particle following the path $C.$ In particular, $\int_C\omega_F=0$ for a loop says that the same amount of work required to bring a particle to a point is neccessary to bring it back-- as long as the force is conservative.

## The cohomology ring

Another main theoretical reason for considering cohomology instead of homology is that it allows for a notion of **product**. Namely, if $\phi\in C^{n}(X)$ and $\psi\in C^{m}(X),$ then we have the **cup product** $\phi\smile\psi\in C^{n+m}(X)$ defined as the homomorphism

$$\phi\smile\psi([v_0,...,v_{n+m}])=\phi([v_0,...,v_n])\cdot \psi([v_n,...,v_{n+m}])$$

This applies to complex, delta-space and singular chains.

Now, this is a product of cochains, but not properly of cohomology classes. We would like to define the product over classes and have something like $[\phi]\smile [\psi]=[\phi\smile\psi].$ This is only properly defined if, for $[\psi']=[\psi],$ we have $[\phi]\smile [\psi']=[\phi]\smile [\psi].$ Well, $\psi$ and $\psi'$ are in the same class only if $\psi'=\psi+d\omega$ for some $\omega.$ Thus, the equality ...........

## Computing some cohomology groups and rings

### Torus

### Projective plane and spaces


# Limits and colimits

## Getting a delta structure for any space

## Cech cohomology

# Impossible figures

## In art

## Cohomology of impossible figures

# State spaces

## Cellular automata

## Tilings

### Tilings in the history of art

### The math behind

### Aperiodic tilings

### Tiling spaces

### The cohomology of tiling spaces
