+++
date = '2025-01-14T12:33:23-03:00'
draft = true
math = true
comment = true
title = "The topology of decision games"
tags = ["Topology for Artists"]
toc = true
+++

# TL;DR

Bla


{{< toc >}}

# Simplices, probabilities and decision games
PROB

The fact that the standard simplex $\Delta^n$ can be simply described as $\{(\lambda_1,...,\lambda_n)\mid  \sum_{i=1}^n \lambda_i=1, \,\lambda_i\geq 0\}$ make it so that points $p\in \Delta^n$ can be intepreted as **probabilities** associated to $n$ possible events-- with each $\lambda_i$ of $p$ being the probability of the $i$-th event to occur. This opens up a bridge between topology and probability, that has been particularly useful in one area of mathematics: **game theory**.

Game theory is concerned with what one might call "decision games". These are problems when $n$ distinct players $P_1,...,P_n$ are confronted with different options. Each player $P_i$ takes moves from a set $A_i.$ Players simultaneously decide a move $a_i\in A_i$, ending in a final state $(a_1, ..., a_n)$ associated to some reward $r_i$ for each player. The goal of $P_i$ is to maximize $r_i$ taking into consideration other players' moves.

EXS
PRISIONERS
ROUSSEAU (EX DO LIVRO + EX DO MAL AMIGO DAS CONFISSOES)
    ex mistos?
BACH X SCHOENBERG (COM MÚSICAS EMBEDDADAS)

$$\begin{array}{c|c c }
  & \text{Prisioner A} & \text{Prisioner B}  \\
\hline
\text{Prisioner A} & 1,1 & -1,2  \\
\text{Prisioner B} & 2,-1 & 0,0 \\
\end{array}
$$

$$\begin{array}{c|c c }
  & \text{Bach} & \text{Schoenberg}  \\
\hline
\text{Bach} & 2,1 & 0,0  \\
\text{Schoenberg} & 0,0 & 1,2 \\
\end{array}
$$

{{< youtube RDADGE44i_o >}}


*In this manner, men may have insensibly acquired some gross ideas of mutual undertakings, and of the advantages of fulfilling them: that is, just so far as their present and apparent interest was concerned: for they were perfect strangers to foresight, and were so far from troubling themselves about the distant future, that they hardly thought of the morrow. If a deer was to be taken, every one saw that, in order to succeed, he must abide faithfully by his post: but if a hare happened to come within the reach of any one of them, it is not to be doubted that he pursued it without scruple, and, having seized his prey, cared very little, if by so doing he caused his companions to miss theirs.*

$$\begin{array}{c|c c }
  & \text{Stag} & \text{Rabbit}  \\
\hline
\text{Stag} & 5, 5 & 0, 3  \\
\text{Rabbit} & 3,0 & 3, 3 \\
\end{array}
$$

Philosophical justice, however, forces me to also present another game we might relate to Rousseau. From his *Confessions*:

*I am less tempted by money than by other objects, because between the moment of possessing the money and that of using it to obtain the desired object there is always an interval, however short; whereas to possess the thing is to enjoy it. I see a thing and it tempts me; but if I see not the thing itself but only the means of acquiring it, I am not tempted. Therefore it is that I have been a pilferer, and am so even now, in the way of mere trifles to which I take a fancy, and which I find it easier to take than to ask for; but I never in my life recollect having taken a farthing from any one, except about fifteen years ago, when I stole seven francs and ten sous. The story is worth recounting, as it exhibits a concurrence of ignorance and stupidity I should scarcely credit, did it relate to any but myself.*

*It was in Paris: I was walking with M. de Franceul at the Palais Royal; he pulled out his watch, he looked at it, and said to me, “Suppose we go to the opera?”—“With all my heart.” We go: he takes two box tickets, gives me one, and enters himself with the other; I follow, find the door crowded; and, looking in, see every one standing; judging, therefore, that M. de Franceul might suppose me concealed by the company, I go out, ask for my ticket, and, getting the money returned, leave the house, without considering, that by then I had reached the door every one would be seated, and M. de Franceul might readily perceive I was not there.*

*As nothing could be more opposite to my natural inclination than this abominable meanness, I note it, to show there are moments of delirium when men ought not to be judged by their actions: this was not stealing the money, it was only stealing the use of it, and was the more infamous for wanting the excuse of a temptation.*

(absurd convertions by me give it equal to about 80 us dolars)


$$\begin{array}{c|c c }
  & \text{Franceul} & \text{Rousseau}  \\
\hline
\text{Franceul} & -7.5, -7.5 & -15, 7.5  \\
\text{Rousseau} & 7.5,-15 & 0, 0 \\
\end{array}
$$

    EX MISTOS
ELEIC?

ESTRATEGS DOMINADAS

# Nash equilibria
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

# 2x2 games and their topology

