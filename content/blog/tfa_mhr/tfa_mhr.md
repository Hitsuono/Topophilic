+++
date = '2025-01-14T12:33:23-03:00'
draft = true
math = true
comment = true
title = "Algebraic topology and game dev: graphics, Rubik's cube and winning flows"
tags = ["Topology for Artists"]
toc = true
js = ["/js/GlslCanvas.js"] 
+++

# TL;DR

In our search for topological invariants, we'll learn how **holes** can be defined and be used to study spaces. This will require studying "model" spaces, known as simplicial complexes, which are widely used in **3D rendering**. We will be able to define general topological concepts like "*boundary*" and "*cycle*". This will be formalized through a quick detour on **group theory**, the study of permutations and their algebras, which can be exemplified by the *moves and configurations* of a **Rubik's cube**. With this machinery, we'll define the **homology groups** of a topological space, in which holes live, and are one of the most important and studied *topological invariants* of spaces. 

{{< toc >}}

{{< unity-webgl-player 
    gameTitle="Build 001"
    width="800" 
    height="600"
    buildURL="/unity_builds/b1/Build" 
    buildFileName="WebGL_Build"
    playerID="jonas"  >}}


{{<webgl 0>}}
!!! - to do
??? - to explain

{{< figure src="flagellation.jpg" caption="*Flagellation* of Christ, by **Piero** della Francesca." >}}


{{< figure src="anamorphic.jpg" caption="*Flagellation* of Christ, by **Piero** della Francesca." >}}


{{< shadertoy id="DlffR8" caption="oiiii" >}}

TODO:
    TRIANG CILINDRO
    melhorar parte de complexos
    3d: setup geral de 3d render, melhorar explicac dos algoritmos (CORREC: depth é do pixel, n do triangulo. precisa melhorar bastante ambas as explicacs), iluminac e orientac. Usar imgs e shaders. Orientac das edges tbm!
    delta spaces: corrigir e revisar
    #deixar claro q orientac é prop topológica já no início!
    MESHES N SÃO 2-SIMPLEXOS (EG TRIANGS INTERSECTANDO), MAS BASEADOS E REDUTÍVEIS A ESTES

TODO:Corrigir estrutura de simplexo do círculo. Dar exemplo do disco.

Delta sets tem q FILL o espaço (td ponto no interior de algm)

ALG LIN:
    matrizes
    tipos de coisas q são trans lins, TRANSLAC NÃO É
    Distância euclidiana $d(a,b)$, norma e normalizac
    dot e exterior products (matrizes tbm?)

ÁLGEBRA N É PRA SER EXPERIMENTO OU SURPRESINHA, MAS ALGO Q SURGE PRA SOLUCIONAR E JUNTAR TUDO NUM MESMO ESPAÇO!!!

**NA INTRO, DAR + EXEMPLOS DE CASOS PERFEITOS: EG, S1 1 CICLO 1D, TORO 1 2D, 2 1D, ETC. VERY IMPORTANT!!!**

# Introduction and intuition
This post will connect many different topics, but let us begin straight away with a question of topological character: what is a hole? How many holes does a space have?

See, if topology is rubbersheet geometry-- where things can be seen as equivalent whenever you can transform one into another continuously, without gluing or cutting--, then it should be intuitive that "holes" could lead us to topological invariants. You can't, for example, turn a circle into a disk or a line without cutting it or gluing stuff to it. Equally, a hollow sphere can't be turned homeomorphically to a plane or something similar. Holes are getting in the way of such transformations. This visually makes sense, but how to actually "compute" the holes of a space? This is the main theoretical purpose of this post: developing a theory of holes mathematicians call **homology theory**, which uses notions from topology, geometry and algebra.

First note that there is a dimensionality factor when we talk about what we intuitively call a hole. For 1D spaces (lines, circles, segments, graphics, etc.), we're thinking about a loop-- a path that ends where it begins. Not only that, but a loop which has "no interior" filling its inside. For 2D spaces (planes, spheres, surfaces like the torus, etc.), having a hole means they're "hollow", in the sense they're surfaces without a border and "not filled". This means that each dimension has a unique notion of "n-dimensional hole", but we'll find these all have something in common.  

Both for 1D and 2D holes, there are two intuitive ideas in play. First, holes should represent shapes that are "closed into itself", that are "cycles" in the sense they have no border-- that an ant can transverse them forever, and never fall off. They are also "unfilled", there's nothing "inside them"-- or, rather, they aren't the boundary of some filling matter. Both of these conditions are neccessary. For example, if we take the boundary circle of a disk by itself, it is indeed a loop, a cycle. But it is also filled by the content of the disk, being its boundary. On the other hand, a circle has a hole, but can be filled to become a disk, which is hole-less.

IMG!!! (S1 E D2)

I.e., holes are represented by cycles (boundaryless shapes) that aren't filled (not the boundary of anything, non-boundary shapes). 

Imagine we have a surface-- say, a cylinder-- and want to find 1D holes in it. We can try to see the different loops we can draw on this cylinder. Some of these loops are filled and can be continuously contracted inside the surface to a single point. These don't really tell us anything about holes. However, there is another class of loops that are not filled within the cylinder-- those that "go around it", so to speak. These all should represent holes!

IMG!!! (CILINDRO E CICLOS)

Similarly, take a 2D shape like a ring-- i.e., a disk with a smaller disk cut out from it, like a DVD. We have a single hole in this space. Consider the two circles that compose the boundary of this shape. Both are cycles. None of them are the complete boundary of some subspace, indicating they're also unfilled. They should be seen as representing the hole we made-- and the same can be said about all the loops in between them! Note that this is all because of the puncture we introduced in the original disk, otherwise all these loops would be boundaries.

IMG!!! (RING)

This could be perfected, though. See, in both examples above, we have a single hole, but infinitely many non-boundary cycles representing it. This seems a little awkward. Thankfully, all these cycles have something in common: whevener you pick two of them, they form the complete border of a surface (in the first case, of a "mini-cylinder", in the second of a "mini-ring" contained in the original space).

This leads us to think of holes as actually **classes of non-boundary cycles**, two cycles being on the same class if they together form the boundary of some space of one dimension above-- so to speak, if they are "connected", or "joined" by that surface. 

Most of this post will deal with the non-trivial, although highly enriching proccess of formalizing this inutitive definition.

# Basic linear algebra

To actually be able to apply our considerations to topological spaces and compute holes, let's start by defining simpler, "model" spaces. First, a quick reminder on basic linear algebra.

We can see elements $(a_0,...a_n)$ of $ \mathbb{R}^n$ in two ways: as points in a space (the $a_i$ being its coordinates), or as arrows going from the origin $ (0,...,0)$ (we will also usually write just $0$ for the origin from now on) to $(a_0,...a_n)$. In the second intepretation, we call them vectors. Points and vectors are really the same thing in $\mathbb{R}^n$, so we'll call them interchangeably.

Bearing in mind the geometry-topology distinction, the fact that points in $ \mathbb{R}^n$ are also vectors-- i.e., directions-- is actually a geometric property, related directly to curvature. Indeed, if we curved the plane in order to get the upper hemisphere of a sphere, points wouldn't coincide if directions, as seen in the image below. Directions at a certain point $x$ in our base space $X$ in the so-called tangent space $T_xX$, which is a copy of $ \mathbb{R}^{dim(X)}$. With the reals, these spaces can be identified, but not for any curved space.

Interestingly, this means that we could informally define $\mathbb{R}^n$ as the space of all directions. Thus, if arithmetic and calculus never lead us to the notion of real numbers (and their sequences), we could still find them through this definition, as a sort of configuration/state space of directed arrows. This method-- defining a space as the "state space" of objects we're studying-- is extremely fruitful, and we'll apply it in later posts.

Vectors unite algebra and geometry very deeply. We can define an addition with vectors by adding all their components: $ a+b= (a_0,...,a_n)+(b_0,...,b_n)=(a_0+b_0,...,a_n+b_n)$. Geometrically, this corresponds as taking $b$ and setting its origin to the end of $a$, and taking the sum as the arrow from the origin to the end of this displaced $b$ vector. This forms a triangle, as seen in the image below.

ADD VETORIAL

We also define what's called **scalar multiplication** between a real number $ \alpha$ (called a "scalar") and a vector $v=(a_0,...,a_1)$: $\alpha v = (\alpha \cdot a_0,...,\alpha \cdot a_1)$. Geometrically, we're stretching $v$ by a factor of $\alpha$ (negative numbers inverting the direction of the vector).

We could do these operations with other sets instead of $\mathbb{R}^n$-- like with $\mathbb{C}^n$, $\mathbb{Q}^k$ or subspaces of $\mathbb{R}^n$, as we will se below. Thus, we generally define a **real vector space** as a set $V$-- whose members are called vectors-- with an operation $+$ satisfying familiar properties: for all $a,b\in V$, we have
- $a+b = b+a$ (commutative property);
- $(a+b) +c=a+(b+c)$ (associative property);
- there is an element $0$ such that $a+0=0$;
- for all $a$ there is an element $-a$ such that $a+(-a)=a-a=0$.

Similarly, we define scalar multiplication $\alpha \cdot a$ for all $\alpha\in \ro, a\in V$, satisfying the distributive propert $\lambda \cdot(a+b)=\lambda a + \lambda b$. We could also define scalars coming from other sets instead of the reals, like the complex numbers. For linear algebra to make sense, these sets also need some algebraic structure, forming what's called a **field**. Fields are sets together with operations $+, \times$ similar to addition and multiplication as we know them from the real or complex numbers. We'll study these latter.

A vector $v$ is called a linear combination of other vectors $v_1,...,v_k$ when we have that $v=\alpha_1v_1 + ... + \alpha_kv_k$ for some $\alpha_1,...,\alpha_k$. This notion can be used to, say, describe colinearity: if for example $v=\alpha v'$ for some other $v'$, this means $v$ and $v'$ are in the same line. Similarly, if $v=\alpha_1v_1+\alpha_2v_2$, then $v$ is in the plane containing $v_1, v_2$ (try seeing this in $\mathbb{R}$^3).

For a finite set $S$ of vectors, its span $\text{span}(S)$ is the set of all possible linear combinations using elemnts from $S$.

Particularly important is the set $e_1,...,e_n$ of vectors $e_i$ with an $1$ in the $i$-th position and zeros elsewhere. Every element of $\mathbb{R}^n$ can be written as a linear combination of these vectors: if $v=(v_1,...,v_n)$, then $v=v_1e_1+...+v_ne_n$.

A set of vectors $\{v_1,...,v_k\}$ is linearly independent (l.i.) if no $v_i$ is a linear combination of some vectors contained in the set. Geometrically, this means we don't have co-linear/planar/etc. points in the set. Note that $e_1,...,e_n$ as defined above are l.i.

For a l.i. set $S=\{v_1,...,v_k\}$, every element of its span can be represented uniquely by elements of $S$. Otherwise, say we had $v=\alpha_1v_1+...+\alpha_kv_k=\beta_1v_1+...+\beta_kv_k$ for at least one $i$ such that $\alpha_i\neq \beta_i$. We can choose $i=1$ (just order $S$ differently), and then then $v_1=(\beta_2v_2+\dots+\beta_kv_k-\alpha_2v_2.-\dots-\beta_kv_k)/(\alpha_1-\beta_1)$, meaning $S$ isn't l.i.-- a contradiction.

In particular, this means $\{v_1,...,v_k\}$ serve as coordinates for $\text{span}(S)$-- we say they are a basis for the span of $S$. For example, $e_1,...,e_n$ is a basis of $\text{span}(e_1,...,e_n)=\mathbb{R^n}$, called the **canonical basis** of $\mathbb{R}^n$-- it is the most natural, but certainly not the only one. In general, the count of vectors neccessary for getting a basis of a vector space $V$ is called its **dimension**, $\text{dim}(V)$.

In $\mathbb{R}^3$, whenever we have two vectors $a, b$, we can form a base by bringin in a vector $c$ perpendicular to the plane containing $a, b$ (their span). We could do this with the so-called **cross product** $a\times b$, defined as 

$$(a_0,a_1,a_2)\times (b_0,b_1,b_2) = (a_1\cdot b_2 - b_1\cdot a_2, a_2\cdot b_0 - b_2\cdot a_0,a_0\cdot b_1-b_0\cdot a_1)$$

You can check that this indeed generates a base whenever $a,b$ come from the canonical one. The formula might seem a bit daunting, but it has a fairly straightforward geometrical interpretation, which we'll skip here for length's sake.

Linear algebra considers not only these algebraic-geometric constructions, but also functions preserving them. More specifically, it also studies linear transformations, which are functions $f:\mathbb{R}^m\rightarrow \mathbb{R}^n$ such that $ f(a+b)=f(a)+f(b)$ (they "respect vector addition") and $f(\alpha a)=\alpha f(a), a\in\mathbb{R}$ (they "respect scalar multiplication").

A linear transformation is a function of the kind $f:\mathbb{R}^m\rightarrow \mathbb{R}^n$, where its output is composed of linear combinations of the components of the input vector: i.e., if $v=(v_1,...,v_m)\in\mathbb{R}^m$, $ f(v)=f(v_1,...,v_m)=(\sum_i\alpha_{1i}v_1,...,\sum_i\alpha_{ni}v_i)\in\mathbb{R}^n$. 

Equivalently, a linear transformation is a function $f:\mathbb{R}^m\rightarrow \mathbb{R}^n$ such that $f(a+b)=f(a)+f(b)$ and $f(\alpha a)=\alpha f(a)$-- we say that it respects sums and scalar products. Computations quickly show that the previous definition satisfies these properties. Conversely, if $f$ satisfies these formulas, then $f(v)=f(v_1,...,v_m)=v_1f(e_1)+...+v_mf(e_m)$, so that $f(v_1,...,v_m)=(\sum_i\alpha_{1i}v_1,...,\sum_i\alpha_{ni}v_i)$ for $\alpha_{ij}$ the $j$-th component of $f(e_i)$.

The two equivalent definitions above tell us two different ways of defining and considering mathematical objetcs. In the first one, we're explicit, or, rather, **extensional**, clearly constructing our objects of interesting. In the second one, we are **intensional**, defining and describing through properties and relations that should be satisfied. Extensive statements are very intuitive and in many cases the definitions we're actually thinking of. Intensive statements, in the other hand, are more generalizable and allow for cleaner reasoning.

Topologically, all linear functions are continuous, since vector addition and multiplication themselves are so.

Linear transformations are very useful for dealing in a systematic way with the solutions of systems linear equations. If we have such a system 

$$\begin{cases}
\alpha_{11}x_1+...+\alpha_{1k}x_k=0 \\  \dots  \\ \alpha_{m1}x_1+...+\alpha_{mk}x_k=0
\end{cases}
$$

with $k$ variables and $m$ equations, we can consider a transformation $f:\ro ^k\rightarrow \ro ^m$ defined as above by considering the vectors $x=(x_1,...,x_k)$ and defining $f(x)=f(x_1,...,x_k)=(\alpha_{11}x_1+...+\alpha_{1k}x_k,...,\alpha_{m1}x_1+...+\alpha_{mk}x_k)$, and the solutions of the system are exactly the members of $\ker f = \{x\in\ro^k\mid f(x)=0\}$-- a set known as the **kernel** of $f$.

Members of $\ker f$ (i.e., solutions to linear systems of equations) satisfy a very important property, namely that for all $a,b\in ker f$, $a+b\in \ker f$, since $f(a+b)=f(a)+f(b)=0$. Similarly $\lambda a\in \ker f$ for all $a\in\ker f$, $\lambda \in \ro$, since $f(\lambda a)=\lambda f(a) = \lambda 0 = 0$. I.e., summing and multiplying vectors of solutions also gives a solution! We can formalize this with the notion of a subspace: given a vector space $V$, a **subspace** $W\subset V$ is a subset where for all $a,b\in W$ and scalars $\lambda$, $a+b\in W$ and $\lambda a\in W$. Lines and planes going through the origin are examples of subspaces, since whenever you add two vectors inside a line/plane, you remain inside it. Indeed, lines are exactly the 1D subspaces of $\mathbb{R}^n$, and planes its 2D subspaces.

Coming back, vectors also allow us to easily define geometrically interesting sets. For example, the line between two vectors $v_0, v_1$ can be written as the set $ \{tv_0+(1-t)v_1\mid  0 \leq t\leq 1\}$.

Another class of geometrical sets that can be defined by vectors are convex hulls. Given a subset $S\subseteq \mathbb{R}^n$, its convex hull is the minimal convex space containing $S$. Remember that $A\subseteq \mathbb{R}^n$ is convex if it contains every line between points inside itself. If $S=\{v_1,...,v_k\}$ is a collection of vectors, then the convex hull $\overline{S}$ of $S$ can be given by all the linear combinations $\lambda_1v_1+...+\lambda_kv_k$ with $\lambda_1+...+\lambda_k=1$, with $\lambda_i\geq 0$ for all $i$.

The proof that $ \overline{S}$ as defined is indeed the convex hull can be made quite constructive. First, to get the hull of $ \{v_1,...,v_k\}$, we add all the lines of the form $ \{tv_i+(1-t)v_j\mid  0 \leq t\leq 1\}$, then again add segments between original vertices to points in these lines, getting $ \{sv_l + (1-s)(tv_i +(1-t)v_j) = sv_l+(t-st)v_i + (1+st-s-t)v_j\mid  0 \leq s,t\leq 1\}$, and so on. This will give us $ \overline{S}$ as defined and, by our construction, it must be inside every convex set containing $ \{v_1,...,v_k\}$. Since $ \overline{S}$ as defined above itself is convex, it must be the convex hull we desired.

# Simplices and topology

## N-simplices and complexes
In order to compute holes, we'll first approximate our spaces using simpler ones-- concretely, polygons-- that will allow for concrete computations. The building blocks of these approximations are called **n-simplices**. Formally, an n-dimensional simplex is defined as the convex hull of $n+1$ points $v_0,...,v_n$ such that the vectors $v_i-v_0$ are all linearly independent, for $i>0$.

For example, for a 1-simplex in $\mathbb{R}^1$, we take two different points $v_0, v_1$, and then fill the interval $[v_0, v_1]$, getting a line betwen $v_0, v_1$: a 1-simplex is a straight line. For a 2-simplex in $\mathbb{R}^2$, we take three l.i. points $ v_0, v_1, v_2$ satisfying $v_1 - v_0$ and $v_2-v_0$ being non-colinear: the 2-simplex will be the triangle with them as vertices. Similarly, a 3-simplex is a pyramid with vertices $v_0,v_1,_v2_,v_3$ in $\mathbb{R}^3$ (assuming these points satisfy the l.i. condition in the definition). That is, **simplices are generalization of polygons**.

The condition that all $v_i-v_0$ should be l.i. guarantees the "faces" of our polygon won't glue to each other: if we had, say, $v_0=(0,0), v_1=(1, 1), v_2=(2,2)$, $v_2-v_0=v_2$ and $v_1-v_0=v_1$ being colinear, the hull of these points would just be a line from $v_0$ to $v_2$, which isn't a triangle-- or rather, it is a triangle with glued, "degenerate" edges, something we don't want to have here.

Since a n-simplex is completely determined by its $n+1$ points $v_0,...,v_n$ (as the hull is unique), we'll denote it as $\angled{v_0,...,v_n}$. For now, the order you put these points in the presentation doesn't matter- but soon it will. Also, note that 0-simplices are just points, the l.i. condition being "nully satisfied" (there are no vectors $v_i-v_0$ for $i>0$!), $\angled{v_0}$ being exactly the set $\{v_0\}$.

By the expression we found for convex hulls, each element $p$ of an n-simplex $\angled{v_0,...,v_n}$ is of the form $\lambda_0 v_0+...+\lambda_n v_n$, with $\sum \lambda_i=1$ and $\lambda_i\geq 0$ for all $i$. These $\lambda_i$ can be interpreted as "simplicial coordinates" of $p$. In the 2-simplex case, each element of the interior of the triangle is given an unique such coordinate in respect to the three vertices, known as its **barycentric coordinate**.

These coordinates are very important because they allow us to extend maps from the vertices $v_0,...,v_n$ to the whole simplex $\angled{v_0,...,v_n}$: if we have **any** function $f:\{v_0,...,v_n\}\rightarrow \mathbb{R}^k$, we can extend it to a linear (and thus **continuous**) map $\widehat{f}:\angled{v_0,...,v_n}\rightarrow \mathbb{R}^k$ by defining 

$$\widehat{f}(\lambda_0 v_0+...+\lambda_n v_n) = \lambda_0 f(v_0)+...+\lambda_n f(v_n),$$

so that, in particular, the image of $\widehat{f}$ is exactly the n-simplex $\angled{f(v_0),...,f(v_n)}$.

For practicality, we also define the standard n-simplex $ \Delta^n$ to be the simplex in $\mathbb{R}^n$ with base points $(0,...,0),(1,0,...,0),(0,1,...,0),...,(0,...,0,1)$. By the formula for the convex hull we gave, $ \Delta^n=\{(\lambda_1,...,\lambda_n)\mid  \sum_i^n \lambda_i=1, \,\lambda_i\geq 0\}$. Every n-simplex is homeomorphic to $ \Delta^n$ by simple linear transformations of translation and stretching. Topologically, $\Delta^n$ is homeomorphic to $D^n$, and so is the case for all other n-simplices. 

For a simplex $\angled{v_0,...,v_n}$, its **faces** are all the sub-simplices $\angled{v_0,...,\widehat{v_i}, ...,v_n}$, where this notation indicates that the index $0\leq i\leq n$ vertex is ommited. For example, a 1-simplex $\gos$ has faces are $\angled{v_1}$ and $\angled{v_0}$, its end and start points. For a 2-simplex, the faces of $\gts$ are $\angled{v_1, v_2}$, $\angled{v_0, v_2}$ and $\gos$, which in this case we can also call the edges of the 2-simplex. Finally, for the 3-simplex $\gths$, its faces are the 2-simplices $\angled{v_1, v_2, v_3},$ $\angled{v_0, v_2, v_3},$ $\angled{v_0, v_1, v_3}$ and $\gts$, in which case the use of the term "face" is closer to the usual. For higher dimensions, the same formula for faces applies as well, even though we can't properly see these simplices.

We'll then call the **boundary** of a simplex to be the set

$$\partial \angled{v_0,...,v_k} = \bigcup_{i=0}^n \angled{v_0,...,\widehat{v_i},...,v_k},$$

i.e., the union of its faces.

The use of intuitive and familiar concepts (like of a face) and this recursive property of simplices-- i.e., they are made of smaller simplices themselves-- are the main reasons why we will use simplices in our computations.

Now, how can we use simplices to understand our spaces better? We'll discuss two ways: simplicial complexes and delta spaces. The first is basically gluing simplices together in order to approximate our space with a polygonal homeomorphic version of it. Formally, **simplicial complex** on $\mathbb{R^n}$ is a set of simplices $S=\{s_1,...,s_k\}$ of possibly different dimensions such that every face of $s_i$ is also in $S$ and so that if $s_1, s_2$ intersect, then their intersection is a common face between them. This means simplicial complexes are constructed by simplices through disjoint unions or gluing their faces together.

For example, a square can be seen as a simplicial complex with two 2-simplices glued on a common edge, as below. These are usually called **quads**. If we use $\Delta^2$ and $\angled{(0, 1), (1, 1), (1, 0)}$ glued along the edge $\angled{(0, 1), (1, 0)}$ to form a quad, we call this simplex the "**standard quad**".

IMG!!! (quad)

IMG!!! (complexos gerais)

Indeed, many spaces of interest can be described as homeomorphic to a simplicial complex on $\mathbb{R}^n$, at least for a high enough $n$. When this is the case, we say our space is triangulable, since in the two-dimensional, surface case this is equivalent to dividing our embedded space into triangles. Generally, a **triangulation** of a space is a homeomorphic space to it which is a simplicial complex-- i.e., it is a **polygonal topological approximation**.

Let's see some examples of complexes homeomorphic to spaces of interest. First, the $\Delta^n$ themselves give us a simplicial model of $D^n$. For the n-dimensional sphere $S^n$, $\partial \Delta^n$ is a complex homeomorphic to it. In the case of the circle, this is just the three edges of a triangle. 

IMG!!!

What about, say, a cylinder? This can be done by gluing four quads in sequence, and then gluing the first and last ones together as well, forming a "square straw".

IMG!!!

Schematically, we could represent this triangulation as follows

For the torus, this is a bit more intricate. We can first form a skewed cylinder with two triangles as its boundary. Make three copies of this shape, and then glue them together in their boundaries, as shown below.

SHADER!!!

Schematically, we can see this triangulation as follows. First, take one of the cylinders and cut the edge joining its two boundary triangles, making a flat piece as shown below. The edges marked as "a" indicate that they should be glued together, and the fact they follow the same direction indicate their start and ending points should be matched (we could reverse these, and get a "twist", as we're going to see further below). Then we join three of these representations in sequence, gluing along the adequate edges. We also mark with "b" the edges that should be finally glued together to form the complete torus. 

IMG!!!

For schematic purposes, we can further simplify this figure flattening it to a square, getting the following (note, this is only a schematic description of how to get the triangulationwe described):

IMG!!!

Of course, all these shapes could be made with many more simplices, getting a better approximation of their idealized, curved versions. But this isn't topologically relevant (at least until we use calculus in algebraic topology, which isn't something we're goint to do in this post).

## Surfaces from squares

### The torus

The last figure above is reminiscent of a common way of getting surfaces. You begin with a square, then label its edges and glue them respecting their start and end points as marked. The torus, as we saw, can be obtained by first joining its north and south edges, forming a cylinder, and then their west and east ones (which, in the cylinder, became its boundary circles).

IMG!!!

### The Möbius strip

Another very interesting shape we can get this way is the **Möbius strip**. You leave the north and south edges alone, and joing the west and east ones-- but with a twist, since they are labeled going in the opposite directions, and thus you have to joing one's start to the other's end. The Möbius strip is the simplest example of a **non-orientable space**, specifically a non-orientable surface here. This means you can't define what is "inside" or "outside" it: try pointing your finger towards a direction you this is outwards from the surface, and then follow the strip until you come back. Your finger will now point to the opposite direction! I.e., you can't define a cohesive notion of outside-ness within the strip. 

More formally, we can't define coherently a normal vector for each point in the strip. A normal vector is a vector perpendicular to a point in a specified surface. Spaces with this property are called non-orientable, and those in which you can define coherent normal vectors for all points are called orientable. Indeed, orientability is a **topological** property: it doesn't how much you strecth an (non)orientable, it will always remain (non)orientable. Spheres, tori and disks, for example, are all space.

Similarly, if an ant transverses the strip in one direction, when it comes back to its initial position it will be facing the opposite direction from the beginning! You can't define inside and outside, nor can you define a cohesive transversing direction! ???

IMG!!! (mobius via square)

The Möbius strip is a very alusive shape, and has inspired many artists and thinkers as a powerful metaphor. The whole world is outside and inside it, so to speak. It is a truly hegelian shape in this sense, a pure form that unifies object and subject, in and out, consciousness and self-consciousness. But let's leave its philosophy for another post of its own.

IMG!!! (obra do MAC)

### The Klein bottle
Another interesting property of $\ro \text{P}^2$ is that it can't be properly seen in 3D space. Technically, we say it isn't embedded in $\rth$-- i.e., it isn't a subspace of it. So don't try to phisically get it from a Möbius strip-- it's impossible to do so in 3D space!

What if we glue the Möbius strip boundary, but without a twist? Well, we would get a space called the **Klein bottle**, which also has been an object of enthusiasm by many mathematicians and math-entusiasts alike. This is also a non-orientable space, and non-embeddable in $\rth$ as well. However, you might have seen the image below, in which the bottle has some of its points glued in order to force it to be able to be seen in 3D space. It is not the Klein bottle, just a way of trying to force it into $\rth$: try fitting a sphere into $\ro$! You will also need to identify some points.

IMG!!! rep square, img


### Perspective and homogenous coordinates * 

There are two other interesting surfaces we can form in this manner which we will use as examples. The first one is the known as the **real projective plane** $\rpt$. It is a space that formalizes the notion of visual perspective, as understood for example in painting and design. Human vision interprets parallel lines as going closer at greater distances, tending to a "vanish point" where they meet. They never arrive this point: only "at infinity" do they do so.

We may formalize this as following. Take the human eye as a point $E$ in 3D space-- we'll assume it is in the origin of our coordinate system. Light rays are arriving in this point from all directions. The 2D image the eye sees can be modeled as a plane $V$ lying exactly in front of the eye, the "vision plane". Generally, we set $V$ to be the plane $z=1$. The color associated with each point within the plane is the color of the real-world object the ray going from the eye to the point eventually hits. 

This model is widely used in computer graphics for projecting 3D scenes into a 2D rendered image. It's also basically identical to the more mature methods developed during the Renaissance for drawing and painting with perspective. The image below by Dürer, for example, represents one of these methods: a line was connected between a fixed point $E$ in the wall (representing our eye/camera) and a point $P$ lying on object. This line passed through a square frame, and the position the line passed through the frame was then marked on paper. This marked point represented the correct perspective position of $P$ on $E$'s vision.

IMG!!! moderno

{{< figure src="durerPerspec.jpg" caption="*The Draughtsman of the Lute*, woodcut by Albrecht Dürer." >}}

In this model, real-world lines are thus associated to a sequence of rays, each one going from $E$ to a point in the line. These rays intersect the vision plane at a unique point. When we have two real-world parallel lines, these give rise to two sequences of rays, which both tend to a single ray parallel to the vision plane. This represents exactly the phenomenom of vanishing points, with this parallel ray representing a "point at infinity" at which lines meet.

!!!IMG?

This prompts us to define the real projective plane $\rpt$ as the space of lines passing through the origin in 3D space- i.e., of 1D subspaces of $\rth$--, with an adequate topology we'll omit here. Lines parallel to the vision plane represent vanishing points, while those that intersect it represent visible ones. That is, this is the space where we can do **projective geometry**, the geometry of perspective and human vision. Similarly, we can define the projective space $\ro\text{P}^n$ of dimension $n$ to be the space of 1D subspaces of $\mathbb{R}^n$. Substituting $\mathbb{R}^n$ by any other vector space $V$, we also can define the projective space $\mathbb{P}(V)$ in the exact same way. We'll come back to these abstract projective spaces later.

Insted of dealing with lines, we could instead take $\rpt$ as $\rth-\{0\}$ and with points $p$ and $q$ being identified, seen as the same, whenever they lie on the same 1D subspace, i.e., if $p = \lambda q$ for a non-zero real $\lambda$. Each $p$ is taken to represent a line going from the origin to it. 3D points treated like this are said to be in 2D **homogenous coordinates**. As described above, every point in 2D cartesian coordinates $(x,y)$ has an associated point in homogenous coordinates, namely $(x,y,1)$, representing the line intersecting the plane $V$ in this position. Points in infinity are exactly those homogenous points that have $z$ coordinate equal to $0$, representing perpendicular lines to $V$. Every other homogenous points $(x, y, z)$ can be brought back to a cartesian $(x,y)$ by the equivalnce $(x, y, z) \sim (x/z, y/z, 1)$, giving a point in our vision plane $V$. 

Generally, homogenous coordinates represent points of $\rpn$ by seeing lines as classes of points, two points $p,q$ being in the same class if they are colinear, giving $p=\lambda q$, $\lambda\neq 0$. We then can pass from cartesian to homogenous coordinates by the continuous function $f:\rn \rightarrow \rpn$ defined by $f(x_1,...,x_n)=(x_1,...,x_n,1)$. Conversely, if $(x_1,...,x_n,x_{n+1})$ has $x_{n+1}\neq 0$, we can go back to usual cartesian coordinates by dividing by $x_{n+1}$, getting the point $(x_1/x_{n+1},...,x_n/x_{n+1})$. In some sense, going from cartesian to homogenous coordinates gives a local parametrization of $\rpn$ by $\rn$-- more technically, we have a homeomorphism $f:\rn \rightarrow \{(x_1,...,x_n,x_{n+1})\in\rpn \mid x_{n+1}\neq 0\}$ given by the $f$ above. Our decision to use the last coordinate was because we used the convention of the vision plane $V$ in $\rth$ as the plane $z=1$, but this isn't strictly neccesary. That is, we could define a whole set of local homeomorphisms $f_i:\rn \rightarrow \{(x_1,...,x_i, x_{n+1})\in\rpn \mid x_{i}\neq 0\}$ by $f_i(x_1,...,x_n)=(x_1,...,x_i,1,...,x_n)$, introducing an $1$ at the $(i+1)$-th coordinate. This way, we can actually cover $\rpn$ by the image of these functions, which are all homeomorphic to $\rn$. 

We won't go much further on the considerations above, but these $f_i$ actually give a **manifold** structure on $\rpn$, a manifold being a space which is covered by homeomorphic copies of some $\rn$ for a fixed $n$. Most spaces we study here are manifolds: the sphere and the torus for example. Manifolds do not have boundaries. The Möbius band and all simplicial comlexes, on the other hand, are "manifolds with boundaries": their "interior" is a manifold, but they also have a boundary of one dimension below.

Graphics programmers are probably familiar with homogenous coordinates, although for somewhat different reasons. They are widely used to transform objects in 3D scenes, specially because translations become linear transformations in these coordinates: more specifically, a translation by a vector $(t_1, t_2, t_3)$ can be given by the transformation $T(x, y, z, w)=(x + w * t_1, y + w * t_2, z + w * t_3, w)$, so that homogenous points $(x, y, z, 1)$ can be translated using $T$-- while those at infinity of the form $(x, y, z, 0)$ are seen as merely giving direction, without further spacial content.

To see how $\rpt$ can be obtained from a square, note that if $S^2_N$ is the northern hemisphere of the sphere (counting the equator as well), then we have a continuous function $g:S^2_N \rightarrow \rpt$ sending each point in the hemisphere to the unique line passing through it. This is injective outside the equator (and topologically equivalent to the function $f$ described above relating to perspective), but inside it every point $p$ in the equator is mapped to the same line as its antipode $-p$-- the point diametrically opposite to it. This means we can see $\rpt$ as a copy of $S^2_N$, but with antipodal points in the equator glued together. Homeomorphically turning $S^2_N$ into a square, this is exactly what the representation below does! Note that the original four vertices of the square became just two with the identifications we made.

IMG!!!

One very interesting way of getting $\rpt$ is through the Möbius strip. See, the latter has a boundary, which is a single loop. In the square representation, this loop is the non-glued horizontal edges. What if we glue them in opposite directions (i.e., again with a twist)? Well, the representation above just showed that we would get the projective plane! In particular, we also have that $\rpt$ isn't orientable.

## Delta spaces

As we can see by the examples above, finding a triangulation of a space can be very tedious. This is because we strictly require that our spaces be composed of simplices. But what if we just asked for it to be composed of chains--i.e., images of simplices? For the circle, e.g., instead of making it with two 1-simplices, we could just take one 1-simplex and glue its ends. This wouldn't be a simplicial complex, but would still be an image of one, with just one 1-chain.

For the torus, instead of the exhausting triangulation we could do as follows. Take two 2-chains (filled triangles), and name each edge $a,b,c$. Glue the respective $c$ edges, forming a square. Then also glue the $a$ edges, forming a cylinder. Finally, glue the $b$ edges, forming a torus.

This gives us the notion of a $\Delta$-space. Technically, it is a space $X$ with a set of chains $\sigma_i:\Delta^n\rightarrow X$ such that the image of the restriction $\sigma_i\mid  F$ for a face of $\Delta^n$ is itself the image of another chain $\sigma_j:\Delta^{n-1}\rightarrow X$ of one dimension below. As we did in the case of simplicial complexes, we also require that the interiors of the images of $\sigma_i,\sigma_j$ be disjoint. 

$\Delta$-spaces present us with some incoveniences when representing chains. With simplicial complexes, every simplex could be uniquely described by a list of (non-repeating) vertices. We can't really do the same with $\Delta$-spaces: take the example of the circle we described, where there's only one vertex with a 1-chain $\sigma$ connecting it to itself. We could try to represent it as $\os$, but it is clearer if we instead just write it as $ \sigma |{\os}$, with $ \sigma |  [v_0]=\sigma | [v_1]$.

## Simplices, probabilities and decision games **
PROB

GAMES- DEFS

EXS
PRISIONERS
ROUSSEAU (EX DO LIVRO + EX DO MAL AMIGO DAS CONFISSOES)
    ex mistos?
BACH X SCHOENBERG (COM MÚSICAS EMBEDDADAS)

$$\begin{array}{c|c c }
  & \text{Bach} & \text{Schoenberg}  \\
\hline
\text{Bach} & 2,1 & 0,0  \\
\text{Schoenberg} & 0,0 & 1,2 \\
\end{array}
$$

{{< youtube RDADGE44i_o >}}
    EX MISTOS
ELEIC?

ESTRATEGS DOMINADAS

## 3D graphics and simplices

Simplices and simplicial complexes shouldn't be foreign to those artists working with 3D rendering. In this area, they go by the name of **meshes**, which are just simplicial complexes constructed only gluing 2-simplices, plus some extra data we will discuss below. 

Meshes have different implementations on different frameworks, but here is a quite minimalistic one we'll use in this post:

{{< highlight cpp "linenos=table,hl_lines=0,linenostart=1" >}}
struct Mesh{
    vec3[] vertices;
    vec2[] uv; // UV maps, allow for textures. See below.
}
{{< / highlight >}}

In the structure above, each three consecutive elements of the array `vertices` represent a triangle in the simplicial structure. The standard 2-simplex $\Delta^2$ embedded in $\rth$, for example, has `vertices = [(0, 0, 0), (1, 0, 0), (0, 1, 0)]`; the complex formed by two 2-simplices making a square may have `vertices = [(0, 0, 0), (1, 0, 0), (0, 1, 0), (1, 0, 0), (1, 1, 0), (0, 1, 0)]`, with the last three vertices representing the triangle we joined with $\Delta^2$. Finally, defining `v0 = (0, 0, 0), v1 = (1, 0, 0), v2 = (0, 1, 0), v3 = (0, 0, 1)`, the boundary of the standard 3-simplex  $\Delta^3$  may be given `vertices = [v1, v2, v3, v0, v2, v2, v0, v1, v3, v0, v1, v2]` (this may seem a bit daunting, but not it is just a matter of applying the formula for the boundary we found before).

For each vertex, we also associate a so-called UV value, which is a vector of dimension 2. Points inside the triangle also have UV values, obtained by interpolating using their barycentric coordinates. UV maps help us texturing our surface: the $(u,v)$ value of a point in the triangle indicates that it should have the colour of the pixel in position $(u,v)$ inside the texture image.

3D SCENES
But why are meshes used in 3D rendering? 

There are two main methods used to render a 3D scene: **rasterization** and **raytracing**. The latter is the most intuitive: in it, for each pixel in the screen you define an infinite ray from the camera passing through the point in the vision plane associated to the pixel. Starting from the camera position, you keep "marching" through the ray, with a point further away from the camera at each step, until you reach an object. You then return data from this object (like its material, its color etc.), and use that further in your rendering pipeline.

In a GLSL-like pseudo-code, this may be written as follows:

{{< highlight cpp "linenos=table,hl_lines=0,linenostart=1" >}}
// General raytracing algorithm

for(pixel in image){

    vec3 direction = rayDirection(pixel);
    vec3 origin = cameraPosition;
    vec3 p = origin; // marching point

    float dO = 0.0; // distance from the origin (camera position)
    float dS = 1e10; // distance from a surface. Initialized as a very high number

    SurfaceData surfaceData; // other data from hit surface

    // MIN_DISTANCE is a small number indicating the marching point is close enough to a surface
    // MAX_DISTANCE is a large number indicating the marching point is off the scene
    while(dS > MIN_DISTANCE && dS < MAX_DISTANCE){
        p = origin + dO * direction;
        dS = distanceFromSurface(p);
        surfaceData = getData(p);
        dO += dS;
    }

    pixel.color = getColor(dS, surfaceData);
}
{{< / highlight >}}

The crucial mathematical step in the algorithm is how to get the distance from $p$ to surfaces inside our scene. How might we find that value? The most straightaway way is to use the surfaces' SDFs-- their "signed distance functions". This is a function that directly-- or, using the more common mathematical term, analitically-- tells you the distance between a point and an embedded (orientable) space, giving positive sign if it is "outside" the object, and negative if it is "inside" it. 

Below is an example of a SDF for a sphere of radius $r$ and center $c$ in $\rth$:

{{< highlight c "linenos=table,hl_lines=0,linenostart=1" >}}
float sphereSdf(vec3 p, vec3 c, float r){
    // length gives the Euclidian distance between p and c: length(v) = sqrt(v[0]^2 + v[1]^2 + v[2]^2)
    return distance = length(p - c) - r;
}
{{< / highlight >}}

When used to render a 3D scene, this will give us a smooth sphere. Sadly, most shapes you will see on, say, video games, do not have such an easy SDF. This may change with the progress of [neural SDFs](https://research.nvidia.com/labs/toronto-ai/nglod), which use neural networks to learn these functions, but, for the most part of the history of computer graphics, using SDFs to render was not practical for most situations. 

The solution was to try to approximate surfaces using simplers shapes-- namely, triangles, or 2-simplices, for which we can use a single known SDF ([see here](https://www.shadertoy.com/view/4sXXRN) for an implementation). And so were meshes born, as complexes made by these triangles. That is, meshes are just triangulations of surfaces we want to approximate. 
The more 2-simplices a mesh has, the more detail our model will be able to have. 

The reader might have noted that there is a slight mathematical problem here: SDFs only really work with orientable surfaces! This is a problem if you try to render a Möbius strip directly using a SDF, but not really if you approximate it using triangles, specially because these have positive SDFs in 3D space, so there's no problem here concerning "inside" or "outside".

Raytracing has the problem that it can take too much time inside the `while` loop trying to hit a surface. Rasterization is then a more efficient alternative. In it, we project our mesh triangles into the vision plane-- something that can be quickly done by the GPU using linear algebra and projectivization. For each pixel we then check if it is contained inside one of these triangles, and use that to define its color. 

We also have to check in the case a pixel is inside many of these triangles-- for example, if we have two triangles in our scene, one behind the other in relation to the camera. To solve that, we compare each point projecting to that pixel, and render only the color associated to the point closest to the camera- i.e., the one with least "depth". These depth values for each pixel are stored in an array called the **depth buffer**.

{{< highlight cpp "linenos=table,hl_lines=0,linenostart=1" >}}
// General rasterization algorithm

for(pixel in image){
    int x = pixel[0];
    int y = pixel[1];

    for(triangle in scene){
        vec2 v0 = project(triangle[0]);
        vec2 v1 = project(triangle[1]);
        vec2 v2 = project(triangle[2]);
        
        float depth;
        if(pixelInTriangle(v0, v1, v2, &depth)){ 
            // pixelInTriangle changes the depth value to be the depth of the projected triangle
            if(depth < depthBuffer[x, y]){
                image[x, y] = triangle.color;
                depthBuffer[x, y] = depth;
            }
        }
    }
}

{{< / highlight >}}

Meshes become more interesting when you introduce **lighting and shading** to your rendering pipeline. Imagine you have a lamp on a point $O$ on your 3D scene, and want to use it to illuminate objects. One of the basic ways to do so is as follows: for each point $P$ in a surface, trace a line from $P$ to $O$. In vector terms, get $O-P$. Then you find the normal $N_P$ of the surface at $P$. If they are colinear and point in the same direction, this means $P$ is standing right in front of $O$, so that, if it isn't obstructed by any other object, it should receive maximum lighting. That is: the closest $P$ and $N_P$ are to being pointing in the same direction, the more iluminated $P$ should be. That's exactly what the dot product measures, so the lighting $L(P)$ in $P$ is proportional to $(O-P)\cdot N_P$, and so it should also be in relation to the intensity $I$ of the lamp. It also should be inversely proportional to the distance $d(O,P)$, and be strictly positive. This means we might model $L(P)$ with the following formula:

$$L(P) = \max (I\, \frac {(O-P) \cdot N_P} {d(O, P)}, 0)$$

Note that, as we're using normals, this method doesn't really work with non-orientable surfaces-- which, again, isn't really the end of the world. The real problem is: how to get $N_P$ for all $P$? Using meshes, this is actually pretty simple: if $\angled{v_0, v_1, v_2}$ is a 2-simplex, then its normal should be a vector ortogonal to the plane containing $v_1 - v_0$ and $v_2 - v_0$, which can be computed using the cross product. The question is, however, in each direction should this normal point to-- i.e., if we use $(v_1 - v_0)\times (v_2 - v_0)$ or $(v_2 - v_0)\times (v_1 - v_0)=-(v_1 - v_0)\times (v_2 - v_0)$. The **convention** is to do $(v_1 - v_0)\times (v_2 - v_0)$, and we call this the "**positive orientation**" of the 2-simplex, the other possibility being the negative orientation.

We can quickly integrate orientation in our mesh structure. Indeed, for each three consecutive vertices `v0, v1, v2` representing a triangle, we'll use the positive orientation in the convention above. Presenting everything in the correct order then becomes very important-- if we get a single triangle wrong, our mesh will be shaded in an absurd way, with some triangles being suddenly bright and other suddenly dark because of the wrong orientations.

We interpret the orientation of a triangle as also being associated with one of its edges: in the positive one, we see edges going in the directions `v0 -> v1`, `v1 -> v2` and then `v2 -> v0`, and then negative one with opposite directions. This allows us to use the **right-hand rule**: take your right hand and curl your fingers in the direction the triangle's edges take, except the thumb; then extend your thumb, and that is the the direction of the normal vector giving the orientation.

IMG right hand

That is, an orientation of a 2-simplex also orients its faces. The opposite is also true: if we have the direction the edges follow, we have also have an orientation. Actually, even more: if we have a **single** edge direction, we can deduce the others' as well, and so we also have an orientation.

## Orientations and boundaries

With the discussions above, it really seems like orientation is a very relevant topological property with important applications. Meshes also showed us how to integrate this notion with complexes-- which, per se, are just sets of points, without any orientation information. So perhaps we'd like to do this same move in the mathematical level, getting "**oriented simplices and complexes**" which do come with some orientation. This will also require a change in terminology: instead of writing $\angled{v_0,...,v_n}$, we'll write $[v_0,...,v_n]$ for this new kind of spaces, and order will matter in the presentation. Similarly to the 2-simplex case, giving an orientation to a n-simplex will be equivalent to giving one for one of its faces.

Let's begin orienting 1-simplices. This is simple, as they can then be seen as directed paths: we will say $\os$ is an oriented simplex with base $\angled{v_0,v_1}$, and going from $v_0$ to $v_1$-- $[v_1,v_0]$ then being the oriented simplex going in the opposite direction. In the same way meshes' orientations were associated to the orientation of their edges, may say that $\os$ gives $[v_1]$ a "positive" orientation and $[v_0]$ a "negative" one. 

Reiterating, this all means that, with oriented simplices, the order we write our base vectors in $[v_0,...,v_k]$ will from now on matter.

Formalizing for the 2-dimensional case, we determine that $\ts$ has oriented edges $[v_0, v_1]$, $[v_1,v_2]$ and $[v_2,v_0]$. The other possible oriented 2-simplex would be the one with inverted edges $[v_1,v_0]$, $[v_0,v_2]$ and $[v_2,v_1]$, which can then be written as $[v_1,v_0,v_2]$. Note that $[v_1,v_2,v_0]$ has the same orientation as $\ts$, both being positive, since their edges follow the same path. Indeed, whenever you swap two neighboring vectors in the presentation, you get the 2-simplex going in the opposite direction. This means that if you do an odd amount of swaps (in what we will call an **odd permutation**), you get the opposite simplex; if you do an even amount (in an **even permutation**), you get the same one. You can see this rule also applies for 1-simplices, and indeed will be the case for any n-simplex.

IMG !!! (MOSTRANDO COMO SE DESENHA ORIENTAC P/ TRIANGULO, BARICENTRICO TBM)

Suggestively, we may write $-[v_0,...,v_k]$ for the simplex with the opposite orientation of $[v_0,...,v_k]$. In particular, we just saw that $[v_0,v_1]=-[v_1,v_0]$ and 


$$\ts=[v_1,v_2,v_0]=-[v_1,v_0,v_2]=-[v_0,v_2,v_1],$$

for example.

Indeed, we can see that defining an orientation for 1 and 2-simplices is actually the same as giving an orientation for all its faces. In both cases, for a simplex $[v_0,...,v_k]$, we used the convention that $[v_1,...,v_k]$ (excluding the first vector from the presentation) was one of its oriented edges-- $[v_1]$ in the case of $\os$, $[v_1,v_2]$ in the case of $\ts$.

We can generalize all of this. Indeed, $[v_0,...,v_k]$ will denote from now on an **oriented k-simplex**. We will use the convention that it has $[\widehat{v_0},...,v_k]$ as one of its faces, which, by the above considerations, is enough to determine the orientation of all its other faces. What we noted for 1 and 2-simplices with regard to permutations is still valid: odd permutations of vertices in the presentation give the opposite simplex, even ones give you the same simplex. From now on, we'll also call "oriented simplices" just "simplices" ????????

What about complexes? We'll say a simplicial complex is oriented if we give each of its simplices an orientation. There are many possible such orientations. Applying to 3D rendering, each of these orientations represents a way of shading our mesh. In many of these, neighbouring triangles have different orientations, resulting in suddenly light or dark regions, which isn't an effect we really desire. For orientable surfaces, we might want to find a single, "canonical", orientation such that all triangles have coherent normals, so that the whole surface will have a smoother and cohesive lighting-- indeed, that's precisely the definition of an orientable surface. 

To obtain this orientation, consider the complex made by gluing the two 2-simplices $\gts$ and $\angled{v_1,v_3,v_2}$ on the common face $\angled{v_1,v_2}$, making a square. Say we orient the first one as $\os$, so that, using the right-hand rule, its normal points towards us. What orientation should we give to the other triangle so that its normal may have the same direction? Again using the right-hand rule, it should be $[v_1, v_3, v_2]$. Note that, at their common edge, they have different orientations: one has $[v_1, v_2]$ as an edge, the other $[v_2, v_1]$. Since the orientation of a single face defines the orientation of a simplex, we could've guaranteed coherent normals by just positing the oriented simplices have opposite orientations on their common face.

This is valid in general: every time you glue two n-simplices together and you want them to have coherent normals (either both pointing outwards or inwards), their common $n-1$ face should come from faces of the opposite direction in each original simplex-- and this last condition is indeed sufficient. Orientable surfaces are exactly those that can be approximated by oriented simplices satisfying this property for all simplices with common faces.

For example, this **can** be done on the triangulation we provided for the torus, as shown belown. 

IMG!!! (ESQUEMA, SHADER)

As a result, we can correctly shade this triangulation-- and, since orientability is a topological property, this applies for any other mesh representing a torus:

SHADER!!!

For example, that's something you **can't** do in the triangulation we presented of the Möbius strip. Consider, say, the orientation provided in the image below, where we're trying to which can be noted on the triangles at the horizontal extremes: they meet booth in the same oriented face $[p_0, p_5]$! Any other orientation will eventually have the same problem. 

IMG!!! (ESQUEMA, SHADER)

As a result, we can't shade this Möbius strip triangulation correclty-- and, since orientability is a topological property, this applies for any other mesh representing the strip:

SHADER!!!

This rules is valid for all n-simplices themselves, which are all orientable. So, seeing the 2-simplex as a collage of 1-simplices forming a triangle, if two edges are glued, then one's end must be the other's starting point (remember, a point has positive orientation in a 1-simplex if it is its end point). This collage perspective allows us to know the orientation of a 2-simplex just by knowing the orientation of one of its edges, and similarly can be done for a 1-simplex (if we know the positive point, we know the other must be negative). 

Let's see how this works in the example of a 3-simplex $\ths$. By our convention, it has an oriented face $[v_1,v_2,v_3]$. This 2-simplex shares the oriented edge $[v_2,v_3]$ with $\angled{v_0,v_2,v_3}$, so the oriented version of the latter must contain the edge $[v_3,v_2]$ going in the opposite direction, and so it must be $-[v_0,v_2,v_3]$. Doing similarly for all other faces of the pyramid, we get that its oriented faces are $[v_1,v_2,v_3]$, $-[v_0,v_2,v_3]$, $[v_0,v_1,v_3]$ and $-[v_0,v_1,v_2]$.

These considerations actually allows us to get a formula for the oriented faces of a simplex $[v_0,...,v_k]$. We know that its geometrical faces are all the possible $\langle v_0,...,\widehat{v_i},...,v_k\rangle$, so we just need to find their *oriented* versions. We have one already: $[\widehat{v_0},...,v_k]$, by our convention. As for the orientation of $\angled{v_0,\widehat{v_1},...,v_k}$, we see that it shares the face $[v_2,...,v_k]$ with $[\widehat{v_0},...,v_k]$***, so it must have the opposite orientation as it has-- i.e., it is negativ***e. Going by a similar procedure, we see that $\langle v_0,...,\widehat{v_{i+1}},...,v_k\rangle$ always has the opposite orientation of $\langle v_0,...,\widehat{v_i},...,v_k\rangle$. Thus, using our suggestive sign notation, we get that the **oriented** faces of $[v_0,...,v_k]$ are

$$(-1)^i[v_0,...,\widehat{v_i},...,v_k],$$

for $0\leq i\leq k$.

CHAINS!!!

As for chains,

## Doing algebra with faces

Now that we know how to describe faces, we can define the boundary of a simplex $\a$, denoted $\partial (a)$ or simply $\partial a$. For an isolate geometrical simplex $\angled{v_0,...,v_k}$, remember we have

$$\partial \angled{v_0,...,v_k} = \bigcup_{i=0}^n \angled{v_0,...,\widehat{v_i},...,v_k},$$

and, for an oriented simplex, we just found out

$$\partial [v_0,...,v_k] = \bigcup_{i=0}^n (-1)^i[v_0,...,\widehat{v_i},...,v_k]$$

But what about the union of simplices $a,b$ inside a simplicial complex? For geometrical simplices, we should have this as the union of their boundaries, disconsidering common faces:

$$\partial (a\cup b)=\bigcup_{e\in (\partial a \cup \partial b) - (\partial a \cap \partial b)}e$$

What about for oriented simplices? Take the case of two simplices meeting in an orientable mesh, with a coherent orientation. Their common face should be disconsidered for boundary of the union, as if this face was "canceled"-- exactly because it had different signs in each simplex. This means there might be some algebra going behind the curtains!

Indeed, let us think of union of oriented simplices as a kind of a sum, and opposite orientations giving us negative sign. We write $a-a=0$, indicating that faces of opposite orientation should be cancelled in a sum. We can understand $0$ as the null set, or some sort of formal "null n-simplex", satisfying $a+0=0+a=a$ for any simplex $a$. In that case, we could write something like

$$\partial_n([v_0,...,v_n]) = \sum_{i=0}^n (-1)^i [v_0, ..., \widehat{v_i}, ..., v_n]$$

And then postulate $\partial(a + b)=\partial a + \partial b$-- which, in particular, would cancel common faces. This leads us to think in algebraic terms, revealing potential extra structure involved with oriented simplices. Also note how the boundary follows some sort of "linearity", as do linear transformations. Structures and connections: these are a mathematician's dream!

Take as an example two 2-simplices $a=\ts$ and $b=[v_1,v_3,v_2]$ glued along the edge $\angled{v_1,v_2}$. In that case, $\partial a = [v_1,v_2]-[v_0,v_2]+[v_0,v_1]$ and $\partial b = [v_3,v_2]-[v_1,v_2]+[v_1,v_3]$, so that

$$\begin{align}
    \partial (a+b)=\partial a + \partial b &= -[v_0,v_2]+[v_0,v_1]+[v_1,v_3]+[v_3,v_2]
                                         \\&= [v_2, v_0]+[v_0,v_1]+[v_1,v_3]+[v_3,v_2],
\end{align}$$

and indeed we get the correct oriented boundary-- with the common edge canceled!

This is great with different simplices, but what about something like $a+a$? We know that $a\cup a = a$, so perhaps we should write $a+a=a$? But since we have inverses, this would mean that we could subtract both sides by $-a$, getting $a=0$-- which doesn't seem good at all. The second most natural option would be to write $a+a = 2a$, which wouldn't bring any algebraic problems. We could interpret this as "following", or "transversing" $a$ twice, so that this formal addition we're describing is not to be understood as an union, but a "composition" of these actions. In the case of a 1-simplex, it would be as following the the path twice; for a 2-simplex, it is like doing a twist twice. This is more intuition than a formal relation, but it shows how geometrical simplices have a set-like logic, while oriented ones can indeed have an algebraic one.

How to formalize this? Well, we will do that properly in the next section when we talk groups, but let us summarize the major points. For a simplicial complex, let $a_0,...,a_k$ be all its n-simplices. Then we saw that it makes senses to consider formal finite sums $n_i \cdot a_i+...+n_j\cdot a_j$, $n_i$ being any integer-- possibly even negative or equal to $0$. We also write $a_i-a_i=0$, $0$ being a null, formal element. Let us call the set of all these sums $C^s_n(X)$ !!! We also described a function $\partial _n : C^s_n(X)\rightarrow C^s_{n-1}(X)$, given by the formula above, satisfying some sort of linearity condition: $\partial_n(a+b)=\partial_n (a) + \partial_n (b)$ (note that the same $+$ symbol in each side represent operations on the different sets $C^s_n(X)$ and $C^s_{n-1}(X)$, respectively).

EXAMPLE

CHAINS

This boundary definition also applies for general delta spaces. As we did in the previous section, instead of dealing directly with simplices and their faces, we use chains and their restrictions. Thus, we define the boundary of a chain $\sigma : \Delta^n\rightarrow X$ as

$$\partial_n(\sigma) = \sum_i (-1)^i \sigma |   [v_0, ..., \widehat{v_i}, v_n]$$

Seeing the circle as a delta space as we described previously, we also have that, if $\sigma$ is the one 1-chain in the construction, $\partial_1(\sigma)=\sigma|  [v_1]-\sigma|  [v_0]=0$ since $\sigma|  [v_1]=\sigma|  [v_0]$.

For the torus as a delta space, 
$$\begin{align}
\partial_2(U+L)=\partial_2(U)+\partial_2(L)&=(U|  [v_1,v_2]-U|  [v_0,v_2]+U|  [v_0,v_1]) 
\\&\,\,\,\,\,\,\, + (L|  [v_1,v_2]-L|  [v_0,v_2]+L|  [v_0,v_1])
\\&=(-b-a+c)+(a-c+b)=0
\end{align}$$
As intended, the sum corresponding to the whole torus has null boundary.

## Cycles and holes

So far, we haven't really needed any kind of more formal algebraic theory to make sense of our considerations, so let's dive a little deeper into how we can use the geometry of simplices, chains and their boundaries to study general topological spaces. 

First, boundaries allow us to properly define what "cycles" mean. As mentioned in the introduction, these correspond to loops on our space, but also to hollow surfaces, and the corresponding higher-dimensional cycles. What these have in common is that they are "boundaryless", in some sense "self-enclosing". We can thus describe these just the chains $\sigma$ with null boundaries, $ \partial_n(\sigma)=0$. We can reuse the terminology of linear algebra and then define the set of n-cycles in $X$ as $Z_n(X)=\ker \partial_n$.

Still, there are many cycles that don't give rise to holes, and, as discussed, this is exactly because they're boundaries of some chain of the above dimension. Formally, these are the chains in the image of the boundary map, and form the set n-boundaries, $B_n = \im \partial_{n+1}$. 

In the example of the circle $S^1$, we have only one 1-chain of the form $c = [v_0,v_0]$, thus $\partial_1 (c)=v_0-v_0=0$ , and it is a cycle. Since we have no 2-chains, $\partial_2 = 0$, so it's not a boundary of anyone. For $D^2$ , we have a similar situation with the one 1-chain $c=[v_0,v_0]$ which is a cycle, but it's also the boundary of the 2-chain $U = [v_0, v_0, v_0]$ ($ \partial_2 ([v_0,v_0,v_0])=[v_0,v_0]-[v_0,v_0]+[v_0,v_0]=[v_0,v_0]=c$)-- i.e., $ c$ is "filled out" by $ U$.

The formula we gave above for the boundary allows us to easily prove some of the most important facts in all of algebraic topology (and, indeed, many other areas of maths as well): $ \partial_n(\partial_{n+1} (\sigma))= 0$-- more succintly, $ \partial_n\circ \partial_{n+1}=0$, or even $ \partial ^2=0$. Visually, this means that the boundary of a boundary is null, or, equivalently, that all boundaries are cycles! Mathematically, $ \operatorname{im} \partial_{n+1} \subset \ker \partial_n$. 

This fits perfectly in the $S^1$ and $D^2$ examples: $S^1$ has a hole, but $D^2$ hasn't because it has been filled by a 2-chain (a 2d surface)!

We'd like now to find a formal way of getting holes. First, all boundaries should be considered a "0 hole", and, as discussed, cycles differing by a boundary should be treated as the same hole. This fits perfectly with the notion of a quotient in group theory. Thus, we can't avoid it anymore: it's time to introduce group theory formally into our theory.

# Groups, permutations and their games

## Definitions
A group is an algebraic object that generalizes addition with the integers. I.e., it is a set with some operation such that there's a "neutral element" $ e$ and, for any element $a$, an inverse $a^{-1}$ such that $a*a^{-1}=a^{-1}a=e$:

DEF

When dealing with groups, we are not interested in all functions $f:G\rightarrow H$, but only in those that bring and respect algebraic information, stabilishing a relation between the operations of the different groups. These are called homomorphisms. A homomorphism between groups $G$ and $H$ is a function $f:G\rightarrow H$ such that $f(ab)=f(a)f(b)$ for all $a,b\in G$. These are to a general group what linear transformations are to vector spaces, in the sense they respect and can be defined by some operation as well as linear transformations respect and are defined by addition and scalar multiplication.


## Example: abelian groups and modules

The classical exemple of a group are the integers $ \mathbb{Z}$ with respect to addition. Following it, we have the modular groups $ \mathbb{Z}/n\mathbb{Z}$, $ n\in \mathbb{Z}$. These have as base set $ {0, 1, ..., n}$, the operation $ a*b$, written $ a+b \mod n$ (or, if $ n$ is understood by the context, just $a+b$), being the rest of $ a+b$ divided by $ n$. I.e., it is "clock addition": !!! 

For example, $ \mathbb{Z}/2\mathbb{Z}$ has base set $ {0,1}$, with mod 2 addition that satisfies $1+1=0$, as in the table below. As another example, in $ \mathbb{Z}/5\mathbb{Z}$ mod 5 addition gives us results like $3+2=0$ (the rest of $3+2$ divided by $5$ is 0), $4+3=2$ etc. 

We can describe the groups above through presentations, which are a compact way of analysing groups we'll use a lot. A presentation of a group $G$ is written as $G=\langle a_0, a_1,..., a_n \mid   R\rangle $, where $R$ is a set of algebraic relations using our group operations (things like $a_3 * a_2 = a_6^{-1}$, $a_1^2=a_0*a_3$ etc.). We interpret this as saying that $G$ is generated by elements $a_0,...,a_n$ and all their possible (finite) products, and that they satisfy the relations $R$ (the identity being assumed and thus omited). 

For example, $\mathbb{Z} = \langle 1 \rangle$, i.e., the integers are generated by a single element, without any relations (we say it is freely generated by $1$)-- we say $\mathbb{Z}$ is freely generated by a single element. We also have $\mathbb{Z}/n\mathbb{Z} = \langle a \mid   a^n=e \rangle$.

Vector spaces with vector addition are also classical examples of groups, and linear transformations are alse homomorphisms (NOTE). !!!

Coming back to spaces and their holes, $C^s(X)$ and $C(X)$ as we defined are also groups with respect to simplex/chain addition. More than this, since we also described multiplication by an integer, they are $\mathbb{Z}$-modules: indeed, they are modules freely generated by simplices/chains on $X$.

## Example: fields, finite projective spaces and "Spot It!" * 
FIELDS e VECTOR SPACES

Finite fields

Project
$$P( \mathbb{Z}^3_2)$$

Spot it e project

## Example: non-abelian groups and permutation games
All groups mentioned above are abelian, but many common groups aren't. 

D_n

S_n

Rubik

Jogos de permutac

## Example: topological groups and quaternions *
O(n), SO(n)

SO(2) e S1

C e SO(2)

H e SO(3)

Fibrac de Hopf

RP3 = SO(3)

## Group quotients

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

EXS DE QUOCIENTES COM PRESENTACS

# Homology theory

With all this group theory machinery, we can now finally define our homology groups where holes live!

First, let's formalize the work we've done so far with chains, cycles and boundaries. Given a $\Delta$-space structure on $X$, we let $C_n(X)=a_1\mathbb{Z}\times ... \times a_m \mathbb{Z}$ be the free abelian groups generated by all the n-chains $a_1,...,a_m$ in the structure. The boundary homomorphisms $ \partial_n : C_n(X)\rightarrow C_{n-1}(X)$ are defined by the formula we got earlier: $\partial_n(\sigma) = \sum_i (-1)^i \sigma \mid   [v_0, ..., \widehat{v_i}, v_n]$. We thus get the so-called chain complex of the $\Delta$-space structure on $X$:

$$...\xrightarrow{\partial_3}C_2(X)\xrightarrow{\partial_2}C_1(X)\xrightarrow{\partial_1}C_0(X)\rightarrow 0$$

We define the n-cycle subgroup to be $Z_n(X)=\ker \partial_n$ and the n-boundary subgroup to be $B_n(X)=\im \partial_{n+1}$. Since $\partial_n\circ \partial_{n+1}=0$, $B_n(X)\leq Z_n(X)$. Finally, the dimension n homology group of $X$ is the quotient

$$H_n(X) = \frac{\ker \partial_n}{\im \partial_{n+1}}$$

By all our previous considerations, elements of $H_n(X)$ represent n-dimensional holes in $X$!


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

With these computations, we then get that $H_1(T)=\langle a, b, c\rangle / \langle a+b-c\rangle = \langle a, b, c\mid  a+b-c=0\rangle$. But in this group $ c=a+b$, so indeed the generator $c$ is reduntant in the presentation, and $H_1(T)\cong \langle a,b\rangle\cong \mathbb{Z}^2$. So we have two holes: those of the class of $a$ and those of the class of $b$, as expected!

For $H_2(T)$, we have $H_2(T)=\langle U+L\rangle /0=\langle U+L\rangle \cong \mathbb{Z}$, with a "2-dimensional hole" corresponding to the hollow surface of the torus. 

K BOTTLE

The Klein bottle has $ \partial_1 (a)=\partial_1 (b)=\partial_1 (c)=0$, similar to the torus. Also similar to $T^2$, $ \partial_2(U)=c-b-a$. However, $ \partial_2(L)=b-a-c$. 

Thus, in order to the chain $mU+nL$ to be a cycle, we must have $ \partial_2(mU+nL)=\partial(mU)+\partial(nL)=m\partial(U)+n\partial(L)=-(m+n)a+(n-m)b+(m-n)c=0$. In particular, since the chain group is freely generated of the form $ \langle a,b,c\rangle $, we must have the each of the three coefficients multuplying $a,b,c$ must be zero: $m+n=n-m=m-n=0$. Having $m=-n$ thus suffices, and we conclude that $ \ker \partial_2 = {mU-mL\mid  m\in\mathbb{Z}} = \langle U-L\rangle $.

As for $ \im \partial_2$, we saw it is equal to $ \langle c-b-a, b-a-c\rangle $. Indeed, since $ (c-b-a)+(b-a-c)=-2a$, we also have $ \langle c-b-a, b-a-c\rangle =\langle c-b-a, 2a\rangle =\langle a+b-c, 2a\rangle $.

We can then conclude that $H_1(K)=\langle a,b,c\rangle /\langle a+b-c, 2a\rangle =\langle a,b,c\mid  a+b-c=0,2a=0\rangle $. Again, $c$ is determined as $a+b$, and we may simplify to get $ H_1(K)=\langle a,b\mid  2a=0\rangle \cong \mathbb{Z}\times \mathbb{Z}/2\mathbb{Z}$.

# Applications
## Retractions and fixed points
Suppose we have a retraction $r:X\rightarrow A$. Then the induced homology homomorphisms $r_*^H :H_n(X)\rightarrow H_n(A)$ would be surjective, since for chains $r_*^C:C_n(X)\rightarrow C_n(A)$ is surjective. 

This simple remark shows us that **there is no rectraction** $r:D^2\rightarrow S^1$, since this would give a surjection $0\cong H_1(D^2) \rightarrow H_1(S^1) \cong \mathbb{Z}$, which is absurd. This is a very relevant topological fact, and one that isn't easy at all to prove without some algebraic machinery like homology! Its relevance can be seen, for example, in how it can be used to prove this extremely useful and powerful theorem:

**Theorem (Brower's fixed point theorem)**: Every continuous function $f:D^2\rightarrow D^2$ has a fixed point (i.e., $x$ such that $f(x)=x$).

**Proof**: Suppose we had some $f:D^2\rightarrow D^2$ without fixed points, so that, for all $x$, $x\neq f(x)$. Then we can form a ray going from $x$ to $f(x)$, and this ray intersects $S^1$ at some unique point. Define $r(x)$ to be this intersection. This $r$ is then a retraction $D^2\rightarrow S^1$, which isn't topologically possible, so we have a contradiction.

{{< qed >}}

Brower's fixed point theorem is a very useful theorem. It is, for example, commonly used to prove that certain equations have solutions with fixed points (e.g. equations of **movement**, like from liquids or planetary systems). It is also used in game theory to prove the existence equilibriums (see [Nash equilibrium](https://en.wikipedia.org/wiki/Nash_equilibrium)) or lack thereof (see [Arrow's theorem](https://en.wikipedia.org/wiki/Arrow%27s_impossibility_theorem)). Here, we will use it to prove a very interesting fact about the following board game.

## The Hex game
HEX

HEX WINNER

**Theorem**: Hex always has a winner.

**Proof**: First, note that the graph $B_k$ gives us a **triangulation** of the square $D_k=[0,k]\times [0,k]$ (take the triangles to be filled), which is homeomorphic to a 2D disk (filled circle). Assuming there exists a Hex game without a winner, we will construct a map $f:D_k\rightarrow D_k$ without a fixed point, which is a contradiction. 

Since simplices are convex hulls and $D_k$ is triangulated by $B_k$, every element of $D_k$ can be written uniquely as a linear combination $\lambda_0 v_0 + \lambda_1 v_1 +\lambda_2 v_2$, for $v_0,v_1,v_2$ vertices of $B_k$ and $\lambda_0+\lambda_1+\lambda_2=0$, all $\lambda_i$ positive. In particular, every function $f:B_k\rightarrow \rt$ can extend to one $\widehat{f}:D_k\rightarrow \rt$ by defining $\widehat{f}(\lambda_0 v_0 + \lambda_1 v_1 +\lambda_2 v_2)=\lambda_0 f(v_0) + \lambda_1 f(v_1) +\lambda_2 f(v_2)$.

Assume that we have $H,V$ such that there is no Hex winner. Now, let us define a function $f:B_k\rightarrow B_k$ which will be extended to $\widehat{f}:D_k\rightarrow D_k$ that will lead to the contradiction. Define $\widehat{W}$ to be the subset of $H$ connected to the western extreme $W$, and similarly for $\widehat{E}$, $\widehat{S}$ and $\widehat{N}$. The assumption we have no winner is equivalent to saying that $\widehat{W} \neq \widehat{E}$ and $\widehat{S} \neq \widehat{N}$, or that $\widehat{W}$ (or $\widehat{S}$) and $\widehat{E}$ (or $\widehat{N}$) are connected. Then define $f$ as

$$
\begin{align}
f(z)  &= z + (1, 0) \;\;\; \text{for} \; z\in \widehat{W} 
    \\&= z - (1, 0) \;\;\; \text{for} \; z\in \widehat{E} 
    \\&= z + (0, 1) \;\;\; \text{for} \; z\in \widehat{S} 
    \\&= z - (0, 1) \;\;\; \text{for} \; z\in \widehat{N} 
\end{align}
$$

That is, we push elements of each set towards the winning direction. Since we assume this is a draw, doing so would still leave us inside the board $B_k$, so that indeed the function has type $f:B_k\rightarrow B_k$. We define $e(z)$ to be the vector $z$ is pushed by $f$. You can understand the vector $e(z)$ as giving you a victory direction, and $f(z)$ making $z$ follow this **"winning flow"**. Extending $f$ as we described above, we have a map $\widehat{f}:D_k\rightarrow D_k$. 

Note in particular that three points $v_0,v_1,v_2$ forming a triangle in $B_k$ can't have a pair $v_i, v_j$ such that $e(v_i)=-e(v_j)$, because that would imply $\widehat{W}$ and $\widehat{E}$ (or $\widehat{S}$ and $\widehat{N}$) are connected, and we would have a winner!

By definition, if $x = \lambda_0 v_0 + \lambda_1 v_1 +\lambda_2 v_2$, then it is a fixing point of $\widehat{f}(x)$ only if 

$$\begin{align}
\widehat{f}(x)=\lambda_0 f(v_0) + \lambda_1 f(v_1) +\lambda_2 f(v_2) &= \lambda_0(v_0+e(v_0)) + \lambda_1(v_1+e(v_1)) + \lambda_2(v_2+e(v_2))
\\&=\lambda_0 v_0 + \lambda_1 v_1 +\lambda_2 v_2=x
\end{align}$$

This forces $\lambda_1e(v_0)+\lambda_1e(v_1)+\lambda_2e(v_2)=0$, which amounts to say that the 2-simplex generated by $e(v_0),e(v_1),e(v_2)$ contains the origin. This is only possible if some of these three vectors are inverses. However, as noted above, this is a contradiction! Thus, Hex can't have draws. 

{{< qed >}}

REFORMULAR COM FLOW E VECTOR FIELDS DIRETO
REMARKS SOBRE INTUICIONISMO

## Nash equilibria **
NASH EQUILIBRIA
    EXS PUROS (prisionners, eleic)
    EXS MISTOS (bach, pennies)

EXISTÊNCIA
**Theorem**: every game with finite players and actions has at least one Nash equilibrium;

**Proof**:
Let $\sigma \in \Delta^{i_1}\times...\times\Delta^{i_k}$ be a mixed strategy. Let's try to define a "winning flow" which, for each $\sigma$, points in the direction of the direction of a strategy with better expected gains. For this, define for each $\sigma$ a function $\text{Gain} (\sigma): A \rightarrow \ro^i$ that, for each action $a$, returns the expected gain to player $i$ given the action:

$$\text{Gain}_i(\sigma)(a) = \max (0, u_i(a, \sigma_{-i}) - u_i(\sigma))$$

Then we can try to define the flow by pushing $\sigma$ by its gain: $g(\sigma)(a) = \sigma(a) + \text{Gain}(\sigma)(a)$. This, however, doesn't necessarily gives an element inside $\Delta = \Delta^{i_1}\times...\times\Delta^{i_k}$, because its components might not sum to one. What we need is a flow definition $f$ such that $\sum_{b\in A_i}f(\sigma)_i(a_j)=1$. To get this $f$, note that, since $\sigma_i$ is an element of a simplex,

$$\sum_{a\in A_i} g(\sigma)_i(a) = \sum_{a\in A_i} \big( \sigma_i(a) + \text{Gain}_i(\sigma)(a) \big)=1 + \sum_{a\in A_i} \text{Gain}_i(\sigma)(a).$$

This means we can define a flow $f:\Delta\rightarrow\Delta$ normalizing $g$ by this value:

$$f(\sigma)_i(a) = \frac{\sigma_i(a) + \text{Gain}_i(\sigma)(a)} 
                      {1 + \sum_{b\in A_i} \text{Gain}_i(\sigma)(b)},$$

which indeed satisfies the property of returning mixed strategies.

Since $\Delta$ is a product of simplices, it is homeomorphic to a disk of some higher dimension, and the fixed point theorem applies. That is, there exists at least one $\sigma^*\in\Delta$ such that $f(\sigma^*)=\sigma^*$. We claim this mixed strategy is a Nash equilibrium. Let's prove that.

Defining $S=1 + \sum_{b\in A_i} \text{Gain}_i(\sigma)(b)$ to be the constant normalizing factor above, $\sigma^*$ being a fixed point means $\sigma^*_i(a)=\frac{1}{S}(\sigma^*_i(a) + \text{Gain}_i(\sigma^*, a))$, and so $(S-1)\sigma^*_i(a)=\text{Gain}_i(\sigma^*, a)$. 

Now, note that the expected value of gains for the player $i$ according to the strategy $\sigma^*$ is zero:

$$
\begin{align}
    \sum_{a\in A_i}\sigma^*_i(a)\text{Gain}_i(\sigma^*, a) &=\sum_{a\in A_i}\sigma^*_i(a)(u_i(a, \sigma_{-i}^*) - u_i(\sigma_i^*))
    \\&= \left(\sum_{a\in A_i}\sigma^*_i(a)u_i(a, \sigma_{-i}^*)\right) - u_i(\sigma_i^*)
    \\& = u_i(\sigma_i^*) - u_i(\sigma_i^*)=0
\end{align}
$$

where the penultimate equality comes from $\sigma^*_i$ being a simplex and $u_i(\sigma_i^*)$ constand, and the last one by the very definition of $u_i(\sigma_i^*)$.

However, we also have that $\sum_{a\in A_i}\sigma^*_i(a)\text{Gain}_i(\sigma^*, a)=\sum_{a\in A_i}(S-1)\sigma^*_i(a)^2$, and, since there's at least one $a$ such that $\sigma^*_i(a)>0$ (otherwise mixed strategies wouldn't sum to one), $S=1$ in order for the expected value of the gains to be null. Thus we have $\sigma^*_i(a)=\sigma^*_i(a) + \text{Gain}_i(\sigma^*, a)$, and $\text{Gain}_i(\sigma, a)=0$ for any player $i$ and action $a\in A_i$-- proving that $\sigma^*$ is indeed a Nash equilibrium.

{{< qed >}}

Conversely, every possible Nash equilibrium gives a fixed point of the flow above-- i.e., **equilibria are exactly the fixed points of the "winning flow"** $f$.

# Going further
oi