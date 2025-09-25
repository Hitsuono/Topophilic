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

FALAR DEUCLIDES

# This series

ORDER 
this(n mt) -> homologia -> grupos/proj/games -> 

# What you'll need

Short answer: **basic set theory** (cartesian product, injective, surjective and bijective functions, cardinality) and **introductory linear algebra** (you can find a quick reminder on the post concerning algebra).

I tried to write these posts as accessible as possible, but without losing much of the mathematical rigour. That is, mathematics is a human endeavour of unlimited aesthetic capacity, but this comes with a cost-- namely, rigour and precision. It is beautiful because so much formality can't be in vain. Without this limitation, there can ultimately be no beauty; the first is simultaneously the latter's restriction and its progenitor. Or, rather, rigour and aesthetical creativity are *consubstantial* in mathematics. The other member of this trinity is the insatiable human desire to further mathematicize the world and recognize itself in this construction-- to spread the Word and be in a Body, so to speak. But let's leave the formal-hegelian-christian analogies for another place for now. 

Fact is, leaving out the more difficult and rigorous parts **is** necessary when writing to a larger audience, but I tried to keep some balance-- particularly without insulting the intelligence and interest of the reader. You can always skip the more technical sections, and I hope they can spark out your curiosity and be more accessible when you come back to them.

# What is topology?

TOP VS GEO


{{% columns ration="1:1" %}}
- **Ancient Greek**

    **αʹ.**
    σημεῖόν ἐστιν, οὗ μέρος οὐθέν.

    **βʹ.**
    γραμμὴ δὲ μῆκος ἀπλατές.

    **γʹ.**
    γραμμῆς δὲ πέρατα σημεῖα.

    (...)

    **εʹ.**
    ἐπιφάνεια δέ ἐστιν, ὃ μῆκος καὶ πλάτος μόνον ἔχει.

    **ϛʹ.**
    ἐπιφανείας δὲ πέρατα γραμμαί.

    (...)

    **ιεʹ.**
    ὅρος ἐστίν, ὅ τινός ἐστι πέρας.

    **ιϛʹ.**
    σχῆμά ἐστι τὸ ὑπό τινος ἤ τινων ὅρων περιεχόμενον.


- **English**

    **I.**
    A point is that which has no parts.

    **II.**
    A line is length without breadth.

    **III.**
    The extremities of a line are points.

    (...)

    **V.**
    A surface is that which has length and breadth only.

    **VI.**
    The extremities of a surface are lines.

    (...)

    **XIII.**
    A term or boundary is the extremity of any thing.

    **XIV.**
    A figure is a surface enclosed on all sides by a line or lines.

{{% /columns %}}

# The necessity of spaces

spaces encode info and restrictions (eg periodic functions are to S^1)

Riemann, Poincaré, Einstein & Hilbert

Sols restritas a subespaços

Manifold hypothesis

State spaces

# Metric spaces

## Abstract distances

The most natural notion of an abstract space is that of a set together with some kind of "distance" between its points. These are called metric spaces and will properly be defined after some examples. 

For example, in $\ro^n$ we can always define the **Euclidean distance** $d(x,y)=\sqrt{(x_1-y_1)^2+...+(x_n-y_n)^2}$ between points $x=(x_1,...,x_n)$ and $y=(y_1,...,y_n)$-- you can read more on it in the first section of the post concerning algebra, dedicated to linear algebra. This is the normal, flat distance we use in the real-world, but it isn't the only mathematical option available. Another one we implicitly use in our day-to-day is the **Manhattan distance**, in which we consider only the difference between coordinate components and sum them up: $d(x,y)=|x_1-y_1|+...+ |x_n-y_n|.$ The name is illustrative: if you're walking in a rectangular grid of streets (like in Manhattan), the physical distance between you and your destination is irrelevant, since you can't walk through the buildings; the real distance you're going to travel only takes into account the straight line distances in the grid, and for that you use the Manhattan distance.

IMG!!! Manhattan

The Manhattan distance is widely used in any application where you work with a rectangular grid, for example when programming board games.

The Manhattan distance shares a similarity with the Euclidean one: both involve sums over differences of coordinates. This motivates us to define the so-called $\mathcal{l}^p$ **distances** in $\ro^n,$ defined as

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

You can see this is somewhat similar to the $\mathcal{l}^1$ (Manhattan) distance defined above; because of this, it is also called the $L^1$ distance between functions $f$ and $g$. Similarly, one might define the general $L^p$ **distance** of functions as

$$d(f,g)=\left(\int_0^1 |f(x)-g(x)|^p dx\right)^{1/p}$$

There's also the $L^\infty$ distance, defined as the maximum distance that they can take for the same input $x$: i.e., it is the distance $d(f,g)=\max\{|f(x)-g(x)|\mid x\in [0,1]\}.$

## Metric spaces

After all these examples of "distances" on sets, it's natural to look for similarities between these examples to get a general definition. It isn't too far-fetched to propose one like this:

**Definition**: a **metric space** is a set $X$ with a function $d:X\times X\rightarrow \ro$ that takes two elements $x,y$ of $X$ and returns a real number $d(x,y)$ representing their distance. This $d$ must the following properties to be a sensible representation of distance:

- Non-negative: $d(x,y)\geq 0$ for all $x,y$ in $X$;

- The distance of $x$ to itself must be zero: $d(x,x)=0$ for all $x$;

- It mus be symmetrical: $d(x,y)=d(y,x)$ for all $x,y$;

- It must satisfy the *triangular inequality*: $d(x,y)+d(x,z)\leq d(y,z)$ for all $x,y,z.$ 

I think the only property that deserves further comment is the last one. Imagine $x,y,z$ are points in the plane forming a triangle. Breaking the triangular inequality would mean that there is one edge larger than the sum of the two other ones. This seems pretty absurd and would render the theory quite uninteresting and un-geometric later on.

IMG!!! TRIANGULAR INEQ

The function $d$ above is commonly called a **metric** on $X.$ You can check all the examples we gave in the previous sections are indeed valid metrics.


## Metric sets

So far, we've been strictly in the world of geometry, as we still pretty much care about distances. **This section is the heart of the transition from metric to topological spaces.**

One interesting way to study metric spaces is by sets naturally defined using the metric. For example, if we have a point $x\in X,$ we can always consider the set of points within a certain radius $r>0$ of $x$-- mathematically, the set

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

This "fat" property is very important: it tells you that no point in the intersection is a boundary point, since they always have a ball around them inside the intersection. This "fatness"  is more formally called **openness**, and we say a subset $S\subseteq X$ is open if for all $x\in S,$ there's some $r$ such that $B(x,r)\subseteq X.$ Visually, these are fat set with no boundary/frontier points.

Set-theoretically, open sets are somewhat well-behaved in respect to unions and intersections. Indeed, any union (including infinite ones) of open sets will still be open, since the open balls containing elements will still be inside the union. With respect to intersection, finite intersections of open sets are open as well: for if $U$ and $V$ are open and $x\in U\cap V,$ then, by the definition of openess, there are $r_1,r_2$ such that $B(x,r_1)\subseteq U$ and $B(x,r_2)\subseteq V,$ so that $B(x,\min \{r_1,r_2\})\subseteq U\cap V$ and the intersection is open. 

This is valid only for finite intersections: for example, if you do the infinite intersection $\bigcap_{n=1}^\infty B(x,1/n)$ of smaller and smaller open balls around $x$ is exactly the set $\{x\}$ containing only the point $x$ itself. In $\ro,$ points aren't open, however, since this would imply the existence of a ball $B(x,r)$ lying inside $\{x\}$-- i.e., imply $B(x,r)=\{x\},$ thus $r=0,$ something we don't allow as counting as open balls.

IMG!!!

We've been thinking quite informally of open sets as "balls", or "disks", because that's how they look in $\ro^n.$ But let's consider a different space: take a graph $G$ and metricize it with the metric we described. Then for a vertex $v\in G,$ the open ball $B(v,r)$ is the set of all vertices within less than $r$ edges of $v.$ Since $B(v,r)$ for $r<1$ is simply $v$ itself, we get that every vertex in $G$ is open-- and, since countable unions of open sets are open, any set of vertices of $G$ is open.

A less trivial example is given by $C([0,1])$ with the $L^\infty$ metric. Here, the open ball $B(f, r),$ for some $f\in C([0,1]),$ is the set of all (continuous) functions that differ from $f$ less than $r$ in every point. There are infinitely many of these, with all possible shapes.

IMG!!!

In this space, for example, the set $U=\{f\in C([0,1])\mid f(x)\neq 0\text{, for all } x\in[0,1]\}$ is open. This is the case because, if $g\in U$ and $r$ is the closest $g$ gets to $0,$ then $B(g,r)\subseteq U$ (actually proving this requires the proper treatment of continuity we'll give in the next section).

IMG!!!

These examples should show that, in metric spaces, **by definition a subset** $U$ **is open if, for every** $x$ **in** $U,$ **a small perturbation of** $x$ **(measured with the metric) remains inside** $U.$ This is starting to smell like the "continuous deformations" we mentioned informally in the introduction. All we need now is to define continuity properly, and we'll finally get into topology proper.

## Continuity

If you've taken a Calculus I course, you'll surely have met the definition of a real continuous functions; if you haven't, don't worry! Visually, a function $f:\ro\rightarrow \ro$ is said to be continuous if its graph has no sudden jumps-- if it can be drawn continuously without taking your pen from the paper. More formally, this means that if a sequence of points sequence of points $x_1,x_2,...$ gets closer and closer-- converges, we say-- to a point $a\in \ro$ in the $x$ axis, then the sequence $f(x_1),f(x_2),...$ will also converge to $f(a)$. We often write sequences as $\{x_n\}$ and, if it converges to a point $a$ when $n$ gets larger, that $a$ is its **limit**, writing $\lim_{n\rightarrow\infty}x_n=a.$ Informally using this limit notation, a function $f$ as above is continuous if, and only if, 

$$\lim_{x\rightarrow a}f(x)=f(a).$$

IMG!!! func contínua e descontínua

Here's how to make formal sense of these terms and notations.

More properly, we say an infinite sequence $\{x_n\}$ converges to a value $a$ whenever for any positive real number $\epsilon>0$ (which can be very, very small), there's some index $N$ such that $d(x_n, a)<\epsilon$ for all indices $n>N$. That is, you can pick an arbitrarily tiny number $\epsilon$ and there'll come a moment in the sequence where all points will be closer to $x_n$ as $\epsilon,$ starting from the index $N.$ You can imagine this like a game: one player proposes a challenge with a very small $\epsilon,$ and the other has to find an $N$ after which $d(x_n,a)<\epsilon.$ We then write $x_n\rightarrow a,$ or $\lim_{n\rightarrow \infty}x_n=a.$

In Calculus I this is thought only inside $\ro,$ but notice that the only thing we needed here is a metric: indeed, this can be taken as the definition of convergence for any metric space $(X,d)$!

**Definition**: an infinite sequence $\{x_n\}$ in a metric space $(X,d)$ is said to **converge** to a point $a\in X$, written $x_n\rightarrow a,$ whenever for any positive real number $\epsilon>0,$ there is some $N$ such that $d(x_n, a)<\epsilon,$ for all $n>N.$

IMG!!! converging seq

We can then formalize the informal definition of continuity we gave before, and even generalize it to all metric spaces:

**Definition**: a function $f:X\rightarrow Y$ between metric spaces $(X,d_X)$ and $(Y, d_Y)$ is continuous if, for all sequences $x_n\rightarrow a,$ we have $f(x_n)\rightarrow f(a).$ 

Simple, right?! Sure, and it is a very helpful and common way to think of convergence, no matter in which area application. But it also has its disadvantages. Conceptually, it relies too much on the notion of sequences: but sequences really should be seen as tests for continuity-- as a way of exemplifying and verifying it--, but not inherent to continuity as a phenomena itself. Formally, it requires proving two convergences: thus two $\epsilon$'s and two $N$'s, giving four variables to work with. Can't we get something simpler, conceptually and formally?

The following definition gets us rid of both problems: there are no sequences in it anymore, just general points in space, and only two variables ($\epsilon$ and $\delta$) for proving continuity. Proving it is equivalent to the previous one is a good exercise on metric spaces.

**Definition**: a continuous function between metric spaces $(X,d_X)$ and $(Y, d_Y)$ is a function $f:X\rightarrow Y$ such that, for every real number $\epsilon>0,$ there exists some $\delta>0$ such that $y\in B(x, \delta)$ implies $f(y)\in B(f(x), \epsilon).$

The proposition above can actually be further simplified in a cleaner and deeper way, although seemingly distant from the notion of convergence. This is where topology will come in. 

Indeed, a careful reading will tell you that it is equivalent to saying that $f(B(x, \delta))\subseteq B(f(x), \epsilon),$ which is the same as $B(x, \delta) \subseteq \inv{f}(B(f(x), \epsilon)).$ But since this is valid for any $x,$ by definition the set $\inv{f}(B(f(x), \epsilon))$ is open in $X.$ It isn't a difficult exercise to prove that this is again equivalent to having $\inv{f}(V)$ open for any $V$ open in $Y.$

But now this last equivalent definition is free of any notion of metric or convergence! It depends only on open sets, nothing more. This more concise version of continuity ensues:

**Definition**: a **continuous function** between metric spaces $(X,d_X)$ and $(Y,d_Y)$ is a function $f:X\rightarrow Y$ such that, for all $V\subseteq Y$ open in $Y$, $\inv{f}(V)$ is open in $X.$

Note how clean this definition is: in a certain way, it deeply and truly captures the general nature of continuity as a visual phenomena. Ask yourself this: is continuity as a notion that should depend on a metric-- on a definition of distance? Imagine you have a map and a continuous path inscribed in it. **Does the scale of the map matter as to the path being continuous**? Not at all. You can use kilometers, miles or roman feet, it'll remain a continuous path no matter what. Thus being continuous isn't properly a metric property, but something deeper and more subtle-- i.e., "topological". The definition of topology is getting very close to us. 

All most common real functions are continuous. This includes addition, subtraction, multiplication, roots, exponentiation, logarithms and division as well. The last one doesn't seem though: the graph of $\frac{1}{x}$ has two distinct components, doesn't it? It does, but its domain is $\ro\setminus \{0\},$ so it is continuous, only with a domain that's already disconnected. We'll formalize this notion of "connectedness" later on.

Every linear transformation between **finite dimensional** vector spaces is continuous. You may find more over continuous real functions on textbooks on calculus.

Generally, the composition of continuous functions between metric spaces is continuous: if $f:X\rightarrow Y,$ $g:Y\rightarrow Z$ are both continuous and $V\subseteq Z$ is open, then $\inv{(g\circ f)}(V)=\inv{f}(\inv{g}(V)),$ which is open by hypothesis, so that $g\circ f$ is continuous too. Notice by the way how proving this is much, much easier and more obvious using the last definition instead of the previous ones that used explicit metrics.

For spaces of functions, each $L^p$ metric gives a different notion of convergence. With $L^\infty,$ this is called *uniform convergence*: more explicitly, a sequence $\{f_n\}$ of functions converges to $f$ uniformly if, for every $x$ in the domain, $f_n(x)\rightarrow f(x)$-- i.e., if the functions converge punctually to $f$. What's interesting is that $L^p$ spaces allow for *non-continuous linear functions*: the derivative is one example. But we won't delve into that point here (we might though, but only much, much later in the series).

# Topological spaces

## Purpose and definition

The idea of topological spaces comes from trying to focus on the set-theoretic aspect of metric spaces: i.e., what if, instead of taking metrics as the primary concept defining our abstract spaces, we take open sets to be our basic objects? These would then give us **a notion of proximity based only on sets**, skipping the necessity of a distance function. The discussion above on continuity should make this quite reasonable: there are phenomena where openness is the main player, not distance. This includes not only continuity, but, as we'll see later, stuff like gluing two shapes together.

Thus we wish to define a notion of space based only on subsets, which we'll define as being "open". These should have similar properties as open sets in metric spaces. The following definition is the most common for this:

**Definition**: a **topological space** is a set $X$ with a set $\tau$ of subsets of $X$ (called **open sets**) such that

- $X$ and the empty set $\emptyset$ are in $\tau$;

- Unions (possibily infinite) of open sets are open: $\bigcup_i U_i\in \tau$ for $U_i\in \tau$;

- Finite intersections of open sets are open: $\bigcap_i^n U_i \in \tau$ for $U_i\in \tau.$

Some notation and terminology first: we'll often omit $\tau$ and, when the topology is understood from context, call just $X$ a topological space. An open set $U\subseteq X$ containing a point $x\in X$ is often called a **neighborhood** of $x$ (some authors differ on their definitions of neighborhoods, but that's the one I prefer). When we have open sets $\{U_i\}$ such that their union is equal to $X,$ we say they **cover** $X.$

Since continuity was a main reason to define topological spaces-- and because these concepts are intrinsically and necessarily related--, here's how can easily generalize it:

**Definition**: a **continuous function** between topological spaces $(X,\tau_X)$ and $(Y,\tau_Y)$ is a function $f:X\rightarrow Y$ such that, for all $V\subseteq Y$ open in $Y$, $\inv{f}(V)$ is open in $X.$

The composition of topological continuous functions is also continuous: the proof is exactly the same we gave for metric spaces previously.

How do metric spaces fit in this definition? Well, if $(X,d)$ is a metric space, then we can **topologize** $X$ by taking as topology $\tau$ all the open sets of $(X,d),$ as previously defined.

We can't, however, always do the opposite: i.e., we can't generally define a metric $d$ from a general topological space $(X,\tau)$ such that $\tau$ is obtained as the open sets of $d.$ Those spaces that allow this are called **metrizable**, and the obtained topology $\tau$ is called a **metric topology**. That is, topological spaces are a broader category than metric ones, even though most of the spaces we'll study in this series will be metrizable.

## Defining a topology by a basis

In the context of metric spaces, we started with a metric and then got to defining open sets as those subsets $U$ that, for all points $x\in U,$ there was an open ball $B(x,r)\subseteq U$ containing $x$ and inside $U.$ This is generalized by the following theorem:

**Proposition**: if $(X,\tau)$ is a topological space and $U\subseteq X$ is a subset such that, for all $x\in U,$ there's an open set $V(x)\subseteq U$ containing $x$ and inside $U,$ then $U$ is open.

**Proof**: taking all such $V(x)$ for $x$ in $U,$ $\bigcup_x V(x)$ is open by definition. Since all $V(x)$ are subsets of $U,$ $\bigcup_x V(x)\subseteq U$; since all $x\in U$ are at least inside its $V(x),$ $U\subseteq\bigcup_x V(x),$ implying $\bigcup_x V(x)=U$ and so $U$ is open.

{{< qed >}}

To get a topology from metric spaces, what we did is begin with open balls $B(x,r)$ and then define open sets as exactly those that can be gotten through unions and finite intersections from these balls. This can be generalized as follows:

**Definition**: a **basis** for a topological space $(X,\tau)$ is a collection $\mathcal{B}\subseteq \tau$ of open subsets of $X$ such that all open sets of $X$ can be represented as the union of sets inside $\mathcal{B}.$

We often define a topology through a basis, just as we did in the metric case. I.e., we define a basis collection $\mathcal{B}$ of subsets of $X$ and define $\tau$ as all the sets obtained by unions and finite intersections of sets in $\mathcal{B}.$ To this actually work, we need the following two simple conditions (check any standard textbook for a proof):

- For all $x\in X,$ there's a $B$ in $\mathcal{B}$ such that $x\in B$: i.e., $\mathcal{B}$ **covers** $X$;

- For all sets $B_1,B_2\in \mathcal{B}$ and all $x\in B_1\cap B_2,$ there's a $B_3\in \mathcal{B}$ such that $x\in B_3$ and $B_3\subseteq B_1\cap B_2$ (just remember how we showed this for open ball previously).

You can also prove that, in order to show that a function $f:X\rightarrow Y$ is continuous, it suffices to prove it in relation to a basis $\mathcal{B}$ of $Y$: i.e., that $\inv{f}(B)$ is open in $X$ for all $B\in\mathcal{B}.$ This is particularly useful for metric spaces, with $\mathcal{B}$ being the open balls of $Y.$

## Homeomorphisms: the topological notion of equality

We're now finally able to define what we actually mean by topology as rubber geometry. Indeed, what we meant by "a continuous deformation without gluing or cutting" in the introduction can be formally described as a **bijective continuous function** $f$! The property of "being able to go back by a deformation of the same kind" means that $\inv{f}$ should also be continuous. Thus, we have the following fundamental definition:

**Definition**: a **homeomorhpism** between topological spaces $(X,\tau_X)$ and $(Y,\tau_Y)$ is an inversible continuous function $f:X\rightarrow Y$ such that $\inv{f}:Y\rightarrow X$ is also continuous. We then say X and Y are **homeomorphic** and write $X\cong Y.$

IMG!!! HOMEO

If two spaces are homeomorphic, they're seen as equivalent by topology. That is, homeomorphic spaces can be seen as just different ways to name things: a point $x\in X$ is just a different name for another $y\in Y$, and an open set $U\subseteq X$ is just a different name for one open set $V\subseteq Y.$

Like equality, being homeomorphic is an **equivalence relation** (prove it): that is, $X\cong X;$ $X\cong Y$ implies $Y\cong X;$ $X\cong Y$ and $Y\cong Z$ imply $X\cong Z.$

Homeomorphisms allow us to make use of expressions like "the circle", "the torus" etc., even though our circle might actually take the shape of a square-- it doesn't matter, since, as we'll see, both are homeomorphic!

We'll say some property of a space $X$ is a **topological invariant** of $X$, or a topological *property* of it, if any space $Y$ homeomorphic to $X$ has the same property. The main goal of topology is finding invariants appliable to the largest classes of spaces possible.

Note that, from set theory, the [cardinality](https://en.wikipedia.org/wiki/Cardinality) of a space as a set is an invariant. This usually doesn't help us, since most interesting shapes have the same uncountable cardinality. 

One main topological invariant we'll keep studying in this series are **holes**: they refrain transforming one space into another continously (i.e., without cutting or gluing): a disk and a disk with a hole in it, for example, aren't homeomorphic. To prove this will still take some time, though, but I hope it is visually intuitive.

IMG!!! OU GIF SLA, BURACO

Generally, mathematicians describe homeomorphisms explicitly, but rely on the visual intuition of the reader, which should be based on these simpler cases. Here are some of these simpler homeomorphisms which can be explicitly described (take $\ro^n$ and other real spaces with the metric topology from the Euclidean distance):

- The obvious case: the identity $\text{id}_X:X\rightarrow X$ sending $x$ to $x$ itself;

- All one-point spaces are homeomorphic: for if $X=\{p\}$ and $Y=\{q\}$ (both with the only possible topology, composes solely of the point and the empty set), then $f:X\rightarrow Y$ sending $p$ to $q$ is a homeomorphism. It is common to then to speak of **the point space**, often denoted as $0$ to denote its triviality (it's a space though, not a number!);

- **Isommetries**: these are the bijective functions between metric spaces preserving the metric: i.e., $f:(X,d_X)\rightarrow (Y,d_Y)$ such that $d(x,y)=d(f(x),f(y)),$ with $f$ bijective. This is easy to prove using what we know so far. **Rotations, reflections and translations** are examples of isommetries. These will become very important later on when we study the topology of cellular automata;

- Linear scalings: since these are just multiplication by scalars on $\ro^n$;

- Open intervals $(a,b)$ and $(c,d)$ in $\ro$: applying translation and scaling suffices. The same applies for all open balls in $\ro^n;$

- The disk $\bar{B}(0, 1)$ and the square $[0,1]^2$ inside $\ro^2$: this can be described using [polar coordinates](https://en.wikipedia.org/wiki/Polar_coordinates) as $f:[0,1]^2\rightarrow \bar{B}(0, 1),$

$$f(\rho, \theta) = \left( \frac{\rho}{ \max(|\cos \theta|, |\sin \theta|)}, \theta\right).$$

- $\ro$ and the interval $(0,1)$: this may be surprising, but it's true: for topology, the reals and an open interval inside it are really the same. A famous homeomorphism is the **logistic function** $\sigma:\ro\rightarrow (0,1),$

$$\sigma(x)=\frac{1}{1+e^{-x}},$$

which "encapsulates" $\ro$ onto $(0,1).$ Its inverse is the **logit function** $\text{logit }:(0,1)\rightarrow \ro,$ defined as $\text{logit }p=\log\frac{p}{1-p}$-- which is also continuous. Writing the variable here as $p$ is suggestive: the fraction $\frac{p}{1-p}$ can be seen as the odds (30% to 70%, 99% to 1% etc.) of a given event with probability $p$. Thus the logistic function can be seen as a function taking a real number and returning the logarithm of an odd. This makes these two functions widely appliable in statistics, specially in machine learning.

IMG!!! LOGISTIC

Homeomorphisms from $\ro$ to $(0,1)$ are usually called **sigmoids**, due to their graphs being s-shaped.

- $\ro^n$ with the $\mathcal{l}^p$ metrics: these are all homeomorphic as topological. Actually, their topologies are **the exact same**: sure, their balls might be different, but they're open in any other of these metrics as well. This is fundamentally because of the following theorem, which states that, when two metrics are not that different from one another, then they have the same topology:

**Theorem**: If $d_1$ and $d_2$ are two metrics on the same set $X$ and there are constants $K_1, K_2$ such that, for any $x,y\in X,$ we have 

$$K_1 d_2(x,y) \leq d_1(x,y) \leq K_2 d_2(x,y)$$

(in which case the metrics are said to be **equivalent**), then the metric spaces $(X,d_1)$ and $(X,d_2)$ produce the same topology (i.e., every open set in one is open in the other).

This is the case for all the $\mathcal{l^p}$ metrics in any $\ro^n.$ Proving this and the theorem is quite an educative exercise on the relation between metric and topological spaces.

Interestingly, the same can't be said for sets of functions with the $L^p$ metrics: indeed, different $p$ give us completely different topologies. This was actually one of the main sources for defining abstract topological spaces in the earlier 20th century, as many theorems were valid for some $L^p$ distances, and some not for others. This led to the consolidation of **functional analysis**, which is linear algebra applied to the different (infinite dimensional) vector spaces of functions-- an area that later on lead to fundamental advances in quantum mechanics, statistics, topology itself and many other applications.

Beware: **from now on we'll not describe explicitly most of the homeomorphisms we mention!**

Proving that spaces satisfying certain properties are homeomorphic is, in general, hard. However, it may be even harder to prove the opposite: that two spaces *aren't* homeomorphic. Proving the latter is one of the main tasks of topology. Here are some non-homeomorphic spaces and indicatives of thereof:

- $\ro^n$ and $\ro^m$ for different $n,m.$ You think this is obvious? Intuitively, sure-- but not formally! One way to prove it is to show that, after taking the origin from both $\ro^n$ and $\ro^m,$ the holes left in them are of different dimensions-- something that we'll soon study closer when we define homology groups;

- Dimensionality: generally, if two shapes have different dimensions, they aren't homeomorphic. We'll discuss dimensionality properly soon;

- Open and closed intervals: indeed, $(a,b)$ is not homeomorphic to $[a,b],$ and similarly for all open and closed balls $B(x, r)$ and $\bar{B}(x,r)$ in any $\ro^n$. This has to do with the property of compactness, which we'll see later on, but the idea is that in $(a,b)$ you can get infinitely close to the extremities of the interval, without ever getting to them, which doesn't happen in $[a,b];$

- Holes: these are the most important indicatives of non-homeomorphic spaces, and formalizing what "a hole" is will concern us for most of the rest of the series. Examples include: a disk and and its boundary circle aren't homeomorphic since there's a hole in the latter; similarly for, say, a 2D sphere and a cylinder, or with the torus (donut shape): these all have different holes.

We'll also study two properties which are very strong topological invariants in this article: connectivity and compactness. The latter will play an important role in the topological analysis of cellular automata.

## Boundaries and closed sets

One further thing topological spaces allow us to define, in analogy to metric ones, is the notion of the **boundary** of a subset. Think of the open ball $B(0,1)$ in $\ro^2$ and the circle $C$ of radius one which is its frontier. How are these sets topologically related? Visually, even though $B(0,1)$ doesn't contain $C$, its outward points tend to $C$-- in the proper converge meaning. Similarly, every point of $C$ is "topologically glued" to $B(0,1),$ in the sense that, if $x\in C,$ every neighborhood of $x$ intersects with $B(0,1).$ 

This "adherence property" is fundamental to the notion of a boundary:

**Definition**: for a subset $S$ of a topological space $X$, a point $x\in X$ is an **adherent point** of $S$ if, for every neighborhood $U$ of $x,$ $U$ and $S$ intersect: $U\cap S\neq \emptyset.$ Of course, all points of $S$ are adherent to it. The set of all adherent points to $S$ is called its **closure**, written $\bar{S}.$

In the example above, every point in $C$ is adherent to $B(0,1)$ and the closure of $B(0,1)$ is the closed ball $\bar{B}(0,1)=B(0,1)\cup C.$

These notions allow us too to define closed sets (like the closed balls $\bar{B}(x,r)$ in metric spaces) for general topological spaces:

**Definition**: a subset $S$ of a topological space $X$ is said to be **closed** if it's equal to its closure: $S=\bar{S}.$

Now, note that $C=\bar{B}(0,1)\setminus B(0,1).$ The general idea is that **"boundary=closed-open"**. Open sets, since they're "fat" (as we introduced them), visually form the interior mass of a shape, while adherent points form a crust around it. This gives the following definition:

**Definition**: the **interior** of a subset $S$ of a topological space $X$ is the union of all open sets $U$ of $X$ contained inside $S.$ The interior of $S$ is usually written as $\text{int } S.$

IMG!!! CLOSURE, INTERIOR E BOUNDARY (formato q é um disco tangente a um segmento)

With this, the proper formula for the boundary can be given:

**Definition**: the **boundary** of a subset $S\subseteq X$ is its closure minus its interior: $\partial S= \bar{S}\setminus \text{int } S.$

This definition allows us now to use the intuitive notions of boundary and frontier in the general topological context.

Open and closed sets are, literally, complementary notions. For, if $C$ is closed in a space $X$, then $X\setminus C$ is open: otherwise, there'd an $x\in X\setminus C$ with all of its neighborhoods not completely inside $X\setminus C.$ Thus $x$ is an addherent point of $C$ not in $C$-- a contradiction. Conversely, if a subset $C$ is the complement $X\setminus U$ of an open $U$ in $X,$ then all addherent points of $C$ are contained in $C$: for if $x$ is addherent to $C$ but not in it, it is in $X\setminus C= U$ and all its neighborhoods intersect $C$-- implying $U$ isn't open, a contradiction. We thus get:

**Proposition**: a set is closed in $X$ if, and only if, it is the complement of an open set in $X.$

Funnily enough, there are sets that are both open and closed: they're called **clopen** sets. For now, you can see that $X$ and $\emptyset$ are clopen, but we'll meet more subsets of this kind later on.

## Some common topologies

### Basic examples

That should be it for definitions and constructions so far. Let's get into some examples.

First of all, note that every set $X$ can be given a topology: this can be done using the **trivial topology** $\{X, \emptyset\}.$ It's not very interesting: the only open sets are the empty set and $X$ itself. Another less trivial way is to take as basis $\mathcal{B}$ all the one-point subsets $\{x\}$ for $x\in X.$ The resulting topology is the set of all subsets of $X$, and is called the **discrete topology**. It is metrizable by the metric

$$d(x,y)=
\begin{cases}
1, & \text{if } x\neq y\\
0, & \text{else}
\end{cases}
$$

called the discrete metric (note that the ball $B(x,r)$ is just $\{x\}$ for any $r<1$, giving the discrete basis).

You can check that the graph metric described before induces the discrete topology on the set of vertices, no matter the graph.

Similarly, the space $\mathcal{A}^n$ of strings of length $n$ on an alphabet $\mathcal{A}$ with the Hamming distance has the discrete topology, since for any $r<1$ the open ball $B(x,r)$ contains only $x$-- and you can see that the Hamming distance for finite strings is really just an extension of the discrete topology to each position. For infinite strings, however, things get more interesting, as we'll see when studying cellular automata.

Here's a good exercise: prove that, if $(X,\tau)$ is a topological space such that all infinite subsets of $X$ are open, then $\tau$ is the discrete topology. 

You can topologize any union of topological spaces $(X, \tau_X)$ and $(Y, \tau_Y)$ by giving $X\cup Y$ the topology $\tau_X\cup \tau_Y.$ Open sets in $X$ and $Y$ remain open, and there are no open sets with elements both in $X$ and in $Y$: the spaces are "disconnected," so to speak-- a notion we'll later on describe properly. This space is called the **disjoint union** of $X$ and $Y$, and it's custom to denote it as $X\amalg Y.$ Since there's no relation here between the topologies of the two spaces, disjoint unions don't bring anything new and are just used as a formality.
IMG!!!

OTHER TOPOLOGIES FOR SMALL SETS

It's also educative to consider some  !!!!!!!!!!!!!!!!!!!!!

### Spheres and donuts: dimension, intrinsic and extrinsic views

That's all educative and even intersting per se, but where are our cool figures of mind-blowing shapes, our familiar friends the sphere and the torus-- **where are our donuts?!** Indeed, most introductory courses on topology don't really get to these and focus on the more set-theoretical aspects of topology-- the so-called **point-set topology**. This can be frustrating for many beginners, so let me turn to more familiar shapes and spaces.

We know where to start: with the reals $\ro^n.$ In this series, we'll **always** use the metric topology coming from the Euclidean metric-- which is homeomorphic to the one using the other $\mathcal{l^p}$ distances. Of course there are other possible topologies on $\ro$ ([the K-topology](https://en.wikipedia.org/wiki/K-topology) is a common counter-example found in point-set topology textbooks), but the Euclidean one is the only one we'll actually study here.

Sure, we know how to topologize $\ro^n,$ but what about surfaces and other shapes living in it-- like circles and spheres? There are two ways: **extrinsic** and **intrinsic** descriptions.

With extrinsic descriptions, we define our spaces as subsets of some $\ro^n$: for example, seeing the circle as something inside the plane $\ro^2.$ For this, we can use **subspace topology**. Generally, if you have a topological space $(X,\tau)$ and some subset $Y$ of $X,$ you can define the subspace topology $\tau'$ on $Y$ (induced by $\tau$) as 

$$\tau'=\{U\cap Y \text{, where } U \text{ is open in } (X,\tau)\}.$$

You can check that this is a topology for any $s$ and $Y\subseteq X.$ You can also see that, for a metric space $(X,d)$ with the metric topology, the subspace topology of a subspace $Y\subseteq X$ is the same as the metric topology of $Y$ with the restriction of $d$ to it.

It's basically immediate from the definition that, if $Y\subseteq X$ is given the subspace topology, then the **inclusion function** $i:Y\rightarrow X$ sending $y\in Y$ to $y$ itself is continuous. 

For lower dimensional shapes, that's how we tend to think of them: as living inside some larger space. Intrinsic definitions, however, can unsatisfactory for some reasons. First, it limits us a lot: beyond dimension $3$ our visual intuition ceases being that helpful. There are many interesting spaces we'll study in this series that can't be properly seen inside 3D space. 

Second, it is conceptually quite deceiving: being inside some other larger space shouldn't be a defining property of some topological space. Imagine yourself as an ant on the surface of a sphere. You have only two movement directions: forwards/backwards and left/right. Why would you care about some third extra dimension (up/down), if you can't move along it? The sphere might as well be inside a $23$-dimensional space, it is irrelevant for you-- and so it should be for the sphere as a topological space. 

IMGS!!!

This leads us to the **intrinsic** description of spaces: define them without seeing them as embedded in some $\ro^n.$

This all has a lot to do with the notion of **dimension**. By dimension, we usually mean the **degrees of freedom** available in a space: i.e., the general directions of movement possible inside it. This is an intrinsic notion. Because in the sphere as described above the ant has only go forwards/backwards or left/right, we say the sphere is two-dimensional. Similarly, if you were restricted to a circle, you could only go forwards or backwards, and a circle is one-dimensional.

Intuitively, a shape has dimension $d$ whenever it locally "looks like" $\ro^d$. Intrinsically, circle locally looks like a line segment, and the sphere-- seen at a closer distance-- looks like a portion of the plane-- something we experience everyday using maps to represent the small portion of the round planet we live in. 

Some people, however, think it'd be more intuitive to say a sphere is three-dimensional. Now let me ask: is a circle inside the three-dimensional space $\ro^3$ three-dimensional? Of course not! The dimension of a shape doesn't care where you **embedd** it! A sphere could also be embedded in the four-dimensional space $\ro^4$: is it four-dimensional then?! Think of dimension intrinsically, not extrinsically. I.e., dimension is defined as if you could only move in the shape, not from any other, external point of view. 

2D spaces are so common and important that they receive the exclusive name of **surfaces**.

We'll properly define spaces intrinsicaly in the next subsection. For now, let's **finally** get into some concrete examples:

- $\ro^n$: the reals with the Eucliedean distance-- the only topology we'll consider here for them. We know them already;

- Points: sets of a single point ${p},$ with $p\in\ro$ are are said to be 0-dimensional-- we actually define $\ro^0$ as being the set solely containing the origin, $\ro^0=\{0\};$  

- The natural and integer numbers: with the subspace topology, they have the discrete topology. They're seen as 0-dimensional spaces as well;

- Intervals: both open $(a,b)=\{x\in\ro\mid a < x < b\}$ and closed $[a,b]=\{x\in\ro\mid a \leq x \leq b\}$ with subspace topology. These are one-dimensional. The unit interval $[0,1]$ is often just written $I.$

The interval $I$ is a very important space, because we can use it to define paths in any topological space $X.$ We say a **path** in $X$ is a continuous function $p:I\rightarrow X.$ It is common to call the image $p(I)\rightarrow X$ as "the path" as well, instead of the function $p.$

IMG!!!

- Cubes: these are the $n$-dimensional products $I^n.$ A 2D cube $I^2$ is a square and a 3D one a cube in the usual sense. Since $I^n\subseteq \ro^n$, these can get the subspace topology from the reals; but what if we wanted to topologize it without seeing it as embedded in another space? We'll later on see how to give a topology to the cartesian product of spaces;

IMG!!!

- $S^n$: the **spheres**. For $n=2$, we get the sphere (a hollow ball), but also a circle with the same description. These may be realized as the set of points with Euclidean distance equal to 1 from the origin of $\ro^{n+1}$:

$$S^n=\{x\in \ro^{n+1}\mid \sqrt{x_1^2+...+x_{n+1}^2}=1 \}$$

For $n=1$, this is a circle; for $n=2$, the usual shape we mean by a "ball". Note that $S^0$ is, by definition, the two points $\{0,1\}$ inside $\ro;$

IMGS

- $D^n$: the **disks**. There are just the $S^n$ with their hollow interior filled. Equivalently, they're just the closed balls of distance one from the center of $\ro^n$:

$$D^n=\{x\in \ro^{n+1}\mid \sqrt{x_1^2+...+x_{n+1}^2}\leq 1 \}$$

$D^n$ is an $n$-dimensional space, as the index tells. $D^1$ is the same thing as the closed interval $I=[0,1].$

Note that the $S^n$ are the boundary of the $D^{n+1}.$

IMGS

- Cylinder: as a set, this is just $S^1\times I$-- i.e., a circle elongated along one extra dimension. It is a two-dimenisonal space and we see it as a subspace of the three-dimensional space $\ro^3$;

IMG

- The torus $T^2$: this is the shape of a hollow donut. Torii can be concretely described by the internal radius $r$ of the tube and the distance $R$ from the center (usually the origin) of the torus to the center of the tube, with $R>r.$ Algebraically, then, a torus can be seen as the set

$$\{(x,y,z)\in \ro^3\mid (\sqrt{x^2+y^2}-R)^2+z^2=r^2\},$$

where the $(\sqrt{x^2+y^2}-R)^2$ part represents the distance of a point to the tube.

There's a more topological way to describe $T^2$, though. Indeed, any point in the torus can be **uniquely** described by two circular coordinates, i.e., two angles:

1. The "transversal" angle around the whole doughnut;

2. The "longidutinal" around around the tube made by the torus.

IMG!!!

This means that we can specify every point uniquely in $T^2$ by two angles in $S^1$. This is the same as saying that $T^2=S^1\times S^1,$ that the torus is the cartesian product of two circles. The description before, with $T^2$ embedded in $\ro^3,$ allowed us to topologize it as a subspace; we'll soon see how to give it a topology just by seeing it as a product.

IMG!!! GIf do torus formando com dois rcicles

- $n$ handle torus: these are surfaces like the torus, but, instead of one hole in the middle, they have $n$ holes, or, rather, $n$ handles. They're also called the **genus** $g$ **surfaces**, this $g$ being the amount of holes, from $1$ (the standard torus) to as many as you wish;

IMG!!!

- The multidimensional torii $T^n$: based on the description $T^2=S^1\times S^1,$ we define $T^n$ as the product of $n$ circles $S^1$;

### Two bizarre lines: separation and countability axioms

Before we further study the visually intuitive spaces presented above, I'd like to remind the reader that topology is full of counter-intuitive, "pathological" spaces. Here are two bizarre variations of the real line $\ro,$ intended to show that **constructing spaces based on the real numbers can get quite tricky without some proper restrictions**.

The first variation concerns the notion of **separability** in topology. See, one type of argument we often take for granted in metric spaces is how points and sets in them can be separated and distnguished. For example, if you have a point $x$ and another $y$ in your metric space, then there is an open ball $B(x,r)$ containing $x$ but not $y$-- just take $r< d(x,y).$ Similarly, $x$ and $y$ have disjoint open balls containing one but not the other-- just take $B(x,r)$ and $B(y,r)$ with $r < d(x,y)/2,$ the triangular inequality guaranteeing they won't intersect.

IMG!!!

These arguments are very intuitive and almost obvious for metric spaces, but general topological spaces may not satisfy these properties! This gives rise to the **separability axioms**, which is a hierarchy of desirable properties for topological spaces in regards to the separability of points (and subsets too) by open sets. These tell how much we can separate and distinguish points topologically in our space. 

We'll need only one of these axioms, which is the following:

**Definition**: a topological space $X$ is a **Hausdorff space** if, for every pair of distinct points $x,y\in X,$ there are open neighborhoods $U$ of $x$ and $V$ of $y$ such that $U\cap V=\emptyset.$

IMG!!! Hausdorff

The Hausdorff property is sometimes denoted as the **T{{< sub "2" >}} axiom**, with separability properties generally being denoted as some "T{{< sub "n" >}} axiom". You can read more definitions on the [Wikipedia page](https://en.wikipedia.org/wiki/Separation_axiom).

Here's a non-Hausdorff space based on the real line:  the **line with two origins**. As a set, it is $\ro$ with an extra point, called the *second origin* and denoted $0^*$-- that is, $X=\ro\cup \{0^*\}$. All open subsets of $\ro$ remain open in $X.$ If $U$ open in $\ro$ contains $0$, then we define an open set $U^*$ in $X$ which is the same as $U,$ but with $0$ swaped for $0^*.$ That way the origins $0$ and $0^*$ are **topologically inseparable**: there's no neighborhood of one that doesn't intersect a neighborhood of the other. I.e., the line with two origins isn't Hausdorff.

IMG!!!

The second variation of the line deals with the idea of **countability**. This concerns how large your space is by measuring if points in it can be approximated by a smaller subset. The idea is that the reals enjoy a quite useful property: every point in the real line can be approximated by a sequence of rational numbers. This means that there's always a rational as close as you want from a real. Topologically, this implies every neighborhood $U$ of a point $x$ must contain rational numbers-- i.e., that $U\cap \mathbb{Q}\neq \emptyset.$ We say that $\mathbb{Q}$ is **dense** inside $\ro$: generally, a subspace $Y$ of a topological space $X$ is **dense** in $X$ if, for every $U$ open in $X$, we have $U\cap Y\neq \emptyset.$ If $X$ has a countable dense subset-- like $\ro$ in the standard topology does--, it is said to be **separable**.

IMG!!!

But there's a stronger version of this idea. See, rational numbers can actually be used to **generate** all open sets of $\ro.$ If $(a,b)$ is an open interval, then it can be seen as the infinite union $\cup_n^\infty(a_n, b_n),$ with $a_n$ a sequence of rationals larger than $a$ and converging to $a$, and $b_n$ rationals less than $b$ converging to it. This means that the open intervals with rational extremities generate all intervals-- and, thus, form a basis for the standard topology of $\ro.$ This is a stronger property than being dense: not only all open sets can't be separated from the rationals (density), but they're actually all describable using rational numbers!

Generally speaking, we have the following generalization:

**Definition**: a topological space $X$ is **second-countable** if it has a countable basis.

We just proved above that (using the basis $(a, b)$ for $a,b\in\mathbb{Q}$) the reals are second-countable. It is a good exercise on topological bases to prove that all second-countable spaces are separable-- the opposite, however, isn't true.

Before we construct our second bizarre line, we need to define a new kind of topology. See, intervals in $\ro$ are defined using the strict order $ < $ on the line. Instead of using the Euclidean metric, we could equivalently just use this order to define the topology of $\ro$-- and this we can do for general sets as well.

Generally, a **total strict order** on a set $X$ is a (binary) relation between points of $X$ such that 

- Not $a< a$;
- If $a< b$ then not $b> a$;
- If $a< b$ and $b< c,$ then $a< c$;
- If $a\neq b,$ then $a< b$ or $b < a$ (this is the "totality" of the order).

The set $X$ together with some total strict order is said to be a totally ordered set.

With this, we can make the following definition:

**Definition**: the **order topology** on a totally ordered set $X$ is the topology with basis all the intervals 

$$(a,b)=\{x\in X\mid a< x \text{ and } x < b \},$$

for $a,b\in X$ and $a< b.$

There's one special order that will concern us now. If you have a product $X\times Y$ of two totally ordered sets $X$ and $Y,$ then the **lexicographical order** on $X\times Y$ is as follows: if $p_1=(x_1,y_1)$ and $p_2=(x_2,y_2)$ are two pairs, then $p_1< p_2$ if $x_1< x_2$; if $x_1 = x_2,$ then $p_1< p_2$ if $y_1 < y_2.$ That is, like in a dictionary, we first search for the entry on the first coordinate (like our first letter), then, if the values are equal, on the second one.

The lexicographical order allows us to give another definition of the real line. Divide $\ro$ the intervals $I_n=[n, n+1),$ for $n$ an integer. If you want to compare two points $x,y\in \ro,$ you can use this subdivision. First, if, say, $x$ lies in $I_n$ and $y$ in a different $I_m,$ you don't need to go further: if $n>m,$ then $x>y,$ else $x< y.$ If they lie on the same such interval $I_n$, then you need to check who's larger inside $I_n.$

This means $\ro$ is homeomorphic to $\zo\times [0,1)$ with the with the order topology from the lexicographical order-- the homeomorphism being $f:\zo\times [0,1) \rightarrow \ro$ being simply $f(n, x) = n + x.$ I.e., $n\in \zo$ gives the integer part of a number, $x\in[0,1)$ its fractional part. 

This makes sense: the real line is really a (countable) infinite amount of intervals $[0,1)$ attached to one another. But what if this amount becomes uncountable? Then we get this:

**Definition**: the **long line** is the space $\ro\times [0,1)$ with the order topology from the lexicographical order.

Here's an informal way of trying to visualize this definition: the long line is also composed of the intervals $[0,1),$ but between any of two such intervals there is an infinite amount of other ones-- just like in between two real numbers there are infinitely many other ones, and this can't be changed by any reordering. Contrast this to the normal line: there's nothing between two $[0,1)$ attached to each other-- just like there's nothing between two consecutive integers. 

Another way is to see each point of the real line as representing a whole interval-- how colossally infinite is this space?!

IMG!!! PRA CADA REAL, UM [0,1)

The careful reader, however, has probably noted something: the **set** $\ro\times[0,1)$ is actually completely familiar! It can be seen inside the plane $\ro^2$ as an infinite horizontal strip. It doesn't seem so mysterious in this version. The difference lies in topology: $\ro\times[0,1)$ with the Euclidean topology is one thing, with the long line's another one. The latter has an order topology, which can be seen as trying to representing the set $\ro\times[0,1)$ as a huge, zigzagging line. Notice too how open sets in these two topologies are completely different: in particular, the identity $i:(\ro\times[0,1), \tau_1)\rightarrow (\ro\times[0,1),\tau_2)$ sending $x$ to $x$ itself, but between these two different topologies, is not even continuous.

IMG!!! ORDEM EM RX[0,1), LINHA ZIGZAGUEANDO

### Manifolds

#### Topological manifolds

The shapes we described in the penultimate have all the property that, locally, they "look like" some $\ro^n,$ as we previously discussed. Another way of viewing this is saying that $M$ locally looks like some graph of a function. The last section, however, showed that studying spaces based on the reals $\ro^n$ can be quite tricky without restrictions. Here's a definition of the more intuitive spaces that we actually wish to work on:

**Definition**: a second-countable, Hausdorff space $M$ is an $n$**-dimenisonal manifold** if, for every point $x\in M$, there is a neighborhood $U$ of $x$ such that $U$ is homeomorphic to an open subset of $\ro^n.$

We add the conditions of being second-countable and Hausdorff so that we don't have to deal with "long" or "doubled" spaces, in the terminology of the previous section.

See, by the way, how this an intrinsic view of spaces: we don't assume they live inside some $\ro^n$!

We say a pair $(U, \phi)$ of an open subset $U\subseteq M$ and a homeomorphism $\phi$ from $U$ to an open subspace of $\ro^n$ is a **chart**; a collection $\{U_i,\phi_i\}$ of charts with $\{U_i\}$ covering $M$ is an **manifold structure** of $M.$ To prove your space is a manifold, you don't need to find a unique homeomorphism for every point, as long as you can find an structure for the space. It's common to describe manifold structures only by the collection of open sets, when one can assume the reader can describe the homeomorphisms by himself.

The topographic terminology is fitting: every chart can $(U, \phi)$ be seen as defining a **local coordinate** in $U$ based on $\phi$-- that is, describing points locally using cartesian coordinates.

IMG!!!

Here are some descriptions of spaces as manifolds:

- $\ro^n$ and open subsets of them: the spaces themselves together with the identity provide a manifold structure;

- $S^1$: a manifold structure can be given by the open sets $S^1\setminus \{p\}$ and $S^1\setminus \{q\},$ with $p,q\in S^1$ any two points in the circle. You can describe the necessary homeomorphisms if you want to, but visually it should be clear that both sets are homeomorphic to intervals;

IMG!!!

- $S^2$: similarly to the 1D case, $S^2\setminus \{p\}$ and $S^2\setminus \{q\}$ provide a manifold structure, with any $p,q\in S^2.$ Constructing the homeomorphisms can take use of [polar coordinates](https://en.wikipedia.org/wiki/Polar_coordinates);

- $T^2$:

Note, however, that the definition above doesn't allow for bounded spaces, like $D^2:$ a point lying in its circular boundary can't move in 2 directions freely (it can't go beyond the disk). This is easy to solve: instead of considering $\ro^n$, consider the upper **half-spaces** $\mathbb{H}^n,$ with $\mathbb{H}=\{x\in\ro\mid x\geq 0\}$ (i.e., the subspaces of $\ro^n$ of points with only positive or zero coordinates). Give $\mathbb{H^n}$ the subspace topology inside $\ro^n$: then we have open sets with boundaries (those near the boundary of $\mathbb{H}^n$ itself). If we want to allow manifolds with boundaries, then we should use $\mathbb{H}^n$ as a model space, instead of $\ro^n,$ with points in the boundary of our bounded manifold being matched to those on the boundary of $\mathbb{H}^n.$

{{< figure src="ManifoldBoundary.png" caption="Manifolds with boundaries should be based on the upper half-spaces $\mathbb{H}^2$. Work by [Pekkog](https://commons.wikimedia.org/wiki/User_talk:Pekkog)." width="60%" height="60%" >}}

This allows us the following definition:

**Definition**: a space $M$ is an $n$**-dimenisonal manifold with boundary** if, for every point $x\in M$, there is a neighborhood $U$ of $x$ such that $U$ is homeomorphic to an open subset of $\mathbb{H}^n.$

Here are some examples:

- I: the manifold structure can be given using the open sets $[0,1)$ and $(0,1]$ (both homeomorphic to, say, $[0,1)$ inside $\mathbb{H},$ which is open);

- $D^2$: the structure can be given using the open sets $\{(x,y)\in D^2\mid y>-0.1\}$ and $\{(x,y)\in D^2\mid y<0.1\}$

IMG!!!

Here are some examples of spaces that **aren't** manifolds (with or without boundary):

- Branched spaces: visually, these are spaces like manifolds, but with specific points in which the space branches itself, like below. The branching points don't satisfy the manifold property (we'll prove this when studying connectivity);

IMG!!!

- Intersecting figures: lines, surfaces etc. having self-intersections, like the [folium of Descartes](https://en.wikipedia.org/wiki/Folium_of_Descartes) or a [lemniscate](https://en.wikipedia.org/wiki/Lemniscate). These are branched in the intersections.

IMG!!!

Branching intersecting points are examples of **singularities**: points impeding a space of becoming a manifold. [Singularity theory](https://en.wikipedia.org/wiki/Singularity_theory) is a pretty important topic in areas like chaos theory and algebraic geometry.

How do the extrinsic and intrinsic views work together? This is actually quite non-trivial. Formally, if we have a manifold $M$ and another manifold $N$, an **embedding** from $M$ to $N$ is a homeomorphism from $M$ to a subspace of $N.$ We're generally interested if we can embed $M$ on some $\ro^n,$ in such a way that it can be seen extrinsically as inside some $\ro^n.$ For the cases we've been studying so far, this seems possible-- if not obvious. But, as we'll later see, **there are some surfaces that can't be embedded in** $\ro^3$! Generally, it's not clear if every manifold can be embedded inside some $\ro^n.$

Thankfully, we have the following theorem:

**Theorem**: every $n$-dimensional manifold can be embedded inside $\ro^{2n+1}.$

Its proof is, frankly, quite long and tedious. It is proven by Munkres in different sections of his book, beginning at 4-5 ("Partitions of Unity") and being properly concluded at 7-9 ("An Introduction to Dimension Theory").

#### Smooth manifolds

**This section is skippable for most of the series**, but, if you know some calculus, it presents one of the most important concepts of all of topology.

There's another very important class of manifolds: **smooth manifolds**. These rely on calculus, so we we'll try to avoid them until necessary, but the idea is that they locally look like graphs of smooth functions (a function $f:\ro^n\rightarrow\ro^m$ is smooth if every one of its components can be differentiated infinitely many times everywhere). This avoids stuff like sharp corners: the perimeter of a square, for example, is a manifold, but not a smooth one because of its corners, which aren't smooth. With this, you can do calculus-- i.e., computing curvatures and areas-- inside these spaces, which is extremely useful and powerful.

How to formalize this intuition? Imagine the simple case of some continuous function $f:M\rightarrow \ro,$ and say we want to find the derivatives of $f$ on a point $p\in M.$ We know how to do this if $M$ were some $\ro^n$: express this function in terms of coordinates $x_1,...,x_n$ and then compute the partial derivatives $\pard{f}{x_i}(p)$ on $p.$ But what is a partial derivative? It's the change of $f$ in the direction $i.$ Formally, if you have a path $\gamma:(-1,1)\rightarrow \ro^n$ with $\gamma(0)=p$ (i.e., $p$ is in the center of $\gamma$)QQQQQQQGAMMA CAMINHOEHQCAMINHO, then you define the partial derivative $\pard{f}{x_i}(p)$ as

$$\pard{f}{x_i}(p)=\frac{d}\frac{dt}f(\gamma(t))\right_{t=0}$$

1) O Q EH SER CAMINHO DIF. PROB: E SE MUDAR A PARAMETR? EXIGE-SE Q SEJAM COMPATIVEIS; IMG Q É ASSIM: TOMA-SE UMA PARAMETRIZAC PHI. DAÍ CURVA DOUTRA PARAMETRIZAC N SENDO SMOOTH, MAS RETA, N PODE

4) DERIVADA. EH DIF A DEP DA PARAMETRIZAC. TRANSITION FUNCTIONS MOSTRAM COMO Q IR DE UMA DERIVADA A OUTRA

2) NÚMEROS VS VETORES

3) VETORES TANGENTES


QUESTÃO CONCEITUAL: NÚMEROS VS VETORES TANGENTES



IN SEARCH FOR DERIVATIVES: PATHS, THEN OF COURSE PARAMMETRIZATIONS MUST BE DIFFERENTIABLE. DPS: TRANSITION FUNCTIONS MOSTRA COMO IR DE UMA DERIVADA A OUTRA



The problem is that $M$ might not be $\ro^n.$ What should we do then? Well, if $p$ is contained in a chart $(U,\phi),$ then $f$ can't be directly derivated, but $f\circ \inv{\phi}$ is a function of type $\ro^n\rightarrow \ro,$ whose partial derivatives can be computed. What $f\circ \inv{\phi}$ means is that we're seeing some open subset of $\ro^n$ (the set $\inv{\phi}(U)$) as a parametrized version of $U,$ and then applied $f$ to this local parametrization. 

Why not then define the derivatives $\pard{f}{x_i}(p),$ for $p\in U,$ as those of $f\circ \inv{\phi}$? There's an issue: if $p$ is inside another chart $(V,\psi),$ what if we use $\phi$ instead of $\phi$ to get $f\circ \inv{\psi}$? Would the derivatives using different parametrizations be the same? A simple example shows that no: for the interval $(0,1)$ take $f:(0,1)\rightarrow$ as the identity. As charts, choose $\big((0,1), i\big),$ with $i$ the identity, and $\big((0,1), g\big),$ with $g(x)=2x.$ Then $f\circ\inv{i}(x)=f(x)=x$ and $f\circ \inv{g}(x)=f(x/2)=x/2,$ with these two functions having different derivatives. 

That is, 

First of all, give our space $M$ a manifold structure. How do we . Simple: turn these functions into functions of the type $\ro^n\rightarrow \ro^n,$ with which we know how to do calculus. For two charts $(U, \phi)$ and $(V, \psi),$ this can be done by beginning in $\ro^n$ and using the inverse $\inv{\psi}$ to go to $V\subseteq M$; then apply $\phi$ over the intersection $U\cap V$ to get back to $\ro^n.$ Thus we get

$$\phi\circ\inv{\psi}:\psi(U\cap V)\rightarrow\phi(U\cap V)$$

Functions of this type are called **transition functions**. Intuitively, it means that we are begin with the region $\psi(U\cap V),$ which 


**Definition**: a space $M$ is an $n$**-dimenisonal smooth manifold** if it is a manifold with a maximal atlas.

MAXIMAL ATLAS, detalhes no tu, SMOOTH STRUCT

General manifolds, as defined previously, are called **topological manifolds**, in contrast to those for which a smooth structure is given.

There are some topological manifolds which admit no smooth structure at all (eg, the [Kervaire](https://en.wikipedia.org/wiki/Kervaire_manifold) or [E8](https://en.wikipedia.org/wiki/E8_manifold) manifolds), and some others that have different non-diffeomorphic smooth structures (like the [exotic spheres](https://en.wikipedia.org/wiki/Exotic_sphere) found by [John Milnor](https://en.wikipedia.org/wiki/John_Milnor)). The interaction between the purely topological and the smooth worlds is still an area of much research.

Here's a stronger embedding theorem:

**Whitney embedding theorem**: every $n$-dimensional smooth manifold can be embedded inside $\ro^{2n}.$

### Topologies on cartesian products

We've seen above that many interesting spaces can be formed using cartesian products. These include boxes, the cylinder and torii, but also the space of strings $\mathcal{A}^n.$ We were able to topologize these either using the metric or subspace topologies, but what if we didn't have these? How to generally give a topology to the product of topological spaces?

Consider first the case of a product$X\times Y$ between two spaces $(X,\tau_X)$ and $(Y,\tau_Y).$ A natural idea would be to define the topology

$$\tau=\{U\times V\mid U\in \tau_X, V\in \tau_Y\},$$

i.e., open sets should be product of open sets in each coordinate. If $\pi_1:X\times Y\rightarrow X$ and $\pi_2:X\times Y\rightarrow Y$ are the corresponding projections onto the $n$-th coordinate (i.e., $\pi_1(x,y)=x$ and $\pi_2(x,y)=2$), then this topology is the minimal topology with $\pi_1$ and $\pi_2$ continuous.

This idea works fine for products of finitely many spaces, but for technical reasons it gets tricky with infinite products. The following definition works for both cases:

**Definition**: given a product $\prod_{i\in I} X_i$ of topological spaces $(X,\tau_i)_{i\in I},$ the **product topology** on $\prod_{i\in I} X_i$ is the topology whose open sets are of the form

$$\{\prod_{i\in I}U_i\mid U_i \text{ is open in } X_i \text{, and only for finitely many } i \text{ we have }U_i\neq X_i\}$$

Quick reminder: the $I$ in $\prod_{i\in I} X_i$ is an *index set*, and can be any set you want. For finite products, it's just $\{1,...,n\}$ for some $n$; for infinite ones, it can be the whole natural numbers $\mathbb{N},$ the integers $\zo$ or anything you want!

If the spaces $X_i$ are homeomorphic to $Y_i,$ then the product $\prod X_i$ is homeomorphic to $\prod Y_i,$ by applying homeomorphisms on each coordinate.

If you leave the condition that only finitely many $U_i$ are not the whole $X_i$ themselves and take only the topology $\{\prod_{i\in I}U_i\mid U_i \text{ is open in } X_i\},$ you'll get the so-called **box topology**, which is of interest for pure point-set topology, but not really for us in this series.

Now, if you topologize all the products we considered so far with this product topology, **will it be the same space**? I.e., is, for example, $\ro^n$ with the Euclidean topology the same as with the product one? **Thankfully, the answer is yes, and so it is for every other product we've met so far**. Still, it is good to know how to define a topology for any product you want.

PROD MANIFOLDS

### Gluing spaces: quotients

EQUIVALENCE CLASSES
WELL-BEHAVED, SIGNIFICADO

**Topologically, making equivalences can be seen as gluing points together.** For example, imagine I have a segment of line (i.e., an interval) $I=[0,1]$ and I want to glue its endpoints to make a circle $S^1.$ Mathematically, all you need to know is to define an equivalence on $I$ such that $0\sim 1$ and all other points are equivalent only to themselves, getting a quotient $\quot{I}.$ Now the extremities are really one and the same thing.

{{< figure src="intervalS1quotient.png" caption="Illustration of the relation $\quot{I}\cong S^1$ given above. Work by [MaxFischerUCPH](https://commons.wikimedia.org/wiki/User_talk:MaxFischerUCPH)." >}}


How do we topologize these spaces though? It's actually pretty simple: all we want is that the gluing function $q:X\rightarrow \quot{X}$ be continuous, which visually is quite sensible. This gives us the following:

**Definition**: the **quotient topology** over $\quot{X}$ is the smallest topology such that $q:X\rightarrow \quot{X}$ is continuous. Equivalently, it is the topology of all $U\subseteq \quot{X}$ such that $\inv{q}(U)$ is open in $X.$

From the definition, you can see that, if $U$ is an open set $X$ such that its elements are equivalent only to themselves, then $q$ restricted to $U$ is a homeomorphism: i.e., $U$ is not altered in the quotient topology.

Generally, if you have a space $X$ and a subspace $A\subseteq X,$ you can collapse $A$ onto a single point using the relation $\sim_A$ such that $a\sim_A b$ for all $a,b\in A$ and all other points of $X$ are equivalent only to themselves. In this case, we don't write $X/{\sim_A},$ but rather $X/A,$ a space often called the **quotient of** $X$ **by** $A.$

In this notation, the homeomorphism $\quot{I}\cong S^1$ is the same as $I/\{0,1\}\cong S^1.$ It can now be formally proven: indeed, the function $f:I/\{0,1\}\rightarrow S^1$ is given by $f([t])=(\cos(t),\sin(t))$ (seeing $S^1$ embedded in $\ro^2$) is a homeomorphism. It is well-defined because we have $f([0])=f([1]),$ and bijective too. You can prove that it and its inverse are both continuous.

The case of $I$ and $S^1$ can be generalized by noting that $I=D^1$ and $\{0,1\}=S^0.$ One dimension higher, if you have $D^2$ and glue its whole $S^1$ boundary onto a single point, you get a sphere $S^2.$ Thus, $D^2/S^1\cong S^2,$ and in general we have $D^n/S^{n-1}\cong S^n$ (you can try proving this). Cool: we're starting to do some algebra with spaces!

IMG!!!! D2/S1

The notation is suggestive: it's almost as if we were dividing $X$ by a $A$-- imagining $A$ as a "factor" of $X.$ But "suggestive" is the best we can say, as it actually doesn't really follow algebraic rules like division. There's also somewhat of a shock of notations here: if $0$ denotes a generic point in $X,$ then $X/0$ is really, by definition, homeomorphic to $X$ itself: $X/0\cong X.$

For simpler quotients, open sets in $\quot{X}$ can be easily visualized. It is as if the glued regions worked as "portals" open sets can now tranverse.

IMG!!!

One common kind of quotients are **wedge sums**, which consist of joining different spaces on a single point. Formally, the wedge sum between spaces $X$ and $Y$, written $X\vee Y,$ is the quotient $\quot{X\amalg Y}$ with the relation $x_0\sim y_0$ for two fixed points $x_0\in X$ and $y_0\in Y.$ You can prove that different choices of $x_0, y_0$ give homeomorphic spaces, so that we're allowed to speak of **the** wedge sum $X\vee Y.$

IMG!!! S1 WEDGE S1

Generally, if you have two distinct spaces $X$ and $Y$ and you want to glue points $x$ of $X,$ all lying in a specified subspace $A\subseteq X,$ to points $g(x)$ in $Y$ (with $g:A\rightarrow Y$ any function), then all you need is to take the relation $\sim$ in $X\amalg Y$ with $x\sim g(x).$ The quotient $\quot{X\amalg Y}$ then will represent the spaces glued together at the specified points.

IMG!!! parágrafo acima

In the article on homology, we'll further describe many spaces as quotients.

## Connectivity

If topology gives us a notion of proximity, can it define a notion of connectivity of a space? Take the example of the union of the intervals $(0,1)$ and $(2,3)$ in $\ro.$ Intuitively, their union forms a disconnected subspace. One might then be tempted to say that this is because they're disjoint, and we're done. But then consider $(0,1)$ and $\{0,1\}$-- i.e., $(0,1)$ and its boundary. These are disjoint sets, but their union forms the interval $[0,1],$ which feels connected, and so mere set theoretical disjointness can't explain the intuition of connectivity. 

What pure set theory lacks is the notion, as we saw above, of addherent points. Sure, $(0,1)$ and $\{0,1\}$ are disconnected, but the later are addherent to the first. The points $0$ and $1$ can't really be separated from the interval $(0,1)$-- they're "connected" to it. This leads us to say that a space $X$ should be disconnected if there are disjoint subsets sets $A,B$ covering it, with $A$ and $B$ sharing no addherence relation-- i.e., no point in one is addherent to the other. 

This implies $A$ and $B$ above are closed: if $x$ is addherent to $A,$ it must be in $A$ or else it would contradictorily be in $B$-- and similarly for addherent points of $B.$ But then $A$ and $B$ are also open, since $A=X\setminus B$ and $B$ is closed- and similarly for $B.$ In particular, $A$ and $B$ are **clopen sets!** This leads us to the more common definition of connectivity:

**Definition**: a topological space $X$ is called **connected** if there are no disjont open sets $U,V$ such that $U\cup V = X.$ Otherwise, it is said to be **disconnected**, and we'll say $U$ and $V$ separate $X.$

You can check that, if $U,V$ separate $X,$ they must be clopen.

The largest connected subset containing a point $x\in X$ is said to be its **connected component**. Any space can be divided into connected components.

It's easy to see that connectivity is a **topological invariant**. Indeed, if $f:X\rightarrow Y$ is continuous and $X$ connected, then $\im f$ is also connected; otherwise, if it could be divided into two disjoint open sets $U,V$ in $\im f,$ then $\inv{f}(U)$ and $\inv{f}(V)$ would be open, disjoint (there can be no $x\in \inv{f}(U)\cap \inv{f}(V)$ since it would imply $f(x)\in U\cap V$) and cover $X$, a contradiction. That is,

**Proposition**: continuous functions preserve connectivy between their domains and images.

An important theorem is that intervals in $\ro$ (and in any order topology too) are connected. This must be proven, but we'll not do that here-- you check Munkres for it. This can then in its turn be used to prove that the entire line $\ro$ is connected, by using the result (a good exercise) that, if $A,B$ are connected subspaces of a space $X$ with non-empty intersection, $A\cup B$ is connected. Since $\ro$ can be seen as a chain of open intervals-- as $\bigcup_{n\in \zo} (n-1, n+1),$ for example--, then the line must be connected. 

IMG!!! 

Take this together with the last proposition and you immediately get an important theorem from calculus:

**Intermediate value theorem**: if a continuous function $f:X\rightarrow \ro$ obtains values $a$ and $b,$ with $a< b,$ then there must exist a $x\in X$ obtaining an intermediate value: $a < f(x) < b.$

IMG!!!

Furthermore, the product of connected spaces is connected as well. Every quotient of a connected space is also connected. Both proofs are quite simple and work by assuming disconnectedness and then finding a contradiction with the connectivity of the original spaces.

Connectivity can be used to prove some spaces aren't homeomorphic. The classical example is that of $\ro$ and $\ro^n,$ for $n>1.$ For, if you take the origin away from the line, you get a disconnected space with two components: $(-\infty,0)$ and $(0,\infty).$ But if you do the same for any other $\ro^n,$ $n>1,$ you still get a connected space. Thus these two can't be homeomorphic. You can use a similar trick to prove that branched spaces aren't manifolds.

Beyond this notion of connectivity purely based on sets, there's another intuitive one: visually, we think of connected figures as those in which every two points can be connected by a line. Thus we get the following definition:

**Definition**: a topological space $X$ is called **path-connected** if, for every two points $x,y\in X,$ there's a path $p:I\rightarrow X$ starting in $x$ and ending in $y$ (i.e., $p(0)=x$ and $p(1)=y$).

Path-connectedness is also a topological property. Indeed, if $f:X\rightarrow Y$ is continuous and $X$ path-connected, so is $\im y$: if $f(x),f(y)$ are in $\im f,$ $x$ and $y$ can be connected by a path $p$ in $X,$ and so $f\circ p:I\rightarrow \im f$ connects $f(x)$ to $f(y).$ Thus:

**Proposition**: continuous functions preserve path-connectivy between their domains and images.

Path-connectedness implies connectedness: for if $X$ were path-connected but had $U,V$ separating it, then if $p$ is a path connecting $u\in U$ and $v\in V,$ $\inv{p}(U)$ and $\inv{p}(V)$ will be disjoint open sets covering $I,$ which is absurd.

Is the converse true-- i.e., are all connected spaces path-connected. The answer is negative. The classical example is the [topologist's sine curve](https://en.wikipedia.org/wiki/Topologist%27s_sine_curve), which is the subspace of $\ro^2$ formed by the graph of the curve $f(x)=\sin (\frac{1}{x})$ (with $x\in (0,1]$) joined with the origin.

IMG !!!!

The topologist's sine curve is connected, since the graph of $f$ is connected and the origin is addherent to it. But there's no continuous path connecting a point in the graph to the origin. Try to make visualize it and make this is somewhat intuitive-- proving it is a bit tedious so we won't do it here. 

## Homotopy

### Paths and holes

Beyond homeomorphisms, there's another notion of equivalence between spaces: **homotopy**. **We say two spaces are "homotopical" when you can continuously transform one into the other over time**. 

A circle and a square should be seen as homotopical since one can be transformed into the other in a continuous process. But this notion is even stronger: a disk and a point are homotopical since you can continuously shrink the disk in time until you get a single point (say its center). But you intuitively shouldn't be able to modify a disk into its boundary circle in this way. 

On the other hand, if you take the center point of the disk, this can be done by pushing points towards the boundary along a radial line. Similarly, a cylinder and a circle should be homotopical since you can flatten the first into the later-- but still preserving the hole in the middle. These are good indications that the notion of homotopy might be a good notion to identify holes: let's formalize it!

IMG!!! IBAAAAAAAAAGENS

Let's begin with the simplest case: that of a paths in our space $X,$ which can be used as probes to explore the topology of $X.$ Begin with two paths $p,q.$ To say we can "continuously transform" path $p$ into $q$ means that, for a time value $t$ in the range $[0,1],$ we have a path $p_t,$ representing the transformation at $t,$ with $p_0=p$ and $p_1=q,$ so as to begin with $p$ and end with $q.$

IMG!!!

How can we actually tell if these $p_t$ evolve "continuily"? This can be done by writting the process as a function $H:I\times I\rightarrow X,$ with $H(s,t)$ equal to $p_t(s)$-- i.e., the first coordinate is spacial, the second temporal. We should then have $H(s,0)=f(s)$ and $H(s, 1) = g(s)$. If $H$ is continuous we then say the transformation is too as well.

That's what we have:

**Definition**: a **homotopy** between two paths $f:I\rightarrow X$ and $g:I\rightarrow X$ in a space $X$ is a continuous association of paths $p_t$ for every $t\in I$ such that $p_0=f$ and $p_1=g.$ More formally, it is a continuous function $H:I\times I\rightarrow X$ such that $H(s,0)=f(s)$ and $H(s,1)=g(s).$ When $f$ and $g$ are **homotopic** (i.e., there's a homotopy between them), we write $f\simeq g.$

Homotopy is a sort of "path between paths", so to speak. You can check that it is an equivalence relation between paths in $X$: that is, $p\simeq p$ for all paths $p$; $p\simeq q$ implies $q\simeq p$; and, most importantly, $p\simeq q$ and $q\simeq r$ implies $p\simeq r$ (i.e., homotopy of paths is transitive). The set of the equivalence class of this relation is written as $[I,X].$

It is a further indicative of the importance of homotopy that $[I,X]$ is fundamentally related to the connectivity of $X.$ See, if we have paths $p$ and $q$ lying on the same path-connected component of $X,$ then they're homotopic: for if $r$ is a path between the end of $p$ and the beginning of $q,$ then the path $p$ can be brought to $q$ along $r.$ More explicitly, if $f:I\rightarrow X$ is the path which travels through $p,$ then $r$ and $q,$

$$f(x)=
\begin{cases}
p(3x), & \text{if } 0\leq x\leq \frac{1}{3} \\
r(3x), & \text{if } \frac{1}{3} \leq x\leq \frac{2}{3}\\
q(3x), & \text{if } \frac{2}{3}\leq x\leq 1
\end{cases}
$$

then a homotopy between $p$ and $q$ is given by $H(x,t)=f(\frac{x}{3} + \frac{2t}{3})$-- i.e., $H$ slides $p$ into $q$ along $f$ along time $t.$

IMG!!!

Conversely, if paths $p$ and $q$ are homotopic, then for each point $x\in I,$ $H(x,t)$ is a path from $p(s)$ to $q(s),$  so that all points in both paths being in the same path-componnent. **Thus the elements of** $[I,X]$ **represent exactly the path-connected components of** $X,$ with the class $[p]$ being associated to the path-componnent of path $p.$

IMG!!!

There are many variations of path homotopy. For example, we can also consider homotopy with **fixed endings**-- i.e., where we require that all paths have the same end points. This means enforcing extra conditions $p_t(0)=x_1$ and $p_t(1)=x_2$ for all $t.$ This homotopy is also an equivalence relation, and its set of equivalence classes is written $[(I,0,1), (X,x_1,x_2)].$ 

What the notation $[(I,0,1), (X,x_1,x_2)]$ means is that we restrict ourselves to maps and homotopies seding $0$ to $x_1$ and $1$ to $x_2.$ In general, if you have subspaces $A_i\subseteq I,$ and $B_i\subseteq X,$ then you have a set of classes $[(I, A_1, A_2,...), (X, B_1, B_2,...)].$ Each class is represented by paths $p:I\rightarrow X$ such that $p(A_i)\subseteq B_i$ and the equivalence is given by homotopies of the form $H:I\times I\rightarrow X$ such that each path $H(x,t)$ for $x$ fixed is of the desired type of paths (i.e., those sending $A_i$ to $B_i$). These general homotopies will be handy later on.

Note that $[(I,0,1), (X,x_1,x_2)]$ considers only paths beginning in $x_1$ and ending in $x_2,$ and if we wanted to include those with reverted end points we should then use $[(I,\{0,1\}), (X, \{x_1,x_2\})].$

A particularly important set of homotopy classes is $[(I,\{0,1\}), (X, x_0)],$ as it represents **homotopy of loops** at a chosen point $x_0$-- i.e., of paths $p$ with $p(0)=p(1)=x_0,$ and homotopies fixing this point $x_0.$

IMG!!!

One of the main uses of path homotopy is to use paths as probes with each you can explore your. Beyond $[I,X]$ and its relation to path-connectivity, loop homotopy is fundamental because of the two following intuitive considerations:

- Take the space $X,$ which is $D^2$ with a smaller disk taken away from it, and let's consider homotopy of loops in it. Some loops don't go around the empty middle region. These can be slowly shrunk until they're the constant paths $p(x)=x_0,$ for all $x\in I$-- i.e., the paths can be shrunk to the single point $x_0.$ However, some loops do go aroung the "hole" left over, and, intuitively, these can't be homotoped to $x_0.$ These are "detecting" the hole, so to speak, and are a loop homotopy class different from those that don't go around it;

- Take the same $X$ as above. It doesn't matter only if a loop goes around the hole, but **how many times** it goes around. Intuitively, this should homotopically distinguish loops too. Orientation matters too: a loop goin clockwise around the hole can't really be homotoped to one goind counter-clockwise.

IMG!!!

This all indicates that $[(I,\{0,1\}), (X, x_0)]$ is able to detect holes in a space $X$; further, it distinguishes the amount of times a loop goes around a hole. These are indicatives of an underlying algebraic structure, and, indeed, we can properly define how to "join" two loops together, getting an operation that makes $[(I,\{0,1\}), (X, x_0)]$ an algebraic structure called a **group**. This is called the **fundamental group** of $X,$ written $\pi_1(X).$ In the examples above, $\pi_1(X)$ can be seen as the group of integers $\zo$: a loop going counter-clockwise $n$ times around the hole is associated to the number $n,$ and one doing so $n$ times clockwise to $-n.$ But this will be a topic for a further article on its own.

Homotopy of paths seemed to be a very powerful tool to study spaces. Let's generalize it!

### General homotopy

Homotopy of paths was great, but remember our initial motivation of homotopy as a notion of equivalence between spaces-- not only paths--, much like homeomorphisms.´

Thankfully, the general definitions are almost immediate now. Substituting paths by any sort of mapping from a space $X$ to another one $Y,$ we get

**Definition**: a **homotopy** between two continuous maps $f:X\rightarrow Y$ and $g:X\rightarrow Y$ is a continuous function $H:X\times I\rightarrow Y$ such that $H(x, 0)=f(x)$ and $H(x,1)=g(1)$.

IMG

Similarly to above, homotopy is an equivalence relation. We denote the set of its classes as $[X,Y],$ and we may generalize as above to get $[(X,A_1,A_2,...), (Y,B_1,B_2,...)].$

Note, for example, that $[(I,\{0,1\}), (X, x_0)]$ is fundamentally the same thing as $[(S^1, p), (X, x_0)],$ with $p$ some fixed point of the circle, since the endpoints $\{0,1\}$ of $I$ are fundamentally glued together as they're both sent to $x_0.$

Now, for each $X$ and $Y,$ $[X,Y]$ is a whole world of topology-- usually a very difficult one to completely specify. Indeed, most branches of (algebraic) topology can be seen as the study of some $[X,Y],$ for specific $X,Y.$ This includes homotopy groups, homology, cohomology, cobordism and many other interesting theories we'll have the opportunity to study in this series. Describing a topological theory as the study of some $[X,Y]$ is one of the tasks of [spectra theory](https://en.wikipedia.org/wiki/Spectrum_(topology)), a branch of algebraic topology probably way beyond anything we'll actually see in Topology for Artists.

Anyway, now that we know how to describe general homotopies, we know what it should mean to say two $X,Y$ spaces are "homotopically equivalent": 


### A stronger view: isotopy and knots

One way is to, similarly with path homotopy, see your space as embedded into another one, and considering continuous transformations *inside this larger space*. This is called isotopy, and the definition is an immediate generalization of path homotopy:

**Definition**: an **isotopy** between two embeddings $f:X\rightarrow Y$ and $g:X\rightarrow Y$ is a continuous function $H:X\times I\rightarrow Y$ such that $H(x,0)=f(x),$ $H(x,1)=g(x)$ and, for every fixed $t$, $H(\cdot, t):X\rightarrow Y$ is a homeomorphism.

IMG!!!

EX DE N ISOTOPIA (-1 EM [-1,1])

The most common and intuitive application of isotopy-- one we use day to day and have engraved in our spatial perception of the world-- are knots. Mathematically, knots are seen as embeddings of the circle:

**Definition**: a **knot** is an embedding of $S^1$ in some space, generally taken to be $\ro^3.$ Two knots are said to be the same if they are isotopic.

Note that this definition considers only knots with their ends joined-- those with free ends are all isotopic to the segment $I,$ so not much can be topologically said without gluing ends.

We generally study knots by planar figures of them. The least amount of crossings such a figure for a knot has is called the **crossing number** of the knot.

IMG!!! Knot 3D E FIGURA

Knot theory is a vast area of topology and still actively researched. Its main goals, fundamentally, are to classificate all knots, and tell whenever two arbitrary knots are equivalent or not. This might be done using "knot invariants", which are quantities or properties that don't change with isotopies and may help us distinguishing knots. Still, both tasks are insanely difficult and probably will never be fulfilled.

Here's a table of knots with small crossing numbers:

IMG!!! KNOT TABLE, KNOT ATLAS

Knot theory is a beautiful area of study, specially because many of the invariant aren't actually hard to compute-- even though finding and proving they're invariant might be. In the early and mid 20th century, it was developed as an application of algebraic topology and a challenge to its concepts. Later in the century, deep and fascinating relations between knots and physics-- specially statistical mechanics and quantum field theory-- were found, leading to major breakthroughs in knot theory. New invariants were found and interpreted as invariant properties of certain physical systems-- like the [Ising model](https://en.wikipedia.org/wiki/Ising_model), a simplified model of magnets. 

Knots, in general, are just fascinating per se. They have a certain "thingness" to them: each knot is an object by itself, and there's a pleasure in studying each of them-- like a collection of some sort. Unlike collections of plants, insects or whatever it be, a single knot can take a multitude of appearances, so that you never know if a complicated knot might actually be an old friend in disguise. The generation principle of this multitude is isotopy in 3D space, but also the vast combinatorial possibilities of how to slide strings into holes. Their local simplicity makes them even more interesting: they're just lines, 1D spaces. They're "thin", "topologico-combinatorial" "things", if we want to describe the "phenomenology" of knots.

Despite the incredible richness of this mathematical theory, it would be a great pity to limit oneself to the theoretical world. One principle of this series is that we should remain curious to all aspects of a thing. And then we reach a truly infinite branch of human activity when we study knots in the real world-- their use in the naval world, in fabrics, hitching, heraldry and semiotics, and much, much more. A more careful exposition of both the mathematical and practical sides will be given when we study homotopy further, in a dedicated post.

The classical encyclopedic reference on knots in the real world is **The Ashley Book of Knots**, a magnificent work with almost four thousand entries and seven thousand illustrations. 

Since the book is already copyright-free, [here's a pdf for you](/pdfs/ashley.pdf).

IMGS!!! ANIMAIS NO ASHLEY. 

Going back to the notion of homotopy, however, we find a problem-- well, actually it was found in the 19th century. Since isotopy by definition depends on embedding a space $X$ inside a larger $Y,$ it isn't clear if it tells us something about $X$ or $Y,$ or even about their relation. $X$ might have one isotopy behaviour inside $Y$ and a completely different one in $Z,$ so that actually isotopy is not a property *of a space*, but rather *between spaces*.  That's interesting, but not really what we wanted: we wished to use the notion of homotopy to study topological properties of *one* space, but now we'd have two study *two*! 

A classical example proved by [Klein](https://en.wikipedia.org/wiki/Felix_Klein) is that all knots embedded in $\ro^4$ are isotopic to the unknot-- i.e., they can all be untied in 4D space. The extra dimension that allows you to do that: this is similar to how we can "free" a shape contained into another in the plane by lifting it in 3D space and then putting it back in the plane, but outside the other figure. 

IMG!! OU GIF!!

That there are no knots in 4D space has lead -- a the great encyclopedist, but notoriously rea!!!!!ctionary of knots--

*To me the simple act of tying a knot is an adventure in unlimited space. A bit of string affords a dimensional latitude that is unique among the entities. For an uncomplicated strand is a palpable object that, for all practical purposes, possesses one dimension only. If we move a single strand in a plane, interlacing it at will, actual objects of beauty and of utility can reulst in what is practically two dimensions; and if we choose to direct our strand out of this one plane, another dimension is added which provides opportunity for an excursion that is limited only by the scope of our own imagery and the lenght of the ropemaker's coil.*

*What can be more wonderful than that?*

*But there always seems to be another car ahead in every likely parking space. Here is a Mr. Klein who claims to have proved* (Mathematische Annalen) *that knots cannot exist in space of four dimensions. This in itself is bad enough, but if someonse else should come forward to prove that heaven does not exist in three dimensions, what future is there left for the confirmed knot tier?*

IMG!!! MARIA DESATANDO NÓS

If isotopy can't tell us much about a single space $X$, how can we make homotopy a strong classification method for spaces, like homeomorphisms? An intrinsic view makes itself necessary.

### Intrinsic view: homotopy equivalence

Thankfully Ashley's knot-hell can be untied with an intrinsic view of homotopy, independent of any embeddings. It will still kill knots for now, but a later article will show how to redeem them.

A rather elegant way to get an intrinsic view of homotopy is to say that two spaces are homotopic if "their homotopy of paths work the same". We can formalize this by analogy with bijections in set theory, or homeomorphisms in topology: given a path $p$ in $X,$ we want continuous functions $f:X\rightarrow Y$ and $g:Y\rightarrow X$ such that 

$$g\big(f(p)\big)\simeq p \text{ and } f\big(g(q)\big)\simeq q,$$

for all paths $p$ in $X$ and $q$ in $Y$-- in the very same way a function $f:X\rightarrow Y$ is bijective whenever there's some $g:Y\rightarrow X$ (usually written $\inv{f},$ the inverse of $f$) such that $g\big(f(x)\big)=x$ and $f\big(g(y)\big)=y,$ for all $x\in X$ and $y\in Y,$ and similarly for homeomorphisms when we consider continuous functions. Note, however, that we're not using equality, but rather the homotopy equivalence $\simeq$ of paths, so that we're properly in the "homotopical world". The function $f$ is called then a **homotopy equivalence** and $g$ its "**homotopy inverse**".

IMG!!! BIJEÇÃO E EQUIV

More concisely, a homotopy equivalence is a continuous function $f:X\rightarrow Y$ inducing a bijection between homotopy equivalence classes of paths in $X$ and $Y$-- i.e., $f$ applied to paths gives such a bijection of classes.

That is, in the same way that a homeomorphism shows that homeomorphic spaces are actually only different labelings of the same thing, a homotopy equivalence should show us that homotopically equivalent spaces have the same homotopy of paths, just with different labels for these. For every path $p$ in $X,$ you can get one in $Y$ using $f,$ and then go back to the same (homotopically saying) $p$ with $g,$ so that there's no "homotopical loss of information" with $f.$

Another common way to define equivalence is by first defining a general notion of homotopy between functions:

**Definition**: a **homotopy** between two continuous maps $f:X\rightarrow Y$ and $g:X\rightarrow Y$ is a continuous function $H:X\times I\rightarrow Y$ such that $H(x, 0)=f(x)$ and $H(x,1)=g(1)$.

Which allows us to state equivalence more clearly as a sort of "bijection up to homotopy":

**Definition**: two spaces $X,Y$ are **homotopically equivalent** if there are continuous functions $f:X\rightarrow Y$ and $g:Y\rightarrow X$ such that $f\circ g \simeq \text{id}_Y$ and $g\circ f \simeq \text{id}_X.$ We may also say that $X$ and $Y$ have the same **homotopy type**.

You can check that the given definitions are equivalent and that homotopy equivalence is, indeed, an equivalence relation between topological spaces.

Here are some important cases:

- All homeomorphisms $f$ are homotpy equivalences by just taking $f$ and its inverse;

- The reals $\ro^n$ are equivalent to a point $\{p\}$. Explicitly, for $f:\ro^n\rightarrow \{p\},$ it has a homotopical inverse $g:\{p\}\rightarrow \ro^n$ given by $g(p)=0.$ The homotopy is $H(x,t)=tx$-- i.e., all elements are bringed to the origin along a line. There's no hole or other topological obstruction not allowing you to continually collapse the whole space into a single point. This can also be seen through paths: every path in $\ro^n$ is contractible to a single point-- even if one end point The In general, spaces with the homotopy type of a point are called **contractible**. Open balls in $\ro^n$ are also contractible;

- D^n and S^n aren't equivalent, due to $S^n$ having a hole in the middle. We'll prove this later;

- Letters

- Contraindo subespaços contráteis permanece msm tp dhomotopia

## Compactness

Another topological notion is that of **compact subspaces**. This is an idea involving finitude. Take the plane $\rt$ as an example. Both open as closed balls in it are sets with ininitely many points. But, in the open one, you can get a sequence of points in the ball that get infinitely closed to the frontier, without ever actually getting to it. This isn't possible in the closed one: every converging sequence actually converges to a point inside the closed ball. The exact same is valid for general open/closed sets. It is as if the closed ball is "less finite" as the open one, "more bounded"-- or, rather, it's more *compact*. 

IMG!!! OPEN BALL SEQ

In metric language,

In purely topological language, we can get this definition:

**Definition**: a topological space $(X, \tau)$ is called **compact** if for all open covers $\{U_i\}_{i\in J},$ there exists a finite subcollection $\{U_i\}_{i\leq n}$ that also covers $X.$

IMG!!!

**Tychonoff's theorem**: 

# The topology of cellular automata

## Cellular automata

### Conway's Game of Life

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

### Machines and termites

CGOL TURING

NEUMANN

WOLFRAM

### Entropy and reversibility

SIMULACS

### Evolution and chaos: the space of CA rules

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

In general, distances in this space are hard to find exactly. However, if $x,y\in S^\zo$ differ only inside an interval $[-L,L]$ and have exactly $k$ different values, then $d(x,y)=\sum_{m\geq 0} \frac{D(x,y)}{2^m}\leq k\sum_{m\geq 0} \frac{1}{2^m}=2k.$

### Symmetries: the shift

The space $S^\zo$ is quite interesting because it comes along a continuous symmetry, the **shift** $s:S^\zo\rightarrow S^\zo,$ which shifts sequences one step to the right: $s(x)_i=x_{i-1}.$ Note also that $s$ is invertible, with $\inv{s}$ being a shift one step to the left: $\inv{s}(x)_i=x_{i+1}.$ We'll denote this left shift $l.$

IMG!!!

To verify the continuity of $s,$ let $B_p$ be the basis neighborghood of a pattern $p.$ Then $\inv{s}(B_p)$ is exactly $B_{l(p)}$ BLA. Similarly, $\inv{l}(B_p)=B_{s(p)}.$

Using basically the same argument as for $s,$ we can see $\inv{s}$ is continuous. That is, **the shift** $s$ **is a homeomorphism from** $S^\zo$ **to itself!** In that sense, the term "symmetry" is quite appropriate for it. More than that, it is also an isometry: $d(s(x), s(y))=d(x,y)$ for all $x,y\in S^\zo.$

EQUIVARIANT

### Continuity

... Again, please note how this is absurdly simplier than the description of continuity using the metric explicitly.

### Compactness

By Tychonoff's theorem, $S^\zo$-- as an infinite product of compact spaces-- is compact.

## The topological definition of cellular automata


