+++
date = '2025-01-14T12:33:23-03:00'
draft = true
math = true
title = "Code"
+++

{{< highlight haskell "linenos=table,hl_lines=0,linenostart=1" >}}
-- If A, then A or B
proof1 :: A -> (A + B)
proof1 a = a

-- If A, B, then A and B
proof2 :: A -> B -> (A, B)
proof2 a b = (a, b)

-- If A and (A then B), B
proof3 :: A -> (A -> B) -> B
proof3 a f = f a
{{< / highlight >}}

{{< highlight python "linenos=table,hl_lines=0,linenostart=1" >}}
class NeuralNetwork(nn.Module):
    def __init__(self, *args):
        ...
    
    def forward(self, *args):
        ...
{{< / highlight >}}

{{< highlight csharp "linenos=table,hl_lines=0,linenostart=1" >}}
struct Mesh{
    Vector3[] points;
    Vector3[] triangles;
}
{{< / highlight >}}