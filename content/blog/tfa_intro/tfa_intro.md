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

# A preview

ORDER 
this(n mt) -> homologia -> grupos/proj/games -> 

# The necessity of spaces

# Metric and topological spaces

## Metric and topology

**Definition**: a **metric space** is a set $X$ with a function $d:X\times X\rightarrow \ro_{\geq 0}$ that takes two elements $x,y$ of $X$ and returns a positive real number $d(x,y)$ representing their distance. This $d$ must the following properties to be a sensible representation of distance:

- The distance of $x$ to itself must be zero: $d(x,x)=0$ for all $x$;

- It mus be symmetrical: $d(x,y)=d(y,x)$ for all $x,y$;

- It must satisfy the *triangular inequality*: $d(x,y)+d(x,z)\leq d(y,z)$ for all $x,y,z.$ Imagine $x,y,z$ forming a triangle and the hypothenuse being smaller than the sum of the other two sides, how absurd that would be!

The function $d$ above is commonly called a **metric** on $X.$

**Definition**: a **topological space** is a set $X$ with a collection $\tau$ of subsets of $X$ (called **open sets**) such that

- $X$ and the empty set $\emptyset$ are in $\tau$;

- Unions (possibily infinite) of open sets are open: $\bigcup_i U_i\in \tau$ for $U_i\in \tau$;

- Finite intersections of open sets are open: $\bigcap_i^n U_i \in \tau$ for $U_i\in \tau.$

## Some important spaces

## Continuity, homeomorphisms

**Definition**: a **continuous function** between topological spaces $(X,\tau_X)$ and $(Y,\tau_Y)$ is a function $f:X\rightarrow Y$ such that, for all $V\subseteq Y$ open in $Y$, $\inv{f}(V)$ is open in $X.$

**Definition**: a **homeomorhpism** between topological spaces $(X,\tau_X)$ and $(Y,\tau_Y)$ is an inversible continuous function $f:X\rightarrow Y$ such that $\inv{f}:Y\rightarrow X$ is also continuous.

## Homotopy



## Connectivity

**Definition**: a topological space $(X,\tau)$ is called **connected** if there are no disjont open sets $U,V$ such that $U\cup V = X.$

It's easy to see that connectivity is a topological property. Indeed, if $f:X\rightarrow Y$ is continuous and $X$ connected, then $\im f$ is also connected; otherwise, if it could be divided into two disjoint open sets $U,V$ in $\im f,$ then $\inv{f}(U)$ and $\inv{f}(V)$ would be open and disjoint (there can be no $x\in \inv{f}(U)\cap \inv{f}(V)$ since it would imply $f(x)\in U\cap V$), a contradiction.

**Definition**: a topological space $(X,\tau)$ is called **path-connected** if, for every two points $x,y\in X,$ theres a path $p:I\rightarrow X$ starting in $x$ and ending in $y$ (i.e., $p(0)=x$ and $p(1)=y$).

Path-connectedness is also a topological property. Indeed, if $f:X\rightarrow Y$ is continuous and $X$ path-connected, so is $\im y$: if $f(x),f(y)$ are in $\im f,$ $x$ and $y$ can be connected by a path $p$ in $X,$ and so $f\circ p:I\rightarrow \im f$ connects $f(x)$ to $f(y).$

Path-connectedness implies connectedness: 

One of the classic counter-examples in topology is that not all connected spaces are path-connected. For example, take the subset of $\ro^2$ that's composed of the graph of $\sin (\frac{1}{x})$ (with $x>0$) together with the origin.

## Compactness

**Definition**: a topological space $(X, \tau)$ is called **compact** if for all open covers $\{U_i\}_{i\in J},$ there exists a finite subcollection $\{U_i\}_{i\leq n}$ that also covers $X.$

