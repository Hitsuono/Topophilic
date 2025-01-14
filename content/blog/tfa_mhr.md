+++
date = '2025-01-14T12:33:23-03:00'
draft = true
math = true
title = "Meshes, holes and Rubrik's cube (TfA Series)"
tags = ["Topology for Artists"]
+++

TODO:

Corrigir estrutura de simplexo do círculo. Dar exemplo do disco.

Delta sets tem q FILL o espaço (td ponto no interior de algm)

Estudr + meshes

Explicar orientação

TL;DR

In our search for topological invariants, we'll learn how holes can be defined and be used to study spaces. This will require a detour on group theory, the study of permutations and their algebras (the possible moves on a Rubik's cube being an example). With this machinery, we'll define the homology groups of a topological space, in which holes live. A dual perspective on the topic will be given and then we'll define cohomology groups, which also define holes, but with a different perspective. Finally, we'll see how these groups are able to define and explain the impossibility of certain impossible figures, like the Penrose triangle and Necker's cubes.

HOLES

RIGHT AWAY

SIMPLEXES AND SINGULARS

To actually be able to apply our considerations to topological spaces and compute holes, let's start by defining simpler, "model" spaces. First, a quick reminder on basic linear algebra.

We can see elements $(a_0,...a_n)$ \((a_0,...a_n)\) of $ \mathbb{R}^n$ in two ways: as points in a space (the $a_i$ being its coordinates), or as arrows going from the origin $ (0,...,0)$ to $(a_0,...a_n)$. In the second intepretation, we call them vectors. Points and vectors are really the same thing in $\mathbb{R}^n$, so we'll call them interchangeably.

Bearing in mind the geometry-topology distinction, the fact that points in $ \mathbb{R}^n$ are also vectors-- i.e., directions-- is actually a geometric property, related directly to curvature. Indeed, if we curved the plane in order to get the upper hemisphere of a sphere, points wouldn't coincide if directions, as seen in the image below. Directions at a certain point $x$ in our base space $X$ in the so-called tangent space $T_xX$, which is a copy of $ \mathbb{R}^{dim(X)}$. With the reals, these spaces can be identified, but not for any curved space.

Interestingly, this means that we could informally define $\mathbb{R}^n$ as the space of all directions. Thus, if arithmetic and calculus never lead us to the notion of real numbers (and their sequences), we could still find them through this definition, as a sort of configuration/state space of directed arrows. This method-- defining a space as the "state space" of objects we're studying-- is extremely fruitful, and we'll apply it in later posts.

Vectors unite algebra and geometry very deeply. We can define an addition with vectors by adding all their components: $ a+b= (a_0,...,a_n)+(b_0,...,b_n)=(a_0+b_0,...,a_n+b_n)$. Geometrically, this corresponds as taking $b$ and setting its origin to the end of $a$, and taking the sum as the arrow from the origin to the end of this displaced $b$ vector. This forms a triangle, as seen in the image below.

ADD VETORIAL

We also define scalar multiplication between a real number $ \alpha$ and a vector $v=(a_0,...,a_1)$: $\alpha v = (\alpha \cdot a_0,...,\alpha \cdot a_1)$. Geometrically, we're stretching $v$ by a factor of $\alpha$ (negative numbers inverting the direction of the vector).

A vector $v$ is called a linear combination of other vectors $v_1,...,v_k$ when we have that $v=\alpha_1v_1 + ... + \alpha_kv_k$ for some $\alpha_1,...,\alpha_k$. This notion can be used to, say, describe colinearity: if for example $v=\alpha v'$ for some other $v'$, this means $v$ and $v'$ are in the same line. Similarly, if $v=\alpha_1v_1+\alpha_2v_2$, then $v$ is in the plane containing $v_1, v_2$ (try seeing this in $\mathbb{R}$^3).

For a finite set $S$ of vectors, its span $\text{span}(S)$ is the set of all possible linear combinations using elemnts from $S$.

Particularly important is the set $e_1,...,e_n$ of vectors $e_i$ with an $1$ in the $i$-th position and zeros elsewhere. Every element of $\mathbb{R}^n$ can be written as a linear combination of these vectors: if $v=(v_1,...,v_n)$, then $v=v_1e_1+...+v_ne_n$.

A set of vectors $\{v_1,...,v_k\}$ is linearly independent (l.i.) if no $v_i$ is a linear combination of some vectors contained in the set. Geometrically, this means we don't have co-linear/planar/etc. points in the set. Note that $e_1,...,e_n$ as defined above are l.i.

For a l.i. set $S=\{v_1,...,v_k\}$, every element of its span can be represented uniquely by elements of $S$. Otherwise, say we had $v=\alpha_1v_1+...+\alpha_kv_k=\beta_1v_1+...+\beta_kv_k$ for at least one $i$ such that $\alpha_i\ineq \beta_i$. We can choose $i=1$ (just order $S$ differently), and then then $v_1=(\beta_2v_2+...+\beta_kv_k-\alpha_2v_2.-..-\beta_kv_k)/(\alpha_1-\beta_1)$, meaning $S$ isn't l.i.-- a contradiction.

In particular, this means $\{v_1,...,v_k\}$ serve as coordinates for $\text{span}(S)$-- we say they are a basis for the span of $S$. For example, $e_1,...,e_n$ is a basis of $\text{span}(e_1,...,e_n)=\mathbb{R^n}$, called the canonical basis of $\mathbb{R}^n$-- it is the most natural, but certainly not the only one.

Linear algebra considers not only these algebraic-geometric constructions, but also functions preserving them. More specifically, it also studies linear transformations, which are functions $f:\mathbb{R}^m\rightarrow \mathbb{R}^n$ such that $ f(a+b)=f(a)+f(b)$ () and $f(\alpha a)=\alpha f(a), a\in\mathbb{R}$ ().

A linear transformation is a function of the kind $f:\mathbb{R}^m\rightarrow \mathbb{R}^n$, where its output is composed of linear combinations of the components of the input vector: i.e., if $v=(v_1,...,v_m)\in\mathbb{R}^m$, $ f(v)=f(v_1,...,v_m)=(\sum_i\alpha_{1i}v_1,...,\sum_i\alpha_{ni}v_i)\in\mathbb{R}^n$. 

Equivalently, a linear transformation is a function $f:\mathbb{R}^m\rightarrow \mathbb{R}^n$ such that $f(a+b)=f(a)+f(b)$ and $f(\alpha a)=\alpha f(a)$-- we say that it respects sums and scalar products. Computations quickly show that the previous definition satisfies these properties. Conversely, if $f$ satisfies these formulas, then $f(v)=f(v_1,...,v_m)=v_1f(e_1)+...+v_mf(e_m)$, so that $f(v_1,...,v_m)=(\sum_i\alpha_{1i}v_1,...,\sum_i\alpha_{ni}v_i)$ for $\alpha_{ij}$ the $j$-th component of $f(e_i)$.

The two equivalent definitions above tell us two different ways of defining and considering mathematical objetcs. In the first one, we're explicit, or, rather, extensive, clearly constructing our objects of interesting. In the second one, we are intensive, defining and describing through properties and relations that should be satisfied. Extensive statements are very intuitive and in many cases the definitions we're actually thinking of. Intensive statements, in the other hand, are more generalizable and allow for cleaner reasoning.

Coming back, vectors also allow us to easily define geometrically interesting sets. For example, the line between two vectors $v_0, v_1$ can be written as the set $ \{tv_0+(1-t)v_1\mid  0 \leq t\leq 1\}$.

Another class of geometrical sets that can be defined by vectors are convex hulls. Given a subset $S\mathbb{R}^n$, its convex hull is the minimal convex space containing $S$. Remember that $A\subset \mathbb{R}^n$ is convex if it contains every line between points inside itself. If $S=\{v_1,...,v_k\}$ is a collection of vectors, then the convex hull $\overline{S}$ of $S$ can be given by all the linear combinations $\lambda_1v_1+...+\lambda_kv_k$ with $\lambda_1+...+\lambda_k=1$, with $\lambda_i\geq 0$ for all $i$.

The proof that $ \overline{S}$ as defined is indeed the convex hull can be made quite constructive. First, to get the hull of $ \{v_1,...,v_k\}$, we add all the lines of the form $ \{tv_i+(1-t)v_j\mid  0 \leq t\leq 1\}$, then again add segments between original vertices to points in these lines, getting $ \{sv_l + (1-s)(tv_i +(1-t)v_j) = sv_l+(t-st)v_i + (1+st-s-t)v_j\mid  0 \leq s,t\leq 1\}$, and so on. This will give us $ \overline{S}$ as defined and, by our construction, it must be inside every convex set containing $ \{v_1,...,v_k\}$. Since $ \overline{S}$ itself is convex, it must be the convex hull we desired.

With that in mind, we'll now define the simplers spaces that will be our building blocks. These are called simplices. Formally, a n-dimensional simplex is defined as the convex hull of $n+1$ linearly independent points.

For example, for a 1-simplex in $\mathbb{R}^1$, we take two different points $v_0, v_1$, and then fill the interval $[v_0, v_1]$, getting a line betwen $v_0, v_1$. For a 2-simplex in $\mathbb{R}^2$, take three l.i. points $ v_0, v_1, v_2$: the 2-simplex will be the triangle with them as vertices. Similarly, a 3-simplex is a piramid with vertices $v_0,v_1,_v2_,v_3$ in $\mathbb{R}^3$.

Since a n-simplex is completely determined by its $n+1$ points $v_0,...,v_n$, we'll denote it as $[v_0,...,v_n]$. For now, the order you put these points in the presentation doesn't matter- but soon it will. Also, note that 0-simplices are just points.

For practicality, we also define the standard n-simplex $ \Delta^n$ to be the simplex in $\mathbb{R}^n$ with base points $(0,...,0),(1,0,...,0),(0,1,...,0),...,(0,...,0,1)$. By the formula for the convex hull we gave, $ \Delta^n=\{(\lambda_1,...,\lambda_n)\mid  \sum_i^n \lambda_i=1, \,\lambda_i\geq 0\}$. Every n-simplex is homeomorphic to $ \Delta^n$ by simple transformations of translation and stretching.

Topologically, n-simplices are all homeomorphic to $D^n$, since that's the case for $ \Delta^n$. Their importance comes along with their structure, which will then allow for actual computation. First, we can use the convenient language of vertices (our base $n+1$ points) and edges/faces and all the intuition that comes along. Second, simplices are very constructive, recursive objects: for every simplex $[v_0,...,v_k]$, we automatically have many other lower dimensional "sub-simplices" obtained by ommiting some of the vertices in our presentation. So in $[v_0,v_1,v_2]$ we have $[v_0,v_1], [v_0,v_2], [v_1,v_2]$, which correspond to the edges of our triangle; we also get $[v_0], [v_1], [v_2]$, which correspond to its vertices.

Now, how can we use simplices to understand our spaces better? The idea is to fill spaces by simplices, seeing them as collages of homeomorphic copies of $ \Delta^n$. Thus, we will be considering continuous maps $\sigma:\Delta^n\rightarrow X$, called chains, and we will want to describe $X$ as the union of images of chains. It is also common to call $\im \sigma$ itself a chain on $X$. The simplest conceptual way of describing this is with simplicial complexes.

SIMPL COMPLEXES

A simplicial complex on $\mathbb{R^n}$ is a set of simplices ${s_1,...,_s_k}$ such that, if $s_i, s_j$ intersect as sets, then $s_i \cap s_j$ is simplex. For example, if $s_i, s_j$ are 2-simplices (triangles), then $s_i \cap s_j$ is also a simplex: either a 2-simplex, in which case $s_i=s_j$, or a common edge (which is a 1-simplex).

Indeed, many spaces of interest can be described as homeomorphic to a simplicial complex on $\mathbb{R}^n$, at least for a high enough $n$. When this is the case, we say our space is triangulable, since in the two-dimensional, surface case this is equivalent to dividing our embedded space into triangles. 

DELTA SPACES

As we can see by the examples above, finding a triangulation of a space can be very tedious. This is because we strictly require that our spaces be composed of simplices. But what if we just asked for it to be composed of chains--i.e., images of simplices? For the circle, e.g., instead of making it with two 1-simplices, we could just take one 1-simplex and glue its ends. This wouldn't be a simplicial complex, but would still be an image of one, with just one 1-chain.

For the torus, instead of the exhausting triangulation we could do as follows. Take two 2-chains (filled triangles), and name each edge $a,b,c$. Glue the respective $c$ edges, forming a square. Then also glue the $a$ edges, forming a cylinder. Finally, glue the $b$ edges, forming a torus.

This gives us the notion of a $\Delta$-space. Technically, it is a space $X$ with a set of chains $\sigma_i:\Delta^n\rightarrow X$ such that the image of the restriction $\sigma_i\mid  F$ for a face of $\Delta^n$ is itself the image of another chain $\sigma_j:\Delta^{n-1}\rightarrow X$ of one dimension below. As we did in the case of simplicial complexes, we also require that the interiors of the images of $\sigma_i,\sigma_j$ be disjoint. 

$\Delta$-spaces present us with some incoveniences when representing chains. With simplicial complexes, every simplex could be uniquely described by a list of (non-repeating) vertices. We can't really do the same with $\Delta$-spaces: take the example of the circle we described, where there's only one vertex with a 1-chain $\sigma$ connecting it to itself. We could try to represent it as $[v_0,v_0]$, but it is clearer if we instead just write it as $ \sigma\mid  _{[v_0, v_1]}$, with $ \sigma\mid  _{[v_0]}=\sigma\mid  _{[v_1]}$.

DOING ALGEBRA

Now that we know how to represent spaces through simplices, we can use that to do algebra inside our space $X$. Let's begin considering the case of simplicial complexes. Given k-simplices $a,b$, let's formally write $a+b$ to represent their union. Note that this union isn't a simplex, so is not an element of the set of k-simplices. We can ammend this and consider the more general set $C^\{s}_n(X)$, whose elements are formal finite sums of n-simplices in $X$. The word "formal" here is very important: $a+b$ doesn't strictly have any relation with $a\cup b$, but we'll think of it this way. 

With delta spaces, we can do an analogous definition: $C_n(X)$ is the set of formal finite sums of n-chains $\sigma: \Delta^n\rightarrow X$ defining $X$ as a delta space. Here, if we think of n-chains $a,b$ as their images, then $a+b$ should also be thought as the union of these images-- but, again, this is just informal. Formally, there's no real geometry in $C_n(X)$, just algebraic formulas.

Now, do we also include inverses to these sets? Things like $-a$, $a$ either a simplex or a chain. Thinking of 1-simplices/chains, negative values could be interpreted as going in the opposite direction, so that $[v_0, v_1] - [v_0, v_1]=0$ would be interpreted as saying that following $[v_0, v_1]$ and then going back results in the same thing as if we stayed in $v_0$ all along (think of this in temrs os HOMOTOPY!!!!!!!!!!!!! as well). This means positive and negative signs should indicate orientations of 1-simplices/chains. Furthermore, we can adapt our terminology to this inovation: from now on, order will matter whenever we present a 1-simplex as list $[v_0,v_1]$, indicating that the simplex goes from $v_0$ to $v_1$, and we will define $-[v_0,v_1]=[v_1,v_0]$.

We also saw with meshes how orientation of 2-simplices was relevant. We will thus do the same we made with 1-simplices in regard to terminology: writing $[v_0, v_1, v_2]$ indicates the simplex follows the edge $[v_0,v_1]$, then $[v_1, v_2]$ and finally $[v_2, v_0]$. This implies that the inverse-- the simplex going in the reverse direction-- of $[v_0,v_1,v_2]$ is $[v_1,v_0,v_2]$. But the same could be said of $[v_0,v_2,v_1]$. Note also that, say, $[v_1,v_2,v_0]$ goes in the same direction as the original simplex, so that $-[v_0,v_1,v_2]=[v_1,v_2,v_0]=[v_0,v_2,v_1]$, but $[v_0,v_1,v_2]=[v_1,v_2,v_0]$. The secret lies in the parity: whenever we permute an odd amount of vertices in our terminology, we get an inverse; when even, we get the same simplex.

This all points to the direction that we do, indeed, want inverses to be considered in $C^s_n(X)$ and $C_n(X)$, as these can represent important geometrical properties. So, now, instead of simple finite formal, positve sums $a_0+...+a_m$ of simplices/chains, we will also consider negative terms and sums containing them as well. Following the examples, our terminology for simplices will be changed, so that $[v_0,...v_n]$ cares about order, and whenever we permute points in the presentation, we follow the last paragraph's rule: odd permutations invert, even ones result in the same simplex.

Summaryzing, we'll understand now sums (including inverses) of simplices as representing ways to transverse their unions. ????

WHAT ABOUT MULTIPLICATION

Now, what about multiplication? BLABLABBLABLA

Orientations suggest something quite interesting: we might do algebra with our chains! I.e., if $ [v_0, v_1]$ is an edge, we could take the one going in the opposite direction as its inverse: $ [v_1, v_0]=-[v_0, v_1]$. This idea becomes even more promising when we "algebrize" our considerations above concerning following a hole multiple times: for any integer $ n$ and a hole represented by a chain $h$, we should have another hole $ n * h$, represented by  following $ h$ $ n$ times.

BOUNDARIES, HOMOLOGY

As we said, one of the many interesting properties of simplices is that they are constructed in a recursive way: every n-simplex (for $n\rangle 0$ at least) containts many other lower-dimensional simplices inside it-- its faces, its faces' faces etc. This can be described by the intuition of a boundary. 

The case for a 2-simplex is quite educative, so we'll stick for it for a while. Its boundary is composed by its three faces. Now that we can represent geometry with simplex/chain algebra, we could say that the boundary of the 2-simplex is the sum of its face. Writing $ \partial$ for this boundary operator and using our terminology for simplices, we can write

$ \partial [v_0,v_1,v_2] = [v_0,v_1]+[v_1,v_2]+[v_2,v_0]$

In particular, using the properties of our notation, we could also write $ \partial [v_0,v_1,v_2] = [v_1,v_2]-[v_0,v_2]+[v_0,v_1]$.

What about the boundary of sums of simplices?

One very important thing is also that, following the formula above, $\partial (-[v_0,v_1,v_2])=\partial([v_1,v_0,v_2])=[v_1,v_0]+[v_0,v_2]+[v_2,v_1]=-[v_0,v_1]-[v_1,v_2]-[v_0,v_2]=-\partial([v_0,v_1,v_2])$. Thus, $\partial([v_0,v_1,v_2])+\partial(-[v_0,v_1,v_2])=0$.

For the case of the 1-simplex, we can use the sign 0-simplices in order to distinguish 

...

We can reinterpret these equations to get a general, more useful formula. In fact, assuming orientations give rise to algebraic sign, we can consider boundaries as alternating sums. 

$ \partial_n([v_0,...,v_n]) = \sum_i (-1)^i [v_0, ..., \widehat{v_i}, v_n]$

We can then define the boundary on the whole space of simplices linearly: i.e., if $a,b\in C^\s(X)$, $\partial(a+b)=\partial(a)+\partial(b)$.

Seeing the circle as a simplicial complex, we have that $ \partial_1([v_0, v_1]+[v_1,v_2]+[v_2,v_0])=\partial_1([v_0, v_1]) + \partial_1([v_1, v_2])+\partial_1([v_2, v_0])=([v_1]-[v_0])+([v_2]-[v_1]) + ([v_0]-[v_2])=0$-- that is, the sum of simplices corresponding to the circle has null border.

This boundary definition also applies for general delta spaces. As we did in the previous section, instead of dealing directly with simplices and their faces, we use chains and their restrictions. Thus, we define the boundary of a chain $\sigma : \Delta^n\rightarrow X$ as

$ \partial_n(\sigma) = \sum_i (-1)^i \sigma \mid   [v_0, ..., \widehat{v_i}, v_n]$

Seeing the circle as a delta space as we described previously, we also have that, if $\sigma$ is the one 1-chain in the construction, $\partial_1\(sigma)=\sigma\mid  [v_1]-\sigma\mid  [v_0]=0$ since $\sigma\mid  [v_1]=\sigma\mid  [v_0]$.

For the torus as a delta space, $\partial_2(U+L)=\partial_2(U)+\partial_2(L)=(U\mid  [v_1,v_2]-U\mid  [v_0,v_2]+U\mid  [v_0,v_1]) + (L\mid  [v_1,v_2]-L\mid  [v_0,v_2]+L\mid  [v_0,v_1])=(-b-a+c)+(a-c+b)=0$. As intended, the sum corresponding to the whole torus has null boundary.

Boundaries now allow us to define cycles in our space: these are the chains with null boundaries, $ \partial_n(\sigma)=0$. A common name for the set of vanishing values of a function $ f$ is called its kernel, denoted $ \ker f$: $ \ker f = {x \mid   f(x)=0}$. Thus, n-cycles are elements of $ \ker \partial_n$.

Still, there are many cycles that don't give rise to holes, and, as discussed, this is exactly because they're boundaries of some chain of the above dimension. Formally, these are the chains in the image of the boundary: n-boundaries are elements of $ \im \partial_{n+1}$. 

In the example of the circle $S^1$, we have only one 1-chain of the form $c = [v_0,v_0]$, thus $\partial_1 (c)=v_0-v_0=0$ , and it is a cycle. Since we have no 2-chains, $\partial_2 = 0$, so it's not a boundary of anyone. For $D^2$ , we have a similar situation with the one 1-chain $c=[v_0,v_0]$ which is a cycle, but it's also the boundary of the 2-chain $U = [v_0, v_0, v_0]$ ($ \partial_2 ([v_0,v_0,v_0])=[v_0,v_0]-[v_0,v_0]+[v_0,v_0]=[v_0,v_0]=c$)-- i.e., $ c$ is "filled out" by $ U$.

The formula we gave above for the boundary allows us to easily prove some of the most important facts in all of algebraic topology (and, indeed, many other areas of maths as well): $ \partial_n(\partial_{n+1} (\sigma))= 0$-- more succintly, $ \partial_n\circ \partial_{n+1}=0$, or even $ \partial ^2=0$. Visually, this means that the boundary of a boundary is null, or, equivalently, that all boundaries are cycles! Mathematically, $ \operatorname{im} \partial_{n+1} \subset \ker \partial_n$. 

This fits perfectly in the $S^1$ and $D^2$ examples: $S^1$ has a hole, but $D^2$ hasn't because it has been filled by a 2-chain (a 2d surface)!

We'd like now to find a formal way of getting holes. First, all boundaries should be considered a "0 hole", and, as discussed, cycles differing by a boundary should be treated as the same hole. This fits perfectly with the notion of a quotient in group theory. Thus, it's time to introduce group theory formally into our theory.

GROUPS

A group is an algebraic object that generalizes addition with the integers. I.e., it is a set with some operation such that there's a "neutral element" $ e$ and, for any element $a$, an inverse $a^{-1}$ such that $a*a^{-1}=a^{-1}a=e$:

DEF

When dealing with groups, we are not interested in all functions $f:G\rightarrow H$, but only in those that bring and respect algebraic information, stabilishing a relation between the operations of the different groups. These are called homomorphisms. A homomorphism between groups $G$ and $H$ is a function $f:G\rightarrow H$ such that $f(ab)=f(a)f(b)$ for all $a,b\in G$. 

EXS

The classical exemple of a group are the integers $ \mathbb{Z}$ with respect to addition. Following it, we have the modular groups $ \mathbb{Z}/n\mathbb{Z}$, $ n\in \mathbb{Z}$. These have as base set $ {0, 1, ..., n}$, the operation $ a*b$, written $ a+b \mod n$ (or, if $ n$ is understood by the context, just $a+b$), being the rest of $ a+b$ divided by $ n$. I.e., it is "clock addition": !!! 

For example, $ \mathbb{Z}/2\mathbb{Z}$ has base set $ {0,1}$, with mod 2 addition that satisfies $1+1=0$, as in the table below. As another example, in $ \mathbb{Z}/5\mathbb{Z}$ mod 5 addition gives us results like $3+2=0$ (the rest of $3+2$ divided by $5$ is 0), $4+3=2$ etc. 

We can describe the groups above through presentations, which are a compact way of analysing groups we'll use a lot. A presentation of a group $G$ is written as $G=\langle a_0, a_1,..., a_n \mid   R\rangle $, where $R$ is a set of algebraic relations using our group operations (things like $a_3 * a_2 = a_6^{-1}$, $a_1^2=a_0*a_3$ etc.). We interpret this as saying that $G$ is generated by elements $a_0,...,a_n$ and all their possible (finite) products, and that they satisfy the relations $R$ (the identity being assumed and thus omited). 

For example, $\mathbb{Z} = \langle 1 \rangle$, i.e., the integers are generated by a single element, without any relations (we say it is freely generated by $1$)-- we say $\mathbb{Z}$ is freely generated by a single element. We also have $\mathbb{Z}/n\mathbb{Z} = \langle a \mid   a^n=e \rangle$.

Vector spaces with vector addition are also classical examples of groups, and linear transformations are alse homomorphisms (NOTE). !!!

Coming back to spaces and their holes, $C^s(X)$ and $C(X)$ as we defined are also groups with respect to simplex/chain addition. More than this, since we also described multiplication by an integer, they are $\mathbb{Z}$-modules: indeed, they are modules freely generated by simplices/chains on $X$.

All groups mentioned above are abelian, but many common groups aren't. 

S_n

Rubik

QUOTIENTS

Now, the examples above should be sufficient to note some interesting behaviours. First, it seems like there's a strong relation between $ \mathbb{Z}$ and the groups $ \mathbb{Z}/n\mathbb{Z}$. Indeed, for each member of $ \mathbb{Z}$, we have a new mod group-- and, since each subgroup of the integers is of the form $\langle n\rangle$, we can also say that every subgroup of $ \mathbb{Z}$ gives us a new group. Indeed, we also have, given the element/subgroup $\langle n\rangle$, a surjective homomorphism $f:  \mathbb{Z} \rightarrow \mathbb{Z}/n\mathbb{Z}$ given by $f(m) = m \mod n$.

EX EM D6

Let's try to generalize these constructions. Indeed, given a group $G$ and a subgroup $ H\leq G$, we'll consider the sets $aH = {ah \mid   h\in H}$ for every $a\in G$, which are called the (right) cosets of $ H$. ...@@@

These considerations prompt us to define a new group, whose base set are the cosets $aH, a\in G$, with the operation $aH * bH = (ab)H$. Let's denote this new wanna-be group as $G/H$, called the quotient of $G$ by $H$. In this way, we should get a homomorphism $f: G\rightarrow G/H$ given by $ f(a)=aH$. We should then have, for every $ h\in H$, $f(h)=hH=H=eH$-- i.e., $G/H$ is a method for annihilating elements of $H$, in the same way mod addition nullifies multiples of $n$ (or, rather, elements of $\langle n\rangle$). 

In particular, if $h\in H$, $f(a+h)=f(a)*f(h)=f(a)$, so that elements differing by an element of $H$ are seen as equivalent. This reminds us of how cycles differing by a boundary should be considered as the same hole!

We can check now if $G/H$ is actually a group. It indeed has an identity (the coset $H$ itself), inverses ($aH*a^{-1}H=eH=H$) and is associative. Seems like we have group, but not really: the operation itself is not neccesarily well-defined. By this, I mean that if we have identical right-cosets $aH=xH$ and $bH=yH$, then we should be able to swap them freely in the operation: $aH*bH$ should be the same as $xH*yH$, $xH*bH$, etc. If this isn't the case, no reasonable algebra will be possible!

Sadly, not all subgroups $H$ of a group $G$ allow for a well-defined quotient operation. However, this actually won't be a problem, because all the subgroups we're interested in will have this property! For this, define a normal subgroup $ H\leq G$ to be a subgroup such that, for every $g\in G, \, h\inH$, $ghg^{-1}\in H$. Note that all subgroups of an abelian group are normal, since then $ghg^{-1}=gg^{-1}h=h\in H$.

Theorem: the operation in $G/H$ is well-defined if and only if $H$ is normal. In particular, if $G$ is an abelian group, all quotients are well-defined.

Proof:

...

With all this group theory machinery, we can now finally define our homology groups where holes live!

First, let's formalize the work we've done so far with chains, cycles and boundaries. Given a $\Delta$-space structure on $X$, we let $C_n(X)=a_1\mathbb{Z}\times ... \times a_m \mathbb{Z}$ be the free abelian groups generated by all the n-chains $a_1,...,a_m$ in the structure. The boundary homomorphisms $ \partial_n : C_n(X)\rightarrow C_{n-1}(X)$ are defined by the formula we got earlier: $\partial_n(\sigma) = \sum_i (-1)^i \sigma \mid   [v_0, ..., \widehat{v_i}, v_n]$. We thus get the so-called chain complex of the $\Delta$-space structure on $X$:

$ ...\rightarrow$ POR PARTIAL ACIMA DAS ARROWS

We define the n-cycle subgroup to be $Z_n(X)=\ker \partial_n$ and the n-boundary subgroup to be $B_n(X)=\im \partial_{n+1}$. Since $\partial_n\circ \partial_{n+1}=0$, $B_n(X)\leq Z_n(X)$. Finally, the dimension n homology group of $X$ is the quotient

$ H_n(X) = \frac{\ker \partial_n}{\im \partial_{n+1}}$

By all our previous considerations, elements of $H_n(X)$ represent n-dimensional holes in $X$!

HOMOLOGY: EXAMPLES

CIRCLE (PERHAPS USED ALL ALNG THE EXPALANTION)

Let's consider 

$ \partial_1(\sigma)=\sigma \mid  [v_1] - \sigma \mid   [v_0] = \sigma \mid  [v_1]-\sigma \mid  [v_1] = 0$

and thus $ H_1(S^1)=\mathbb{Z}$-- as expected, the circle has a single hole!

TORUS

For the torus $ T^2=S^1\times S^1$, we can give DELTA STRUCT

Let's compute all the neccesary kernels and images. For $$

$ \ker \partial_1$:

These correspond to classes of loops. Indeed, we have that $ \partial_1 (a)=\partial_1 (b)=\partial_1 (c)=0$, so that $ \ker \partial_1 = \langle a, b, c\rangle$, the entire 1-chain space.

$ \im \partial_1$:

By the above, $\im \partial_1 = 0$.

$ \ker \partial_2$:

Now, we have that $ C_2 = \langle U, L\rangle$: for the boundaries, we have $ \partial_2 (U) = c - b - a$ and $ \partial_2 (L) = b + a - c$, so $\partial_2 (U) = - \partial_2 (L)$, and since $\partial_n$ is a homomorphism, $\partial_2(U+L)=\partial_2(U)+\partial_2(L)=0$. We conclude that $\ker \partial_2 = \langle U+L\rangle $. Geometrically, this is very intuitive: $U+L$ corresponds to the whole surface of the torus, which indeed has no border. 

$ \im \partial_2$:

The computations above also show us that $\im \partial_2 = \langle c - b - a \rangle = \langle a + b - c\rangle$ (remember that $\langle a\rangle$ always equals $\langle -a\rangle$, by definition of the generated subgroup).

With these computations, we then get that $H_1(T)=\langle a, b, c\rangle / \langle a+b-c\rangle = \langle a, b, c\mid  a+b-c=0\rangle$. But in this group $ c=a+b$, so indeed the generator $c$ is unnecessary, and $H_1(T)\cong \langle a,b\rangle\cong \mathbb{Z}^2$. So we have two holes: those of the class of $a$ and those of the class of $b$, as expected!

For $H_2(T)$, we have $H_2(T)=\langle U+L\rangle /0=\langle U+L\rangle \cong \mathbb{Z}$, and we have a "2-dimensional hole" corresponding to the hollow surface of the torus. 

K BOTTLE

The Klein bottle has $ \partial_1 (a)=\partial_1 (b)=\partial_1 (c)=0$, similar to the torus. Also similar to $T^2$, $ \partial_2(U)=c-b-a$. However, $ \partial_2(L)=b-a-c$. 

Thus, in order to the chain $mU+nL$ to be a cycle, we must have $ \partial_2(mU+nL)=\partial(mU)+\partial(nL)=m\partial(U)+n\partial(L)=-(m+n)a+(n-m)b+(m-n)c=0$. In particular, since the chain group is freely generated of the form $ \langle a,b,c\rangle $, we must have the each of the three coefficients multuplying $a,b,c$ must be zero: $m+n=n-m=m-n=0$. Having $m=-n$ thus suffices, and we conclude that $ \ker \partial_2 = {mU-mL\mid  m\in\mathbb{Z}} = \langle U-L\rangle $.

As for $ \im \partial_2$, we saw it is equal to $ \langle c-b-a, b-a-c\rangle $. Indeed, since $ (c-b-a)+(b-a-c)=-2a$, we also have $ \langle c-b-a, b-a-c\rangle =\langle c-b-a, 2a\rangle =\langle a+b-c, 2a\rangle $.

We can then conclude that $H_1(K)=\langle a,b,c\rangle /\langle a+b-c, 2a\rangle =\langle a,b,c\mid  a+b-c=0,2a=0\rangle $. Again, $c$ is determined as $a+b$, and we may simplify to get $ H_1(K)=\langle a,b\mid  2a=0\rangle \cong \mathbb{Z}\times \mathbb{Z}/2\mathbb{Z}$.