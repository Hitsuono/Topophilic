+++
date = '2025-01-14T12:33:23-03:00'
draft = true
math = true
comment = true
title = "Algebra for topology: symmetries, permutation games and spaces"
tags = ["Topology for Artists"]
toc = true
+++

# TL;DR

Bla


{{< toc >}}

ALGEBRA DOS QUOCIENTES

# Basic linear algebra

We can see elements $(a_0,...a_n)$ of $ \mathbb{R}^n$ in two ways: as points in a space (the $a_i$ being its coordinates), or as arrows going from the origin $ (0,...,0)$ (we will also usually write just $0$ for the origin from now on) to $(a_0,...a_n)$. In the second intepretation, we call them vectors. Points and vectors are really the same thing in $\mathbb{R}^n$, so we'll call them interchangeably.

Bearing in mind the geometry-topology distinction, the fact that points in $ \mathbb{R}^n$ are also vectors-- i.e., directions-- is actually a geometric property, related directly to curvature. Indeed, if we curved the plane in order to get the upper hemisphere of a sphere, points wouldn't coincide if directions, as seen in the image below. Directions at a certain point $x$ in our base space $X$ in the so-called tangent space $T_xX$, which is a copy of $ \mathbb{R}^{dim(X)}$. With the reals, these spaces can be identified, but not for any curved space.

IMG !!!

Interestingly, this means that we could informally define $\mathbb{R}^n$ as the space of all directions. Thus, if arithmetic and calculus never lead us to the notion of real numbers (and their sequences), we could still find them through this definition, as a sort of configuration/state space of directed arrows. This method-- defining a space as the "state space" of objects we're studying-- is extremely fruitful, and we'll apply it in later posts.

Vectors unite algebra and geometry very deeply. We can define an addition with vectors by adding all their components: $ a+b= (a_0,...,a_n)+(b_0,...,b_n)=(a_0+b_0,...,a_n+b_n)$. Geometrically, this corresponds as taking $b$ and setting its origin to the end of $a$, and taking the sum as the arrow from the origin to the end of this displaced $b$ vector. This forms a triangle, as seen in the image below.

IMG!!! ADD VETORIAL

We also define what's called **scalar multiplication** between a real number $ \alpha$ (called a "scalar") and a vector $v=(a_0,...,a_1)$: $\alpha v = (\alpha \cdot a_0,...,\alpha \cdot a_1)$. Geometrically, we're stretching $v$ by a factor of $\alpha$ (negative numbers inverting the direction of the vector).

We could do these operations with other sets instead of $\mathbb{R}^n$-- like with $\mathbb{C}^n$, $\mathbb{Q}^k$ or subspaces of $\mathbb{R}^n$, as we will se below. Thus, we generally define a **real vector space** as a set $V$-- whose members are called vectors-- with an operation $+$ satisfying familiar properties: for all $a,b\in V$, we have
- $a+b = b+a$ (commutative property);
- $(a+b) +c=a+(b+c)$ (associative property);
- there is an element $0$ such that $a+0=0$;
- for all $a$ there is an element $-a$ such that $a+(-a)=a-a=0$.

Similarly, we define scalar multiplication $\alpha \cdot a$ for all $\alpha\in \ro, a\in V$, satisfying the distributive propert $\lambda \cdot(a+b)=\lambda a + \lambda b$. We could also define scalars coming from other sets instead of the reals, like the complex numbers. For linear algebra to make sense, these sets also need some algebraic structure, forming what's called a **field**. Fields are sets together with operations $+, \times$ similar to addition and multiplication as we know them from the real or complex numbers. We'll study these latter.

We can use these operations to do geometry on $\ro^n.$ For example, the **length**, also called **norm** of a vector $v$ is the size of the arrow representing it, written $\|v\|.$ Using Pythagora's theorem, we get that $\|v\|=\sqrt{v_1^2+...+v_n^2}.$ Then the length of the vector representing the difference $a-b$ that goes from $b$ to $a$ is the **Euclidean distance** between $a,b$ seen as points: $d(a,b)=\|a-b\|.$ This is the usual metric we intuitively use when calculating distances in the real world.

If you have a vector $v$ and want to get another $v'$ pointing on the same direction, but with length equal to $1$, you can "**normalize**" it and let $v'=\frac{v}{\|v\|}.$

IMG !!!

A vector $v$ is called a **linear combination** of other vectors $v_1,...,v_k$ when we have that $v=\alpha_1v_1 + ... + \alpha_kv_k$ for some $\alpha_1,...,\alpha_k$. This notion can be used to, say, describe colinearity: if for example $v=\alpha v'$ for some other $v'$, this means $v$ and $v'$ are in the same line. Similarly, if $v=\alpha_1v_1+\alpha_2v_2$, then $v$ is in the plane containing $v_1, v_2$ (try seeing this in $\mathbb{R}$^3).

For a finite set $S$ of vectors, its span $\text{span}(S)$ is the set of all possible linear combinations using elemnts from $S$.

Particularly important is the set $e_1,...,e_n$ of vectors $e_i$ with an $1$ in the $i$-th position and zeros elsewhere. Every element of $\mathbb{R}^n$ can be written as a linear combination of these vectors: if $v=(v_1,...,v_n)$, then $v=v_1e_1+...+v_ne_n$.

A set of vectors $\{v_1,...,v_k\}$ is linearly independent (l.i.) if no $v_i$ is a linear combination of some vectors contained in the set. Geometrically, this means we don't have co-linear/planar/etc. points in the set. Note that $e_1,...,e_n$ as defined above are l.i.

For a l.i. set $S=\{v_1,...,v_k\}$, every element of its span can be represented uniquely by elements of $S$. Otherwise, say we had $v=\alpha_1v_1+...+\alpha_kv_k=\beta_1v_1+...+\beta_kv_k$ for at least one $i$ such that $\alpha_i\neq \beta_i$. We can choose $i=1$ (just order $S$ differently), and then then $v_1=(\beta_2v_2+\dots+\beta_kv_k-\alpha_2v_2.-\dots-\beta_kv_k)/(\alpha_1-\beta_1)$, meaning $S$ isn't l.i.-- a contradiction.

In particular, this means $\{v_1,...,v_k\}$ serve as coordinates for $\text{span}(S)$-- we say they are a basis for the span of $S$. For example, $e_1,...,e_n$ is a basis of $\text{span}(e_1,...,e_n)=\mathbb{R^n}$, called the **canonical basis** of $\mathbb{R}^n$-- it is the most natural, but certainly not the only one. In general, the amount of vectors neccessary for getting a basis of a vector space $V$ is constant and it's called its **dimension**, $\text{dim}(V)$. We'll only consider finite-dimensional spaces here. The study of infinite dimensional ones-- known as [functional analysis](https://en.wikipedia.org/wiki/Functional_analysis)-- uses a lot of (more point set) topology, but is out of the range of this post (although perhaps not of this series).

In $\mathbb{R}^3$, whenever we have two vectors $a, b$, we can form a base by bringin in a vector $c$ perpendicular to the plane containing $a, b$ (their span). We could do this with the so-called **cross product** $a\times b$, defined as 

$$(a_0,a_1,a_2)\times (b_0,b_1,b_2) = (a_1\cdot b_2 - b_1\cdot a_2, a_2\cdot b_0 - b_2\cdot a_0,a_0\cdot b_1-b_0\cdot a_1)$$

You can check that this indeed generates a base whenever $a,b$ come from the canonical one. The formula might seem a bit daunting, but it has a fairly straightforward geometrical interpretation, which we'll skip here for length's sake.

MAO DIREITA

Another very important product is the **dot product**, which measures the similarity of two vectors. More properly, if $a,b$ are vectors in $\ro^n,$ then their dot product is defined as $a\cdot b=\|a\|\|b\| \cos(\theta),$ where $\theta$ is the angle between $a$ and $b$ in the plane containing them. Since we're using the cosine, $a\cdot b=0$ only when $a$ and $b$ are perpendicular to one another (or if one of them is $0$). It's a standard exercise to show that $a\cdot b = \sum _{i=0}^n a_ib_i,$ giving us a straightforward formula for the product (just prove it for the canonical basis and then for a general vector by decomposing it into the basis). It also shows us that $a\cdot a = \sum a_i^2=\|a\|^2.$

Linear algebra considers not only these algebraic-geometric constructions, but also functions preserving them. More specifically, it also studies linear transformations, which are functions $f:\mathbb{R}^m\rightarrow \mathbb{R}^n$ such that $ f(a+b)=f(a)+f(b)$ (they "respect vector addition") and $f(\alpha a)=\alpha f(a), a\in\mathbb{R}$ (they "respect scalar multiplication").

A linear transformation is a function of the kind $f:\mathbb{R}^m\rightarrow \mathbb{R}^n$, where its output is composed of linear combinations of the components of the input vector: i.e., if $v=(v_1,...,v_m)\in\mathbb{R}^m$, $ f(v)=f(v_1,...,v_m)=(\sum_i\alpha_{1i}v_1,...,\sum_i\alpha_{ni}v_i)\in\mathbb{R}^n$. 

Equivalently, a linear transformation is a function $f:\mathbb{R}^m\rightarrow \mathbb{R}^n$ such that $f(a+b)=f(a)+f(b)$ and $f(\alpha a)=\alpha f(a)$-- we say that it respects sums and scalar products. Computations quickly show that the previous definition satisfies these properties. Conversely, if $f$ satisfies these formulas, then $f(v)=f(v_1,...,v_m)=v_1f(e_1)+...+v_mf(e_m)$, so that $f(v_1,...,v_m)=(\sum_i\alpha_{1i}v_1,...,\sum_i\alpha_{ni}v_i)$ for $\alpha_{ij}$ the $j$-th component of $f(e_i)$.

The two equivalent definitions above tell us two different ways of defining and considering mathematical objetcs. In the first one, we're explicit, or, rather, **extensional**, clearly constructing our objects of interesting. In the second one, we are **intensional**, defining and describing through properties and relations that should be satisfied. Extensive statements are very intuitive and in many cases the definitions we're actually thinking of. Intensive statements, in the other hand, are more generalizable and allow for cleaner reasoning.

Topologically, all linear functions are continuous, since vector addition and multiplication themselves are so.

Many common geometrical functions are linear, like

- Linear scalings: scale vectors on each direction with $f(v)=\alpha_v v,$ where $\alpha_v$ depends on $v$ linearly;
- Rotations;
- Projection into an axis.

However, note that translations are not linear: if we want translate a point $x$ by a fixed vector $v$, getting $f(x)=x+v,$ this isn't linear since, for example, $f(2x)=2x+v\neq f(x)+f(x)=2x+2v.$ We'll see on the post on projective spaces that there is, however, a way to include translations as linear transformations of some space-- using the so-called "homogenous coordinates".

IMG!!!

Bijective (i.e., invertible) linear transformations are called **linear isomorphisms**.

We can represent transformations using **matrices**: specifically, if $f:\ro^n\rightarrow \ro^m$ is linear, then it can be represented by the $m\times n$ matrix $M_f$ defined as

$$\begin{pmatrix}
f(e_1)_1&...& f(e_n)_1\\
...& ...&...\\
f(e_1)_m&...&f(e_n)_m
\end{pmatrix} $$

Conversely, every matrix $M$ represents a transformation $f$ by defining the values of $f$ as above.

Remember that the element $M_{ij}$ of a matrix is the one on the $i$-th row and $j$-th column. We then define matrix multiplication $AB$ (of size $a\times c$) between two matrices $A$ (of size $a\times b$) and $B$ (of size $b\times c$) by $(AB)_{ij}=\sum A_{ik} B_{kj}$. Equivalently, $(AB)_{ij}=A_{i*}\cdot B_{*j},$ where $A_{i*}$ and $B_{*j}$ are the vectors representing the $i$-th row of $A$ and the $j$-th column of $B,$ respectively. This operations is defined exactly so that $M_fM_g=M_{f\circ g},$ for linear transformations $g:\ro^n\rightarrow \ro^m$ and $f:\ro^m\rightarrow \ro^k.$ It is also so that, if vectors $v\in \ro^n$ are seen as a column matrices of values $\begin{pmatrix}v_1\\...\\ v_n\end{pmatrix}$ and $f:\ro^n\rightarrow \ro^m$ is linear, then $f(v)$ is obtained by multiplying $M_f$ and $v$: $f(v)=M_fv.$ 

Note that matrix multiplication isn't commutative, since linear transformation composition isn't. For example, $M_f=\begin{pmatrix}1&0\\0&0 \end{pmatrix}$ represents a transformation $f$ annihilating $e_2$ and leaving $e_1$ as it is; $M_g=\begin{pmatrix}1&1\\0&0\end{pmatrix}$ represents one $g$ taking $e_2$ to $e_1$ and, again, fixing $e_1.$ Doing $f\circ g$ has matrix $M_fM_g=\begin{pmatrix}1&1\\0&0\end{pmatrix}$ (since $f(g(e_2))=f(e_1)=e_1$) and $g\circ f$ has $M_gM_f=\begin{pmatrix}1&0\\0&0\end{pmatrix}$ (since $g(f(e_2))=g(0)=0$).

The identity transformation on $\ro^n$ is represented by the $n\times n$ identity matrix $I$ with ones on the diagonal $m_{ii}$ and zeros elsewhere. It has the property that $MI=IM=M$ for all matrices $M$ of size $n\times n.$ A matrix $M$ is then called **invertible** if there's some matrix $\inv{M}$ such that $M\inv{M}=\inv{M}M=I,$ and these represent exactly the linear isomorphisms on $\ro^n.$ 

A counter-clockwise rotation of $\theta$ radians, for example, is given by the matrix $\begin{pmatrix}\cos (\theta) & -\sin (\theta)\\ \sin (\theta) & \cos(\theta) \end{pmatrix}.$ A clockwise rotation with the same angle is given by $\begin{pmatrix}\cos (\theta) & \sin (\theta)\\ -\sin (\theta) & \cos(\theta) \end{pmatrix},$ and these are inverses since they represent inverse transformations.

IMG!!!

Linear transformations are very useful for dealing in a systematic way with the solutions of systems linear equations. If we have such a system 

$$\begin{cases}
\alpha_{11}x_1+...+\alpha_{1k}x_k=0 \\  \dots  \\ \alpha_{m1}x_1+...+\alpha_{mk}x_k=0
\end{cases}
$$

with $k$ variables and $m$ equations, we can consider a transformation $f:\ro ^k\rightarrow \ro ^m$ defined as above by considering the vectors $x=(x_1,...,x_k)$ and defining $f(x)=f(x_1,...,x_k)=(\alpha_{11}x_1+...+\alpha_{1k}x_k,...,\alpha_{m1}x_1+...+\alpha_{mk}x_k)$, and the solutions of the system are exactly the members of $\ker f = \{x\in\ro^k\mid f(x)=0\}$-- a set known as the **kernel** of $f$.

Members of $\ker f$ (i.e., solutions to linear systems of equations) satisfy a very important property, namely that for all $a,b\in \ker f$, $a+b\in \ker f$, since $f(a+b)=f(a)+f(b)=0$. Similarly $\lambda a\in \ker f$ for all $a\in\ker f$, $\lambda \in \ro$, since $f(\lambda a)=\lambda f(a) = \lambda 0 = 0$. I.e., summing and multiplying vectors of solutions also gives a solution! We can formalize this with the notion of a subspace: given a vector space $V$, a **subspace** $W\subset V$ is a subset where for all $a,b\in W$ and scalars $\lambda$, $a+b\in W$ and $\lambda a\in W$. Lines and planes going through the origin are examples of subspaces, since whenever you add two vectors inside a line/plane, you remain inside it. Indeed, lines are exactly the 1D subspaces of $\mathbb{R}^n$, and planes its 2D subspaces.

Coming back, vectors also allow us to easily define geometrically interesting sets. For example, the line between two vectors $v_0, v_1$ can be written as the set $ \{tv_0+(1-t)v_1\mid  0 \leq t\leq 1\}$.

Another class of geometrical sets that can be defined by vectors are convex hulls. Given a subset $S\subseteq \mathbb{R}^n$, its convex hull is the minimal convex space containing $S$. Remember that $A\subseteq \mathbb{R}^n$ is convex if it contains every line between points inside itself. If $S=\{v_1,...,v_k\}$ is a collection of vectors, then the convex hull $\overline{S}$ of $S$ can be given by all the linear combinations $\lambda_1v_1+...+\lambda_kv_k$ with $\lambda_1+...+\lambda_k=1$, with $\lambda_i\geq 0$ for all $i$.

The proof that $ \overline{S}$ as defined is indeed the convex hull can be made quite constructive. First, to get the hull of $ \{v_1,...,v_k\}$, we add all the lines of the form $ \{tv_i+(1-t)v_j\mid  0 \leq t\leq 1\}$, then again add segments between original vertices to points in these lines, getting $ \{sv_l + (1-s)(tv_i +(1-t)v_j) = sv_l+(t-st)v_i + (1+st-s-t)v_j\mid  0 \leq s,t\leq 1\}$, and so on. This will give us $ \overline{S}$ as defined and, by our construction, it must be inside every convex set containing $ \{v_1,...,v_k\}$. Since $ \overline{S}$ as defined above itself is convex, it must be the convex hull we desired.

# Groups, permutations and their games

Since most of the topological intuition for this post has already been described, we'll allow ourselves to be rather quick with definitions and properties in this section, assuming most of the work here is of formalizing and generalizing what we've already seen.

## Definitions and basic examples (H)
A **group** is a set $G$ with an **binary operation** $*:G\times G\rightarrow G$ taking two elements $a,b\in G$ and returning $a*b\in G$. We require this operation to be "well-behaved" and satisfy properties resembling integer addition (which also models our chain sums above), namely:

* Associativity: $(a*b)*c=a*(b*c)$ for all $a,b,c\in G$;

* Neutral element: there is one element $e\in G$ such that, for all $a\in G$, $a*e=e*a=a$;

* Inverses: for all $a\in G$, there exists an element $\inv{a}$ such that $a*\inv{a}=\inv{a}*a=e$.

The integers $\zo$ with addition are the prototypical group, with neutral element $0$ and the inverse of $n$ being $-n$. We may denote groups in the form $(G, *)$ to make clear they're pairs of sets and operations. 

Note, however, that we **didn't** require the following property satisfied by $(\zo, +)$:

* Commutativity: $a*b=b*a$ for all $a,b\in G$.

Groups satisfying this relation are called commutative, or also **abelian** (after [Abel](https://en.wikipedia.org/wiki/Niels_Henrik_Abel)). Again $(\zo, +)$ is the primordial example of this class. $(\mathbb{Q}, +),$ $(\mathbb{R}, +)$ and $(\mathbb{C}, +)$ are all groups as well. $(\mathbb{N}, +),$ on the other hand, isn't one because it doesn't contain negative numbers.

We'll write $|G|$ for the amount of elements of $G$, called its **order**.

Following $(\zo, +)$, the second most classical example of a group are the modular groups $ \mathbb{Z}/n\mathbb{Z}$, for $ n\in \mathbb{Z}$ (the notation will be clearer when we study quotients). These have as base set $\{0, 1, ..., n-1\}$, with mod sum as operation. As a reminder, if $a,b\in \zo$, this is the mod sum $(a+b) \mod n$ is the rest of $a+b$ divided by $n$. I.e., it is "clock addition": the result of a sum is equal to its excess relative to $n$. Programmers will also recognize it through the remainder operator `%`, although $\text{mod}$ and `%` aren't properly the same in most languages. Generally, $\zmod{n}$ has neutral element $0$ and the inverse of $k\in \zmod{n}$, $k\neq 0$, is exactly $n-k$.

For example, $\zmod{2}$ has base set $\{0,1\}$, with mod 2 addition that satisfies $1+1=0$. Seconds and minutes are counted inside $\zmod{60}$, while hours in $\zmod{24}$. When $n$ is understood from the context, we'll write $\text{mod}\,\,\,\, n$ addition just using a plain $+$ sign. 

Another fundamental example of a group are the $(C_n(X),+)$ and $(C^\Delta _n(X),+)$ we defined previously, which are all abelian per definition. If $V$ is a vector space, then $(V,+)$ is also a classic example of an abelian group.

We also have the **trivial group** $G=\{e\}$ which contains a single element $e$ with $e*e=e$. That is, $G$ has a neutral element and that's all. We'll often write this group just $0$, since it is composed of a single zero, neutral element.

Invertible (real, complex) matrices of the same size $n\times n,$ together with matrix multiplication, form a group. It will be non-abelian as long as $n>1.$ This group is written as $\text{GL}(n, \ro)$ (or $\text{GL}(n, \mathbb{C})$ in the complex case).

Finally, another familiar group is the set of strictly positive reals $\ro_{>0}$ with multiplication. Its neutral element is $1$ and the inverse of $x$ is $\frac{1}{x}.$

Here are some simple, quick properties of groups due to the good behaviour of operations:

**Proposition**: if $a*c=b*c$, then $a=b$ (you can cancel common factors). Similarly, if $c*a=c*b,$ then $a=b$.

**Proof**: by associativity, $(a*c)*\inv{c}=a*(c*\inv{c})=a*e=a.$ Similarly, $(b*c)*\inv{c}=b.$ Since $a*c=b*c,$ $(a*c)*\inv{c}=(b*c)*\inv{c}$ and so $a=b.$ The proof of the other half of the proposition is basically identical.

{{< qed >}}

**Proposition**: the neutral element $e$ of $G$ is unique (i.e., if there is another neutral element $e'\in G,$ $e=e'$).

**Proof**: if $e,e'$ are netural elemnts, then for all $a\in G$ we have $a*e=a=a*e'.$ By above, we cancel $a$ and get $e=e'.$

{{< qed >}}

**Propostion**: the inverse of $a$ is unique (i.e., if both $b,c$ are inverses of $a$, then $b=c$).

**Proof**: if $b,c$ are inverses of $a,$ then $a*b=e=a*c.$ Canceling $a,$ $b=c.$

{{< qed >}}

Thus, we're justified when we talk about **the** neutral element of $G$ and **the** inverse of $a\in G$. Notice also that the neutral element is always its own inverse (in the integers, $0=-0$).

We'll sometimes ommit the operation $*$ if it's clear from context, writing just $ab$ for $a*b.$ We'll also write $a^n$ for $a*...*a$ n times and $a^{-n}$ for the inverse of $a^n$, which is equal to $(\inv{a})^n.$

Another basic result is that $\inv{(ab)}=\inv{b}\inv{a}$ since $(ab)\inv{b}\inv{a}=a\inv{a}=e$ and $\inv{b}\inv{a}(ab)=\inv{b}b=e.$

As sets have subsets and spaces subspaces, groups also contain subgroups. Formally, $H$ is a subgroup of $G$ when $H\subset G$ and, for all $h_1,h_2\in H$, the product $h_1*h_2$ is also in $H$. I.e., when $H$ is a group of its own together with the operation $*$ of $G$ restricted to elements of $H$. We then write $H\leq G$.

Every group $G$ has at least two subgroups: $G$ itself and $\{e\},$ the trivial subgroup.

For example, even numbers form a subgroup of $(\zo, +)$ since whenever you add two of these you still end up with an even number. In general, if $n\in \zo$, the set $n\zo = \{n\cdot m \mid m\in\zo\}$ (i.e., the multiples of $n$) is a subgroup of the integers. Subspaces of vector spaces are also subgroups.

The subgroups of $\text{GL}(n, \ro)$ are very interesting and usually bring geometric information, as matrices represent linear transformations. For example, rotations form a subgroup (written $\text{SO}(n)$), since they are invertible and the composition of two rotations is still a rotation. We'll study $\text{SO}(n)$ later, as a deep connection between it, algebra and projective spaces will be described.

If $H\leq G$, then $H$ must contain the neutral element $e_G$ of $G$: if $e_H$ were to be a neutral element of $H$ and only $H$, then $he_H=h=e_G$ for any $h\in H$, thus $e_H=e_G$. Similarly, if $h\in H$, the inverse of $h$ in $H$ is identical to the inverse of $h$ in $G$.

When dealing with groups, we are not interested in all functions $f:G\rightarrow H$, but only in those that bring and respect algebraic information, stabilishing a relation between the operations of the different groups. Examples of these are linear transformations, as well as the boundary operators $\partial_n$ we defined previously. In group theory, these maps are called **homomorphisms**. A homomorphism between groups $(G,*_G)$ and $(H,*_H)$ is a function $f:G\rightarrow H$ such that $f(a *_G b)=f(a)*_H f(b)$ for all $a,b\in G$.

Note that if $f:G\rightarrow H$ is a homomorphism, $f(e_G)=e_H$ since $e_Hf(a)=f(a)=f(e_Ga)=f(e_G)f(a)$; canceling $f(a),$ $e_H=f(e_G).$ We also have that $f(\inv{a})=\inv{f(a)}$ since $f(a\inv{a})=f(e_G)=e_H=f(a)f(\inv{a}).$ That is, homomorphisms map neutral elements to neutral elements and inverses to inverses. This is, then, also the case for linear transformations and our boundary operators $\partial_n.$

Bijective homomorphisms are also called **isomorphims**. If we have an isomorphism $f:G\rightarrow H$, it means $G$ and $H$ have operations with the exact same behaviour. They may give different names to their elements, but to group theory $G,H$ can be seen as the same object. We'll then write $G\cong H$ for isomorphic groups. This $\cong$ is an equivalence relation: i.e., it satisfies $G\cong G$, $G\cong H\implies H\cong G$ and $G\cong H\cong K \implies G\cong K$.

Isomorphisms from $G$ to itself are called **automorphisms**, which form the set $\text{Aut}(G).$ Since their range and domains are the same, they can be composed-- and, as they are all bijections, thus invertible, $(\text{Aut}(G), \circ)$ is a group. The identity $\text{id}$ sending elements to themselves is the neutral element.

A familiar set of homomorphisms is, for some $x\in\ro$, $f_x:(\ro, +)\rightarrow (\ro_{>0}, \cdot)$ given by $f_x(a)=x^a$, since $f_x(a+b)=x^{a+b}=x^ax^b=f_x(a)f_x(b).$ Similarly, we have logarithms giving us a class of homomorphisms $g_x:(\ro_{>0}, \cdot)\rightarrow (\ro, +)$ defined as $g_x(a)=\log_x(a)$, since $g_x(ab)=\log_x(ab)=\log_x(a)+\log_x(b)=g_x(a)+g_x(b)$. Indeed, we have that $f_x$ is exactly the inverse of $g_x$ since, for all $a>0,$ $f_x(g_x(a))=f_x(\log_x(a))=x^{\log_x(a)}=a$. That is, exponentiation is a homomorphism between $(\ro, +)$ and $(\ro_{>0}, \cdot)$, and the logarithm is its inverse. Thus, we have an isomorphism $(\ro, +)\cong (\ro_{>0}, \cdot).$

In analogy to linear algebra, every homomorphism $f:G\rightarrow H$ has its kernel $\ker f = \{g\in G\mid f(g)=e_H\},$ $e_H$ the neural element of $H.$ This is a subgroup of $G$ since, for any $a,b\in \ker f$, $f(ab)=f(a)f(b)=e_He_H=e_H.$ Similarly, the image $\im f = \{h\in H\mid f(g)=h\text{ for some }g\in G\}$ is a subgroup of $H$, since $h_1h_2=f(g_1)f(g_2)=f(g_1g_2)$ for any $h_1,h_2\in \im f.$ 

In particular, since $\partial_n:C_n(X)\rightarrow C_{n-1}(X)$ is a homomorphism, the set of n-cycles $\ker \partial_n$ and n-boundaries $\im \partial_{n+1}$ are bouth subgroups of $C_n(X)$. We also saw previously that $\im \partial_{n+1}\leq \ker \partial_n.$

The kernel is a useful subgroup because it tell you a lot about $f.$ In particular, 

**Proposition**: $f$ is injective if and only if $\ker f$ is the trivial subgroup.

**Proof**: if $f$ is injective, by definition $\ker f$ must contain a single element-- which must be the neutral element. If $\ker f$ is trivial, then if $f(a)=f(b),$ $f(a)\inv{f(b)}=f(a\inv{b})=e,$ and $a\inv{b} \in \ker f,$ implying $a\inv{b}=e,$ thus $a=b$ and so $f$ is injective.

{{< qed >}}

In many cases, we'll ommit the operation $*$ in $a*b$ and just write $ab,$ the actual operation being deduced from context. For example, we'll write $f(ab)=f(a)f(b)$ for homomorphisms, even if $ab$ and $f(a)f(b)$ actually involve two different operations in two distinct groups.

## Describing groups

### Tables

The simplest way to visualize a group is by a table representing its operation. 

Here is, for example, the table for $\zmod{2}$:

$$\begin{array}{c|c c}
  & 0 & 1  \\
\hline
0 & 0 & 1 \\
1 & 1 & 0 \\
\end{array}
$$

And for $\zmod{4}$:

$$\begin{array}{c|c c c c}
  & 0 & 1 & 2 & 3  \\
\hline
0 & 0 & 1 & 2 & 3 \\
1 & 1 & 2 & 3 & 0 \\
2 & 2 & 3 & 0 & 1 \\
3 & 3 & 0 & 1 & 2 \\
\end{array}
$$

Tables can help us quickly identify some properties of groups: for example, a group is abelian if, and only if its table is symmetric along the (negative) diagonal. However, tables aren't that helpful for larger, let alone infinite, groups.

### Presentations (H)

A more powerful way to represent groups is through **presentations**, which provide compact descriptions we'll use a lot. A presentation of a group $G$ is written as $G=\langle a_0,..., a_n \mid   R\rangle $, where $R$ is a set of algebraic relations using our group operations (things like $a_3 * a_2 = a_6^{-1}$, $a_1^2=a_0*a_3$ etc.). We interpret this as saying that $G$ is formally generated by elements $a_0,...,a_n$, a neutral element, their inverses, and all their possible (finite) products, and that they satisfy the relations $R$ (the identity being assumed and thus omited). That is, elements of $G$ are arbitrary products of $a_0,...,a_n$, including their inverses, subject to the relations $R$.

For example, $\zo \cong \angled{a}$. I.e., $\zo$ can be seen as the group generated by a single element $a$ (representing $1$) without any relations, its distinct elements thus being $a,\inv{a},a^2,a^{-2},...,$ with the isomorphism $\zo\rightarrow \angled{a}$ sending $n$ to $a^n.$ For $\zmod{n}$, these have the presentation $\angled{a\mid a^n=e},$ $e$ being the neutral element. The isomorphism is again given by sending $n$ to $a^n$.

Presentations are not unique, with it being possible to a group to be described by many of these. In particular, presentations can sometimes be simplified by disconsidering redundant elements. For example, $\angled{a}$ could be presented as $\angled{a, a^2}$, but $a^2$ is redundant since its already included in $\angled{a}$. We'll often strive for the simplest presentation.

Another example is if instead of presenting $\zo = \angled{a}$ generated by $1$, we present it as generated by $2$ and $3$: $\zo = \angled{b, c \mid b^3=c^2}$ ($b$ is $2$ and $c$ represents $3$). These presentations are isomorphic via $f:\angled{b, c \mid b^3=c^2}\rightarrow \angled{a}$ sending $b\mapsto a^2$ and $c\mapsto a^3.$

The trivial group has as a possible presentation $\angled{a\mid a^2=a}.$ Again, there are many other possibilities, some not obvious: for example, $G=\angled{a,b\mid ab\inv{a}b^{-2}=e, a^{-2}\inv{b}ab=e}$ is trivial. To see this, note that $ab=b^2a$ (by the first relation) and $ab=ba^2$ (by the second relation), so that $b^2a=ba^2.$ Canceling $b$ on the left and $a$ on the right, we get $b=a.$ Thus, the first relation is $aa\inv{a}a^{-2}=\inv{a}=e,$ and thus $a=e,$ $b=e$ and the group is trivial! 

Generally, determining when two presentations generate the same group is a non-decidable problem: i.e., there's no algorithm that can determine it. This is because of the [word problem](https://en.wikipedia.org/wiki/Word_problem_(mathematics)), the problem of knowing if a certain product $a_i...a_j$ of generators (a "word") is equal to the identity-- which is also undecidable for many groups. However, deep results by [Gromov](https://en.wikipedia.org/wiki/Mikhael_Gromov_(mathematician)) show that, in a quite precise way, "most" finite groups have decidable word problem. 

Groups that can be described by finite presentations are called **finitely generated**. 

The groups with presentation $F_n=\angled{a_1,...,a_n}$ are called the **free groups** generated by $n$ elements. They contain no relations at all. This is actually somewhat circular: the proper, formal way to define presentations is actually by using the free groups and then quotients. But we're doing a more informal definition here.

Presentations are also useful for getting homomorphisms. Indeed, if $G=\langle a_0,..., a_n \mid   R\rangle$ and you want to define a homomorphism $f:G\rightarrow H,$ all you have to do is to define the $f(a_i)$ and be sure they also satisfy the relations $R,$ but now in $H.$ Then, for any other generated element $a_i...a_k,$ all you have to do is to define $f(a_i...a_k)=f(a_i)...f(a_k)$-- the condition that the $f(a_i)$ satisfy $R$ guaranteeing there will be no ambiguity. This is similar to how, in linear algebra, you can define a transformation by just setting its values on a basis.

### Cayley graphs

If you have a presentation for some group $G,$ you can visualize it by its Cayley graph. Each element of $G$ is a vertex; two vertices $g_1,g_2$ are connected by an edge if $g_1=ag_2$ for some generator $a$ in the specific presentation. I.e., we connect vertices whenever you can get one from another via a generator. We may also mark edges by the generator they represent.

For example, the Cayley graph of $\zmod{3}=\angled{a\mid a^3=e}$ is a triangle:

IMG!!!

The Cayley graph of $\zo$ with the presentation $\angled{a}$ is a line:

IMG!!!

Note that these graphs do depend heavily on the presentation. Using the presentation $\angled{b, c \mid b^3=c^2},$ for example, we get the following Cayley graph for $\zo$ (a sort of "infinite braid"):

IMG!!!

The Cayley graph of $F_2=\angled{a,b}$ is an infinite binary tree. In general, $F_n=\angled{a_1,...,a_n}$ has as its graph an infinite n-ary tree. This is because any cycle going through edges $a_i...a_j$ from elements $g_1$ to $g_2$ in the graph would imply a relation $g_1=a_i...a_jg_2$ (equivalently, $\inv{g_1}a_i...a_jg_2=e$), which, by definition, doesn't exist.

IMG!!!

The geometry of Cayley graphs can tell a lot about your group, their study being the cornerstone of **geometric group theory**. One of its great successes, for example, is that [some finite groups satisfying certain geometrical properties](https://en.wikipedia.org/wiki/Hyperbolic_group) have decidable word problem.

## Generating groups

Now that we have some basic group examples, let's see how to combine them and how to generate even more groups.

### Direct products (H)
Similarly to sets with their binary operations $\cup, \cap, \times,$ etc., groups can also be joined together. There are three common ways to take two groups in order to get another one: **direct products**, **semidirect products** and **quotients**. The first is a simple "groupification" of the cartesian product $\times.$

If we have two groups $(G, *_G)$ and $(H, *_H)$, then the set $G\times H$ has a very natural way to become a group, by taking the operation $*$ on it such that $(g_1, h_1) * (g_2, h_2)=(g_1*_G g_1, h_1 *_H h_1).$ I.e., we apply operations component-wise. This is known as the direct product of $G$ and $H$, written just as $G\times H$ (operations being implicit, as we'll often do). Similarly to sets, we'll write $G^n$ for the (direct) product of $G$ with itself $n$ times.

The neutral element of $G\times H$ is $(e_G, e_H)$ and the inverse of $(g,h)$ is $(\inv{g}, \inv{h}).$ Note that $|G\times H|=|G|\cdot |H|,$ since that's the size of the set $G\times H.$

Here's a very important classification theorem, whose proof we'll ommit:

**Theorem**: all finitely generated abelian groups are isomorphic to a group of the form

$$\zo^r\times\zmod{a_1}\times...\times\zmod{a_k}$$

Below is the table for the group $\zmod{2}\times \zmod{2}.$ You can check it is non-isomorphic to that of $\zmod{4}$ so that these are two non-isomorphic groups of four elements:

$$\begin{array}{c|c c c c}
  & (0,0) & (1, 0) & (0, 1) & (1, 1)  \\
\hline
(0,0) & (0,0) & (1,0) & (0,1) & (1,1) \\
(1,0) & (1,0) & (0,0) & (1,1) & (0,1) \\
(0,1) & (0,1) & (1,1) & (0,0) & (1,0) \\
(1,1) & (1,1) & (0,1) & (1,0) & (0,0) \\
\end{array}
$$

If you have two presentations $G=\angled{S_G\mid R_G}$ and $H=\angled{S_H\mid R_H},$ you can also get a presentation fro $G\times H$: it is given by $\angled{S_G\cup S_H\mid R_G\cup R_H \cup R_C},$ where $R_C$ is the set of relations $s_gs_h=s_hs_g$ for all $s_g\in S_G$ and $s_h\in S_H.$ Each $s_g\in G$ should be associated to the pair $(s_g, e_H)\in G\times H,$ and similar for $s_h$. For example, $\zmod{n}\times\zmod{m}$ has the presentation $\angled{a,b\mid a^n=b^m=e, ab=ba}$ (note that we simplified the commuting relations $R_C$).

### Semidirect products

The operation we defined on $G\times H$ doesn't have any sort of "interference" between the operations of $G$ and $H.$ I.e., the first component only cares about $G$, being completely independent of whatever happens on the second one corresponding to $H.$ 

We can add some interplay between the two groups as follows. Choose and fix some homomorphism $\phi : H\rightarrow \text{Aut}(G).$ This means that, for each $h\in H$, $\phi (h)$ is some sort of permutation, an action over $G.$ Instead of multiplying elements $g_1,g_2\in G$ to get $g_1g_2$ in the first component, we could add some interdependence on $H$ by multiplying $g_1$ with $\phi(h_1)(g_2)$-- so to speak, a multiplication "twisted" by $\phi(h).$ I.e., we get the operation

$$(g_1, h_1)*(g_2,h_2)=(g_1\phi(h_1)(g_2),h_1h_2).$$

The set $G\times H$ together with this new operation (dependant on $\phi$) is called the semidirect product of $G$ and $H,$ denoted $G\rtimes_\phi H.$ These products are very powerful and can genrate a wide class of groups- as we'll see later with the Rubik's cube group.

If $\phi(h) = \text{id}$ for all $h\in H,$ then $G\rtimes_\phi H$ is the same thing as $G\times H$-- i.e., direct products are the "trivial example" of the semi-direct ones.

Similarly to the direct product, $|G\rtimes_\phi H|=|G|\cdot |H|.$

Let's, for example, construct a product $\zmod{3}\rtimes_\phi \zmod{2}.$ The automorphism group $\text{Aut}(\zmod{3})$ is composed of the identity $\text{id}$ and the isomorphism $f:\zmod{3}\rightarrow \zmod{3}$ sending the generator $1$ to $2.$ Thus, we let $\phi:\zmod{2}\rightarrow \text{Aut}(\zmod{3})$ send $0$ to $\text{id}$ and $1$ to $f$; $\zmod{3}\rtimes_\phi \zmod{2}$ then has the following table:

$$\begin{array}{c|c c c c c c}
  & (0,0) & (1, 0) & (2, 0) & (0, 1) & (1, 1) & (2, 1) \\
\hline
(0, 0) & (0, 0) & (1, 0) & (2, 0) & (0, 1) & (1, 1) & (2, 1) \\ 
(1, 0) & (1, 0) & (2, 0) & (0, 0) & (1, 1) & (2, 1) & (0, 1) \\ 
(2, 0) & (2, 0) & (0, 0) & (1, 0) & (2, 1) & (0, 1) & (1, 1) \\ 
(0, 1) & (0, 1) & (2, 1) & (1, 1) & (0, 0) & (2, 0) & (1, 0) \\ 
(1, 1) & (1, 1) & (0, 1) & (2, 1) & (1, 0) & (0, 0) & (2, 0) \\ 
(2, 1) & (2, 1) & (1, 1) & (0, 1) & (2, 0) & (1, 0) & (0, 0) \\ 
\end{array}
$$

In particular, it isn't abelian and, letting $a=(0,1)$ and $b=(1,1)$ we get the presentation $\zmod{3}\rtimes_\phi \zmod{2}=\angled{a,b\mid a^2=b^2=(ab)^3=e}.$ This group will become important later as an example.

### Group extensions and exact sequences


## Example: rings and modules (H)

If groups generalize integers with addition, it is very natural to try to generalize integers with the operations of addition and multiplication. In this case, we get structures called **rings**. Formally, a ring $(R,+,\cdot)$ is a set $R$ with two operations $+$ and $\cdot$ satisfying:

* (R, +) is an **abelian group**;

* Distributivity: $(a + b) \cdot c = ac + bc$ and $a(b+c)=ab+ac$ for all $a,b,c\in R$;

* Associativity of the product: $a(bc)=(ab)c$ for all $a,b,c\in R$;

* Identity: there is an element $1\in R$ such that $1a=a1=a$ for all $a\in R$.

The prototypical example is, again, $(\zo, +, \cdot)$, others being $(\mathbb{Q}, +, \cdot),$ $(\ro, +, \cdot)$ and $(\mathbb{C}, +, \cdot).$ Note that we didn't require for the product to be commutative.

A homomorphism $f:R\rightarrow S$ between rings is a map such that $f(a+b)=f(a)+f(b)$ and $f(ab)=f(a)f(b),$ in analogy with the group case.

Coming back to spaces and their holes, we saw that the $(C_n(X), +)$ and $(C_n^\Delta(X), +)$ we defined are both abelian groups. However, we also saw they bring more structure than that: they also have scalar multiplication by an integer. This is neatly described by the concept of **modules**. Concretely, if $(R, +, \cdot)$ is a ring, then an $R$-module is an abelian group $(M, +)$ such that, for all $a\in R$ and $m\in M$, there exists an element $a\cdot m\in M$ for some notion of a scalar product $\cdot.$ These must satisfy the following relations:

* Distributivity: $a\cdot(m+n)=a\cdot m+a\cdot n$;

* Scalar distributivity: $(a+b)\cdot m=a\cdot m + b\cdot m$;

* Scalar associativity: $a\cdot(b\cdot m)=(ab)\cdot m$;

* Product by the identity: $1\cdot a=a$.

We then see that our chain groups are all $\zo$-modules, with a proper definition of integer scalar multiplication. It is also, per definition, clear that all real vector spaces are $\ro$-modules.

As vector spaces have bases, so do modules. For $C_n(X)$, the set of simplices $a_1,...,a_k$ in our complex gives us a basis. More than that, for each $n\in \zo$, $na_i$ is a distinct chain, so that we say that $C_n(X)$ is "**freely generated**" by the elements $a_1,...,a_k.$ In general, we say an $R$-module $M$ is freely generated by elements $e_1,...e_k$ if any element $m\in M$ can be **uniquely** written as a linear combination $r_1\cdot e_1+...+r_k \cdot e_k,$ and we write

$$M=\zo e_1\times ...\times \zo e_k,$$

each $\zo e_i$ being the set (and group) spanned (with scalar multiplication) by $e_i$. This applies to both $C_n(X)$ and to $C^\Delta_n(X)$ with a delta structure over $X.$ The $e_i$ then form a basis of the module, all in analogy to linear algebra.

A homomorphism $f:M\rightarrow N$ between $R$-modules is a map such that $f(a+b)=f(a)+f(b)$ and $f(r\cdot a)=r\cdot f(b).$ In particular, linear transformations are $\ro$-module homomorphisms.

Whenever you have a freely generated $R$-module $M$, you can define an $R$-module homomorphism $f:M\rightarrow N$ by just setting its values on the generators $a_1,...,a_k$ and setting $f(r_1a_1+...+r_ka_k)=r_1f(a_1)+...+r_kf(a_k).$

## Example: fields, finite projective spaces and "Spot It!" * 
FIELDS e VECTOR SPACES

Finite fields

Project
$$P( \mathbb{Z}^3_2)$$

Spot it e project

## Example: non-abelian groups and permutation games

So far, the only non-abelian groups we've seen so far are matrix groups, $F_n$ and $\zmod{3}\rtimes_\phi \zmod{2}.$ Most other non-abelian groups arise when you consider **permutations** and **symmetries** of objects.

### Dihedral groups

For example, take a square with labeled vertices. It has two kinds of symmetries: rotations and reflections around an axis going from the origin to a vertex. You can compose these to form all symmetries, which then form a group, since the identity is a symmetry, these transformations are inversible and compose to give further symmetries. We call this group $D_4.$ 

IMG!!!

Let $r_i$ be the counter-clockwise 90-degree rotation applied $i$ times to the square, and $s_i$ the reflection around the axis groing from the origin to the $i$-th vertex. Elements of $D_4$ are exactly all the compositions $r_is_j$ and $s_jr_i.$ Each of these is a function from the vertex label set $\{1, 2, 3, 4\}$ to itself: for example, $r_i$ send $i$ to $i+1\mod 4,$ and $s_1$ swaps $2$ and $4,$ leaving the other vertices unaltered. What algebraic relations do these elements satisfy? First, note that all the $r_i$ can be described as $r_1^i,$ and $r^4=r^0=e.$ Then, see that doing reflection around an axis and then a rotation is equivalent to a reflection around the rotated axis. This gives the relations $r_is_j=s_{i+j}.$ Thus, all reflections can be generated as $r_is_1.$ Concluding, every element of $D_4$ can be generated by composing $r_1$ and $s_1$ together in some form. Between them, we have the relation $r_1s_1=\inv{s_1}\inv{r_1},$ or, equivalently since $\inv{s_1}=s_1,$ $r_1s_1=s_1\inv{r_1}$  we derive the presentation

$$D_4=\angled{r, s \mid r^4=s^2=e, rs=s\inv{r}}$$

In particular, we can see $D_4$ has only $8$ distinct elements, represented as $r^is^j$.

All these simmetries are also linear transformations. Indeed, $r_1=\begin{pmatrix}
0 & -1 \\
1 & 0
\end{pmatrix}
$ and $s_1=\begin{pmatrix}
-1 & 0 \\
0 & -1
\end{pmatrix}
,$ so that we get an isomorphism of $D_4$ with a matrix subgroup

$$D_4\cong \angled{\begin{pmatrix}
0 & -1 \\
1 & 0
\end{pmatrix}, 
\begin{pmatrix}
-1 & 0 \\
0 & -1
\end{pmatrix}}\leq \text{GL}(2, \ro)$$

In general, if we have a regular $n$-polygon (equilateral triangle, square, ...), we get its symmetry group $D_n,$ called the **n-th dihedral group**. These are also generated by all rotations $r_i$ and reflections $s_i,$ with $0\leq i\leq 4.$ All $r_i$ can be derived from $r_1$ and all $s_i$ from the product $r_js_1,$ and the presentation generalizes:

$$D_n=\angled{r, s \mid r^n=s^2=e, rs=s\inv{r}}$$

In particular, this shows that $D_n$ has order $2n.$

Similarly, all the symmetries are linear representations, with $r_1=\begin{pmatrix}
\cos(\frac{2\pi}{n}) & -\sin(\frac{2\pi}{n}) \\
\sin(\frac{2\pi}{n}) & \cos(\frac{2\pi}{n})
\end{pmatrix}$ 
and $s_1=\begin{pmatrix}
\cos(\frac{2\pi}{n}) & \sin(\frac{2\pi}{n}) \\
\sin(\frac{2\pi}{n}) & -\cos(\frac{2\pi}{n})
\end{pmatrix},$ and we thus have an isomorphism with $D_n$ and the subgroup of $\text{GL}(2,\ro)$ generated by these transformations.

In group theory, representing groups through matrices is actually an extremely important and powerful technique. In general, if we have a homomorphism $\phi : G\rightarrow \text{GL}(n,\ro)$, we call this $\phi$ a **(real) representation** of $G.$ Representation theory is unavoidable in more advanced group theory.

Finally, note something in the presentation of $D_n$: it contains two subgroups $\angled{r}$ (with $n$ elements) and $\angled{s}$ (with just two elements), and they together generate all of $D_n.$ Between $r$ and $s,$ we have an "interference" relation $rs=s\inv{r},$ as if $s$ was inverting $r.$ This fits perfectly into the description of a semidirect product: namely, if you define the homomorphism $\phi:\zmod{2}\rightarrow \text{Aut}(\zmod{n})$ by sending $1$ to $x \mapsto \inv{x},$ then we have an isomorphism

$$D_n\cong \zmod{n}\rtimes_\phi \zmod{2}$$

by sending $r^is^j$ to $(i,j).$

In particular, we've seen the example of $D_3\cong \zmod{3}\rtimes_\phi \zmod{2}$ before, the group of symmetries of an equilateral triangle. Each pair $(m, n)$ represented doing $m$ rotations $r_1$ and then $n$ reflections $s_1.$

### Symmetric groups

The example above showed us that if you take some set $A$ and permutate its elements you can get a group. More formally, a **permutation** on $A$ is a bijective function $A\rightarrow A.$ These form a set $S_A,$ which, together with function composition, forms a group, called the **symmetric group** on $A.$ When $A=\{1,...,n\},$ we write $S_n$ for $S_A,$ getting the **symmetric group on n elements**. We write the product $\sigma \tau= \sigma \circ \tau$ in the same order as composition.

We'll only study $S_n$ here. Note that it is a group of order $n!=n\cdot(n-1)\cdot...\cdot 1,$ since that's the number of possible sequences of distinct numbers from $1$ to $n$ of size $n.$ 

We can write a permutation $\sigma$ in many different ways. The most explicit one is just listing the elements $1,...,n$ and, one row below, $\sigma(1),...,\sigma(n).$ For example, the rotation $r_1$ of labeled edges in the square can be written as $\begin{pmatrix}
1 & 2 & 3 & 4 \\
2 & 3 & 4 & 1
\end{pmatrix}.$ Note that it forms a single "cycle". Formally, we defined a **cycle** of a permutation $\sigma$ as a sequence of numbers $c_1,...,c_k$ such that $\sigma(c_i)=c_{i+1}$ until $k$ and $\sigma(c_k)=c_1.$ A permutation $\sigma$ is cyclic if it has a single cycle $c_1,...,c_k,$ with all other numbers being fixed: in that case, we use the notation $\sigma=(c_1...c_k)$ (note that all numbers outside the decomposition are fixed by $\sigma$).

Every $\sigma\in S_n$ can be written as the product of cyclic permutations: get the first number $x$ such that $\sigma(x)\neq x,$ and let $c_{1i}=\sigma^{i-1}(x).$ These $c_{1i}$ will form a cycle (if $i-1>n!,$ then we must find a repetition in them, since $S_n$ just has $n!$ elements). If they cover all the numbers $1,...,n,$ then $\sigma = (c_{11}...c_{1n}).$ If not, then look for the next number not contained in this cycle and that isn't fixed by $\sigma,$ and then let $c_{21},...,c_{2l}$ be the cycle containing it. Repeat this proccess, and in the end you'll find the decomposition of $\sigma$ in respect to its cycles:

$$\sigma = (c_{11}...c_{1k})(c_{21}...c_{2l})...(c_{m1}...c_{mr})$$

For example, the permutation $\sigma=\begin{pmatrix}
1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 \\
7 & 3 & 2 & 8 & 5 & 1  & 6 & 4
\end{pmatrix}$ in $S_8$ has cycle decomposition $\sigma=(1\, 7\, 6) (2\, 3) (4\, 8).$

We can actually go further. Indeed, every permutation is a composition of single swaps between two numbers. Formally, we call these **transpositions**: a transposition $\tau\in S_n$ is a cycle of the form $\tau=(a_1\; a_2).$ If $(c_1...c_k)$ is a cycle, then we can write it as the product of transpositions: begin swapping $(c_1\; c_2)$; now, $c_1$ is being correctly sent to $c_2,$ and $c_2$ to $c_1.$ Then send $c_1$ to $c_3$ with $(c_1\; c_3)$, so that, overall, $c_1$ is going to $c_2$ and $c_2$ to $c_3.$ Continue in this procedure, and you'll get

$$(c_1\;...\;c_k)=(c_1\;c_k)...(c_1\;c_3)(c_1\;c_2)$$

Thus, we have that every permutation is a composition of transpositions. In particular, the $\sigma\in S_8$ above can be written as $(1\, 6)(1\, 7)(2\, 3)(4\, 8).$ This decomposition, however, is not unique. Luckily, though, the **parity** of the amount of transpositions in a decomposition of a permutation is constant. There are [many different proofs](https://math.stackexchange.com/questions/46403/alternative-proof-that-the-parity-of-permutation-is-well-defined), most quite understandable, but too wordy for this post. Thus, we can classify permutations as either being odd (being a product of an odd amount of transpositions) or even. The $\sigma$ above, for example, is even.

Indeed, the transpositions $\tau_i=(i\;i+i)$ generate all other transpositions: if $j>i$, then we can move $i$ to $j$ one step at a time, and then bringing $j$ back to $i$, so that $(i\;j)=(i\;i+1)(i+1\;i+2)...(j-1\;j)(j-2\;j-1)...(i\;i+1).$ Thus, all of $S_n$ is generated by these transpositions. Taking into consideration the relations the $\tau_i$ satisfy, we get the presentation

$$S_n=\angled{\tau_1,...,\tau_{n-1}\mid \tau_i^2=e,\;\;\; \tau_i\tau_j=\tau_j\tau_i \text{ for all }|i-j|>1,\;\;\; (\tau_i\tau_{i+1})^3=e}$$

In particular, note that in the $S_3$ case, we get the same presentation as for the $\zmod{3}\rtimes_\phi \zmod{2}$ before, so that $S_3\cong \zmod{3}\rtimes_\phi \zmod{2}\cong D_3.$

Since parity is a defining property of permutations, we can define the subgroup $A_n\leq S_n$ of even permutations (a group since its closed under composition), called **the alternating group** of order $n.$ Since these are exactly half of all permutations, $|A_n|=\frac{n!}{2}.$

Symmetric groups are very important, since **each group** $G$ **can be seen as a subgroup of** $S_{G}.$ This is easy to see: each element $g\in G$ can be interpreted as the permutation taking elements $a$ to $ga.$ Since we have inverses, this does gives a bijective map. Formally, this gives us an injective homomorphism $f:G\rightarrow S_G,$ with $G\cong \im f\leq S_{G}$-- you can check it is indeed a homomorphism by applying associativity. This result is known as **Cayley's theorem**. For finite groups, you can label the elements of $G$ by numbers from $1$ to $n$, and then $G$ can be seen as isomorphic to a subgroup of $S_{|G|}.$

For example, every element $m\in \zmod{n}$ can be interpreted as the permutation $k\rightarrow m+k\mod n$ in $S_n.$ In particular, $1\in\zmod{n}$ is the cycle $(1\; ...\; n),$ with $m$ generally being the cycle $(1\;...\;n)^m=(m\;m+1\;...\;n\; 1\;...\; m-1)$ (i.e., "pushing" through the cycle $(1\;...\;n)$ $m$ times).

CONJUGATES

### Permutation games

Rubik

Jogos de permutac

## Example: topological groups, quaternions and the Hopf fibration *
O(n), SO(n)

SO(2) e S1

C e SO(2)

H e SO(3)

Fibrac de Hopf

RP3 = SO(3)

## Group quotients (H)

We're finally ready to study quotients. Remember that we found out that two n-cycles $c_1,c_2$ should be seen as representing the same hole in $X$ if they "differ by a boundary": $c_1-c_2=\partial_{n+1} a$ for some $a\in C_{n+1}(X)$. Translating to group theory, the situation is that we have a group $Z_n(X)$ of cycles and a subgroup $B_n(X)$ of boundaries. We want to take two elements $c_1, c_2\in Z_n(X)$ to be **equivalent** whenever there's some $b\in B_n(X)$ with $\partial b = c_1-c_2$-- or, equivalently, if $c_1-c_2\in B_n(X).$ We'll then write $c_1\sim c_2.$

In particular, since $\partial_{n+1} a = \partial_{n+1} a - 0 \in B_n(X)$, $\partial_{n+1}a\sim 0$ and every element of $B_n(X)$ (i.e., bounded chains) should be seen as not representing a hole-- or, rather, as a "null hole".

This is actually surprisingly similar to how we get modular numbers. If $\angled{n}\leq \zo$ is the subgroup of multiples of an integer $n$, then, for integers $a,b$, $a\mod n=b\mod n$ exactly when $a-b$ is a multiple of $n$-- i.e., it is contained in $\angled{n}.$ We also have that, if $a$ is a multiple of $n,$ $a \mod n = 0$-- i.e., elements of $\angled{n}$ are "killed" by the mod operator. This prompts us to a generalization!

Generally, if we have a group $G$ and a subgroup $H$, we can define the relation $\sim$ in $G$ having $a\sim b$ whenever there's some $h\in H$ and $h=a\inv{b}$-- i.e., whenever $a\inv{b}\in H$. This is an [equivalence relation](https://en.wikipedia.org/wiki/Equivalence_relation): i.e., we always have a relation similar to equality $=$, satisfying

* Reflexivity: $g\sim g$ ($e=g\inv{g}$ and $e\in H$); 

* Symmetry: $a\sim b$ implies $b\sim a$ (if $h = a\inv{b}$, then $ \inv{h}= b\inv{a}$); 

* Transitivity: $a\sim b$ and $b\sim c$ imply $a \sim c$ ($h_1 = a\inv{b}$ and $h_2=b\inv{c}$ multiply to give $h_1h_2=a\inv{c}$, $h_1h_2\in H$ since $H$ is a subgroup).

With this relation, we can form **equivalence classes**, which are the maximal sets containing equivalent elements. We'll denote the class of an element $g\in G$ as $[g].$ Note that $H$ is itself a class, all $h_1,h_2\in H$ being equivalent since $h_1\inv{h_2}\in H$ as $H$ is a subgroup. 

We can thus say that holes are equivalence classes of cycles.

Let's denote the set of equivalence classes of this relation by $G/H.$ This can become a group, called the **quotient group** $G/H$, if we define the operation $[a][b]=[ab].$ The neutral element is given by the class $H$ since $h\inv{e}=h\in H$, so that $[h]=[e]$ and thus $[a][h]=[a][e]=[ae]=[a]$ for all $a\in G.$  The inverse of $[a]$ is $[\inv{a}]$ since $[a][\inv{a}]=[a\inv{a}]=[e]=H,$ as $e\in H.$ That is, the whole subgroup $H$ is condensed into a single element, which is the neutral element. It is as if we were **canceling, annihilating** $H$, sending all its elements to $0$. In the case of chains, this means we're "killing" all bounded cycles, which indeed shouldn't represent holes.

In the mod example, we take as subgroup $\angled{n}$ and define $a\cong b$ whenever $a-b\in \angled{n}.$ Equivalence classes are also called mod classes. The quotient $\zo / \angled{n}$ is then the set of these classes with the operation $[a]+[b]=[a+b]$. This is isomoprhic to $\zmod{n}$ (thus our notation), with each class $[a]$ being sent to $a\mod n.$ Indeed, modular groups are prototypical quotients.

There is, however, a small problem here! The quotient operation may not be well-defined: i.e., if $[x]=[x']$ and $[y]=[y']$, it may not be necessarily the case that $[x][y]=[xy]$ and $[x'][y']=[x'y']$. That is, the operation may depend on the specific representant we choose for our equivalence classes. If this is the case, then doing algebra in $G/H$ is basically impossible-- imagine how chaotic that would be!

Whar are, the, some possible conditions that may force $[xy]=[x'y']$ for $x\sim x'$ and $y\sim y'$? Well, we want $xy\sim x'y',$ which, by definition, is equivalent to $xy\inv{(x'y')}=x(y\inv{y'})\inv{x'}\in H.$ Since $x\sim x'$ and $y\sim y',$ there are $h_1,h_2\in H$ such that $x'=h_1x$ and $y'=yh_2.$ In particular, $\inv{x'}=\inv{x}h_1$ and $.$ Thus, we want to have

$$
\begin{align}
xy\inv{(x'y')}&=x(y\inv{y'})\inv{x'}=x (y\inv{y}\inv{h_2}) \inv{x}\inv{h_1}
          \\&= (x\inv{h_2}\inv{x})\inv{h_1}\in H
\end{align}
$$

This last formula shows us that if we require $xh\inv{x}\in H$ for all $x\in G, h\in H,$ then the quotient operation will be well-defined! Subgroups satisfying this property are called **normal**, and thus we have that, if $H\leq G$ is normal, $G/H$ is a well-defined group. The condition is actually neccesary as well: multiplying the formula above by $h_1$ in the right, we still get an element of $H$ equal to $(x\inv{h_2}\inv{x}).$ Since $x$ and $h_2$ are arbitrary, this forces $H$ to be normal. This proves

**Theorem**: The quotient $G/H$ is a well-defined group if and only if $H\leq G$ is normal.

Luckilly, every subgroup of an abelian group is normal, since $xh\inv{x}=x\inv{x}h=h\in H$! In particular, this shows that the construction of $\zmod{n}$ as a quotient is correct, and that we don't have to worry about normality in our $C_n(X).$

Another more trivial examples of normal subgroups, for all $G$, are $\{e\}\leq G$ and $G$ itself. In the first case $G/\{ e\}$-- which we'll also write $G/0$ since $\{e\}$ is isomorphic to the trivial group-- is isomorphic to $G$, since in this case $a\sim b$ if and only if $a\inv{b}=e$ and $b=a,$ so that the equivalence classes are all the sets $\{g\}$ for $g\in G$, and the quotient operation is identical with the one of $G.$ I.e., $G/0\cong G.$ On the other hand, $G/G$ has a single element, since we have $a\sim b$ for all $a,b \in G$ ($a\inv{b}\in G$ always), so that $G/G \cong 0.$

One important thing about quotients is how they interact with presentations. Namely, if $G=\angled{S_G\mid R_G}$ and $H\leq G$ is normal, then $G/H = \angled{S_G\mid R_G \cup H_0},$ with $H_0$ being the set of relations $h=0$ for $h=0.$ In particular, if $H=\angled{S_H},$ we can further simplify to get $G/H = \angled{S_G\mid R_G \cup S_H}.$ For example, since $\zo=\angled{a}$, then $\zo/\angled{n}=\angled{a \mid a^n=0, a^{2n}=0,...},$ which simplifies to $\angled{a\mid a^n=0}$ (all the $a^{2n}=0,a^{3n}=0,...$ are reduntant since we already have $a^n=0$), as we had before. This makes clear how doing quotients is somehow a process of annihilating normal subgroups.

That's pretty much what you need to know about quotients to understand homology. The rest of this section is optional.

### The isomorphism theorem and the classification of finite groups (optional)

A guaranted type of normal subgroups are the kernels $\ker f$ of homomorphisms: if $x\in G$ and $h\in \ker f,$ then $f(xh\inv{x})=f(x)f(h)f(\inv{x})=f(x)f(\inv{x})=f(x\inv{x})=f(e_G)=e_H,$ so that $xh\inv{x}\in \ker f.$ Now, if $H\leq G$ is normal, then the map $f: G\rightarrow G/H$ is a homomorphism (basically by definition), and its kernel is exactly $H,$ as we discussed above. Thus, every kernel is normal, and every normal subgroup is a kernel: **homomorphism kernels and normal subgroups are the same**! 

Important in the quotient construction is the "projection homomorphism" $\pi : G\rightarrow G/H$ sending $a$ to its class $[a].$ Its kernel is exactly $H$.

All of this allows us to prove the following, highly useful theorem:

**Theorem (Isomorphism Theorem)**: for every homomorphism $f:G\rightarrow H$, $\phi:G/\ker f\rightarrow \im f$ defined as $\phi([a])=f(a)$ is an isomorphism 

$$G/\ker f \cong \im f$$

**Proof**:

$\phi$ is well-defined: if $[a]=[b],$ then $a=kb,$ with $k\in \ker f.$ Thus, if $\phi([a])=f(a)=f(kb)=f(k)f(b)=f(b)=\phi([b]).$ It is a homomorphism because $f$ is one and by the definition of the quotient product (well-defined since $\ker f$ is normal): $\phi([a][b])=\phi([ab])=f(ab)=f(a)f(b)=\phi([a])\phi([b]).$

$\phi$ is, by definition, surjective. It is injective since $\ker \phi$ is trivial: $\phi([a])=e$ implies $f(a)=e,$ $a\in \ker f,$ and so $[a]$ is the trivial class $\ker f$ in the quotient.

Note in particular that $\phi \circ \pi=f.$ The whole situation is described on the diagram below (you can't escape from diagrams in algebra!):

{{< figure src="firstiso.png" alt="First Isomorphism Theorem diagram" width="25%" height="auto" >}}

{{< qed >}}

The isomorphism theorem tells us that normal groups can actually be used

Normal groups are very important, since in some precise way they are responsible for "constructing" our groups. These means groups without normal subgrouos-- which are called **simple**-- are specially important, as they can be interpreted as the "building blocks" of groups. They're to groups what primes are to integers. !!!

IMG!!! Tabela periodica

# Going further
oi