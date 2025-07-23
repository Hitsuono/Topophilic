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

Short answer: **basic set theory** (cartesian product, injective, surjective and bijective functions) and **introductory linear algebra** (you can find a quick reminder on the post concerning algebra).

I tried to write these posts as accessible as possible, but without losing much of the mathematical rigour. That is, mathematics is a human endeavour of unlimited aesthetic capacity, but this comes with a cost-- namely, rigour and precision. It is beautiful because so much formality can't be in vain. Without this limitation, there can ultimately be no beauty; the first is simultaneously the latter's restriction and its progenitor. Or, rather, rigour and aesthetical creativity are *consubstantial* in mathematics. The other member of this trinity is the insatiable human desire to further mathematicize the world and recognize itself in this construction-- to spread the Word and be in a Body, so to speak. But let's leave the formal-hegelian-christian analogies for another place for now. 

Fact is, leaving out the more difficult and rigorous parts **is** necessary when writing to a larger audience, but I tried to keep some balance-- particularly without insulting the intelligence and interest of the reader. You can always skip the more technical sections, and I hope they can spark out your curiosity and be more accessible when you come back to them.

# The necessity of spaces

Riemann, Poincaré, Einstein & Hilbert

Sols restritas a subespaços

Manifold hypothesis

State spaces

# Metric and topological spaces

## Abstract distances

The most natural notion of an abstract space is that of a set together with some kind of "distance" between its points. For example, in $\ro^n$ we can always define the **Euclidean distance** $d(x,y)=\sqrt{(x_1-y_1)^2+...+(x_n-y_n)^2}$ between points $x=(x_1,...,x_n)$ and $y=(y_1,...,y_n)$-- you can read more on it in the first section of the post concerning algebra, dedicated to linear algebra. This is the normal, flat distance we use in the real-world, but it isn't the only mathematical option available. Another option we implicitly use day-tod-day is the **Manhattan distance**, in which we consider only the difference between coordinate components and sum them up: $d(x,y)=|x_1-y_1|+...+ |x_n-y_n|.$ The name is illustrative: if you're walking in a rectangular grid of streets (like in Manhattan), the physical distance between you and your destination is irrelevant, since you can't walk through the buildings; the real distance you're going to travel only takes in account the straight line distances in the grid, and for that you use the Manhattan distance.

IMG!!! Manhattan

The Manhattan distance is widely used in any application where you work with a rectangular grid, for example when programming board games.

The Manhattan distance shares a similarity with the Euclidean one: both involve sums over differences of coordinates. This motivates us to define the so-called $\mathcal{l}^p$ distances in $\ro^n,$ defined as

$$d(x,y)=\left(|x_1-y_1|^p+...+|x_n-y_n|^p\right)^{1/p}.$$

As you can see, setting $p=1$ gives us the Manhattan distance, and $p=2$ the Euclidean one. The cases $p>2$ are mathematically interesting, but we won't really consider them in this series.

Graphs
Another context where applying a notion of distance to a set is quite natural comes when dealing with **graphs**. A graph is a pair $G=(V,E)$ of a generic set $V$-- called the set of vertices, even though the elements of $V$ don't need to be points in space but anything you want-- and $E$ is a set of pairs $(v_1,v_2)$ of elements of $V.$ We usually think of the $v$ inside of $V$ as points in space and the $e=(v_1,v_2)$ in $E$ as straight edges connecting points $v_1$ and $v_2$. These edges may or may not be directed: we'll think of them as undirected here.

IMG!!! GRAFOS

Ignoring any possible geometry behind our set $V$, we can define a distancee between vertices considering only the edge structure on the graph: just define $d(v_1,v_2)$ to be the minimal amount of edges you need to transverse to go from $v_1$ to $v_2.$ This amounts to interpreting all edges to correspond to a path of distance 1. This distance is implicilty used in basically any practical problem involving graphs.

Another distance that may be so obvious to us day-to-day that we even forget to mention it is the so-called **Hamming distance**. If you have two strings of symbols of the same length, this is the distance you naturally use to measure how different they are: you just count the amount of times these strings differ per-position. For example, the strings "Topophilic" and "臻9opophilic" have distance two because they differ in two positions. More formally, if we have an alphabet set $\mathcal{A}$ of symbols, then a string of length $n$ is the same as an element of $\mathcal{A}^n.$ These strings may be represented as $x=x_0x_1...x_n,$ each $x_i$ a symbol in $\mathcal{A},$ so that the Hamming distance in $\mathcal{A}^n$ is

$$d(x,y)=\text{amount of positions } i \text{ where }x_i\neq y_i.$$

We'll later on extend the Hamming distance to infinite strings and apply it to the set of possible configurations of cells in a cellular automata grid, paving the way for a fascinating application of topology.

Finally, we can also define **distances between functions**. Specifically, call $C([0,1])$ the set of all continuous functions between $[0,1]$ and $\ro.$ We'll explain later exactly what a continuous function is: for the momment, just take these as all the graphs that can be drawn without taking up your pencil from the paper, forming a continuous line. Then we can define the are between functions $f$ and $g$ as their distance-- using calculus,

$$d(f,g)=\int_0^1 |f(x)-g(x)|dx$$

IMG!!! L1

You can see this is somewhat similar to the $\mathcal{l}^1$ (Manhattan) distance defined above; because of this, it is also called the $L^1$ distance between functions $f$ and $g$. Similarly, one might define the general $L^p$ distance of functions as

$$d(f,g)=\left(\int_0^1 |f(x)-g(x)|^p dx\right)^{1/p}$$

## Metric spaces

After all these examples of "distances" on sets, it's natural to look for similarities between these examples to get a general definition. It isn't too far-fetched to propose one like this:

**Definition**: a **metric space** is a set $X$ with a function $d:X\times X\rightarrow \ro$ that takes two elements $x,y$ of $X$ and returns a real number $d(x,y)$ representing their distance. This $d$ must the following properties to be a sensible representation of distance:

- Non-negative: $d(x,y)\geq 0$ for all $x,y$ in $X$;

- The distance of $x$ to itself must be zero: $d(x,x)=0$ for all $x$;

- It mus be symmetrical: $d(x,y)=d(y,x)$ for all $x,y$;

- It must satisfy the *triangular inequality*: $d(x,y)+d(x,z)\leq d(y,z)$ for all $x,y,z.$ 

I think the only property that deserves further comment is the last one. Imagine $x,y,z$ are points in the plane forming a triangle. Breaking the triangular inequality would mean that there is one edge larger than the sum of the two other ones. This seems quite absurd and would render the theory quite uninteresting and un-geometric later on.

IMG!!! TRIANGULAR INEQ

The function $d$ above is commonly called a **metric** on $X.$ You can check all the examples we gave in the previous sections are indeed valid metrics.


## Metric sets

So far, we've been strictly in the world of geometry: we do care about distance so far. **This section is the heart of the transition from metric to topological spaces.**

One interesting way to study metric spaces is by sets naturally defined using the metric. For example, if we have a point $x\in X,$ we can always consider the set of points within a certain radius $r$ of $x$-- mathematically, the set

$$B(x,r)=\{y\in X\mid d(x,y)< r\},$$

called the **open ball** of radius $r$ centered on $x$ (even though it might not look like a ball or a disk at all). Notice that points $y$ at distance exactly $r$ are not inside this; to add them, we consider the **closed ball**

$$\bar{B}(x,r)=\{y\in X\mid d(x,y)\leq r\}.$$

It's also natural to consider those points only at distance $r$ from $x$ (like a circle), getting the **boundary of the ball**, denoted $\partial B(x,r),$ which is simply $\bar{B}(x,r)\setminus B(x,r)$-- or, equivalently,

$$\partial B(x,r)=\{y\in X\mid d(x,y)=r\}.$$

Note that a closed ball is exactly the open one plus a boundary, a frontier set.

Here is a collection of balls in different metrics for $\rt$:

IMGS!!! BALLS

Open balls have some interesting set-theoretic properties. First, note that $X$ is **covered** by them: i.e., for all $x\in X,$ there is an open ball containing it ($B(x,1)$, for example). They also have the property that their interesctions are "fat" and contain balls themselves: i.e., if $z\in X$ is in the intersection of balls $B(x,r_1)$ and $B(y,r_2),$ then there's some radius $r$ such that the ball $B(z,r)$ is inside the intersection:

$$B(z,r)\subseteq B(x,r_1)\cap B(y,r_2).$$

For that, just take any $r$ smaller than $d(x,y)-\max\{d(x,z), d(y,z)\}$ (this is posivite by the triangular inequality), as in the image below.

IMG!!! FAT BALLS

This "fat" property is very important: it tells you that no point in the intersection is a boundary point, since they always have a ball around them inside the intersection. This "fatness" property is more formally called **openness**, and we say a subset $S\subseteq X$ is open if for all $x\in S,$ there's some $r$ such that $B(x,r)\subseteq X.$ Visually, these are fat set with no boundary/frontier points.

Set-theoretically, open sets are somewhat well-behaved in respect to unions and intersections. Indeed, any union (including infinite ones) of open sets will still be open, since the open balls containing elements will still be inside the union. With respect to intersection, finite intersections of open sets are open as well: for if $U$ and $V$ are open and $x\in U\cap V,$ then, by the definition of openess, there are $r_1,r_2$ such that $B(x,r_1)\subseteq U$ and $B(x,r_2)\subseteq V,$ so that $B(x,\min \{r_1,r_2\})\subseteq U\cap V$ and the intersection is open. This is valid only for finite intersections: for example, if you do the infinite intersection $\bigcap_{n=1}^\infty B(x,1/n)$ of smaller and smaller open balls around $x$ is exactly the set $\{x\}$ containing only the point $x$ itself, which certainly isn't open.

IMG!!!

## Topological spaces

The idea of topological spaces comes from trying to focus on the set-theoretic aspect of metric spaces: i.e., what if, instead of taking metrics as the primary concept defining our abstract spaces, we take open sets to be our focus? These would then give us **a notion of proximity based only on sets**, skipping the necessity of a distance function. There are many equivalent definitions, but here's one based on open sets:

**Definition**: a **topological space** is a set $X$ with a set $\tau$ of subsets of $X$ (called **open sets**) such that

- $X$ and the empty set $\emptyset$ are in $\tau$;

- Unions (possibily infinite) of open sets are open: $\bigcup_i U_i\in \tau$ for $U_i\in \tau$;

- Finite intersections of open sets are open: $\bigcap_i^n U_i \in \tau$ for $U_i\in \tau.$

We'll often omit $\tau$ and, when the topology is understood from context, call just $X$ a topological space.

How does this fit with the previous section? Well, if $(X,d)$ is a metric space, then we can **topologize** $X$ by taking as topology $\tau$ all the open sets of $(X,d).$ 

We can't, however, do the opposite: i.e., we can't define a metric $d$ from a general topological space $(X,\tau)$ such that $\tau$ is obtained as the open sets of $d.$ Those spaces that allow this are called **metrizable**, and the obtained topology $\tau$ is called a **metric topology**. These spaces include basically all the ones we'll study in this series.

In the context of metric spaces, we started with a metric and then got to defining open sets as those subsets $U$ that, for all points $x\in U,$ there was an open ball $B(x,r)\subseteq U$ containing $x$ and inside $U.$ This is generalized by the following theorem:

**Proposition**: if $(X,\tau)$ is a topological space and $U\subseteq X$ is a subset such that, for all $x\in U,$ there's an open set $V(x)\subseteq U$ containing $x$ and inside $U,$ then $U$ is open.

**Proof**: taking all such $V(x)$ for $x$ in $U,$ $\bigcup_x V(x)$ is open by definition. Since all $V(x)$ are subsets of $U,$ $\bigcup_x V(x)\subseteq U$; since all $x\in U$ are at least inside its $V(x),$ $U\subseteq\bigcup_x V(x),$ implying $\bigcup_x V(x)=U$ and so $U$ is open.

{{< qed >}}

To get a topology from metric spaces, what we did is begin with open balls $B(x,r)$ and then define open sets as exactly those that can be gotten through unions and finite intersections from these balls. This can be generalized as follows:

**Definition**: a **basis** for a topological space $(X,\tau)$ is a collection $\mathcal{B}\subseteq \tau$ of open subsets of $X$ such that all open sets of $X$ can be represented as the union of sets inside $\mathcal{B}.$

We often define a topology through a basis, just as we did in the metric case. I.e., we define a basis collection $\mathcal{B}$ of subsets of $X$ and define $\tau$ as all the sets obtained by unions and finite intersections of sets in $\mathcal{B}.$ To this actually work, we need the following two simple conditions (check any standard textbook for a proof):

- For all $x\in X,$ there's a $B$ in $\mathcal{B}$ such that $x\in B$: i.e., $\mathcal{B}$ **covers** $X$;

- For all sets $B_1,B_2\in \mathcal{B}$ and all $x\in B_1\cap B_2,$ there's a $B_3\in \mathcal{B}$ such that $x\in B_3$ and $B_3\subseteq B_1\cap B_2$ (just remember how we showed this for open ball previously).

## Some common topologies

That should be it for definitions and constructions so far. Let's get into some examples.

First, every set $X$ can be given a topology: just take as basis $\mathcal{B}$ all the one-point subsets $\{x\}$ for $x\in X.$ The resulting topology is the set of all subsets of $X$, and is called the **discrete topology**. It is metrizable by the metric

$$d(x,y)=
\begin{cases}
1, & \text{if } x\neq y\\
0, & \text{else}
\end{cases}
$$

called the discrete metric (note that the ball $B(x,r)$ is just $\{x\}$ for any $r<1$, giving the discrete basis).

OTHER TOPOLOGIES FOR SMALL SETS

That's all educative and even intersting per se, but where are our cool figures of mind-blowing shapes, our familiar friends the sphere and the torus-- **where are our donuts?!** Indeed, most introductory courses on topology don't really get to these and focus on the more set-theoretical aspects of topology-- the so-called **point-set topology**. This can be frustrating for many beginners, so let me turn to more familiar shapes and spaces.

MÉTRICA, ORDEM

RN MÉTRICO (equiv metrics, n em caso infinito)

SUBSPACE: 

RN, S1, SN, DN, T2, TN, CILINDRO

SN VIA DN, SN-1

MANIFOLDS, NON-MANIFOLDS

PRODUCT

QUOTIENTS

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

Another topological notion is that of **compact subspaces**. This is an idea involving finitude. Take the plane $\rt$ as an example. Both open as closed balls in it are sets with ininitely many points. But, in the open one, you can get a sequence of points in the ball that get infinitely closed to the frontier, without ever actually getting to it. This isn't possible in the closed one: every converging sequence actually converges to a point inside the closed ball. The exact same is valid for general open/closed sets. It is as if the closed ball is "less finite" as the open one, "more bounded"-- or, rather, it's more *compact*. 

IMG!!! OPEN BALL SEQ

In metric language,

In purely topological language, we can get this definition:

**Definition**: a topological space $(X, \tau)$ is called **compact** if for all open covers $\{U_i\}_{i\in J},$ there exists a finite subcollection $\{U_i\}_{i\leq n}$ that also covers $X.$

IMG!!!

**Tychonoff's theorem**: 

## Separation axioms

# The topology of cellular automata

## Cellular automata

Some readers might have heard of **Conway's Game of Life** (CGOL). It was invented by the mathematician [John H. Conway](https://en.wikipedia.org/wiki/John_Horton_Conway), who-- due his abundant creativity and prolificity throughout his career-- we will meet again later on in this series. This is a game played on an infinite square grid, which each cell in the grid having one of two states: dead (painted white) and alive (painted black). At each turn, states are updated according to the following rule:

* Live cells survive only if they have 3 or 2 alive neighbors;

* Dead cells become alive if they have exactly 3 neighbors. Else, they stay dead.

The fascinating thing about CGOL is that it allows for an extremely rich set of phenomena and interesting patterns. Here are some examples:

* Still life: patterns that never change, if not hit by something else;

EXS

* Oscilators: patterns that keep repeating after some period; 

EXS

* Spaceships: patterns that repeat, but after displacing themselves in some direction, thus moving in the grid.

EXS

CGOL has been an object of much research since it has been invented. By research, I do mean "scientific", "serious" research by "real" mathematicians, but also by many other people who were enthralled by this cell-world, and who contributed to our understanding of it. Many people may contest CGOL's classification as a "game", but I strongly disagree: it is a game of study, a botanical sort of game, a theory-building game collectively played. In that sense, it is an absolutely exceptional piece of rule/system-design. I can't refrain from being fascinated by all the 

One of the reasons in particular I became so enamored with this world is due to the book *Conway's Game of Life-- Mathematics and Construction*, by Nathaniel Johnson ([blog](https://njohnston.ca/), [Youtube channel](https://www.youtube.com/@NathanielMath), [LifeWiki page](https://conwaylife.com/wiki/Nathaniel_Johnston)) and Dave Greene ([LifeWiki page](https://conwaylife.com/wiki/Dave_Greene)). It's written like a textbook, with plenty of examples and exercises, so that you can actively participate in the "research game". I read it shortly before taking (quite lately) my first physics course on college. Solving exercises from the course's textbook obviously reminded me of those I hade made before, those involving cells and their survival: the simple but descriptive worlds these two books described seemed so alike, both in truth and in dignity. Please do [check out the book](https://conwaylife.com/book/) if you're interested, as it's available for free on the internet.

Many variants of CGOL have been derived, each with its own properties and particular phenomena. There are those with more intricate, "fine-tuned" rules, others with different notions of neighborhood, with more states etc. Some try to be more natural, some focus on artificial, circuit-like processes. Together, they form a part of the world of **cellular automata**. According to Wolfram MathWorld, we have

**Definition**: "a cellular automaton (CA) is a collection of 'colored' cells on a grid of specified shape that evolves through a number of discrete time steps according to a set of rules based on the states of neighboring cells".

The main part of this definition is that the evolution of a cell in our cell-world depends **only** on its neighbors. Note too that grid shapes can be basically arbitrary, but we'll mostly focus on the square 2D grid and the 1D grid with edges of the same length. We may also have different definitions of a "neighborhood"-- the most common ones in the 2D square case being the Moore and von Neumann neighborhoods, as seen below. 

IMG!!! NEIGHBORHOODS

More formally, a grid state is a function $s:G\rightarrow S,$ where $G$ is the set of our grid cells and $S$ that of possible cell states. In the 2D square grid, we have $G=\zo^2$; in the 1D one, $G=\zo.$ The set $S$ may be finite, infinite or even have continuously many states. A CA update rule is some function that brings state $s$ to $s',$ at each cell $c\in G,$ **depending only on the neighbors of** $c.$ We'll later on describe this function using topology.

NEUMANN

CGOL

WOLFRAM

SIMULACS

## A topological space for cell worlds

### Definition

CA
Let $S$ be our set of cell states. We'll consider the bi-infinite (that is, infinite on both sides) sequences

$x=... x_{-2}x_{-1}x_{0}x_{1}x_2...$

That is, $x$ is a sequence of cell-values that extends infinitely on both sides, with the value on position $m$ being denoted $x_m.$ The subsequence of $x$ with positions in an integer interval $[a,b]$ from $a$ to $b$ is denoted $x_{[a,b]}$-- i.e., $x_{[a,b]}=x_ax_{a+1}...x_{b-1}x_b.$

The set of these sequences, denoted $S^\zo,$ can be given the product topology. Thus, by definition, it has as basis the subsets $B\subseteq S^\zo$ such that only finite components $B_i$ of $B$ are not $S^\zo$. Since $S$ is finite, this topology is equivalent to the one generated by the $B_i$ which 

$$d(x,y)=\sum_{m\geq 0}\frac{D(x_{[-m,m]},y_{[-m,m]})}{2^m}$$

Note that this space is "bounded" and does not allow for arbitrarily large distances: for if $x$ and $y$ are different in all positions, then $d(x,y)=\sum_{m\geq 0}\frac{2m}{2^m},$ and this infinite series can be somewhat unproblematically calculated: it is equal to $4.$ Thus, the greatest distance two points in $S^\zo$ may take is $4$-- and we may as well say that the **diameter** of $S^\zo$ is equal to $4.$

### Metric

In general, distances in this space are hard to find exactly. However, if $x,y\in S^\zo$ differ only inside an interval $[-L,L]$ and have exactly $k$ different values, then $d(x,y)&=\sum_{m\geq 0} \frac{D(x,y)}{2^m}\leq k\sum_{m\geq 0} \frac{1}{2^m}=2k.$

### Symmetries: the shift

The space $S^\zo$ is quite interesting because it comes along a continuous symmetry, the **shift** $s:S^\zo\rightarrow S^\zo,$ which shifts sequences one step to the right: $s(x)_i=x_{i-1}.$ Note also that $s$ is invertible, with $\inv{s}$ being a shift one step to the left: $\inv{s}(x)_i=x_{i+1}.$ We'll denote this left shift $l.$

IMG!!!

To verify the continuity of $s,$ let $B_p$ be the basis neighborghood of a pattern $p.$ Then $\inv{s}(B_p)$ is exactly $B_{l(p)}$ BLA. Similarly, $\inv{l}(B_p)=B_{s(p)}.$

Using basically the same argument as for $s,$ we can see $\inv{s}$ is continuous. That is, **the shift** $s$ **is a homeomorphism from** $S^\zo$ **to itself!** In that sense, the term "symmetry" is quite appropriate for it. More than that, it is also an isometry: $d(s(x), s(y))=d(x,y)$ for all $x,y\in S^\zo.$

EQUIVARIANT

### Continuity

### Compactness

By Tychonoff's theorem, $S^\zo$-- as an infinite product of compact spaces-- is compact.

## The topological definition of cellular automata


