+++
date = '2025-01-14T12:33:23-03:00'
draft = true
math = true
comment = true
title = "Algebraic topology for game dev: 3D graphics and winning flows"
tags = ["Topology for Artists"]
toc = true
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
    matrizes OK
    tipos de coisas q são trans lins, TRANSLAC NÃO É OK
    Distância euclidiana $d(a,b)$, norma e normalizac OK
    dot e exterior products (matrizes tbm?) OK

ÁLGEBRA N É PRA SER EXPERIMENTO OU SURPRESINHA, MAS ALGO Q SURGE PRA SOLUCIONAR E JUNTAR TUDO NUM MESMO ESPAÇO!!!

**NA INTRO, DAR + EXEMPLOS DE CASOS PERFEITOS: EG, S1 1 CICLO 1D, TORO 1 2D, 2 1D, ETC. VERY IMPORTANT!!!**

# Introduction and intuition
This post will connect many different topics, but let us begin straight away with a question of topological character: what is a hole? How many holes does a space have?

See, if topology is rubbersheet geometry-- where things can be seen as equivalent whenever you can transform one into another continuously, without gluing or cutting--, then it should be intuitive that "holes" could lead us to topological invariants. You can't, for example, turn a circle into a disk or into a line without cutting it or gluing stuff to it. Equally, a hollow sphere can't be turned homeomorphically to a plane or something similar. Holes are getting in the way of such transformations. This visually makes sense, but how to actually "compute" the holes of a space? This is the main theoretical purpose of this post: developing a theory of holes mathematicians call **homology theory**, which uses notions from topology, geometry and algebra.

First note that there is a dimensionality factor when we talk about what we intuitively call a hole. For 1D spaces (lines, circles, segments, graphics, etc.), we're thinking about a loop-- a path that ends where it begins. Not only that, but a loop which has "no interior" filling its inside. For 2D spaces (planes, spheres, surfaces like the torus, etc.), having a hole means they're "hollow", in the sense they're surfaces without a border and "not filled". This means that **each dimension has a unique notion of "n-dimensional hole"**, and  we'll find these all have something in common.  

Both for 1D and 2D holes, there are two intuitive ideas in play. First, holes should represent shapes that are "closed into themselves", that are "cycles" in the sense they have no border-- that an ant can transverse them forever, and never fall off. They are also "unfilled", there's nothing "inside them"-- or, rather, they aren't the boundary of some filling matter. Both of these conditions are neccessary. For example, if we take the boundary circle of a disk by itself, it is indeed a loop, a cycle. But it is also filled by the content of the disk, being its boundary-- so there's no hole. On the other hand, a circle has a hole since it is a non-boundary cycle.

IMG!!! (S1 E D2)

I.e., holes are represented by cycles that aren't filled. When a subspace is a boundary of another one, we say it is **bounded**. Thus, holes are represented by **boundaryless, non-bounded subspaces**.

Imagine we have a surface-- say, a cylinder-- and want to find 1D holes in it. We can try to see the different loops we can draw on this cylinder. Some of these loops are filled and can be continuously contracted inside the surface to a single point. These don't really tell us anything about holes. However, there is another class of loops that are not filled within the cylinder-- those that "go around it", so to speak. These all should represent the single hole in the cylinder!

IMG!!! (CILINDRO E CICLOS)

Similarly, take a 2D shape like a ring-- i.e., a disk with a smaller disk cut out from it, like a DVD. We have a single hole in this space. Consider the two circles that compose the boundary of this shape. Both are cycles. None of them are the complete boundary of some subspace, indicating they're also unfilled. They should be seen as representing the hole we made-- and the same can be said about all the loops in between them! Note that this is all because of the puncture we introduced in the original disk, otherwise all these loops would be boundaries.

IMG!!! (RING)

This could be perfected, though. See, in both examples above, we have a single hole, but infinitely many non-boundary cycles representing it. This seems a little awkward. Thankfully, all these cycles have something in common: whevener you pick two of them, they form the complete border of a surface (in the first case, of a "mini-cylinder", in the second of a "mini-ring" contained in the original space).

IMG!!! (acima)

This leads us to think of holes as actually **classes of non-boundary cycles**, two cycles being on the same class if they together form the boundary of some space of one dimension above-- so to speak, if they are "connected", or "joined" by that subspace. 

So that we're all on the same page, here are some examples of what we expect to get as the holes of some spaces:

- Circle $S^1$: the prototypical loop, it only has one 1-dimensional hole;

- Disk $D^2$: the prototypical filled loop, it has many 1D cycles, but all bounded-- thus no holes;

- Cylinder $S^1\times [0,1]$: similarly to the circle, only one 1D hole;

- Sphere $S^2$: the prototypical hollow surface, it only has one 2D hole;

- Torus $T^2$: it has one single 2D hole, representing its entire, hollow surface. It also has two 1D ones: one "transversal" (around the whole doughnut), one "longidutinal" (around the tube made by the torus);

- The reals $\mathbb{R}^n$: lines, planes and their higher-dimensional generalizations are all convex, so should have no holes at all.

IMGS!!! (cylinder?, torus)

Most of this post will deal with the non-trivial, although highly enriching proccess of formalizing these inutitive notions.

# Simplices and topology

## N-simplices and complexes
In order to compute holes, we'll first approximate our spaces using simpler ones-- specifically, polygons-- that will allow for concrete computations. The building blocks of these approximations are called **n-simplices**. Formally, a n-dimensional simplex is defined as the convex hull of $n+1$ points $v_0,...,v_n$ such that the vectors $v_i-v_j$ are all linearly independent, for all distinct pairs $i,j.$

For example, for a 1-simplex, we take two different points $v_0, v_1,$ and then fill the segment $[v_0, v_1],$ getting a line betwen $v_0, v_1:$ a 1-simplex is a straight line. For a 2-simplex, we take three points $ v_0, v_1, v_2$ satisfying $v_1 - v_0,$ $v_2-v_0$ and $v_2-v_1$ being non-colinear: the 2-simplex will be the (filled) triangle with them as vertices. Similarly, a 3-simplex is a (filled) pyramid with vertices $v_0,v_1,v_2,v_3$ (assuming these points satisfy the l.i. condition in the definition). That is, **simplices are generalization of polygons**.

IMG!!! simplices

The condition that all $v_i-v_j$ should be l.i. guarantees the "faces" of our polygon won't glue to each other: if we had, say, $v_0=(0,0), v_1=(1, 1), v_2=(2,2),$ $v_2-v_0=v_2$ and $v_1-v_0=v_1$ being colinear, the hull of these points would just be a line from $v_0$ to $v_2$, which isn't a 2-simplex, a triangle-- or rather, it is a triangle with glued, "degenerate" edges. When the points don't satisfy the mentioned l.i. condition we can talk about a "degenerate simplex", which we'll not study here.

The condition that all $v_i-v_j$ for $i\neq j$ be l.i. is actually equivalent to asking $v_i-v_0$ to be l.i. for $i>0.$ Proving this a simple linear algebra exercise. 

Also, note that 0-simplices are just points, the l.i. condition being "nully satisfied" (there are no vectors $v_i-v_0$ for $i>0$!), with $\angled{v_0}$ being exactly the set $\{v_0\}$.

Since an n-simplex is completely determined by its $n+1$ points $v_0,...,v_n$ (as the hull is unique), we'll denote it as $\angled{v_0,...,v_n}$. For now, the order you put these points in the presentation doesn't matter- but soon it will. 

By the expression we found for convex hulls, each element $p$ of an n-simplex $\angled{v_0,...,v_n}$ is of the form $\lambda_0 v_0+...+\lambda_n v_n$, with $\sum \lambda_i=1$ and $\lambda_i\geq 0$ for all $i$. These $\lambda_i$ can be interpreted as "simplicial coordinates" of $p$ relative the base points. In the 2-simplex case, each element of the interior of the triangle is given an unique such coordinate in respect to the three vertices, known as its **barycentric coordinate**.

IMG!!! BARYCENTRIC

These coordinates are very important because they allow us to extend maps from the vertices $v_0,...,v_n$ to the whole simplex $\angled{v_0,...,v_n}$: if we have **any** function $f:\{v_0,...,v_n\}\rightarrow \mathbb{R}^k$, we can extend it to a linear (and thus **continuous**) map $\widehat{f}:\angled{v_0,...,v_n}\rightarrow \mathbb{R}^k$ by defining 

$$\widehat{f}(\lambda_0 v_0+...+\lambda_n v_n) = \lambda_0 f(v_0)+...+\lambda_n f(v_n),$$

so that, in particular, the image of $\widehat{f}$ is exactly the (possibly degenerate) n-simplex $\angled{f(v_0),...,f(v_n)}.$

For practicality, we also define the **standard n-simplex** $ \Delta^n$ to be the simplex with base points the origin $(0,...,0)$ and the canonical base vectors $e_1,...,e_n.$ By the formula for the convex hull we gave, $ \Delta^n=\{(\lambda_1,...,\lambda_n)\mid  \sum_{i=1}^n \lambda_i=1, \,\lambda_i\geq 0\}$. Every n-simplex is homeomorphic to $ \Delta^n$ by simple linear transformations of translation and stretching. Topologically, $\Delta^n$ is homeomorphic to $D^n$, and so is the case for all other n-simplices. 

For a simplex $\angled{v_0,...,v_n}$, its **faces** are all the sub-simplices $\angled{v_0,...,\widehat{v_i}, ...,v_n}$, where this notation indicates that the vertex of index $0\leq i\leq n$ is ommited. For example, a 1-simplex $\gos$ has faces $\angled{v_1}$ and $\angled{v_0}$, its end and start points. For a 2-simplex, the faces of $\gts$ are $\angled{v_1, v_2}$, $\angled{v_0, v_2}$ and $\gos$, which in this case we can also call the edges of the 2-simplex. Finally, for the 3-simplex $\gths$, its faces are the triangles $\angled{v_1, v_2, v_3},$ $\angled{v_0, v_2, v_3},$ $\angled{v_0, v_1, v_3}$ and $\gts$, in which case the use of the term "face" is closer to the usual. For higher dimensions, the same formula for faces applies as well, even though we can't properly see these simplices.

We'll then call the **boundary** of a simplex to be the set

$$\partial \angled{v_0,...,v_k} = \bigcup_{i=0}^n \angled{v_0,...,\widehat{v_i},...,v_k},$$

i.e., the union of its faces.

IMG!!! boundaries

The use of intuitive and familiar concepts (like of a face) and this recursive property of simplices-- i.e., that they are made of smaller simplices themselves-- are the main reasons why we will use these spaces in our computations.

Now, how can we use simplices to understand our spaces better? We'll discuss two ways: **simplicial complexes** and **delta spaces**. The first basically consists in gluing simplices together in order to approximate our space with a polygonal shape homeomorphic to it. Formally, a *simplicial complex* on $\mathbb{R}^n$ is a set of simplices $S=\{s_1,...,s_k\}$ of possibly different dimensions such that every face of $s_i$ is also in $S$ and so that if $s_1, s_2$ intersect, then their intersection is a common face between them. This means simplicial complexes are constructed by simplices through disjoint unions or gluing their faces together.

IMG!!! (complexos gerais)

For example, a square can be seen as a simplicial complex with two 2-simplices glued on a common edge, as below. These are usually called **quads**. If we use $\Delta^2$ and $\angled{(0, 1), (1, 1), (1, 0)}$ glued along the edge $\angled{(0, 1), (1, 0)}$ to form a quad, we'll call this simplex the "**standard quad**".

IMG!!! (quad)

Another simple example of a complex is the boundary $\partial \angled{v_0,...,v_n}$ of a simplex. In the 2-simplex case, for example, this is the three edges of our triangle joined together at the vertices.

Indeed, many spaces of interest can be described as homeomorphic to a simplicial complex on $\mathbb{R}^n$, at least for a high enough $n$. When this is the case, we say our space is **triangulable**, since in the two-dimensional, surface case this is equivalent to dividing our embedded space into triangles. Generally, a **triangulation** of a space is a homeomorphic space to it which is a simplicial complex-- i.e., it is a **polygonal topological approximation**, so to speak.

Let's see some examples of complexes homeomorphic to spaces of interest. First, the $\Delta^n$ themselves give us a simplicial model of $D^n$. For the n-dimensional sphere $S^n$, $\partial \Delta^{n+1}$ is a complex homeomorphic to it. In the case of the circle, this is just the three edges of a triangle. 

IMG!!! (desengo dos espaços)

SHADER!!! (D3)

What about, say, a cylinder? This can be done by gluing three quads in sequence, and then gluing the first and last ones together as well, forming a "triangular straw".

SHADER!!!

For the torus, this is a bit more intricate. First, form a skewed cylinder with two triangles as its boundary. Make three copies of this shape, and then glue them together in their boundaries and you'll get a torus, as shown below.

SHADER!!! (BARRA, TORO)


IMG!!!

Of course, all these shapes could be made with many more simplices, getting a better approximation of their idealized, curved versions. But this isn't topologically relevant (at least until we use calculus in algebraic topology, which isn't something we're goint to do in this post).

## Surfaces from squares

**Note**: in this section, we'll adopt the lazy topological convention of calling every rectangle a square.

### The cylinder
Schematically, we could represent the triangulation above of the cylinder we provided in a plain figure as below:

IMG!!! Triang do cilindro

Above, we have the three quads and the glued edges marked as the same one, called $a$. We give a direction to these edges in order to denote where we should join their vertices: their end points should be glued together, as should the starting ones ("end on end, start on start"). That is, we glue $v_0$ to $v_6$ and $v_2$ to $v_7$, so that these will be identified in the cylinder. This is not the only way to paste the edges $\angled{v_0, v_1}$ and $\angled{v_6, v_7}$ together, though. We could instead decide to do a "twist" and identify $v_0$ with $v_7$ and $v_2$ with $v_6$-- a case which we'll consider soon. 

That is: we represented a triangulation of the cylinder drawing some quads and then indicating how to glue edges, according to some direction. Note that this is just a way of representing our triangulation, not the triangulation per se, specially because there's no concrete indication of which points the vertices are.

Topologically, this means we can obtain a cylinder from a square by gluing two of its faces as done above. This works even without using simplices, so we get the following representation of a cylinder:

IMG!!!

This actually gives a **general way of forming surfaces**. You begin with a square, then label its edges and glue them respecting their start and end points as marked. You can try to replicate this with a sheet of paper. Let's dive a little deeper into that construction.

### The torus

We can get a similar plane representation for the triangulation of the torus we used before. First, take one of the skewed cylinders and cut it along one edge joining its two boundary triangles, making a flat piece as shown below. The edges marked as "a" indicate that they should be glued together, according to the given direction ("end on end, start on start"). Then we join three of these representations in sequence, gluing along the adequate edges. We also mark with "b" the edges that should be finally glued together to form the complete torus. 

IMG!!! (flat piece, glued)

For schematic purposes, we can further simplify this figure flattening it to a square, getting the following representation:

IMG!!! (full triang)

Similarly to the cylinder, this means we can get the torus as given by the figure below: join two edges to form a cylinder. The other two edges are now cycles, and to form a torus all you have is to glue them as well.

IMG!!!

### The sphere

As we've seen, $\Delta^3$ is a triangulation of $S^2$-- and so is any pyramid. To get something similar as we got for the cylinder and the torus, take a pyramid and cut the edges connecting triangles above the base, getting this figure:

IMG!!! (RECORTADO)

Then, continuously deform this into a square:

IMG!!! (QUADRADO)

Finally, glue the $c$ edges together, to get this indication of how to topologically get $S^2$ from a square:

IMG!!! (FINAL)

You can try this on a sheet of paper, and see that it forms a closed cone-- which is homeomorphic to a sphere!

### The Möbius strip

Another very interesting shape we can get this way is the **Möbius strip**. You leave the north and south edges alone, and joing the west and east ones-- but with a twist, as we mentioned on the cylinder case:

IMG!!! (SQUARE, TRIANG)

SHADER!!!(MOBIUS)

The Möbius strip is the simplest example of a **non-orientable space**, specifically a non-orientable surface with boundary. This means you can't define what is "inside" or "outside" it: try pointing your finger towards a direction you think is outwards from the surface, and then follow the strip until you come back to the same point. Your finger will now point to the opposite direction! I.e., you can't define a cohesive notion of outside-ness within the strip. 

GIF!!!!

More formally, we can't define coherently a **normal vector** for each point in the strip. A normal vector is a vector perpendicular to a point in a specified surface. Spaces with this property are called non-orientable, and those in which you can define coherent normal vectors for all points are called orientable. Indeed, orientability is a **topological** property: it doesn't how much you strecth an (non)orientable, it will always remain (non)orientable. Spheres, tori and disks, for example, are all orientable.

Similarly, if an ant transverses the strip in one direction, when it comes back to its initial position it will be facing the opposite direction from the beginning! You can't define inside and outside, nor can you define a cohesive transversing direction! Mathematically, this has to do with how we get normals from tangent vectors to a surface by doing the cross product-- something that will be a bit clearer later.

The Möbius strip is a very alusive shape, and has inspired many artists and thinkers as a powerful metaphor. The whole world is outside and inside it, so to speak. It is a truly hegelian shape in this sense, a pure form that unifies object and subject, in and out, consciousness and self-consciousness. But let's leave its philosophy for another post of its own.

IMG!!! (obra do MAC)

Note also that the strip has a boundary homeomorphic to a circle. You can check this in the square representation by noting that the north and south edges have their end points glued together forming this cycle boundary. This circle geometrically performs a twist-- a fact that might not seem particularly relevant here, but actually has quite deep connections to other topics in topology. 

IMG!!! BOUNDARY

### The Klein bottle
What happens if we glue the Möbius strip boundary? Again, using the square representation, there are two ways: joining the remaining edges with and without a twist. When we do so without one, we get a space called the **Klein bottle**, which also has been an object of interest by many mathematicians and math-entusiasts alike. This is also a non-orientable space, but **non-embeddable** in $\rth$: that it is, it can't be properly seen in 3D space, it can't be properly described as a subspace of $\rth$. So don't try to phisically get it from a Möbius strip-- it's impossible to do so in 3D space! 

This is similar, say, to how $S^2$ can't be embedded in $\rt$-- i.e., you can't properly have the sphere as a subspace of the plane. If you really wanted to fit it into the plane, you'd have to glue some points together, mapping them to the same 2D point. The same happens with the Klein bottle. You might have seen the image below, which is meant to represent the bottle. It isn't the bottle per se: it is a representation in which the some of its points are glued in order to force it to be able to be seen in 3D space. This doesn't mean this is a bad or meaningless way to see the Klein bottle: quite on the contrary, we can use it, for example, to see that it isn't orientable, as the image below shows:

IMG!!! rep square, img mostrando n orient

Generally, when it is possible to describe a space $X$ as homeomorphic to a subspace inside some $Y$, we say it is **embeddable** in $Y$. Here, we'll only consider embeddability inside the reals $\ro^n$.

### Projective spaces: perspective and homogenous coordinates * 

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

Another interesting property of $\ro \text{P}^2$ is  NON EMBED

### Connecting surfaces together

This way of representing surfaces is so powerful that it actually allows us to generate all possible surfaces! This is done as follows.

Imagine you have two torii $T_1$ and $T_2$ and you want to join them in order to form a bitorus. One way to do so is to cut two disks on the surfaces of $T_1$ and $T_2,$ and then join them along the boundaries of these disks. 

IMG!!!

Generally, if you have two surfaces $X$ and $Y$, you can do the same for them: take two disks $D^2$ (or, generally, subspaces homeomorphic to disks) inside $X$ and $Y$; then, join $X-D^2$ and $Y-D^2$ along their boundaries (both being homeomorphic to $S^1$). The obtained space is called the **connected sum** of $X$ and $Y$, denoted $X\# Y.$

Proving that this is a well-behaved operation between surfaces (including non-orientable ones!) is actually highly non-trivial, so we'll just use without proof that:

- $X\# Y$ is independent of the disks we choose;

- $X \# Y = Y \# X.$

You can use the square representations of surfaces to represent $X\# Y$ as well: just cut subspaces homeomorphic to disks inside each representation, and glue them according to the construction of $X\# Y.$

For example, we just saw that $T^2\# T^2$ is the bitorus: indeed, doing $T^2\#...\# T^2$ $n$ times gives the $n$-torus. For the bitorus, ...

SHADER!!! bitorus

What about $S^2\# S^2$? Intuitively, this corresponds to joining two !!!. Using squares, we can describe it as following: take the representation of $S^2$ and 

IMG!!!

RP RP = K

Now, $\rpt \# \rpt$ is a bit more complicated.

RP T = RP K

What about something like $\rpt \# T^2$? ...since $K = \rpt \# \rpt,$

CLASSIFICATION

**Theorem (classification of surfaces)**: a surface is either homeomorphic to

- The sphere $S^2$;

- A connected sum of torii $T^2\#...\# T^2$;

- Or a connected sum of projective planes $\rpt \# ... \# \rpt.$

## Delta spaces

Finding triangulations for topological spaces can be a great exercise to understand simplicial complexes, but it's also quite tedious. This is because we strictly require that our spaces be composed of simplices, which in particular aren't curved. This is a quite strong restriction. But what if we just asked for it to be composed of **images of simplices**? This way, we could stretch and manipulate simplices, and try to see our space as the union of these distorted polygons.

For the circle, e.g., instead of making it with three 1-simplices, forming the boundary of a triangle, we could just take one 1-simplex and glue its ends together-- thus forming a loop. This wouldn't be a simplicial complex, but would still be an image of one, with just one altered 1-simplex.

For the torus, instead of the exhausting triangulation we could describe it as the image of a complex as follows: take a quad and glue its sides exactly as in the description of the torus from a square. Similar can be done for all surfaces we studied above. These are not complexes, but are **continous images** of complexes.

IMG! S1 T2

This gives us the notion of a $\Delta$**-space**. Technically, it is a space $X$ with a set $S$ of maps $\sigma_i:\Delta^k\rightarrow X$, for different $k$. We require, similarly to the simplicial case, that if $\sigma \in S$, then for all the faces $F$ of $\Delta^k$, the restriction $\sigma \mid F$ of $\sigma$ to $F$ (which can be described as a map $\tau: \Delta^{k-1}\rightarrow X$) is also in $S$. We also ask that the restriction of $\sigma$ to the interior $\Delta^k\setminus \partial \Delta^k$ is injective (so that the images of these maps are filled), and that every point in $X$ is inside $\im \sigma$ for some $\sigma\in S$ (the image of maps in $S$ fill $X$). It is common to call such set $S$ a "**delta structure**" over $X$.

In the circle example we gave above, we have $S=\{\sigma_0, \sigma_1\}$, with $\sigma_0:\Delta^0\rightarrow S^1$ having image a single vertex $v_0$, and $\sigma_1:\Delta^1\rightarrow S^1$ a function such that $\sigma_1(0)=\sigma_1(1)$, giving a loop with base point $v_0$.

In the torus example we gave above, we have $S=\{\sigma_0,\sigma_1,\sigma_2,\sigma_3,\sigma_4,\sigma_5\}$, where $\sigma_0:\Delta^0\rightarrow T^2$ maps to the corner point $v$, $\sigma_1:\Delta^1\rightarrow T^2$ maps to the edge labeled $a$, $\sigma_2$ to $b$ and $\sigma_3$ to $c$. Then $\sigma_4:\Delta^2\rightarrow T^2$ maps to one of the triangles with edges $a,b,c$, and $\sigma_5$ to the other one. 

Note: with delta structures, we're dealing with functions here, not with spaces directly. However, it will still be pretty common for us to call the maps in the structure by their images. So, in the example above for $T^2$, we'll usually call $\sigma_0$ just as $v$, $\sigma_1$ as $a$, $\sigma_2$ as $b$, $\sigma_3$ as $c$, $\sigma_4$ as $U$ and $\sigma_5$ as $L$, even though this is a little stretch of our terminology. 

Delta spaces will simplify our computations a lot, so here are some ways of describing the surfaces we've discussed so far as $\Delta$-spaces (note again that these are just the square representation we studied applied to a quad):

IMGS!!!

## Simplices, probabilities and decision games **
PROB

GAMES- DEFS

EXS
PRISIONERS
ROUSSEAU (EX DO LIVRO + EX DO MAL AMIGO DAS CONFISSOES)
    ex mistos?
BACH X SCHOENBERG (COM MÚSICAS EMBEDDADAS)

I am less tempted by money than by other objects, because between the moment of possessing the money and that of using it to obtain the desired object there is always an interval, however short; whereas to possess the thing is to enjoy it. I see a thing and it tempts me; but if I see not the thing itself but only the means of acquiring it, I am not tempted. Therefore it is that I have been a pilferer, and am so even now, in the way of mere trifles to which I take a fancy, and which I find it easier to take than to ask for; but I never in my life recollect having taken a farthing from any one, except about fifteen years ago, when I stole seven francs and ten sous. The story is worth recounting, as it exhibits a concurrence of ignorance and stupidity I should scarcely credit, did it relate to any but myself.

It was in Paris: I was walking with M. de Franceul at the Palais Royal; he pulled out his watch, he looked at it, and said to me, “Suppose we go to the opera?”—“With all my heart.” We go: he takes two box tickets, gives me one, and enters himself with the other; I follow, find the door crowded; and, looking in, see every one standing; judging, therefore, that M. de Franceul might suppose me concealed by the company, I go out, ask for my ticket, and, getting the money returned, leave the house, without considering, that by then I had reached the door every one would be seated, and M. de Franceul might readily perceive I was not there.

As nothing could be more opposite to my natural inclination than this abominable meanness, I note it, to show there are moments of delirium when men ought not to be judged by their actions: this was not stealing the money, it was only stealing the use of it, and was the more infamous for wanting the excuse of a temptation.

(absurd convertions by me give it equal to about 80 us dolars)

$$\begin{array}{c|c c }
  & \text{Bach} & \text{Schoenberg}  \\
\hline
\text{Bach} & 2,1 & 0,0  \\
\text{Schoenberg} & 0,0 & 1,2 \\
\end{array}
$$

$$\begin{array}{c|c c }
  & \text{Franceul} & \text{Rousseau}  \\
\hline
\text{Franceul} & -7.5, -7.5 & -15, 7.5  \\
\text{Rousseau} & 7.5,-15 & 0, 0 \\
\end{array}
$$

{{< youtube RDADGE44i_o >}}
    EX MISTOS
ELEIC?

ESTRATEGS DOMINADAS

# 3D graphics and the algebra of holes

## Meshes and simplices

Simplices and simplicial complexes shouldn't be foreign to those artists working with 3D rendering. In this area, they go by the name of **meshes**, which are just simplicial complexes constructed only gluing 2-simplices, plus some extra data we will discuss below. 

Meshes have different implementations on different frameworks, but here is a quite minimalistic one we'll use in this post:

{{< highlight cpp "linenos=table,hl_lines=0,linenostart=1" >}}
struct Mesh{
    vec3[] vertices;
    vec2[] uv; // UV maps, allow for textures. See below.
}
{{< / highlight >}}

In the structure above, each three consecutive elements of the array `vertices` represent a triangle in the simplicial structure. The standard 2-simplex $\Delta^2$ embedded in $\rth$, for example, has `vertices = [(0, 0, 0), (1, 0, 0), (0, 1, 0)]`; the standard quad may have `vertices = [(0, 0, 0), (1, 0, 0), (0, 1, 0), (1, 0, 0), (1, 1, 0), (0, 1, 0)]`. Finally, defining `v0 = (0, 0, 0), v1 = (1, 0, 0), v2 = (0, 1, 0), v3 = (0, 0, 1)`, the boundary of the standard 3-simplex  $\Delta^3$  may be given `vertices = [v1, v2, v3, v0, v2, v2, v0, v1, v3, v0, v1, v2]` (this may seem a bit daunting, but note it is just a matter of applying the formula for the boundary we found before).

For each vertex, we also associate a so-called UV value, which is a vector of dimension 2. Points inside the triangle also have UV values, obtained by interpolating using their barycentric coordinates. UV maps help us texturing our surface: the $(u,v)$ value of a point in the triangle indicates that it should have the color of the pixel in position $(u,v)$ inside the texture image.

But why are meshes used in computer graphics? In order to answer that, it's neccessary to understand how 3D rendering works. The general setup is pretty similar to what we studied with projective spaces above: we have a scene, and, inside it, a point representing our camera/eye position. This camera has an associated direction and also a view plane-- generally the plane with $z=1$--, which is to be interpreted as representing the 2D view the camera sees. Each point in this plane is associated, in our actual computer image, with a pixel. Rendering is the task of associating correct colors to these pixels.

There are two main methods used to actually render a 3D scene: **rasterization** and **raytracing**. The latter is the most intuitive: in it, for each pixel in the screen you define an infinite ray beginning from the camera and passing through the point in the vision plane associated to the pixel. Starting from the camera position, you keep "marching" through the ray, at each interaction choosing point further away from the camera along the ray. You do so until you hit an object in the scene. You then return data from this object (like its material, its color etc.), and use that further in your rendering pipeline.

IMG!!!

In a [GLSL](https://en.wikipedia.org/wiki/OpenGL_Shading_Language)-like pseudo-code, this may be written as follows:

{{< highlight cpp "linenos=table,hl_lines=0,linenostart=1" >}}
// General raytracing algorithm

for(pixel in image){
    //vec3 is a 3D vector
    vec3 direction = rayDirection(pixel);
    vec3 origin = cameraPosition;
    vec3 p = origin; // marching point

    float dO = 0.0; // distance from the origin (camera position)
    float dS = 1e10; // distance from a surface. Initialized as a very high number

    SurfaceData surfaceData; // other data from hit surface

    // MIN_DISTANCE is a small number indicating the marching point is close enough to a surface
    // MAX_DISTANCE is a large number indicating the marching point is off the scene
    while(dS > MIN_DISTANCE && dS < MAX_DISTANCE){
        p = origin + dO * direction; // push along the ray
        dS = distanceFromSurface(p);
        surfaceData = getData(p);
        dO += dS;
    }

    pixel.color = getColor(dS, surfaceData); // use distance and surface data to get a color
}
{{< / highlight >}}

The crucial mathematical step in the algorithm is how to get the distance from $p$ to surfaces inside our scene. How might we find that value? The most straightaway way is to use the surfaces' SDFs-- their "**signed distance functions**". This is a function that directly-- or, using the more common mathematical term, analitically-- tells you the distance between a point and an embedded (orientable) space, giving positive sign if it is "outside" the object, and negative if it is "inside" it. 

Below is an example of a SDF for a sphere of radius $r$ and center $c$ in $\rth$:

{{< highlight c "linenos=table,hl_lines=0,linenostart=1" >}}
float sphereSdf(vec3 p, vec3 c, float r){
    // length is used to get the Euclidian distance between p and c: length(v) = sqrt(v[0]^2 + v[1]^2 + v[2]^2)
    return distance = length(p - c) - r;
}
{{< / highlight >}}

When used to render a 3D scene, this will give us a smooth sphere. Sadly, most shapes you will see on, say, video games, do not have such an easy SDF. This may change with the progress of [neural SDFs](https://research.nvidia.com/labs/toronto-ai/nglod), which use neural networks to learn these functions, but, for the most part of the history of computer graphics, using a SDF for an entire arbitrary shape wasn't viable. 

The solution was to try to approximate surfaces using simplers shapes-- namely, triangles, or 2-simplices, for which we can use a single known SDF ([see here](https://www.shadertoy.com/view/4sXXRN) for an implementation). And so were meshes born, as complexes made by these triangles. That is, meshes are just triangulations of surfaces we want to approximate. 
The more 2-simplices a mesh has, the more detail our model will be able to have. 

The reader might have noted that there is a slight mathematical problem here: SDFs only really work with orientable surfaces! This is a problem if you try to render a Möbius strip directly using a single SDF, but not really if you approximate it using triangles. Still, as we will soon see, orientation does provide some problems for 3D rendering.

Raytracing is great for phisically correct rendering, since it closely resembles how light actually works. Doing something like reflection, for example, is pretty straightforward: when your surface is reflective and it has been hit by a marching point, just make it follow a new ray normal to the hit point, "bouncing" the marching ray. Then when it hits another surface, combine the colors of the found objects. This technique of bouncing rays is fundamental to raytracing techniques like [path tracing](https://en.wikipedia.org/wiki/Path_tracing). 

There is, however, the problem that it can take too much time inside the `while` loop trying to hit a surface, making it computationally expensive. Rasterization is then a more efficient alternative. In it, we project our mesh triangles into the vision plane-- something that can be quickly done by the GPU using linear algebra and projectivization. For each pixel we then check if it is contained inside one of these projected triangles, and use that to define its color. 

We also have to check in the case a pixel is inside many of these triangles-- for example, if we have two triangles in our scene, one behind the other in relation to the camera. To solve that, we compare each point projecting to that pixel, and render only the color associated to the point closest to the camera- i.e., the one with least "depth". These depth values for each pixel are stored in an array called the **depth buffer**.

IMG!!!

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

We can quickly integrate orientation in our mesh structure. Indeed, for each three consecutive vertices `v0, v1, v2` representing a triangle in the array `vertices`, we'll use the positive orientation in $\angled{v_0, v_1, v_2}$. Presenting everything in the correct order then becomes very important-- if we get a single triangle wrong, our mesh will be shaded in an absurd way, with some triangles being suddenly bright and other suddenly dark because of the wrong orientations.

We interpret the orientation of a triangle as also being associated with one of its edges: in the positive one, we see edges going in the directions `v0 -> v1`, `v1 -> v2` and then `v2 -> v0`-- i.e., going ing the counter-clockwise way--, and then negative one going the other way around. This allows us to use the **right-hand rule**: take your right hand and curl your fingers in the direction the triangle's edges take, except the thumb; then extend your thumb, and that is the the direction of the normal vector giving the orientation.

IMG right hand e mesh na orientac positiva

That is, an orientation of a 2-simplex also orients its faces. The opposite is also true: if we have the direction the edges follow, we have also have an orientation. Actually, even more: if we have a **single** edge direction, we can deduce the others' as well, and so we also have an orientation.

## Orientations and boundaries

With the discussions above, it really seems like orientation is a very relevant topological property with important applications. Meshes also showed us how to integrate this notion with complexes-- which, per se, are just sets of points, without any orientation information. So perhaps we'd like to do this same move in the mathematical level, getting "**oriented simplices and complexes**" which do come with some orientation, and non-oriented simplices will sometimes be called **geometrical**. This will also require a change in terminology: instead of writing $\angled{v_0,...,v_n}$, we'll write $[v_0,...,v_n]$ for this new kind of spaces, and order will matter in the presentation. Similarly to the 2-simplex case, giving an orientation to an n-simplex will be equivalent to giving one for one of its faces.

Let's begin orienting 1-simplices. This is simple: if 1-simplices are line segments, their oriented versions will be seen as directed paths. We will say $\os$ is an oriented simplex with base $\angled{v_0,v_1}$, and going from $v_0$ to $v_1$-- $[v_1,v_0]$ then being the oriented simplex going in the opposite direction. In the same way meshes' orientations were associated to the orientation of their edges, may say that $\os$ gives $[v_1]$ a "positive" orientation and $[v_0]$ a "negative" one. 

IMG!!! ORIENTAC 1

Reiterating, this all means that, with oriented simplices, the order we write our base vectors in $[v_0,...,v_k]$ will from now on matter.

Formalizing for the 2-dimensional case, we determine that $\ts$ has oriented edges $[v_0, v_1]$, $[v_1,v_2]$ and $[v_2,v_0]$. The other possible oriented 2-simplex would be the one with inverted edges $[v_1,v_0]$, $[v_0,v_2]$ and $[v_2,v_1]$, which can then be written as $[v_1,v_0,v_2]$. Indeed, whenever you swap two neighboring vectors in the presentation, you get the 2-simplex going in the opposite direction. This means that if you do an odd amount of swaps (in what we will call an **odd permutation**), you get the opposite simplex; if you do an even amount (in an **even permutation**), you get the same one. For example, $[v_1,v_2,v_0]$ is an even permutation of $[v_0,v_1,v_2]$ (the $v_0$ was swapped twice, first with $v_1$ and then with $v_2$), so that $[v_1,v_2,v_0]=\ts$, which can be seen by their edges following the same directions. Similarly, $[v_1,v_0,v_2]=[v_0,v_2,v_1]$.

You can see the rule above also applies for 1-simplices, and indeed will be the case for **any** n-simplex.

IMG !!! (MOSTRANDO COMO SE DESENHA ORIENTAC P/ TRIANGULO, BARICENTRICO TBM)

Suggestively, we may write $-[v_0,...,v_k]$ for the simplex with the opposite orientation of $[v_0,...,v_k]$. In particular, we just saw that $[v_0,v_1]=-[v_1,v_0]$ and 


$$\ts=[v_1,v_2,v_0]=-[v_1,v_0,v_2]=-[v_0,v_2,v_1],$$

for example.

We can also see from the manner we defined orientations so far that defining an orientation for 1 and 2-simplices is actually the same as giving an orientation for all its faces. In both cases, for a simplex $[v_0,...,v_k]$, we used the convention that $[v_1,...,v_k]$ (excluding the first vector from the presentation) was one of its oriented edges-- $[v_1]$ in the case of $\os$, $[v_1,v_2]$ in the case of $\ts$.

Generalization is now straightforward. From now on, $[v_0,...,v_k]$ will denote an **oriented k-simplex**. We will use the convention that it has $[\widehat{v_0},...,v_k]$ as one of its faces, which we'll soon see as also being enough to define the orientation of every other face. What we noted for 1 and 2-simplices with regard to permutations is still valid: odd permutations of vertices in the presentation give the opposite simplex, even ones give you the same simplex. From now on, we'll also call "oriented simplices" just "simplices" if it's clear from the context.

What about complexes? We'll say a simplicial complex is oriented if we give each of its simplices an orientation. There are many possible such orientations. Applying to 3D rendering, each of these orientations represents a way of shading our mesh. In many of these, neighbouring triangles have different orientations, resulting in suddenly light or dark regions, which isn't an effect we really desire. For orientable surfaces, we might want to find a single, "canonical", orientation such that all triangles have coherent normals, so that the whole surface will have a smoother and cohesive lighting-- indeed, that's precisely the definition of an orientable surface. 

SHADER!!! cilindro mal orientado

To obtain this orientation, consider the example of the standard quad with vertices labeled $v_0=(0,0),$ $v_1=(1,0),$ $v_2=(0,1),$ $v_3=(1,1)$. Say we orient the first triangle as $\ts$, so that, using the right-hand rule, its normal points towards us. What orientation should we give to the other triangle so that its normal may have the same direction? Again using the right-hand rule, it should be $[v_1, v_3, v_2]$. Note that, at their common edge, they have different orientations: one has $[v_1, v_2]$ as an edge, the other $[v_2, v_1]$. 

This is valid in general: every time you glue two n-simplices together and you want them to have coherent normals (either both pointing outwards or inwards), their common $n-1$ face should come from faces of the opposite direction in each original simplex. Orientable surfaces are exactly those that can be approximated by oriented simplices satisfying this property for all simplices with common faces.

For example, this **can** be done on the triangulation we provided for the torus, as shown belown. 

IMG!!! (ESQUEMA, SHADER)

As a result, we can correctly shade this triangulation-- and, since orientability is a topological property, this applies for any other mesh representing a torus:

SHADER!!!

For example, that's something you **can't** do in the triangulation we presented of the Möbius strip. Consider, say, the orientation provided in the image below, where we're trying to which can be noted on the triangles at the horizontal extremes: they meet booth in the same oriented face $[p_0, p_5]$! Any other orientation will eventually have the same problem. 

IMG!!! (ESQUEMA, SHADER)

As a result, we can't shade this Möbius strip triangulation correclty-- and, since orientability is a topological property, this applies for any other mesh representing the strip:

SHADER!!!

This rule for getting coherent normals is valid for the boundary of n-simplices as well, since these are complexes. For example, suppose we wish to have coherent orientations on $\partial \angled{v_0, v_1, v_2}$. This complex a collage of 1-simplices forming a triangle. The rule above says that if two edges are glued, then one's end must be the other's starting point (remember, a point has positive orientation in a 1-simplex if it is its end point). Thus, if we have the orientation of a single edge and want to orient the boundary coherently, all we have to do is follow this rule and we will get the other edge directions as well. 

Let's see how this works in the example of a 3-simplex $\ths$. By our convention, it has an oriented face $[v_1,v_2,v_3]$. This 2-simplex shares the oriented edge $[v_2,v_3]$ with $\angled{v_0,v_2,v_3}$, so the oriented version of the latter must contain the edge $[v_3,v_2]$ going in the opposite direction, and so it must be $-[v_0,v_2,v_3]$. Doing similarly for all other faces of the pyramid, we get that its oriented faces are $[v_1,v_2,v_3]$, $-[v_0,v_2,v_3]$, $[v_0,v_1,v_3]$ and $-[v_0,v_1,v_2]$.

IMG!!!!

In particular, this means that if we have the orientation of a single face on an orientable complex, we can deduce the orientation of all other faces, by just applying this rule of "opposite orientation on intersection". Since simplices themselves are orientable, this can be done for them as well: a single face orientation forces the orientation of the whole simplex-- either positive or negative.

These considerations actually allows us to get a formula for the oriented faces of a simplex $[v_0,...,v_k]$. We know that its geometrical faces are all the possible $\langle v_0,...,\widehat{v_i},...,v_k\rangle$, so we just need to find their *oriented* versions. We have one already: $[\widehat{v_0},...,v_k]$, by our convention. As for the orientation of $\angled{v_0,\widehat{v_1},...,v_k}$, we see that it shares the face $\angled{v_2,...,v_k}$ with $[\widehat{v_0},...,v_k]$, and so these must have opposite orientations-- i.e., we have the negatively oriented face $-[v_0,\widehat{v_1},...,v_k]$. Going by a similar procedure, we see that $\langle v_0,...,\widehat{v_{i+1}},...,v_k\rangle$ always has the opposite orientation of $\langle v_0,...,\widehat{v_i},...,v_k\rangle$, so that orientations alternate between positive and negative, beginning from $[\widehat{v_0},...,v_k]$ with a positive one. Thus, using our suggestive sign notation, we get that the **oriented** faces of $[v_0,...,v_k]$ are

$$(-1)^i[v_0,...,\widehat{v_i},...,v_k],$$

for $0\leq i\leq k$.

## Doing algebra with faces

Now that we know how to describe faces, we can define the boundary of an oriented n-simplex $a$, denoted $\partial_n (a)$ or simply $\partial (a)$ when the dimension is clear (we'll also ommit the parenthesis when possible). For an isolate geometrical simplex $\angled{v_0,...,v_k}$, remember we have

$$\partial \angled{v_0,...,v_k} = \bigcup_{i=0}^n \angled{v_0,...,\widehat{v_i},...,v_k},$$

and, for an oriented simplex, we just found out that

$$\partial [v_0,...,v_k] = \bigcup_{i=0}^n (-1)^i[v_0,...,\widehat{v_i},...,v_k]$$

But what about the union of simplices $a,b$ inside a simplicial complex? For geometrical simplices, we should have this as the union of their boundaries, disconsidering common faces, since these are part of the "interior" of the union:

$$\partial (a\cup b)=\bigcup_{e\in (\partial a \cup \partial b) - (\partial a \cap \partial b)}e$$

What about for oriented simplices? Take as an example two 2-simplices $a=\ts$ and $b=[v_1,v_3,v_2]$ forming a quad along the edge $\angled{v_1,v_2}$. In that case, $\partial a = [v_1,v_2]\cup-[v_0,v_2]\cup[v_0,v_1]$ and $\partial b = [v_3,v_2]\cup-[v_1,v_2]\cup[v_1,v_3]$. Similarly to the geometric case, their common face should be disconsidered for the boundary of the union. But note something: the common canceled face has opposite orientation in these simplices, so it is as if it was being "canceled"-- exactly like in a sum. This means there might be some algebra going behind the curtains!

Indeed, let us think of union of oriented simplices as a kind of a sum, and opposite orientations giving us negative sign. We write $a-a=0$, indicating that faces of opposite orientation should be cancelled in a sum. We can understand $0$ as the null set, or some sort of formal "null n-simplex", satisfying $a+0=0+a=a$ for any simplex $a$. In that case, we could write something like

$$\partial_n([v_0,...,v_n]) = \sum_{i=0}^n (-1)^i [v_0, ..., \widehat{v_i}, ..., v_n]$$

And then postulate $\partial(a + b)=\partial a + \partial b$, so that, in the example above, we may have

$$\begin{align}
    \partial (a+b)=\partial a + \partial b &= ([v_1,v_2]-[v_0,v_2]+[v_0,v_1])+([v_3,v_2]-[v_1,v_2]+[v_1,v_3])
                                         \\&= -[v_0, v_2]+[v_0,v_1]+[v_3,v_2]+[v_1,v_3],
\end{align}$$

which indeed represents the boundary of $a\cup b$ with the correct orientations. Pay attention, however, that this **isn't a union**, but a merely **formal sum**. We may *think of it as a union* for intuition, but it's not one! We're introducing a layer of (useful) abstraction here.

Note how this boundary follows some sort of "linearity", as do linear transformations. This leads us to think in algebraic terms, revealing potential extra structure involved with oriented simplices. Structures and connections: these are a mathematician's dream!

Quite importantly, we think of the sums above as independing of order: i.e., $a+b=b+a$ for any simplices $a,b$. We also assumed it's associative: $(a+b)+c=a+(b+c)$ for all $a,b,c$, so that parenthesis don't matter doing sums.

Summing works great with different simplices, but what about something like $a+a$? We know that $a\cup a = a$, so perhaps we should write $a+a=a$? But since we have inverses, this would mean that we could subtract both sides by $-a$, getting $a=0$-- which doesn't seem good at all. The second most natural option would be to write $a+a = 2a$, which wouldn't bring any algebraic problems. We could interpret this as "following", or "transversing" $a$ twice. That is, we can understand these algebraic elements as "transversions" of simplices, or a generic action over our simplex, so that this formal addition we're describing may be better intuitively understood as a "composition" of these actions. In the case of a 1-simplex, $2a$ would be as following the the directed path described by it twice; for a 2-simplex, it is like doing a twist twice along the triangle, based on the given orientation. This is more intuition than a formal relation, but it shows how geometrical simplices have a **static, set-like** logic, while oriented ones can indeed have a **dynamic, algebraic** one.

According to the linearity property described above, we also set $\partial(n\cdot a)=n\partial(a)$, $n$ and integer.

How to formalize this? Well, we will do that properly in the next section when we talk groups, but let us summarize the major points. For a simplicial complex $X$, let $a_0,...,a_k$ be all its n-simplices. Then we saw that it makes senses to consider formal finite sums $n_i \cdot a_i+...+n_j\cdot a_j$, $n_i$ being any integer-- possibly even negative or equal to $0$. We also write $a_i-a_i=0$, $0$ being a null, formal element (note that we only sum simplices of the same dimension). We also set the rules $a+0=0+a=a$ and $0a=0$. This sum and multiplication work like vector sum and scalar multiplication, basically satisfying all the properties we used to define vector spaces above (commutativity, distributivity, etc.). We'll call these sums **n-chains**, and say they form the set of n-chains $C_n(X)$. We also described a function $\partial _n : C_n(X)\rightarrow C_{n-1}(X),$ given by the formula above, satisfying some sort of linearity condition: $\partial_n(a+b)=\partial_n (a) + \partial_n (b)$ (note that the same $+$ symbol in each side represent operations on the different sets $C_n(X)$ and $C_{n-1}(X),$ respectively) and $\partial(n\cdot a)=n\partial(a)$.

The sets $C_n(X)$ above depend on the simplicial complex we're using to model $X$, but, thankfully, this won't actually matter for the computations involving holes we'll do later. They also don't depend on any choice of orientation, since all possible oriented simplices of our complex are contained as chains in $C_n(X)$.

Notice that the $C_n(X)$ really look similar to vector spaces (and $\partial_n$ to linear transformations), but, since we only allowed here for integet scalar multiplication, they are not vector spaces! They're actually cases of another algebraic structure, namely **modules** (which we'll study soon) which are generalizations of vector spaces.

Finally, note that $C_n(X)$ always contains the null element $0$, even when the complex $X$ contains no n-simplices. In particular, if that's the case, then $\partial_n(0)=0$, and we may write $\partial_n=0$.

## The case of delta spaces

These considerations can all be generalized to the delta space case. See, the maps $\sigma:\Delta^k\rightarrow X$ we considered before don't have any notion of orientation-- and, in particular, of normals on our space. We can orient these maps by seeing them as functions from oriented simplices, not geometric ones, so that the orientation of their domains will matter. We may write something like $\sigma : [v_0,...,v_k]\rightarrow X$ instead of $\sigma:\angled{v_0,...,v_k}\rightarrow X$ to indicate $\sigma$ inherits its orientation from $[v_0,...,v_k]$-- and not, say, from $-[v_0,...,v_k]$, in which case we could write we have $-\sigma$. That is, for each $\sigma$ in the delta structure, we have oriented maps $\sigma$ and $-\sigma$, according to the orientation we give to the domain simplex.

Here are the delta structures we presented before, but now oriented so that at least the oriented surfaces will have coherent normals:

IMGS!!! (oriented deltas)

With oriented delta structures, we can generalize the rest of our previous definitions. We'll let $C^\Delta _n(X)$ be the set of formal finite sums $n_i\sigma_i+...+n_k\sigma_k$, $n_j\in\mathbb{Z}$ and the $\sigma_j$ being part of the delta structure we're using on $X$. These sums will also be called n-chains. We can then define the boundary map $\partial_n:C^\Delta _n(X)\rightarrow C^\Delta _{n-1}(X)$ of a map $\sigma:\Delta^n\rightarrow X$ as

$$\partial_n(\sigma) = \sum_i (-1)^i \sigma \mid   [v_0, ..., \widehat{v_i},..., v_n],$$

and we extend to sums and products linearly: $\partial_n(a+b)=\partial_n(a)+\partial_n(b)$, $\partial(n\cdot a)=n\partial(a)$.

Note that, since $\sigma$ has signature $\Delta^n\rightarrow X$, the $v_i$ here refer to the vertices of the standard simplex, with $v_0$ the origin and $v_i\in\mathbb{R}^{n}$ having a $1$ in its $i$-th coordinates and $0$ elsewhere. Similarly to the simplicial case, the definition of $C^\Delta(X)$ depends on the delta structure, but not on specific orientations.

For example, seeing the circle as a delta space as we described previously with $\sigma$ is the only 1-chain in the structure, we have that $\partial_1(\sigma)=\sigma\mid  [v_1]-\sigma\mid  [v_0]=0$ since $\sigma\mid  [v_1]=\sigma\mid  [v_0]$.

For the torus as a delta space, we have that, for example, $\partial U = U\mid [v_1,v_2]-U\mid [v_0,v_2]+U\mid [v_0,v_1]$. Using the vertex labels above, $U\mid [v_1, v_2]=-b,$ $-U\mid[v_0,v_2]=-a$ and $U\mid[v_0,v_1]=c.$ An easier way to see this is just to follow the orientation of the boundary induced by $U$ and note it transverses $c,$ then $-a$ and then $-b,$ so that $\partial U = -b-a+c.$ Similarly, $\partial L = a-c+b.$ Thus,  

$$\begin{align}
\partial_2(U+L)=\partial_2(U)+\partial_2(L)&=(U\mid  [v_1,v_2]-U\mid  [v_0,v_2]+U\mid  [v_0,v_1]) 
\\&\,\,\,\,\,\,\, + (L\mid [v_1,v_2]-L\mid [v_0,v_2]+L\mid [v_0,v_1])
\\&=(-b-a+c)+(a-c+b)=0
\end{align}$$

As intended, the chain corresponding to the whole torus surface has null boundary!

The torus also has 1D cycles: these are $a, b, c$ and all their possible linear combinations, since the boundary is itself linear. This is easy to see, since all of these begin and end at the same vertex $v.$

## Cycles and holes

Let's dive a little deeper into how we can use the geometry of simplices, chains and their boundaries to study general topological spaces. What we'll say here will apply both to $C_n(X)$ and $C^\Delta_n(X).$

First, boundaries allow us to properly define what "**cycles**" mean. As mentioned in the introduction, these correspond to loops on our space, but also to hollow surfaces, and the corresponding higher-dimensional cycles. What these have in common is that they are "boundaryless", in some sense "self-enclosing". We can thus describe these as the chains $c$ with null boundary, $ \partial_n(c)=0.$ We can reuse the terminology of linear algebra and then define the set of n-cycles in $X$ as $Z_n(X)=\ker \partial_n.$

Still, there are many cycles that don't give rise to holes, and, as discussed, this is exactly because they're boundaries of some chain of the above dimension. Formally, these are the chains in the image of the boundary map, and form the set n-boundaries, $B_n = \im \partial_{n+1}.$ 

In the example of the delta structure on circle $S^1$, we have only one $\sigma:\Delta^1\rightarrow S^1$ with $\partial \sigma = 0$, as seen above, which then represents a cycle. Since we have no 2-chains, $\partial_2 = 0$, so $\sigma$ is not a boundary of anyone, and thus it represents an actual hole. For $D^2$ as the simplex $\Delta^2$, we have a similar situation with the one 1-chain $c=[v_0,v_1]+[v_1,v_2]+[v_2,v_0]$ which is a cycle, but it's also the boundary of the 2-chain $U = [v_0, v_1, v_2]$ representing the surface of the triangle-- i.e., $c$ is "filled out" by $U$, and thus can't be interpreted as giving rise to a hole.

That is, $S^1$ has a hole represented by a non-boundary cycle, but $D^2$ hasn't because it has been filled by a 2-chain (a 2D surface). Similarly happens with the chain $U+L$ representing the entire torus surface above, which is a non-bounded cycle as well.

The formula we gave above for the boundary allows us to easily prove one of the most important facts in all of algebraic topology (and, indeed, of many other areas of math as well): $ \partial_{n-1}(\partial_n (\sigma))= 0$-- more succintly, $ \partial_{n-1}\circ \partial_n=0$, or even $ \partial ^2=0$-- for any chain $\sigma$. Visually, this means that **boundaries are boundaryless, or, equivalently, all boundaries are cycles**! In particular, this implies $ \operatorname{im} \partial_{n+1} \subseteq \ker \partial_n$. 

To prove $\partial^2=0$ is actually just a matter of computation (we do it for delta spaces, but for complexes it's really the same thing):

$$\begin{align}
\partial_{n-1}(\partial_n \sigma) &= \partial_{n-1}(\sum_i (-1)^i \sigma \mid   [v_0, ..., \widehat{v_i},..., v_n])
\\&= \sum_{j< i} (-1)^i(-1)^j\sigma\mid[v_0,...,\widehat{v_j},...,\widehat{v_i},...,v_n]
\\&\,\,\,\,\,\,\, + \sum_{j>i} (-1)^i(-1)^{j-1}\sigma\mid[v_0,...,\widehat{v_i},...,\widehat{v_j},...,v_n],
\end{align}$$


where we have $j-1$ in the last sum because, since $j>i$, the vertex $v_i$ was already skipped in the presentation. For any pair $i,j$ such that $i>j$, we get a term $(-1)^i(-1)^j\sigma\mid[v_0,...,\widehat{v_j},...,\widehat{v_i},...,v_n]$ in the first sum. But we also get the term $(-1)^j(-1)^{i-1}\sigma\mid[v_0,...,\widehat{v_j},...,\widehat{v_i},...,v_n]$ in the other one. These cancel each other; as the sums are only made of these terms, we get that $\partial_{n-1}(\partial_n \sigma)=0$ for any $\sigma$.

As discussed in the introduction, however, **holes are classes of cycles**. Let's cosnider the cylinder triangulation we used before. In it, the two horizontal chains $c_1=[v_1,v_0]+[v_4,v_1]+[v_6,v_4]$ and $c_2=[v_3,v_2]+[v_5,v_3]+[v_7,v_5]$ are both cycles, and they represent the loops at the ends of the cylinder. They should be seen as representing the same hole, and we discussed this should be because their geometric union is the boundary of the whole cylinder. Let's try to use our new concepts to formalize this, specially since we introduzed orientations.

IMG!!! (cilindro)

If we take the chain

$$U=[v_0,v_1,v_2]+[v_1, v_3, v_2]+[v_1,v_4,v_3]+[v_4,v_5,v_3]+[v_4,v_6,v_5]+[v_6,v_7,v_5]$$ 

representing the whole cylinder surface (with all triangles counter-clockwise oriented, as in the image above), then we get $\partial U=c_1-c_2$, since, as discussed before, all the edges between triangles get eliminated. This sort of represents the union of $c_1$ and $c_2$, but with the last loop going in the opposite direction as $c_1$. Or, rather, it transverses $c_1$ and $c_2$, but with the last one going in the other direction. This characterizes $c_1$ and $c_2$ as representing the same hole in the cylinder.

In the purely geometrical case, we would have $\partial U = c_1 \cup c_2$, but in the oriented case we must pay attention to the sign of the chains.

In general, we will say that n-chains $c_1$ and $c_2$ in our space $X$ are members of the same "hole class" whenever there exists a $(n+1)$-chain $a$ such that $\partial a = c_1 - c_2$, or, equivalently, $c_1 = c_2 + \partial a$. We then say that these chains "**differ by a boundary**".

Mathematically, this fits perfectly with the notion of a **quotient** in group theory. Thus, we can't avoid it anymore: it's time to introduce group theory formally into our study.

# Homology theory

## Homology groups

With all this group theory machinery, we can finally define our **homology groups** where holes live.

Given a simplicial complex $X$, we let $C_n(X)=\mathbb{Z}a_1\times ... \times \mathbb{Z}a_m$ be the $\mathbb{Z}$-module freely generated by all the n-simplices $a_1,...,a_m$ in $X$ (if there are none, $C_n(X)=0$). The boundary homomorphisms $\partial_n : C_n(X)\rightarrow C_{n-1}(X)$ are defined by the formula we got earlier: $\partial_n(\sigma) = \sum_i (-1)^i [v_0, ..., \widehat{v_i},..., v_n].$ Define $\partial_0:C_0(X)\rightarrow 0.$ to be the trivial homomorphism to the trivial group $0,$ which we also write as simply $0.$ We thus get the so-called **chain complex** of $X$:

$$...\xrightarrow{\partial_3}C_2(X)\xrightarrow{\partial_2}C_1(X)\xrightarrow{\partial_1}C_0(X)\xrightarrow{0}0$$

We define the n-cycle subgroup to be $Z_n(X)=\ker \partial_n$ and the n-boundary subgroup to be $B_n(X)=\im \partial_{n+1}$. Since $\partial_n\circ \partial_{n+1}=0$, $B_n(X)\leq Z_n(X)$. Finally, the dimension n homology group of $X$ is the quotient

$$H_n(X) = \frac{\ker \partial_n}{\im \partial_{n+1}}$$

By all our previous considerations, elements of $H_n(X)$ represent n-dimensional holes in $X$!

We can do the same construction with delta spaces $X$ and $C^\Delta_n(X)$, getting the homology groups $H_n^\Delta(X).$ It is a theorem we'll not prove here that we always have

$$H_n(X)\cong H^\Delta_n(X),$$

i.e., it doesn't matter whether we use complexes or delta spaces to represent our spaces, homology groups will always be the same. We'll use the most convenient version depending on the specific computation.

Indeed, the groups $H_n(X)$ are invariant in respect to homeomorphisms: if $X$ and $Y$ are homeomorphic, then $H_n(X)=H_n(Y)$ for all $n.$ The same is true if $X$ and $Y$ are just homotopically equivalent. That is, homology is a topological invariant. We won't prove that here, but we'll lay out the neccessary tools later on.

It's now time to properly compute the homology of the spaces we've been studying! We'll use heavy use of presentations for that: since $H_n(X)$ is abelian (since $C_n(X)$ is so), always assume we have the commutative relation $a_i+a_j=a_j+a_i$ between generators. We'll ommit it for brevity-- so that, for example, we'll write $\zo^2\cong\angled{a,b}$ even thought the complete presentation is $\zo^2=\angled{a,b\mid ab=ba}.$

## Holes of dimension 0

Note that we also defined a trivial boundary $\partial_1$ for vertices: for $v\in C_0(X),$ $\partial_1v=0$, as **all points are boundaryless**. I.e., $\ker \partial_0=C_0(X).$ When are two vertices $v_0, v_1$ equivalent in the quotient? Well, whenever there's a 1-chain $c$ such that $\partial_1 c=v_0-v_1.$ Suppose that, for each pair of vertices $X$, there is a sequence $c_1,...,c_k$ of 1-simplices forming a path from $v_1$ to $v_0$; then $c_1+...+c_k=v_0-v_1,$ as common vertices between the lines get canceled. When this is possible, we say $X$ is **path-connected**. All the complexes we've seen so far are path-connected, since they're composed of a single "**connected component**".

In particular, if $X$ is path-connected, all 1-simplices $v_i,v_j$ are equivalent in the quotient: $v_i\sim v_j.$ Their common multiples are also equivalent: $nv_i\sim nv_j.$ This means that, for each $n\in\zo$, we have a class represented by $[nv_0],$ $v_0$ beinf a fixed vertex of $X.$ Thus, $H_0(X)\cong \zo.$ The same is valid using delta structures.

Actually, the converse is also true: if $H_0(X)\cong \zo,$ then you can find a path connecting all vertices $v_i,v_j,$ and $X$ is connected. We ommit the proof.

If $X$ had, say, two connected components $X_1, X_2 \subset X,$ then the vertices of $X_1$ would be identified only with themselves, and same in $X_2.$ Thus, 

$$H_0(X)=\angled{v_1,v_2}=H_0(X_1)\times H_0(X_2)\cong \zo^2,$$

for fixed vertices $v_1\in X_1, v_2\in X_2.$ In general, if $X$ has $k$ connected components, $H_0(X)\cong \zo^k.$ Thus, we may say that **0-dimensional holes measure connectivity**.

## Disks

The disk $D^2$ can be seen as the simplex $\Delta^2$. It is path-connected, so that $H_0(D^2)\cong \zo.$ For 1D cycles, we have only the boundary chain $[v_0,v_1]+[v_1,v_2]+[v_2,v_0]$ and its multiples, but they're all boundaries of $[v_0,v_1,v_2],$ thus being eliminated in the quotient-- thus, $H_1(D^2)=0.$ Since $[v_0,v_1,v_2]$ is the only 2-chain of $\Delta^2$ and it isn't a cycle, $H_2(D^2)=0.$

In general, all the k-chains of $\Delta^n$, $k$ smaller than $n$, are bounded faces of a sub-simplex, and the only n-chain isn't a cycle. This proves that

$$
H_n(D^k)=
\begin{cases}
\zo, & n=0 \\
0, & \text{else}
\end{cases}
$$

We interpret this as saying that the disks are all connected, but have no holes at any dimension.

## The circle and the spheres

Using our delta structure for $S^1,$ we get that $\cdn{1}(S^1)=c\zo$ and $\cdn{0}(S^1)=v\zo$, with

$$ \partial_1 c = c \mid  [v_1] - c \mid   [v_0] = c \mid  [v_0]-\sigma \mid  [v_0] = 0,$$

and so $\ker \partial_1=\cdn{1}(S^1).$ Since $\partial_2 = 0$ (as $\cdn{2}=0$), we have $H_1(S^1)=\angled{c}\cong\zo.$ Since the circle is connected, 

$$
H_n(S^1)=
\begin{cases}
\zo, & n=1, 0 \\
0, & \text{else}
\end{cases}
$$

We can intepret this as saying that the circle is connected and has a single 1D hole.

In general, the sphere $S^k$ can be seen as the boundary $\partial \Delta ^{k+1}.$ The n-chain $a$ summing all the faces of this boundary is an n-cycle, and so similarly we always have $H_k(S^k)=\angled{a}\cong\zo.$ As for the other groups with $k>0,$ they're trivial since every face of a face is bounded. Thus

$$
H_n(S^k)=
\begin{cases}
\zo, & n=k, 0 \\
0, & \text{else}
\end{cases}
$$

Again, this tells us the sphere $S^k$ is connected an has a single hole at dimension $k.$

## The torus

The delta structure we used for the torus has $\cdn{2}(T^2)=U\zo\times L\zo,$ $\cdn{1}(T^2)=a\zo\times b\zo \times c\zo$ and $\cdn{0}(T^2)=v\zo.$

Let's begin by computing all the neccesary kernels and images, then compute the homology.

* $\ker \partial_1$: 

We have that $ \partial_1 (a)=\partial_1 (b)=\partial_1 (c)=v-v=0$, so that $ \ker \partial_1 = \langle a, b, c\rangle$, the entire 1-chain space.

* $\im \partial_2$:

As previously computed, $ \partial_2 (U) = c - b - a$ and $ \partial_2 (L) = b + a - c,$ so that $\partial U =-\partial L$. Thus, $\im \partial_2=\angled{c-b-a, a+b-c}=\angled{a+b-c}$ ($c-b-a$ is generated by $a+b-c$ as its inverse).

* $\ker \partial_2$:

If $mU+nL\in \cdn{2}(T^2),$ then, by linearity, $\partial_2(nU+mL)=(m-n)a + (m-n)b + (n-m)c,$  for $m,n\in \zo.$ This is equal to $0$ if, and only if, $m=n,$ and then $\ker \partial_2 = \angled{nU+nL}=\angled{U+L}.$ As we saw previously, the chain $U+L$ corresponds to the whole torus surface, and thus is boundaryless.

* $H_1(T^2)$:

With these computations, we then get that 

$$H_1(T)=\langle a, b, c\rangle / \langle a+b-c\rangle = \langle a, b, c\mid  a+b-c=0\rangle$$ 

But in this group $ c=a+b$, so indeed the generator $c$ is reduntant in the presentation, and $H_1(T)\cong \langle a,b\rangle\cong \mathbb{Z}^2$. So we have two 1D holes: those of the class of $a$ and those of the class of $b$, as expected!

* $H_2(T^2)$:

For $H_2(T)$, we have $H_2(T)=\langle U+L\rangle /0=\langle U+L\rangle \cong \mathbb{Z}$ as $\cdn{3}(T^2)=0$, and we have a "2-dimensional hole" corresponding to the hollow surface of the torus. 

Summarizing:

$$
H_n(T^2)=
\begin{cases}
\zo, & n=2, 0 \\
\zo^2, & n=1 \\
0, & \text{else}
\end{cases}
$$

## The Klein bottle

The delta structure we used for the Klein bottle has $\cdn{2}(K)=U\zo\times L\zo,$ $\cdn{1}(K)=a\zo\times b\zo \times c\zo$ and $\cdn{0}(K)=v\zo.$

* $\ker \partial_1$:

The Klein bottle has $ \partial_1 (a)=\partial_1 (b)=\partial_1 (c)=0$, similar to the torus. Thus, $\ker \partial_1=\cdn{1}(K)=\angled{a,b,c}.$

* $\im \partial_2$:

Also similar to $T^2$, $ \partial_2(U)=c-b-a$, but here $ \partial_2(L)=b-a-c$. Thus, $\im \partial_2 = \angled{-a-b+c, -a+b-c}.$ Since $(-a-b+c)+(-a+b-c)=-2a$ and $-(-a-b+c)-2a=(-a+b-c),$ $(-a-b+c)$ (and, consequently, its inverse $(a+b-c)$)and $2a$ are sufficient generators of the image: $\im \partial_2=\angled{a+b-c, 2a}.$

* $\ker \partial_2$:

In order to the chain $nU+mL$ to be a cycle, we must have $ \partial_2(nU+mL)=-(n+m)a+(m-n)b+(n-m)c=0$. In particular, since the chain group is freely generated of the form $ \langle a,b,c\rangle $, we must have that each of the three coefficients multiplying $a,b,c$ must be zero: $m+n=n-m=m-n=0$. This is only possible if $m=n=0$, so that $\ker \partial_2 = 0$.

* $H_1(K)$:

We have 

$$H_1(K)=\langle a,b,c\rangle /\langle a+b-c, 2a\rangle =\langle a,b,c\mid  a+b-c=0,2a=0\rangle$$

Again, $c$ is determined as $a+b$, and we may simplify to get 

$$H_1(K)=\langle b,a\mid  2a=0\rangle \cong \mathbb{Z}\times \mathbb{Z}/2\mathbb{Z}$$

* $H_2(K)$:

Since $\ker \partial_2=0$, $H_2(K)=0$ as well.

Summarizing:

$$
H_n(K)=
\begin{cases}
\zo\times\zmod{2}, & n=1 \\
\zo, & n=0 \\
0, & \text{else}
\end{cases}
$$

## The projective plane

The delta structure we used for the projective plane has $\cdn{2}(\rpt)=U\zo\times L\zo,$ $\cdn{1}(\rpt)=a\zo\times b\zo \times c\zo$ and $\cdn{0}(\rpt)=v_0\zo\times v_1\zo.$

* $\ker \partial_1$:

We have that $\partial_1 a=\partial_2=v_1-v_0$ and $\partial_1 c=v_0-v_0=0.$ Thus, $\ker \partial_1=\angled{na-nb+mc},$ for $m,n\in\zo.$ This simplifies to $\angled{a-b, c}.$

* $\im \partial_2$:

We have that $\partial_2 U=-a+b+c$ and $\partial_2 L = -a+b-c,$ so that $\im \partial_2 = \angled{-a+b+c, -a+b-c}.$ Similarly to the Klein bottle, we have $(-a+b+c)+(-a+b-c)=2(-a+b)$, and we can simplify to $\angled{-a+b+c, 2(-a+b)}.$ For convenience later, we'll use the inverses: $\im \partial_2=\angled{a-b-c, 2(a-b)}.$

* $\ker \partial_2$:

For integers $n,m,$ linearity gives $\partial_2 (nU+mL)=-(n+m)a+(n+m)b+(n-m)c.$ If we want this to be null, we must have $n+m=n-m=0,$ this only being possible if $n=m=0$ and $\ker \partial_2 = 0.$

* $H_1(\rpt)$:

We have

$$H_1(\rpt)=\angled{a-b, c}/\angled{a-b-c, 2(a-b)}=\angled{a-b, c \mid (a-b)-c=0, 2(a-b)=0}$$

Again, $c=a-b$ is reduntant, so that $H_1(\rpt)=\angled{a-b\mid 2(a-b)=0}\cong \zmod{2}.$

* $H_2(\rpt)$:

$\ker \partial_2=0$ forces $H_2(\rpt)=0.$

Summarizing:

$$
H_n(\rpt)=
\begin{cases}
\zmod{2}, & n=1\\
\zo, & n=0 \\
0, & \text{else}
\end{cases}
$$

## The Euler characteristic

As we previously saw, we could define the Euler characteristic of a complex/delta structure as the alternating sum of the number $k$ of its n-dimensional chains $a_1,...,a_k.$ By definition, the rank $\rank C_n(M)$ of $C_n(M)$ is exaclty equal to this $k.$ Thus, we migh as well define the characteristic as $\chi(M)=\sum_n (-1)^n\rank C_n(M).$ Since the $C_n(M)$ change depending on the exact complex/delta structure being used, it's not clear that $\chi(M)$ is a topological invariant. 

Here we'll need a simple algebraic fact: if $0\rightarrow A\xrightarrow{i} B\xrightarrow{j} C \rightarrow 0$ is a short exact sequence of freely generated abelian groups, then $\rank B = \rank A + \rank C.$ This is because the map $i$ is injective, so its image contains exactly $\rank A$ copies of $\zo$ in $B.$ Since $\ker i = \im j,$ these copies are all maped to $0$ on $C.$ Since $j$ is surjective, all copies of $\zo$ in $C$ must then come from those remaining ones in $B,$ which forces $\rank B = \rank A + \rank C.$ SEI NNNNNNNNNNNNNNNNNNNNNNNNN

Since we have exact sequences $0\rightarrow Z_n \rightarrow C_n \xrightarrow{\partial} B_{n-1} \rightarrow 0$ and $0\rightarrow B_n \rightarrow Z_n \rightarrow H_n \rightarrow 0,$ this shows us that

$$\rank C_n = \rank Z_n + \rank B_{n-1}$$

$$\rank H_n = \rank Z_n - \rank B_{n}$$

Substituting, we have $\rank C_n = \rank H_n + \rank B_n + \rank B_{n+1}.$ This means we can sum the $\rank C_n$ alternating signs to get 

$$\begin{align}
\sum_n (-1)^n\rank C_n&=\sum_n (-1)^n (\rank H_n + \rank B_n + \rank {n+1})\\&=\sum_n (-1)^n\rank H_n,
\end{align}$$

since the ranks of the boundary groups cancel each other. Thus, the Euler characteristic has the formula $\chi(M)=\sum_n (-1)^n\rank H_n(M),$ which we might as well use as its "new" definition. Since $H_n(M)$ are topological invariants, so is $\chi(M).$ We'll use the characteristic later on when we classify patterns and tilings by their symmetries using algebraic topology.

## Holes of order 2 *

## Homology with coefficients

# Applications
## Functors, retractions and fixed points

Not only spaces can be studied using homology, but also continuous maps between them! If we have a continuous function $f:X\rightarrow Y$, then, for each $n$, we have the **induced homomorphism** $f_\#:\cdn{n}(X)\rightarrow \cdn{n}(Y)$ given by sending $\sigma:\Delta^n\rightarrow X$ to the composition $f\circ \sigma.$ 

This definition has a problem, however: nothing guarantees $f\circ \sigma$ is in the delta structure of $Y.$ To solve this, we define the **singular n-chain groups** $C^s_n(X)$, which is freely generated by **all** continuous maps $\sigma:\Delta^n\rightarrow X.$ These groups are huge, since usually are infinitely many such functions. However, they make the theory much cleaner without actually losing anything: with the same formulas as with delta spaces, you can define the singular homology groups $H^s_n(X)$ using $\csn{n},$ and we have an isomorphism $H^s_n(X)\cong H_n(X).$ Actually, you prove that complex and delta space homologies are the same by proving that both are isomorphic singular homology. We won't do that here, though.

Now, we have no problem defining $f_\#:\csn{n}(X)\rightarrow \csn{n}Y$ for each $n$ as $f_\#(\sigma)=f\circ \sigma.$

We would like to extend these to homomorphisms $f_*:H_n(X)\rightarrow H_n(Y)$ for each $n$ sending the class $[h]$ to $[f_\#(h)].$ This is only well-defined, however, if it sends cycles to cycles (or else we'd land outside of $\ker \partial_n$ in $\csn{n}(Y)$), and if $f_\#$ maps boundaries to boundaries. Otherwise, there would exist a boundary $b$ whose class is the neutral element $B_n(X)$, but being sent to a non-neutral element in $H_n(Y).$

Luckily, we always have $f_\#$ being well-behaved. This is because of the relation $f_\#\partial_n=\partial_{n}f_\#$: if $c$ is a cycle in $\csn{n}(X),$ then $f_\#(\partial c)=\partial(f_\#c),$ but also $f_\#(\partial c)=f_\#(0)=0,$ so that $\partial (f_\#c)=0,$ $f_\#c$ being then a cycle. If $c=\partial b$ is a boundary, $f(c)=f(\partial b)=\partial f(b)$ is also one.

Proving $f_\#\partial_n=\partial_{n}f_\#$ is basically just an application of $f_\#$ being, per definition, a homomorphism:

$$
\begin{align}
f_\#\partial_n (\sigma) &= f_\#(\sum_i (-1)^i \sigma \mid   [v_0, ..., \widehat{v_i},..., v_n])
                     \\&= \sum_i (-1)^i f_\#(\sigma \mid   [v_0, ..., \widehat{v_i},..., v_n])=\partial_n f_\#(\sigma)
\end{align}
$$

Thus, the induced homomorphisms $f_*:H_n(X)\rightarrow H_n(Y)$ sending $[h]$ to $[f_\#(h)]$ are well-defined. This means homology is a theory that associated spaces $X$ to (abelian) groups $H_n(X)$, and continuous functions $f:X\rightarrow Y$ to homomorphisms $f_*:H_n(X)\rightarrow H_n(Y)$. This is called homology's **functorial** property, and the n-th homology $H_n(\cdot)$ is called a **functor** between spaces and groups.

The idea of some theory $F$ bringing mathematical objects $o$ to $Fo$ and maps $f:o\rightarrow o'$ to maps $Ff:Fo\rightarrow Fo'$ is one of the most fundamental insights of [category theory](https://en.wikipedia.org/wiki/Category_theory) ([see also](https://en.wikipedia.org/wiki/Functor)), and is widely applied in [functional programming](https://en.wikipedia.org/wiki/Functor_(functional_programming)).

Homology being a functor is actually a very, very useful and powerful property. First, it allows us to prove that homology is a topological invariant: if $f,g$ provide a homotopy equivalence $X\simeq Y,$ then we can prove that $f_*$ and $g_*$ are inverses in homology, giving isomorphisms $H_n(X)\cong H_n(Y).$ The proof isn't actually hard and introduces some useful algebraic concepts, and can be found, say, on Hatcher's book.

Functoriality is also useful when applied to **retractions**. Formally, a retraction from a space $X$ to a subspace $A\subseteq X$ is a continuous functions $r:X\rightarrow A$ such that $r(a)=a$ for all $a\in A.$ That is, we leave $A$ alone and send the rest of $X$ to it.

IMG !!!

Suppose we have a retraction $r:X\rightarrow A$. The chain homomorphisms $r_\#:\csn{n}(X)\rightarrow \csn{n}(A)$ are surjective since each $\sigma:\Delta^n\rightarrow A$ can be given as $r_\#(\sigma'),$ $\sigma':\Delta^n\rightarrow X$ being the exact same as $\sigma,$ but with extended range. This implies that the homology induced homomorphisms $r_* :H_n(X)\rightarrow H_n(A)$ are also surjective. 

This simple remark shows us that **there is no rectraction** $r:D^2\rightarrow S^1$, since this would give a surjection $0\cong H_1(D^2) \rightarrow H_1(S^1) \cong \mathbb{Z}$, which is absurd. Intuitively, this means that if tou take a sheet of fabric and fix its boundary, it's impossible to retract it to the boundary without cutting the sheet. This also applies for any dimension, since retractions would imply surjections $r_*:H_n(D^{n+1})\cong 0 \rightarrow H_n(S^n)\cong \zo.$ This is a very relevant topological fact, and one that isn't easy at all to prove without some algebraic machinery like homology! Its relevance can be seen, for example, in how it can be used to prove this extremely useful and powerful theorem:

**Theorem (2D Brouwer's fixed point theorem)**: Every continuous function $f:D^2\rightarrow D^2$ has a fixed point (i.e., $x$ such that $f(x)=x$).

**Proof**: Suppose we had some $f:D^2\rightarrow D^2$ without fixed points, so that, for all $x$, $x\neq f(x)$. Then we can form a ray going from $x$ to $f(x)$, and this ray intersects $S^1$ at some unique point. Define $r(x)$ to be this intersection. This $r$ is then a retraction $D^2\rightarrow S^1$, which isn't topologically possible, so we have a contradiction.

{{< qed >}}

IMG !!!

Actually, this applies to any dimension, using the exact same argument. Thus

**Theorem (Brouwer's fixed point theorem)**: Every continuous function $f:D^n\rightarrow D^n$ has a fixed point.

The theorem applies for any space $X$ homeomorphic to $D^n.$ For if $h:X\rightarrow D^n$ is a homeomorphism and we have a continuous function $f:X\rightarrow X,$ then $h\circ f\circ \inv{h}:D^n\rightarrow D^n$ has no fixed point. Suppose there was an $x\in X$ fixed by $f.$ Since $h$ is bijective, there is a $p\in D^n$ such that $\inv{h}(p)=x.$ Thus, $h(f(\inv{h}(p)))=h(\inv{h}(p))=p,$ and $p$ is a fixed point of $h\circ f\circ \inv{h},$ which is a contradiction.

In the 1D case, the theorem states that, if we have a continuous function $f:[a,b]\rightarrow [a,b],$ then $f(x)=x$ for some $x\in [a,b].$ We can see this through the graphic of $f$, which is contained inside the square $[a,b]^2.$ The fact that there's $x\in[a,b]$ such that $f(x)=x$ is equivalent to the graph of $f$ being forced to intersect the diagonal from $(a,a)$  to $(b,b)$ in the square. I.e., continuous graphs can't avoid touching this diagonal. This 1D example is actually a standard exercise on analysis, and can be proved only using the compactness of $[a,b]$ and the [intermediate value theorem](https://en.wikipedia.org/wiki/Intermediate_value_theorem)-- but topological methods are required for higher dimensional proofs. 

IMG!!!

Brouwer's fixed point theorem is a very useful theorem. It is, for example, commonly used to prove that certain equations have solutions with fixed points (e.g. equations of **movement**, like from liquids or planetary systems). We're now going to study two fascinating applications to games, both fundamentally due to [John Nash](https://en.wikipedia.org/wiki/John_Forbes_Nash_Jr.).

## The Hex game

Hex is a board game invented by the norwegian polymath [Piet Hein](https://en.wikipedia.org/wiki/Piet_Hein_(scientist)) and later further studied by Nash. It's played on an 11x11 hexagonal board, between two players: black (which starts) and white. Each one places a stone on a cell of the according color in its turn. Stones can't be taken away from the board. Black's objective is to connect the horizontal sides of the board by black stones, and similarly white has to connect the vertical sides. Here's, for example, a game won by black:

IMG !!!

Interestingly, Hex can also be played on a Go-like board, shown below. As in Go, you place stones in vertices on the board, but, unlike in Go, these vertices are not connected only in a square lattice: they also contain diagonal connections! These are such that the connectivity of the hexagonal and the Go-like board are exactly the same. Each row of vertices corresponds to a row of hexagonal cells, and you can check that the connectivities are the same.

IMG!!! go-like

You can play Hex solo and check the equivalence between the hexagonal and Go-like boards below:

GAME!!!

The fascinating thing about Hex is that is an inherently **topological game**, in the sense it involves connectivity, independent of any actual geometry. The relation is, however, even deeper, specifically when you consider the possible end results of the game. What results are possible? Since we have a finite board, we must have that each game either leads to a black win, to a white victory or a draw. This last ending, however, is **impossible**, and this is an application of Brouwer's fixed point theorem!

**Theorem**: No Hex game can end in a draw.

**Proof**: 

The proof is appliable to any $k\times k$ board (actually to any dimensions, the proof being identical).

First, note that the Go-like board gives us a **triangulation** of the square $D_k=[0,k]\times [0,k]$ (with the connections giving the edges of the triangles), which is homeomorphic to a 2D disk. Denote this complex as $B_k$. Assuming there exists a Hex game without a winner, we will construct a map $f:D_k\rightarrow D_k$ without a fixed point, which is a contradiction. 

Since $D_k$ is triangulated by $B_k$, every element $x$ of $D_k$ can be written uniquely in barycentric coordinates as a linear combination $x=\lambda_0 v_0 + \lambda_1 v_1 +\lambda_2 v_2$, for $v_0,v_1,v_2$ vertices of $B_k$ forming the triangle containing $x$, and $\lambda_0+\lambda_1+\lambda_2=1$,  $\lambda_i\geq 0$. Remember that this means that every function $f:B_k\rightarrow \rt$ can extend to one $\widehat{f}:D_k\rightarrow \rt$ by defining $\widehat{f}(\lambda_0 v_0 + \lambda_1 v_1 +\lambda_2 v_2)=\lambda_0 f(v_0) + \lambda_1 f(v_1) +\lambda_2 f(v_2)$.

Let $H, V$ denote the sets the positions of black (*Horizotal*-winning) and white (*Vertical*-winning) pieces on a board, respectively.

Assume that we have $H,V$ such that there is no Hex winner. Now, let us define a function $f:B_k\rightarrow B_k$ which will be extended to $\widehat{f}:D_k\rightarrow D_k$ that will lead to the contradiction. Define $\widehat{W}$ to be the subset of $H$ connected to the western extreme $W$, and similarly for $\widehat{E}\subset H$, $\widehat{S}\subset V$ and $\widehat{N}\subset V$. The assumption we have no winner is equivalent to saying that $\widehat{W} \neq \widehat{E}$ and $\widehat{S} \neq \widehat{N}$, or that $\widehat{W}$ (or $\widehat{S}$) and $\widehat{E}$ (or $\widehat{N}$) are connected. Then define $f$ as

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

The result is actually even stronger: Hex having no draws is **equivalent** to the 2D Brouwer fixed point theorem. The proof requires some use of real analysis, so we won't write it here. See the references for a proof.

The interactive game above shows this winning flow, it being null at positions without any placed stones. Colors represent the direction (and length by their intensity) of the flow vectors, according to the color-coding shown in the disk below (right is blue-ish, up is red-ish, left is green-ish and down is cyan). Black indicates null-flow.

IMG !!! circulo

IMG!!!!  jogo e exemplo

By [Zermelo's Theorem](https://en.wikipedia.org/wiki/Zermelo%27s_theorem_(game_theory)), since Hex has no draws, there must be a winning strategy for either black or white. Well, if white-- the second player-- had such a strategy, then black could begin with a generic move and then immitate it. Since in Hex a placed stone can never be a disadvantage, black's first stone wouldn't stop them from following the immitated winning strategy. Thus, if white had such a forced win, black would have one as well-- which is a contradiction. Thus, it must be that **black-- the first player-- has a winning strategy from the beginning**.

In that sense, Hex is "solved". But note that we didn't actually construct this strategy, and the "perfect Hex game" is still unknown. The strategies for the 7x7, 8x8 and 9x9 boards, however, have been found.

## Nash equilibria **
NASH EQUILIBRIA
    EXS PUROS (prisionners, eleic)
    EXS MISTOS (bach, pennies)

Formally, define a function $\text{Gain} (\sigma): A \rightarrow \ro^i$ that, for each action $a$, returns the expected gain to player $i$ given the action:

$$\text{Gain}_i(\sigma)(a) = \max (0, u_i(a, \sigma_{-i}) - u_i(\sigma))$$

Then a **Nash equilibirum** of a game is a mixed strategy such that $\text{Gain}_i(\sigma)(a)=0$ for all $i$-- i.e., no players can improve their position.

**Theorem**: Every game with finite players and actions has at least one Nash equilibrium.

**Proof**:
Let $\sigma \in \Delta^{i_1}\times...\times\Delta^{i_k}$ be a mixed strategy. Let's try to define a "winning flow" which, for each $\sigma$, points in the direction of the direction of a strategy with better expected gains. The idea is that fixed points of this flow will exactly be the strategies that can't be improved for any player-- i.e., Nash equilibria. 

We can try to define the flow by pushing $\sigma$ by its gain: $g(\sigma)(a) = \sigma(a) + \text{Gain}(\sigma)(a)$. This, however, doesn't necessarily gives an element inside $\Delta = \Delta^{i_1}\times...\times\Delta^{i_k}$, because its components might not sum to one. What we need is a flow definition $f$ such that $\sum_{b\in A_i}f(\sigma)_i(a_j)=1$. To get this $f$, note that, since $\sigma_i$ is an element of a simplex,

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
    \sum_{a\in A_i}\sigma^*_i(a)\text{Gain}_i(\sigma^*, a) &=\sum_{a\in A_i'}\sigma^*_i(a)(u_i(a, \sigma_{-i}^*) - u_i(\sigma_i^*))
    \\&= \left(\sum_{a\in A_i'}\sigma^*_i(a)u_i(a, \sigma_{-i}^*)\right) - u_i(\sigma_i^*)
    \\& = u_i(\sigma_i^*) - u_i(\sigma_i^*)=0
\end{align}
$$

where $A'_i$ is the set of actions such that $\text{Gain}_i(\sigma^*, a)\neq 0.$ FALSE!!!!!!!! DAÍ O RESTO DAS IGUALDADES N ROLA The penultimate equality comes from $\sigma^*_i$ being a simplex and $u_i(\sigma_i^*)$ constand, and the last one by the very definition of $u_i(\sigma_i^*)$.

However, we also have that $\sum_{a\in A_i}\sigma^*_i(a)\text{Gain}_i(\sigma^*, a)=\sum_{a\in A_i}(S-1)\sigma^*_i(a)^2$, and, since there's at least one $a$ such that $\sigma^*_i(a)>0$ (otherwise mixed strategies wouldn't sum to one), $S=1$ in order for the expected value of the gains to be null. Thus we have $\sigma^*_i(a)=\sigma^*_i(a) + \text{Gain}_i(\sigma^*, a)$, and $\text{Gain}_i(\sigma, a)=0$ for any player $i$ and action $a\in A_i$-- proving that $\sigma^*$ is indeed a Nash equilibrium.

{{< qed >}}

Conversely, every possible Nash equilibrium gives a fixed point of the flow above-- i.e., **equilibria are exactly the fixed points of the "winning flow"** $f$.

ARROWS!!!!

# Going further

## Homotopy invariance of homology

To prove that *singular* homology is a topological invariant, it's actually easier to prove that two spaces $X,Y$ with the same *homotopy* type (which includes homeomorphic spaces) have the same homology groups.

We can actually prove even more: if $f$ and $g$ are homotopic maps, then they have exactly the same induced homomorphisms on homology: $f_*=g_*.$ This includes the previous claim, since if $f:X\rightarrow Y$ and $g:Y\rightarrow X$ provide a homotopy equivalence $X\simeq Y,$ then $f\circ g\simeq \text{id}$ and thus $f_*\circ g_*=\text{id},$ so that $f_*$ and $g_*$ are inverses, giving an isomorphism $H_*(X)\cong H_*(Y).$

Thus, let $F:X\rightarrow I\rightarrow Y$ be a homotopy between maps $f$ and $g$ as above. Now, the essential (and actually quite simple, **check Hatcher**) part of the proof is to provide a triangulation of $\Delta^n\times I$ for all standard simplices-- with $\Delta^2$, for example, this is just a triangulation of a square, especifically using a quad. 

## Long exact sequences

## Isomorphism of simplicial, delta and singular homologies

## CW complexes and cellular homology

CW COMPLEXOS

RPN, CPN

H_*(X_N,X_N-1)

DESCRIÇÃO DO BOUNDARY

CPN, RPN (COEFICS TBM)