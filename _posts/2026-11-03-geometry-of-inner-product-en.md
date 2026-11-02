---
layout: post
title: The Geometry of the Inner Product — From Line Equations to Dual Spaces
date: 2026-11-03 00:00:00+0900
description: A geometric journey from the equation of a line to inner products and dual spaces, using areas, volumes, and different ways of dividing the same shape.
tags: [mathematics, geometry, linear-algebra]
categories: [study-notes]
lang: en
math: true
related_posts: false
---

<link rel="stylesheet" href="{{ '/assets/css/geometry-blog.css' | relative_url }}">

<div class="geometry-article" markdown="1" lang="en">

[한국어로 읽기]({% post_url 2026-11-03-geometry-of-inner-product-ko %}) · English

Think back to when you first learned the equation of a line in middle school. We first understood $$y=mx+n$$ in terms of its slope and $$y$$-intercept, then checked that $$ax+by=c$$ also represents a line by rewriting it as $$y=-\frac abx+\frac cb$$.[^vertical-line] But **could we see the line directly in the expression $$ax+by$$, without rewriting it?**

Both $$ax$$ and $$by$$ are products of two numbers. What if we thought of each as a base times a height—in other words, as an area? As we will see, this turns out to be a useful approach. Surprisingly, the same picture helps us understand not only the equation of a line but also the formula for the distance from a point to a line.

That was as far as I got in high school. In college, I tried asking a similar question about the inner product of vectors. There are many things in mathematics whose results we learn without spending enough time looking at the beauty within them. For me, one such example was **the connection between multiplying corresponding coordinates and adding them, and the picture of projecting one vector orthogonally onto the direction of another**. I knew that the two expressions were equal, but I wanted a proof that would let me see where they meet.

Along the way, I arrived at the idea of rotating one vector by $$90^\circ$$. Later, I came to view volumes, higher-dimensional volumes, and even dual spaces from the same perspective. Here, I would like to trace that line of thought through the two- and three-dimensional pictures where it began. The tools we need are elementary: the area of a triangle, the volume of a triangular pyramid, and the Pythagorean theorem. Let us begin.

## 1. The equation of a line and area

First, to keep the picture simple, assume that $$a,b>0$$. Take the origin $$O$$ and the two points

$$
A=(0,a),\qquad B=(b,0).
$$

To interpret $$ax$$ and $$by$$ as the areas of triangles, we have placed a length $$a$$ on the $$y$$-axis and a length $$b$$ on the $$x$$-axis. Let us first see which line equation emerges from this arrangement.

Choose a point $$P=(x,y)$$ on the segment $$AB$$ and join it to $$O$$. Writing $$\left[\,\cdot\,\right]$$ for the area of a triangle, we have

$$
\left[OAP\right]=\frac12 ax,\qquad
\left[OBP\right]=\frac12 by.
$$

This is because the height is $$x$$ when we take $$OA$$ as the base, and $$y$$ when we take $$OB$$ as the base. The two triangles together make the original triangle $$OAB$$, so

$$
\frac12 ax+\frac12 by=\frac12 ab,
\qquad\text{that is,}\qquad ax+by=ab.
$$

<figure class="geometry-figure" id="fig-line" markdown="1">
<a href="{{ '/assets/img/blog/geometry-of-inner-product/fig01_line.svg' | relative_url }}" target="_blank" rel="noopener"><img src="{{ '/assets/img/blog/geometry-of-inner-product/fig01_line.svg' | relative_url }}" alt="Point P on segment AB divides triangle OAB into two triangles whose areas are ax/2 and by/2." loading="lazy"></a>
<figcaption markdown="span">Figure 1. As the point moves along the line, the sum of the two triangle areas stays constant. The condition that these two areas have a constant sum describes a line. $$ax$$ and $$by$$ are twice the respective shaded areas.</figcaption>
</figure>

For this auxiliary line, the constant $$c$$ is $$ab$$. From this perspective, $$ax+by=ab$$ says that the sum of two areas is constant. As $$P$$ moves from $$A$$ to $$B$$, one area grows while the other shrinks, but their sum does not change. This exchange of areas was there all along, inside the linear expression in the coordinates.

## 2. The distance from a point to a line

Now move $$P=(x,y)$$ beyond $$AB$$. In the configuration shown, where $$x,y>0$$ and $$ax+by>ab$$, we can divide the quadrilateral $$OBPA$$ in two ways.

If we divide it along the diagonal $$OP$$, the sum of the two triangle areas is still $$\frac12(ax+by)$$. If we divide it along the diagonal $$AB$$ instead, we have the original triangle $$OAB$$ with a new triangle $$ABP$$ attached. Therefore,

$$
\left[ABP\right]=\frac12(ax+by-ab).
$$

Taking $$AB$$ as the base of this new triangle, its height is exactly the distance $$d$$ we want. By the Pythagorean theorem, $$\lvert AB\rvert=\sqrt{a^2+b^2}$$, so

$$
d=\frac{2\left[ABP\right]}{\lvert AB\rvert}
=\frac{ax+by-ab}{\sqrt{a^2+b^2}}.
$$

<figure class="geometry-figure" id="fig-distance" markdown="1">
<a href="{{ '/assets/img/blog/geometry-of-inner-product/fig02_distance.svg' | relative_url }}" target="_blank" rel="noopener"><img src="{{ '/assets/img/blog/geometry-of-inner-product/fig02_distance.svg' | relative_url }}" alt="Two decompositions of quadrilateral OBPA: along OP into areas ax/2 and by/2, and along AB to show triangle ABP and its perpendicular height d." loading="lazy"></a>
<figcaption markdown="span">Figure 2. On the left, dividing along $$OP$$ gives $$ax/2$$ and $$by/2$$. On the right, dividing along $$AB$$ gives $$\left[ABP\right]$$ and its height $$d$$. The numerator of the distance formula is twice $$\left[ABP\right]$$, and the denominator is the length of the base $$AB$$.</figcaption>
</figure>

If $$P$$ lies on the other side of the line, the difference of the areas changes sign. Since distance must be nonnegative, we take the absolute value. The same calculation can be carried out beyond the coordinate axes by using oriented areas. We will return to the meaning of this sign later.

For a general constant $$c$$, we simply translate this line.[^translate-line] This gives the distance formula

$$
\boxed{\displaystyle d=\frac{\lvert ax+by-c\rvert}{\sqrt{a^2+b^2}}}.
$$

When one coefficient is $$0$$, the formula can be checked directly as the distance to a horizontal or vertical line. Coefficients of different signs can also be understood with the same picture by reversing the directions of the coordinate axes. We do, however, require $$(a,b)\ne(0,0)$$.

For me, the distance-from-a-point-to-a-line formula was actually the first mathematical formula I ever encountered that looked truly “messy.” Perhaps some of you felt the same way. Yet this apparently complicated expression turns out to have a very clear meaning: **“twice the area of a triangle ÷ base = height”!**

## 3. An area interpretation of the inner product

Let us start afresh with two vectors in the coordinate plane:

$$
u=(a,b),\qquad v=(c,d).
$$

In coordinates, their inner product is $$ac+bd$$; geometrically, it is $$\left\lVert u\right\rVert\left\lVert v\right\rVert\cos\theta$$, where $$\theta$$ is the angle between the vectors. What I wanted to understand was **why multiplying components that lie along the same axis measures an orthogonal projection**.

My first thought was to interpret $$ac$$ and $$bd$$ as areas. But $$a$$ and $$c$$ are both components along the $$x$$-axis, while $$b$$ and $$d$$ are both components along the $$y$$-axis. As they stand, neither pair can serve as a perpendicular base and height. So I thought: **why not rotate $$u$$ by $$90^\circ$$ to change the directions of its components?** The idea looks simple in hindsight, but it took me quite a while to think of this rotation.

Write $$Ru$$ for the vector obtained by rotating $$u$$ clockwise. Then

$$
Ru=(b,-a).
$$

We now have a length $$b$$ in the horizontal direction and a length $$a$$ in the vertical direction. Translate this vector so that it starts at $$A=(0,a)$$, and its endpoint becomes $$B=(b,0)$$. Thus $$\overrightarrow{AB}=Ru$$. Translation moves only its starting point, so the rotated vector keeps its length and direction, giving

$$
\lvert AB\rvert=\left\lVert u\right\rVert,\qquad AB\perp u.
$$

Now place the endpoint $$P=(c,d)$$ of $$v$$ in the picture and join $$O,B,P,A$$ in that order to form a quadrilateral.[^convex-quadrilateral]

<figure class="geometry-figure" id="fig-vectors" markdown="1">
<a href="{{ '/assets/img/blog/geometry-of-inner-product/fig03a_vectors.svg' | relative_url }}" target="_blank" rel="noopener"><img src="{{ '/assets/img/blog/geometry-of-inner-product/fig03a_vectors.svg' | relative_url }}" alt="Construction from vectors u and v: rotate u clockwise by 90 degrees and translate it to form AB, while v remains OP." loading="lazy"></a>
<figcaption markdown="span">Figure 3. Building the figure from two vectors. Rotate $$u=(a,b)$$ and translate it so that $$\overrightarrow{AB}=(b,-a)$$. The other vector, $$v=(c,d)$$, remains $$\overrightarrow{OP}$$.</figcaption>
</figure>

The two diagonals of this quadrilateral carry different vectors. $$OP$$ is the original $$v$$, while $$AB$$ is the rotated and translated $$u$$. Depending on **which diagonal we use to divide the quadrilateral into two triangles**, we can read different expressions for the inner product from the same area.

First, divide along the diagonal $$OP$$. In triangle $$OPA$$, the vertical base $$OA$$ has length $$a$$, and the horizontal height from $$P$$ to the $$y$$-axis is $$c$$. In triangle $$OBP$$, the horizontal base $$OB$$ has length $$b$$, and the vertical height is $$d$$. Therefore,

$$
\left[OBPA\right]=\left[OPA\right]+\left[OBP\right]
=\frac12 ac+\frac12 bd.
$$

The rotation has placed components that originally lay along the same axis in perpendicular directions, so the two products we wanted have become actual areas.

<figure class="geometry-figure" id="fig-dot" markdown="1">
<a href="{{ '/assets/img/blog/geometry-of-inner-product/fig03_dot.svg' | relative_url }}" target="_blank" rel="noopener"><img src="{{ '/assets/img/blog/geometry-of-inner-product/fig03_dot.svg' | relative_url }}" alt="The same quadrilateral divided along OP and AB, relating ac/2 plus bd/2 to a common base and the projection length OQ." loading="lazy"></a>
<figcaption markdown="span">Figure 4. $$S$$ is the area of the quadrilateral $$OBPA$$. On the left, dividing along $$OP$$ gives $$ac/2$$ and $$bd/2$$; on the right, dividing along $$AB$$ reveals a common base and two heights. $$Q$$ is the orthogonal projection of $$P$$ onto the line in the direction of $$u$$, and $$OQ=h_O+h_P$$.</figcaption>
</figure>

Next, divide along the diagonal $$AB$$. The triangles $$OAB$$ and $$PAB$$ share the base $$AB$$. Writing their respective heights as $$h_O,h_P$$, we have

$$
\left[OBPA\right]=\frac12\lvert AB\rvert(h_O+h_P).
$$

We can see the sum of these heights directly in the picture. Let $$E$$ be the point where the line through the origin in the direction of $$u$$ meets $$AB$$, and let $$Q$$ be the foot of the perpendicular from $$P$$ to that line. Since $$AB\perp u$$, we have $$OE=h_O$$. Also, $$PQ$$ is parallel to $$AB$$, so $$P$$ and $$Q$$ are at the same height above $$AB$$, and $$EQ=h_P$$. Hence

$$
h_O+h_P=OE+EQ=OQ.
$$

But $$OQ$$ is precisely the length of the orthogonal projection of $$v$$ onto the direction of $$u$$. In the right triangle $$OPQ$$, we have $$OQ=\left\lVert v\right\rVert\cos\theta$$. The common base has length $$\lvert AB\rvert=\left\lVert u\right\rVert$$, since rotation preserves length. Comparing the areas obtained from the two diagonals, we get

$$
\frac12(ac+bd)
=\frac12\left\lVert u\right\rVert\left\lVert v\right\rVert\cos\theta,
$$

and therefore

$$
ac+bd=\left\lVert u\right\rVert\left\lVert v\right\rVert\cos\theta.
$$

The purpose of the rotation was to turn coordinate products into products of a base and a height. Dividing the resulting quadrilateral $$OBPA$$ along $$OP$$ reveals the coordinate products; dividing it along $$AB$$ reveals the projection. The key to connecting the two inner-product formulas was **the relationship between this figure and the ways of dividing it**.

## 4. A volume interpretation of the inner product

In two dimensions, we rotated one vector so that its components could serve as bases in an area calculation. What happens if we carry this role into three dimensions? This time, we want to interpret the inner product $$ad+be+cf$$ of two vectors

$$
u=(a,b,c),\qquad v=(d,e,f)
$$

as a volume. The volume of a triangular pyramid is one third of its base area times its height. We therefore want to make **each component of $$u$$ a base area, and each corresponding component of $$v$$ the height above that base**.

First, assume that $$a,b,c>0$$ and choose points $$X,Y,Z$$ on the positive coordinate axes so that

$$
\left[OYZ\right]=a,\qquad
\left[OZX\right]=b,\qquad
\left[OXY\right]=c.
$$

Here, $$a$$ is the area of a triangle in the $$yz$$-plane, perpendicular to the $$x$$-axis; similarly, $$b$$ and $$c$$ are the areas of triangles in the coordinate planes perpendicular to the $$y$$- and $$z$$-axes. To distinguish the lengths along the axes from these three areas, write $$OX=\alpha$$, $$OY=\beta$$, and $$OZ=\gamma$$. The required conditions are

$$
\frac{\beta\gamma}{2}=a,\qquad
\frac{\gamma\alpha}{2}=b,\qquad
\frac{\alpha\beta}{2}=c.
$$

These can all be satisfied.[^axis-lengths]

Having used $$u$$ to fix the three bases, place the endpoint $$P=(d,e,f)$$ of $$v$$ in the picture. The height from $$P$$ to the $$yz$$-plane is $$d$$, the height to the $$zx$$-plane is $$e$$, and the height to the $$xy$$-plane is $$f$$. Drawing the coordinate axes and planes together makes it clear which component pairs with which height.

<figure class="geometry-figure" id="fig-bases" markdown="1">
<a href="{{ '/assets/img/blog/geometry-of-inner-product/fig04a_bases.svg' | relative_url }}" target="_blank" rel="noopener"><img src="{{ '/assets/img/blog/geometry-of-inner-product/fig04a_bases.svg' | relative_url }}" alt="Three coordinate-plane triangles with areas a, b, and c, and the projection Q of P onto the yz-plane showing height PQ equals d." loading="lazy"></a>
<figcaption markdown="span">Figure 5. On the left, the components of $$u=(a,b,c)$$ are represented as areas in the three coordinate planes. On the right, $$Q=(0,e,f)$$ is the orthogonal projection of $$P$$ onto the $$yz$$-plane. Thus the base $$OYZ$$ has area $$a$$, and the height $$PQ$$ is $$d$$.</figcaption>
</figure>

Joining the same apex $$P$$ to these three bases gives the triangular pyramids $$OPYZ$$, $$OPZX$$, and $$OPXY$$, whose volumes are

$$
V_{OPYZ}=\frac13ad,\qquad
V_{OPZX}=\frac13be,\qquad
V_{OPXY}=\frac13cf.
$$

If $$P$$ lies beyond the triangle $$XYZ$$ as shown, these three triangular pyramids share the edge $$OP$$ and fill a single triangular bipyramid.[^bipyramid] The total volume is therefore

$$
V=\frac13(ad+be+cf).
$$

Now cut the same solid along the triangle $$XYZ$$. This gives two triangular pyramids, $$OXYZ$$ and $$PXYZ$$, with $$XYZ$$ as their common base. Writing the base area as $$S$$ and their two heights as $$h_O,h_P$$, we have

$$
V=\frac13S(h_O+h_P).
$$

<figure class="geometry-figure" id="fig-volume" markdown="1">
<a href="{{ '/assets/img/blog/geometry-of-inner-product/fig04_volume.svg' | relative_url }}" target="_blank" rel="noopener"><img src="{{ '/assets/img/blog/geometry-of-inner-product/fig04_volume.svg' | relative_url }}" alt="Two decompositions of the same triangular bipyramid: three pyramids around OP and two pyramids sharing the triangular base XYZ." loading="lazy"></a>
<figcaption markdown="span">Figure 6. Two decompositions of the same solid, with the same vertices and coordinate system. On the left, the three triangular pyramids around $$OP$$ give the sum of coordinate products. On the right, the two triangular pyramids with the common base $$XYZ$$ give the sum of the heights.</figcaption>
</figure>

In two dimensions, the rotated vector provided the common base. Here, the three faces in the coordinate planes, constructed from the components of $$u$$, determine the tilted common base $$XYZ$$. We now need to know the area and direction of this base. **If $$S$$ equals $$\left\lVert u\right\rVert$$ and its normal points in the direction of $$u$$**, the sum of the two heights will once again be the projection of $$v$$.

## 5. De Gua’s theorem and the normal vector

Let us find the area first. For a triangular pyramid whose edges $$OX$$, $$OY$$, and $$OZ$$ are mutually perpendicular, the area of the opposite face $$XYZ$$ and the areas of the three faces in the coordinate planes satisfy

$$
\boxed{S^2=a^2+b^2+c^2}.
$$

This is called de Gua’s theorem. It looks like the Pythagorean theorem, with squared areas taking the place of squared lengths.

If we verify this immediately using an inner-product or cross-product formula, however, we risk circular reasoning: we may already be using the projection relationship we are trying to understand. So let us calculate it using just two right triangles.

<figure class="geometry-figure" id="fig-degua" markdown="1">
<a href="{{ '/assets/img/blog/geometry-of-inner-product/fig05_degua.svg' | relative_url }}" target="_blank" rel="noopener"><img src="{{ '/assets/img/blog/geometry-of-inner-product/fig05_degua.svg' | relative_url }}" alt="A trirectangular tetrahedron OXYZ with D the perpendicular foot from O to XY, showing the right triangles OXY and ODZ used to prove de Gua's theorem." loading="lazy"></a>
<figcaption markdown="span">Figure 7. A trirectangular tetrahedron on the same coordinate axes. $$D$$ is the foot of the perpendicular from $$O$$ to $$XY$$. We find $$OD$$ using the right triangle $$OXY$$, then $$ZD$$ using the right triangle $$ODZ$$.</figcaption>
</figure>

Let $$L=\lvert XY\rvert$$, and let $$D$$ be the foot of the perpendicular from $$O$$ to $$XY$$. Computing the area of triangle $$OXY$$ in two ways gives

$$
L^2=\alpha^2+\beta^2,
\qquad
\frac12L\cdot OD=\frac12\alpha\beta,
\qquad
OD=\frac{\alpha\beta}{L}.
$$

Since $$OZ$$ is perpendicular to the $$xy$$-plane, it is also perpendicular to $$OD$$. Moreover, $$XY$$ is perpendicular to the directions of both $$OD$$ and $$OZ$$, so it is perpendicular to $$ZD$$ as well. Thus $$ZD$$ is an altitude of triangle $$XYZ$$, and

$$
ZD^2=\gamma^2+OD^2,
\qquad S=\frac12L\cdot ZD.
$$

Combining these equations,

$$
\begin{aligned}
4S^2
&=L^2ZD^2\\
&=(\alpha^2+\beta^2)\gamma^2+\alpha^2\beta^2\\
&=\beta^2\gamma^2+\gamma^2\alpha^2+\alpha^2\beta^2\\
&=4(a^2+b^2+c^2).
\end{aligned}
$$

Therefore, $$S=\sqrt{a^2+b^2+c^2}=\left\lVert u\right\rVert$$.

Next comes the direction. Orthogonally projecting triangle $$XYZ$$ onto the $$yz$$-plane takes $$X$$ to $$O$$ and gives triangle $$OYZ$$. The projections onto the other two coordinate planes similarly give $$OZX$$ and $$OXY$$.

When a planar figure is projected orthogonally onto another plane, its area is reduced by the cosine of the angle between the planes. To see this, take a base in the direction of the line where the planes intersect: the base remains unchanged, while only the perpendicular height is reduced by that cosine. The angle between the planes equals the angle between appropriately chosen unit normals.

Let $$n=(n_x,n_y,n_z)$$ be the unit normal to $$XYZ$$ whose three components are positive. The normal to the $$yz$$-plane points along the $$x$$-axis. Since $$n$$ is a unit vector, the cosine of its angle with this direction is $$n_x$$. Thus the areas of the three projections are

$$
a=Sn_x,\qquad b=Sn_y,\qquad c=Sn_z.
$$

In other words,

$$
(a,b,c)=Sn.
$$

The vector whose components are the areas in the three coordinate planes records **both the area and the normal direction** of the tilted face.

Returning to the heights of the two triangular pyramids, $$h_O+h_P$$ is the length of the orthogonal projection of $$\overrightarrow{OP}=v$$ onto the direction of $$n$$. Since $$n$$ points in the same direction as $$u$$, we have $$h_O+h_P=\left\lVert v\right\rVert\cos\theta$$. Comparing the two volume calculations in the previous section gives

$$
\frac13(ad+be+cf)
=\frac13\left\lVert u\right\rVert\left\lVert v\right\rVert\cos\theta,
$$

and therefore

$$
ad+be+cf=\left\lVert u\right\rVert\left\lVert v\right\rVert\cos\theta.
$$

The role played by a single edge in two dimensions is played by a triangular face in three dimensions. The coordinate products appear as the volumes of three smaller triangular pyramids, while the projection appears through the heights of two triangular pyramids with a common base.

## 6. Oriented areas and volumes

So far, we have placed $$P$$ where the pictures can be read as sums of ordinary areas and volumes. But an inner product can be negative, and vectors can point in any direction. To extend the picture to general vectors, we need to **record orientation as well as magnitude**.

In two dimensions, fix $$u=(a,b)$$ and construct $$A=(0,a)$$ and $$B=(b,0)$$ as before. Read the vertices of triangles $$OBP$$ and $$OPA$$ in the stated order. If we assign positive area to counterclockwise orientation and negative area to clockwise orientation, then for any input vector $$v=(c,d)$$ and its endpoint $$P=(c,d)$$,

$$
\mathcal A(v)
:=\left[OBP\right]_{\mathrm{or}}+\left[OPA\right]_{\mathrm{or}}
=\frac12(bd+ac).
$$

This formula remains valid even when $$P$$ crosses a coordinate axis. If the quadrilateral is no longer convex, or parts of it overlap, the overlapping regions are added or canceled according to their signs.

In three dimensions, take the positive axis direction perpendicular to each coordinate plane to be the direction of positive height. The sum of the oriented volumes obtained by joining the endpoint $$P$$ of $$v=(d,e,f)$$ to the three bases determined by $$u=(a,b,c)$$ is then

$$
\mathcal V(v)=\frac13(ad+be+cf).
$$

Here, $$\mathcal V(v)$$ does not mean the ordinary volume of a single convex solid in every configuration. It is a sum of volumes that takes orientation into account.

The quantity we read as a sum of heights in the pictures must therefore be read more generally as a difference of oriented heights. If $$u$$ and $$v$$ form an obtuse angle, the projection of $$v$$ measured in the direction of $$u$$ is negative. Signs of coefficients can be handled by changing the directions of the axes, and the result extends continuously to cases where some components are $$0$$. The zero vector, however, has no defined direction or angle, so the expression involving a cosine is restricted to the case where both vectors are nonzero. If either vector is zero, the sum of the coordinate products is simply $$0$$.

Had we discarded orientation and kept only the magnitudes of areas or volumes, we would have measured $$v$$ and $$-v$$ as the same value. Now, reversing the direction of the input also reverses the sign of the measurement. As we examine how this behavior extends to addition and scalar multiplication, the picture begins to read as a linear functional.

## 7. Linear functionals and dual spaces

I would like to use the pictures we have developed as a starting point for understanding the definition of a dual space.[^historical-note] The key is to give the two vectors different roles: **fix one vector $$u$$ as a standard of measurement, and measure the other vector $$v$$ against it.**

In the earlier construction with positive components, fixing $$u$$ determines the segment $$AB$$ in two dimensions, or the bases in the three coordinate planes in three dimensions. Each time we move the endpoint of $$v$$, we obtain an oriented area or volume. If we multiply the area by $$2$$ or the volume by $$3$$, both pictures give the same rule:

$$
\ell_u(v)=u\cdot v.
$$

Geometrically, we are measuring a height while holding a base segment or base face fixed. As a function, the rule takes a vector as input and returns a real number.

This way of measuring has a special property. Adding input vectors adds their measurements, and multiplying an input vector by a real number multiplies its measurement by the same number:

$$
\ell_u(v+w)=\ell_u(v)+\ell_u(w),\qquad
\ell_u(tv)=t\ell_u(v).
$$

These are properties of oriented projection lengths measured along a fixed normal direction, and they can also be checked directly in coordinates. Let us keep this **linearity** and set aside, for a moment, the particular triangles and triangular pyramids used to construct the measurement. Could we collect all the ways of measuring that obey these rules on a vector space, and treat them as a new space?

This question leads naturally to the following definition. The dual space of a real vector space $$V$$ is

$$
V^*=\{\ell:V\to\mathbb R\mid\ell\text{ is a linear functional}\}.
$$

Adding the results of two such measurements, or multiplying the results of one by a real number, gives another linear way of measuring. These measurements therefore do form a vector space. **We have moved from studying vectors in a space to studying the ways of measuring those vectors linearly.** This is how I would like to understand the abstraction that takes us from pictures of areas and volumes to a dual space.

The definition itself requires no length, angle, or inner product. The inner product is additional structure that, in our original picture, turned $$u$$ into the measurement $$\ell_u$$. In a finite-dimensional real inner product space, every linear functional can be written as $$\ell_u(v)=\langle u,v\rangle$$ for a unique $$u$$, but this correspondence depends on the chosen inner product. We should therefore distinguish the fact that vectors can be identified with dual vectors from the claim that the two play the same role.

Returning now to our original equation,

$$
ax+by=c
\qquad\Longleftrightarrow\qquad
\ell_{(a,b)}(x,y)=c
$$

collects all the points at which a fixed measurement gives the same value. Changing $$c$$ produces parallel lines. Taking the absolute difference between two measurement values and dividing by $$\sqrt{a^2+b^2}$$ gives the distance between those lines. The linear expression that we first read as an area now reads as a linear functional that groups points in space according to their measured values.

Looking back over this journey, we began with a small question about interpreting coordinate products as areas. Dividing the same figure in different ways brought us to projection; abstracting the way that figure measures vectors brought us to dual spaces. For me, it is just as interesting to discover **what picture was hidden in a calculation I already knew, and what I can carry from that picture into the next concept**, as it is to learn a new formula.

See you in the next post!

[^vertical-line]: Here we have in mind the case $$b\ne0$$. If $$b=0$$ and $$a\ne0$$, the equation is the vertical line $$x=c/a$$.

[^translate-line]: When $$a\ne0$$, translating by $$t=(c-ab)/a$$ in the $$x$$-direction gives $$ax+by=c$$. Reading $$P$$ as $$(x-t,y)$$ in the coordinates before the translation, the numerator of the distance formula becomes $$\lvert a(x-t)+by-ab\rvert=\lvert ax+by-c\rvert$$.

[^convex-quadrilateral]: We begin with a convex configuration in which $$a,b,c,d>0$$ and $$ac+bd>ab$$. Then $$O$$ and $$P$$ lie on opposite sides of $$AB$$, and the two diagonals intersect in the interior. We will extend this to other configurations later using signed areas.

[^axis-lengths]: For example, choosing $$\alpha=\sqrt{2bc/a}$$, $$\beta=\sqrt{2ca/b}$$, and $$\gamma=\sqrt{2ab/c}$$ satisfies all three conditions.

[^bipyramid]: More precisely, the configuration satisfies $$d,e,f>0$$ and $$d/\alpha+e/\beta+f/\gamma>1$$. Then $$OP$$ passes through the interior of triangle $$XYZ$$, and the interiors of the three triangular pyramids do not overlap.

[^historical-note]: This is not a claim that dual spaces were historically defined this way. Rather, I am proposing that we use the pictures developed in this post as motivation for the definition.

</div>
