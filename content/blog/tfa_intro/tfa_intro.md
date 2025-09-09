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

# This series

ORDER 
this(n mt) -> homologia -> grupos/proj/games -> 

# What you'll need

Short answer: **basic set theory** (cartesian product, injective, surjective and bijective functions) and **introductory linear algebra** (you can find a quick reminder on the post concerning algebra).

I tried to write these posts as accessible as possible, but without losing much of the mathematical rigour. That is, mathematics is a human endeavour of unlimited aesthetic capacity, but this comes with a cost-- namely, rigour and precision. It is beautiful because so much formality can't be in vain. Without this limitation, there can ultimately be no beauty; the first is simultaneously the latter's restriction and its progenitor. Or, rather, rigour and aesthetical creativity are *consubstantial* in mathematics. The other member of this trinity is the insatiable human desire to further mathematicize the world and recognize itself in this construction-- to spread the Word and be in a Body, so to speak. But let's leave the formal-hegelian-christian analogies for another place for now. 

Fact is, leaving out the more difficult and rigorous parts **is** necessary when writing to a larger audience, but I tried to keep some balance-- particularly without insulting the intelligence and interest of the reader. You can always skip the more technical sections, and I hope they can spark out your curiosity and be more accessible when you come back to them.

# What is topology?

TOP VS GEO

# The necessity of spaces

spaces encode info and restrictions (eg periodic functions are to S^1)

Riemann, Poincaré, Einstein & Hilbert

Sols restritas a subespaços

Manifold hypothesis

State spaces

# Metric and topological spaces

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

This "fat" property is very important: it tells you that no point in the intersection is a boundary point, since they always have a ball around them inside the intersection. This "fatness"  is more formally called **openness**, and we say a subset $S\subseteq X$ is open if for all $x\in S,$ there's some $r$ such that $B(x,r)\subseteq X.$ Visually, these are fat set with no boundary/frontier points.

Set-theoretically, open sets are somewhat well-behaved in respect to unions and intersections. Indeed, any union (including infinite ones) of open sets will still be open, since the open balls containing elements will still be inside the union. With respect to intersection, finite intersections of open sets are open as well: for if $U$ and $V$ are open and $x\in U\cap V,$ then, by the definition of openess, there are $r_1,r_2$ such that $B(x,r_1)\subseteq U$ and $B(x,r_2)\subseteq V,$ so that $B(x,\min \{r_1,r_2\})\subseteq U\cap V$ and the intersection is open. This is valid only for finite intersections: for example, if you do the infinite intersection $\bigcap_{n=1}^\infty B(x,1/n)$ of smaller and smaller open balls around $x$ is exactly the set $\{x\}$ containing only the point $x$ itself, which certainly isn't open.

IMG!!!

EXS: 
GRAPHS
FUNCS
We've been thinking quite informally of open sets as "balls", or "disks", because that's how they look in $\ro^n.$ But let's consider a different space: $C([0,1])$ with the $L^1$ metric. Here, the open ball $B(f, r),$ for some $f\in C([0,1]),$ is the set of all (continuous) functions that differ less from $f$ than $r$, according to the $L^1$ distance. There are infinitely many of these, with all possible shapes.

IMG!!!

Then the set
????????
is open.  IF YOU DEFINE VERY SMALL R,....

IMG!!!

## Topological spaces

The idea of topological spaces comes from trying to focus on the set-theoretic aspect of metric spaces: i.e., what if, instead of taking metrics as the primary concept defining our abstract spaces, we take open sets to be our focus? These would then give us **a notion of proximity based only on sets**, skipping the necessity of a distance function. There are many equivalent definitions, but here's one based on open sets:

**Definition**: a **topological space** is a set $X$ with a set $\tau$ of subsets of $X$ (called **open sets**) such that

- $X$ and the empty set $\emptyset$ are in $\tau$;

- Unions (possibily infinite) of open sets are open: $\bigcup_i U_i\in \tau$ for $U_i\in \tau$;

- Finite intersections of open sets are open: $\bigcap_i^n U_i \in \tau$ for $U_i\in \tau.$

We'll often omit $\tau$ and, when the topology is understood from context, call just $X$ a topological space. An open set $U\subseteq X$ containing a point $x\in X$ is often called a **neighborhood** of $x$ (some authors differ on their definitions of neighborhoods, but that's the one I prefer).

How does this fit with the previous section? Well, if $(X,d)$ is a metric space, then we can **topologize** $X$ by taking as topology $\tau$ all the open sets of $(X,d),$ as previously defined.

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

**What's really the point for studying topological instead of metric spaces?** First of all, because different metric spaces may have the same topology, and thus fundamentally . This is the case for all $\ro^n$ with any $\mathcal{l}^p$ distance: sure, their balls might be different, but they're open in any other of these metrics as well. This is fundamentally becaus of the following theorem, which states that, when two metrics are not that different from one another, then they have the same topology:

**Theorem**: If $d_1$ and $d_2$ are two metrics on the same set $X$ and there are constants $K_1, K_2$ such that, for any $x,y\in X,$ we have 

$$K_1 d_2(x,y) \leq d_1(x,y) \leq K_2 d_2(x,y)$$

(in which case the metrics are said to be **equivalent**), then the metric spaces $(X,d_1)$ and $(X,d_2)$ produce the same topology (i.e., every open set in one is open in the other).

This is the case for all the $\mathcal{l^p}$ metrics in any $\ro^n.$ Proving this and the theorem is quite an educative exercise on the relation between metric and topological spaces.

Interestingly, the same can't be said for sets of functions with the $L^p$ metrics: indeed, different $p$ give us completely different topologies. This was actually one of the main sources for defining abstract topological spaces in the earlier 20th century, as many theorems were valid for some $L^p$ distances, and some not for others. This led to the consolidation of **functional analysis**, which is linear algebra applied to the different (infinite dimensional) vector spaces of functions-- an area that later on lead to fundamental advances in quantum mechanics, statistics, topology itself and many other applications.

Another reason for considering topologies instead of metrics is because the latter are superfuous in many constructions and arguments. Continuity is one example in which, as we'll soon find out, a definition using distances is quite tedious, while one using sets brings a lot of clarity. Similarly, intuitive ideas like **gluing** and **cutting** don't really involve distances, and thus should need no description of a metric.

## Some common topologies

### Basic examples

That should be it for definitions and constructions so far. Let's get into some examples.

First of all, you can topologize any union of topological spaces $(X, \tau_X)$ and $(Y, \tau_Y)$ by giving $X\cup Y$ the topology $\tau_X\cup \tau_Y.$ Open sets in $X$ and $Y$ remain open, and there are no open sets with elements both in $X$ and in $Y$: the spaces are "disconnected," so to speak-- a notion we'll later on describe properly. This space is called the **disjoint union** of $X$ and $Y$, and it's custom to denote it as $X\amalg Y.$ Since there's no relation here between the topologies of the two spaces, disjoint unions don't bring anything new and are just used as a formality.
IMG!!!

Then, note that every set $X$ can be given a topology: just take as basis $\mathcal{B}$ all the one-point subsets $\{x\}$ for $x\in X.$ The resulting topology is the set of all subsets of $X$, and is called the **discrete topology**. It is metrizable by the metric

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

OTHER TOPOLOGIES FOR SMALL SETS

It's also educative to consider some 

### Subspaces, spheres, donuts and manifolds

That's all educative and even intersting per se, but where are our cool figures of mind-blowing shapes, our familiar friends the sphere and the torus-- **where are our donuts?!** Indeed, most introductory courses on topology don't really get to these and focus on the more set-theoretical aspects of topology-- the so-called **point-set topology**. This can be frustrating for many beginners, so let me turn to more familiar shapes and spaces.

We studied how to metricize and topology $\ro^n$ above, and how all $\mathcal{l^p}$ topologies are the same as the one coming from the usual Euclidean distance. Of course there are other possible topologies on $\ro$ ([the K-topology](https://en.wikipedia.org/wiki/K-topology) is a common counter-example found in point-set topology textbooks), but the Euclidean one is the only one we'll actually study here.

Sure, we know how to topologize $\ro^n,$ but what about surfaces and other shapes living in it-- like circles and spheres? The simplest way is to use the **subspace topology**. Generally, if you have a topological space $(X,\tau)$ and some subset $Y$ of $X,$ you can define the subspace topology $\tau'$ on $Y$ (induced by $(X,d)$) as 

$$\tau'=\{U\cap Y \text{, where } U \text{ is open in } (X,\tau)\}.$$

You can check that this is a topology for any $(X,\tau)$ and $Y\subseteq X.$

In the case of subsets $\ro^n,$ that's the topology we'll basically always think of. We'll now consider some other shapes that can be seen as living inside these spaces: but, before, a note on the notion of **dimensionality**.

Dimension refers to the possible move directions on a space. When mathematicians speak of the dimension of a shape, they think of it as if we lived in the shape. Imagine yourself as an ant on to the surface of a ball-- a sphere. You have only two movement directions: forwards/backwards and left/right. Thus we say this shape is two-dimensional. Similarly, if you were restricted to a circle, you could only go forwards or backwards. So a circle is one-dimensional. And we all live in a three-dimensional spacial world. 

IMGS!!!

Some people, however, think it'd be more intuitive to say a sphere is three-dimensional. Now let me ask: is a circle inside the three-dimensional space $\ro^3$ three-dimensional? Of course not! The dimension of a shape doesn't care where you **embedd** it! A sphere could also be embedded in the four-dimensional space $\ro^4$: is it four-dimensional then?! Think of it **intrinsically**, not extrinsically. I.e., dimension is defined as if you could only move in the shape, not from any other, external point of view. 

Intuitively, a shape has dimension $d$ whenever it locally "looks like" $\ro^d$. Intrinsically, the sphere locally-- seen at a closer distance-- looks like the plane. We'll give a more rigorous definition of dimension when we define manifolds after studying continuity.

2D spaces are also called **surfaces**.

Finally, I have to mention the way we address spaces in topology. Because topology treats spaces that can be morphed into one another as equivalent-- as we'll properly define later on--, it is common to call the whole class of these equivalent spaces of type X as "**the** space X". For example, by "the circle" a topologist really means any circle at all, independent of center or radius. It doesn't even have to be a circle, as long as it is a closed loop. Similarly for "the" torus-- which *is* a donut for a topologist-- and any other space. We might as well say that a specific circle "realizes" "the" circle, although it is also common to say that a certain realization *is* the space.

Now, let's get to some concrete examples:

- $\ro^n$: the reals with the Eucliedean distance-- the only topology we'll consider here for them. We know them already;

- Intervals: both open $(a,b)=\{x\in\ro\mid a < x < b\}$ and closed $[a,b]=\{x\in\ro\mid a \leq x \leq b\}$ with subspace topology. These are one-dimensional. The unit interval $[0,1]$ is often just written $I$;

- Cubes: these are the $n$-dimensional products $I^n.$ A 2D cube $I^2$ is a square and a 3D one a cube in the usual sense. Since $I^n\subseteq \ro^n$, these can get the subspace topology from the reals; but what if we wanted to topologize it without seeing it as embedded in another space? We'll later on see how to give a topology to the cartesian product of spaces;

IMG!!!

- $S^n$: the **spheres**. For $n=2$, we get the sphere (a hollow ball), but also a circle with the same description. These may be realized as the set of points with Euclidean distance equal to 1 from the origin of $\ro^{n+1}$:

$$S^n=\{x\in \ro^{n+1}\mid \sqrt{x_1^2+...+x_{n+1}^2}=1 \}$$

For $n=1$, this is a circle; for $n=2$, the usual shape we mean by a "ball".

IMGS

- $D^n$: the **disks**. There are just the $S^n$ with their hollow interior filled. Equivalently, they're just the closed balls of distance one from the center of $\ro^n$:

$$D^n=\{x\in \ro^{n+1}\mid \sqrt{x_1^2+...+x_{n+1}^2}\leq 1 \}$$

$D^n$ is an $n$-dimensional space. 

Note that the $S^n$ are the frontier, the boundary of the $D^{n+1}.$ Pay attention to these $n$ and $(n+1)$!

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

Later on we'll see different ways of describing these spaces which will be very helpful to do certain topological computations.

### Topologies on cartesian products

We've seen above that many interesting spaces can be formed using cartesian products. These include boxes, the cylinder and torii, but also the space of strings $\mathcal{A}^n.$ We were able to topologize these either using the metric or subspace topologies, but what if we didn't have these? How to generally give a topology to the product of topological spaces?

It turns out the answer to this can get quite technical if you consider some details and how these impact further theory, but we'll ignore this and give the simple definition straight away:

**Definition**: given a product $\prod_{i\in I} X_i$ of topological spaces $(X,\tau_i)_{i\in I},$ the **product topology** on $\prod_{i\in I} X_i$ is the topology whose open sets are of the form

$$\{\prod_{i\in I}U_i\mid U_i \text{ is open in } X_i \text{, and only for finitely many } i \text{ we have }U_i\neq X_i\}$$

Quick reminder: the $I$ in $\prod_{i\in I} X_i$ is an *index set*, and can be any set you want. For finite products, it's just $\{1,...,n\}$ for some $n$; for infinite ones, it can be the whole natural numbers $\mathbb{N},$ the integers $\zo$ or anything you want!

You might also wonder why do we have the condition that only finitely many $U_i$ are not the whole $X_i$ themselves. For finite products, this condition is inoquous; however, for infinite products, it isn't. For reasons later on the theory, this condition avoids many technical issues and gives more well-behaved spaces. If you leave it and take only the topology $\{\prod_{i\in I}U_i\mid U_i \text{ is open in } X_i\},$ you'll get the so-called **box topology**, which is of interest for pure point-set topology, but not really for us in this series.

Now, if you topologize all the products we considered so far with this product topology, **will it be the same space**? I.e., is, for example, $\ro^n$ with the Euclidean topology the same as with the product one? **Thankfully, the answer is yes, and so it is for every other product we've met so far**. Still, it is good to know how to define a topology for any product you want.

### Gluing spaces: quotient topologies

**Definition**: 

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

Indeed, a careful reading will tell you that it is equivalent to saying that $f(B(x, \delta))\subseteq B(f(x), \epsilon),$ which is the same as $B(x, \delta) \subseteq \inv{f}(B(f(x), \epsilon)).$ But since this is valid for any $x,$ by definition the set $\inv{f}(B(f(x), \epsilon))$ is open in $X.$ It isn't a difficult exercise on the notion of topological basis to prove that this is again equivalent to having $\inv{f}(V)$ open for any $V$ open in $Y.$

But now this last equivalent definition is free of any notion of metric or convergence! It is **purely topological**! The following topological definition ensues:

**Definition**: a **continuous function** between topological spaces $(X,\tau_X)$ and $(Y,\tau_Y)$ is a function $f:X\rightarrow Y$ such that, for all $V\subseteq Y$ open in $Y$, $\inv{f}(V)$ is open in $X.$

Note how clean this definition is: in a certain way, it deeply and truly captures the general nature of continuity as a visual phenomena.

SLA ONDE POR ESSE PARAGRAFO. CAFUSO
Is continuity really a metric property? If you stretch some space, e.g. a plane, completely altering its metric, and you apply a continuous function to this stretched version, will the function still be continuous? I.E., MULTIPLICAR MÉTRICA POR 2, POR EXEMPLO. SE EU USO METRO, FEET OU QLQ COISA, CONTÍNUO É CONTÍNUO

All most common real functions are continuous. This includes addition, subtraction, multiplication, roots, exponentiation, logarithms and division as well. The last one doesn't seem though: the graph of $\frac{1}{x}$ has two distinct components, doesn't it? It does, but its domain is $\ro\setminus \{0\},$ so it is continuous, only with a domain that's already disconnected. We'll formalize this notion of "connectedness" later on.

You may find more over continuous real functions on textbooks on calculus.

Generally, the composition of continuous functions between topological spaces is continuous: if $f:X\rightarrow Y,$ $g:Y\rightarrow Z$ are both continuous and $V\subseteq Z$ is open, then $\inv{(g\circ f)}(V)=\inv{f}(\inv{g}(V)),$ which is open by hypothesis, so that $g\circ f$ is continuous too. Notice by the way how proving this is much, much easier and more obvious using the topological definition instead of the metric one.

Considering the topologies we described before, if $Y\subseteq X$ is given the subspace topology, then the **inclusion function** $i:Y\rightarrow X$ sending $y\in Y$ to $y$ itself is continuous. If we have a product $\prod X_i,$ then the projection $\pi_n:\prod X_i\rightarrow X_n$ sending to the $n$-th component is continuous as well.

## Homeomorphisms

We're now finally able to define what we actually mean by topology as rubber geometry. Indeed, what we meant by "a continuous deformation without gluing or cutting" in the introduction can be formally described as a **bijective continuous function** $f$! The property of "being able to go back by a deformation of the same kind" means that $\inv{f}$ should also be continuous. Thus, we have the following fundamental definition:

**Definition**: a **homeomorhpism** between topological spaces $(X,\tau_X)$ and $(Y,\tau_Y)$ is an inversible continuous function $f:X\rightarrow Y$ such that $\inv{f}:Y\rightarrow X$ is also continuous. We then say X and Y are **homeomorphic** and write $X\cong Y.$

If two spaces are homeomorphic, they're seen as equivalent by topology. That is, homeomorphic spaces can be seen as just different ways to name things: a point $x\in X$ is just a different name for another $y\in Y$, and an open set $U\subseteq X$ is just a different name for one open set $V\subseteq Y.$

Like equality, being homeomorphic is an **equivalence relation** (prove it): that is, $X\cong X;$ $X\cong Y$ implies $Y\cong X;$ $X\cong Y$ and $Y\cong Z$ imply $X\cong Z.$

Homeomorphisms allow us to speak of "the" space !!!!!!!

Here are some explicit homeomorphisms:

EXS (ALGNS OBVIOS, R E (0,1), BURACOS)

- Open intervals $(a,b)$ and $(c,d)$ in $\ro$: applying translation and scaling suffices. That is, we first $$

- $D^2$ and the square $[0,1]^2$:

- **Isommetries**: 

- $\ro$ and the interval $(0,1)$: this may be surprising, but it's true: for topology, the reals and an open interval inside it are really the same. A famous homeomorphism is the **logistic function**

$$\sigma(x)=\frac{1}{1+e^{-x}},$$

which "encapsulates" $\ro$ onto $(0,1).$ Its inverse is the **logit function** $\text{logit }:(0,1)\rightarrow \ro,$ defined as $\text{logit }p=\log\frac{p}{1-p}$-- which is also continuous. Writing the variable here as $p$ is suggestive: the fraction $\frac{p}{1-p}$ can be seen as the odds (30% to 70%, 99% to 1% etc.) of a given event with probability $p$. Thus the logistic function can be seen as a function taking a real number and returning the logarithm of an odd. This makes these two functions widely appliable in statistics, specially in machine learning.

IMG!!! LOGISTIC

- PRODUCTS

Generally, however, mathematicians don't describe homeomorphisms explicitly, but rely on the visual intuition of the reader for simpler cases.

- Linear isomorphisms: 

- Smooth stretchings: 

PROVING THE NEGATIVE
Proving that spaces satisfying certain properties are homeomorphic is, in general, hard. However, it may be even harder to prove the opposite: that two spaces *aren't* homeomorphic. Proving the latter is one of the main tasks of topology. Here are some non-homeomorphic spaces and indicatives of thereof:

- $\ro^n$ and $\ro^m$ for different $n,m.$ You think this is obvious? Intuitively, sure-- but not formally! One way to prove it is to show that, after taking the origin from both $\ro^n$ and $\ro^m,$ the holes left in them are of different dimensions-- something that we'll soon study closer when we define homology groups;

- Open and closed intervals: indeed, $(a,b)$ is not homeomorphic to $[a,b],$ and similarly for all open and closed balls $B(x, r)$ and $\bar{B}(x,r)$ in any $\ro^n$;

- Dimensionality: generally, if two

- Branched spaces: these are shapes that locally look like some $\ro^n$, but with branched points or regions !!! We'll later find these spaces again when studying tilings and patterns.

- Holes: these are the most important indicatives of non-homeomorphic spaces, and formalizing what "a hole" is will concern us for most of the rest of the series. Examples include: $D^2$ and $S^1$ aren't homeomorphic since there's a hole in $S^1$; similarly for, say, the sphere $S^2$ and the cylinder $S^1\times [0,1],$ or with the torus $T^2$: these all have different holes.

We'll also study two properties which are very strong topological invariants in this article: connectivity and compactness. The latter will play an important role in the topological analysis of cellular automata.

## Further common topologies

### Manifolds

MANIFOLDS, NON-MANIFOLDS

Now, 

Why?
Doenst depend on R^n at all, despite our descriptions above
Easy to think of low-dim examples, but what about manifolds of abstract, high-dimensional objects? Give exs. Then thinking of R^n is superfluus. Whitney, RP^2 soon.

**Definition**: a space $X$ is an $n$**-dimenisonal manifold** if, for every point $x\in X$, there is a neighborhood $U$ of $x$ such that $U$ is homeomorphic to an open subset of $\ro^n.$

### Quotients

EQUIVALENCE CLASSES
WELL-BEHAVED, SIGNIFICADO

**Topologically, making equivalences can be seen as gluing points together.** For example, imagine I have a segment of line (i.e., an interval) $I=[0,1]$ and I want to glue its endpoints to make a circle $S^1.$ Mathematically, all you need to know is to define an equivalence on $I$ such that $0\sim 1$ and all other points are equivalent only to themselves, getting a quotient $\quot{I}.$ Now the extremities are really one and the same thing.

{{< figure src="intervalS1quotient.png" caption="Illustration of the relation $\quot{I}\cong S^1$ given above. Work by [Mark Fischer](https://commons.wikimedia.org/wiki/User_talk:MaxFischerUCPH)." >}}


IMG!!!!!!!!!

How do we topologize these spaces though? It's actually pretty simple: all we want is that the gluing function $q:X\rightarrow \quot{X}$ be continuous, which visually is quite sensible. This gives us the following:

**Definition**: the **quotient topology** over $\quot{X}$ is the smallest topology such that $q:X\rightarrow \quot{X}$ is continuous. Equivalently, it is the topology of all $U\subseteq \quot{X}$ such that $\inv{q}(U)$ is open in $X.$

From the definition, you can see that, if $U$ is an open set $X$ such that its elements are equivalent only to themselves, then $q$ restricted to $U$ is a homeomorphism: i.e., $U$ is not altered in the quotient topology.

Generally, if you have a space $X$ and a subspace $A\subseteq X,$ you can collapse $A$ onto a single point using the relation $\sim_A$ such that $a\sim_A b$ for all $a,b\in A$ and all other points of $X$ are equivalent only to themselves. In this case, we don't write $X/{\sim_A},$ but rather $X/A,$ a space often called the **quotient of** $X$ **by** $A.$

In this notation, the homeomorphism $\quot{I}\cong S^1$ is the same as $I/\{0,1\}\cong S^1.$ It can now be formally proven: indeed, the function $f:I/\{0,1\}\rightarrow S^1$ is given by $f([t])=(\cos(t),\sin(t))$ (seeing $S^1$ embedded in $\ro^2$) is a homeomorphism. It is well-defined because we have $f([0])=f([1]),$ and bijective too. You can prove it is continuous as well as its inverse.

The case of $I$ and $S^1$ can be generalized by noting that $I=D^1$ and $\{0,1\}=S^0.$ One dimension higher, if you have $D^2$ and glue its whole $S^1$ boundary onto a single point, you get a sphere $S^2.$ Thus, $D^2/S^1\cong S^2,$ and in general we have $D^n/S^{n-1}\cong S^n$ (you can try proving this). Cool: we're starting to do some algebra with spaces!

The notation is suggestive: it's almost as if we were dividing $X$ by a $A$-- imagining $A$ as a "factor" of $X.$ But "suggestive" is the best we can say, as it actually doesn't really follow algebraic rules like division. There's also somewhat of a shock of notations here: if $0$ denotes a generic point in $X,$ then $X/0$ is really, by definition, homeomorphic to $X$ itself: $X/0\cong X.$

For simpler quotients, open sets in $\quot{X}$ can be easily visualized. It is as if the glued regions worked as "portals" open sets can now tranverse.

IMG!!!

One common kind of quotients are **wedge sums**, which consist of joining different spaces on a single point. Formally, the wedge sum between spaces $X$ and $Y$, written $X\vee Y,$ is the quotient $\quot{X\amalg Y}$ with the relation $x_0\sim y_0$ for two fixed points $x_0\in X$ and $y_0\in Y.$ You can prove that different choices of $x_0, y_0$ give homeomorphic spaces, so that we're allowed to speak of **the** wedge sum $X\vee Y.$

IMG!!! S1 WEDGE S1

In the article on homology, we'll further describe many spaces as quotients.

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


