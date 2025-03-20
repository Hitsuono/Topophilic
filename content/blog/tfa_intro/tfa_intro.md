+++
date = '2025-01-14T12:33:23-03:00'
draft = true
math = true
comment = true
title = "Topology for Artists: introduction"
tags = ["Topology for Artists"]
toc = true
+++

# TL;DR

Bla


{{< toc >}}

TGT AUDIENCE 

# A preview

ORDER 
this(n mt) -> homologia -> grupos/proj/games -> 

# What you'll need

Short answer: **linear algebra** (you can find a quick reminder on the post concerning algebra) and **basic set theory** (cartesian product, injective, surjective and bijective functions).

I tried to write these posts as accessible as possible, but without losing much of the mathematical rigour. That is, mathematics is a human endeavour of unlimited aesthetic capacity, but this comes with a cost-- namely, rigour and precision. It is beautiful because so much formality can't be in vain. Without this limitation, there can ultimately be no beauty; the first is simultaneously the latter's restriction and its progenitor. Or, rather, rigour and aesthetical creativity are *consubstantial* in mathematics. The other member of this trinity is the insatiable human desire to further mathematicize the world and recognize itself in this construction-- to spread the Word and be in a Body, so to speak. But let's leave the logical-christian analogies for another place for now. 

Fact is, leaving out the more difficult and rigorous parts **is** necessary when writing to a larger audience, but I tried to keep some balance-- particularly without insulting the intelligence and interest of the reader. You can always skip the more technical sections, and I hope they can spark out your curiosity and be more accessible when you come back to them.

# The necessity of spaces

# Metric and topological spaces

## Metric and topology

The most natural notion of an abstract space is that of a set together with some kind of "distance" between its points. For example, $\ro^n$ always comes with the Euclidean distance $d(x,y)=\sqrt{(x_1-y_1)^2+...+(x_n-y_n)^2}$ between points $x=(x_1,...,x_n)$ and $y=(y_1,...,y_n)$-- you can read more on it in the first section of the post concerning algebra, dedicated to linear algebra. This is the normal distance we use in the real-world, but it isn't the only mathematical option available. We could, say, 

IMG!!! Manhattan

**Definition**: a **metric space** is a set $X$ with a function $d:X\times X\rightarrow \ro_{\geq 0}$ that takes two elements $x,y$ of $X$ and returns a positive real number $d(x,y)$ representing their distance. This $d$ must the following properties to be a sensible representation of distance:

- The distance of $x$ to itself must be zero: $d(x,x)=0$ for all $x$;

- It mus be symmetrical: $d(x,y)=d(y,x)$ for all $x,y$;

- It must satisfy the *triangular inequality*: $d(x,y)+d(x,z)\leq d(y,z)$ for all $x,y,z.$ Imagine $x,y,z$ forming a triangle and the hypothenuse being smaller than the sum of the other two sides, how absurd that would be!

The function $d$ above is commonly called a **metric** on $X.$

Now, we can see

**Definition**: a **topological space** is a set $X$ with a collection $\tau$ of subsets of $X$ (called **open sets**) such that

- $X$ and the empty set $\emptyset$ are in $\tau$;

- Unions (possibily infinite) of open sets are open: $\bigcup_i U_i\in \tau$ for $U_i\in \tau$;

- Finite intersections of open sets are open: $\bigcap_i^n U_i \in \tau$ for $U_i\in \tau.$

BASIS

NEIGHBORHOODS

## Some common topologies

MÉTRICA, ORDEM

As this was one of the main motivations we have for topological spaces, of course metric spaces are also topological: namely, the open sets $B(p, r)=\{x\in X\mid d(x, p)<r\}$ form a basis. In the case of $\ro,$ $B(a, r)$ is just the open interval $(a-r, a+r).$ Indeed, the open intervals $(a,b)$ form a basis for this topology on $\ro.$

What about the plane $\ro^2$ and all the other $\ro^n$? These are also metric spaces alongside the Euclidean metric $d(x,y)=\sqrt{(x_1-y_1)^2+...+(x_n-y_n)^2}$ Thus, have a basis made of the n-dimensional balls $B(p,r)$ as above. In $\ro^2,$ these are open disks; in $\ro^3,$ open solid balls.

PRODUCT

SUB

QUOTIENTS

## Some important spaces

RN, S1, SN, DN, T2, TN, CILINDRO

MANIFOLDS, NON-MANIFOLDS

## Continuity, homeomorphisms

**Definition**: a continuous function between metric spaces $(X,d_X)$ and $(Y, d_Y)$ is a function $f:X\rightarrow Y$ such that, for every real number $\epsilon>0,$ there exists some $\delta>0$ such that $y\in B(x, \delta)$ implies $f(y)\in B(f(x), \epsilon).$

How to translate this to topology? Well, the definition above is equivalent to having $B(x, \delta)\subseteq \inv{f}(B(f(x), \epsilon)).$ That is, every point in $\inv{f}(B(f(x), \epsilon))$ is in an open ball inside the $\inv{f}(B(f(x), \epsilon))$ itself. Thus, $\inv{f}(B(f(x), \epsilon))$ is open. So what we have is an open set $V\subseteq Y$ and continuity of $f$ is equivalent to $\inv{f}(V)$ being open. The following topological definition ensues:

**Definition**: a **continuous function** between topological spaces $(X,\tau_X)$ and $(Y,\tau_Y)$ is a function $f:X\rightarrow Y$ such that, for all $V\subseteq Y$ open in $Y$, $\inv{f}(V)$ is open in $X.$

EXS ...

We're now finally able to define what we actually mean by topology as rubber geometry. Indeed, what we meant by "a continuous deformation without gluing or cutting" in the introduction can be formally described as a **bijective continuous function** $f$! The property of "being able to go back by a deformation of the same kind" means that $\inv{f}$ should also be continuous. Thus, we have the following fundamental definition:

**Definition**: a **homeomorhpism** between topological spaces $(X,\tau_X)$ and $(Y,\tau_Y)$ is an inversible continuous function $f:X\rightarrow Y$ such that $\inv{f}:Y\rightarrow X$ is also continuous.

If two spaces are homeomorphic, they're seen as equivalent by topology.

EXS (ALGNS OBVIOS, BURACOS)

## Homotopy

**Definition**: a **homotopy** between two paths $f:I\rightarrow X$ and $g:I\rightarrow X$ is a continuous association of paths $p_t$ for every $t\in I$ such that $p_0=f$ and $p_1=g.$ More formally, it is a continuous function $H:I\times I\rightarrow X$ such that $H(s,0)=f(s)$ and $H(s,1)=g(s).$

**Definition**: a **homotopy** between two continuous maps $f:X\rightarrow Y$ and $g:X\rightarrow Y$ is a continuous deformation from the function $H:X\times I\rightarrow Y$ with $H(x, 0)=f(x)$ and $H(x,1)=g(1)$.

**Definition**: two spaces $X,Y$ are **homotopically equivalent** if there are continuous functions $f:X\rightarrow Y$ and $g:Y\rightarrow X$ such that $f\circ g \simeq \text{id}_Y$ and $g\circ f \simeq \text{id}_X.$ We may also say that $X$ and $Y$ have the same **homotopy type**.

HOMOTOPIA COM QUOCIENTES E OUTRAS DEFORMAÇÕES

## Connectivity

**Definition**: a topological space $(X,\tau)$ is called **connected** if there are no disjont open sets $U,V$ such that $U\cup V = X.$

It's easy to see that connectivity is a topological property. Indeed, if $f:X\rightarrow Y$ is continuous and $X$ connected, then $\im f$ is also connected; otherwise, if it could be divided into two disjoint open sets $U,V$ in $\im f,$ then $\inv{f}(U)$ and $\inv{f}(V)$ would be open and disjoint (there can be no $x\in \inv{f}(U)\cap \inv{f}(V)$ since it would imply $f(x)\in U\cap V$), a contradiction.

**Definition**: a topological space $(X,\tau)$ is called **path-connected** if, for every two points $x,y\in X,$ theres a path $p:I\rightarrow X$ starting in $x$ and ending in $y$ (i.e., $p(0)=x$ and $p(1)=y$).

Path-connectedness is also a topological property. Indeed, if $f:X\rightarrow Y$ is continuous and $X$ path-connected, so is $\im y$: if $f(x),f(y)$ are in $\im f,$ $x$ and $y$ can be connected by a path $p$ in $X,$ and so $f\circ p:I\rightarrow \im f$ connects $f(x)$ to $f(y).$

Path-connectedness implies connectedness: 

One of the classic counter-examples in topology is that not all connected spaces are path-connected. For example, take the subset of $\ro^2$ that's composed of the graph of $\sin (\frac{1}{x})$ (with $x>0$) together with the origin.

## Compactness

**Definition**: a topological space $(X, \tau)$ is called **compact** if for all open covers $\{U_i\}_{i\in J},$ there exists a finite subcollection $\{U_i\}_{i\leq n}$ that also covers $X.$

# More point-set topology

There are many other topological properties that point-set studies, but I've mentioned all that we'll actually use. There are some others, however, that are still pretty used in algebraic topology, even though we'll ommit their applications. Here's a taste of these, although **you won't need to read this section** to understand what's coming.

## Separation axioms


