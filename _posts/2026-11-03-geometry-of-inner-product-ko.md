---
layout: post
title: "내적의 기하학적 직관 — 직선의 방정식에서 쌍대공간까지"
date: 2026-11-03 00:00:00+0900
description: "좌표곱을 넓이와 부피로 읽고, 같은 도형의 서로 다른 분할을 따라 내적의 정사영 해석과 쌍대공간으로 나아갑니다."
tags: [mathematics, geometry, linear-algebra]
categories: [study-notes]
lang: ko
math: true
related_posts: false
---

<link rel="stylesheet" href="{{ '/assets/css/geometry-blog.css' | relative_url }}">

<div class="geometry-article" markdown="1" lang="ko">

**한국어** · [English]({% post_url 2026-11-03-geometry-of-inner-product-en %})

중학교 시절, 처음 직선의 방정식을 배웠을 때를 떠올려 봅시다. 우리는 먼저 $$y=mx+n$$을 기울기와 $$y$$절편으로 이해한 뒤, $$ax+by=c$$도 $$y=-\frac abx+\frac cb$$로 고쳐 쓰면 직선을 나타낸다는 것을 확인했습니다.[^1] 그런데 식을 굳이 고쳐 쓰지 않고, **$$ax+by$$라는 모양 자체에서 직선을 읽어낼 수는 없을까요?**

$$ax$$와 $$by$$는 각각 두 수의 곱입니다. 이 곱들을 밑변과 높이의 곱, 즉 넓이로 생각하면 어떨까요? 뒤에서 살펴보겠지만 이 시도는 제법 효과적입니다. 놀랍게도 직선의 방정식뿐 아니라 점과 직선 사이의 거리 공식까지 같은 그림으로 이해할 수 있게 됩니다.

여기까지가 제가 고등학교 시절에 생각했던 내용입니다. 대학에 와서는 비슷한 질문을 벡터의 내적에도 적용해 보았습니다. 수학에는 결과만 익히고 그 안의 아름다움은 충분히 들여다보지 못한 채 지나치는 것들이 많습니다. 제게는 **좌표끼리 곱해서 더하는 계산과 한 벡터를 다른 벡터 방향으로 정사영하는 그림이 연결된다는 사실**이 그런 예였습니다. 두 표현이 같다는 것은 알고 있었지만, 그 접점이 눈에 보이는 증명을 찾아보고 싶었습니다.

그 과정에서 벡터 하나를 $$90^\circ$$ 돌리는 생각에 이르렀고, 이후에는 부피와 고차원의 부피, 그리고 쌍대공간까지 같은 관점으로 바라보게 되었습니다. 여기서는 그 출발점이 되는 2차원과 3차원의 그림을 따라가며 생각의 흐름을 정리해 보려고 합니다. 필요한 도구는 삼각형의 넓이, 삼각뿔의 부피, 그리고 피타고라스 정리처럼 기본적인 것들입니다. 그러면 시작해 보죠.

## 1. 직선의 방정식과 넓이

먼저 그림을 단순하게 그리기 위해 $$a,b>0$$이라고 하겠습니다. 원점 $$O$$와 두 점

$$
A=(0,a),\qquad B=(b,0)
$$

를 잡습니다. $$ax$$와 $$by$$를 삼각형의 넓이로 이해하기 위해, $$y$$축에는 길이 $$a$$를, $$x$$축에는 길이 $$b$$를 놓았습니다. 이 배치에서 어떤 직선의 방정식이 나오는지 먼저 살펴보겠습니다.

선분 $$AB$$ 위에 점 $$P=(x,y)$$를 잡고 $$O$$와 연결해 봅시다. 삼각형의 넓이를 $$\left[\,\cdot\,\right]$$로 표시하면

$$
\left[OAP\right]=\frac12 ax,\qquad
 \left[OBP\right]=\frac12 by
$$

입니다. $$OA$$를 밑변으로 보면 높이가 $$x$$이고, $$OB$$를 밑변으로 보면 높이가 $$y$$이기 때문입니다. 두 삼각형을 합하면 원래의 삼각형 $$OAB$$가 되므로

$$
\frac12 ax+\frac12 by=\frac12 ab,
 \qquad\text{즉}\qquad ax+by=ab.
$$

<figure class="geometry-figure" id="fig-line" markdown="1">
  <a href="{{ '/assets/img/blog/geometry-of-inner-product/fig01_line.svg' | relative_url }}" target="_blank" rel="noopener">
    <img src="{{ '/assets/img/blog/geometry-of-inner-product/fig01_line.svg' | relative_url }}" alt="직선 AB 위의 점 P를 원점 O와 연결하여 두 삼각형으로 나눈 그림" loading="lazy">
  </a>
  <figcaption markdown="span">그림 1. 직선 위의 점을 움직여도 두 삼각형의 넓이 합은 일정합니다. 이처럼 두 넓이의 합이 일정하다는 조건이 직선을 나타냅니다. $$ax$$와 $$by$$는 각각 색칠한 넓이의 두 배입니다.</figcaption>
</figure>

이 보조선에서는 상수 $$c$$가 $$ab$$가 됩니다. 이렇게 보면 $$ax+by=ab$$는 두 넓이를 합한 값이 일정하다는 말입니다. $$P$$가 $$A$$에서 $$B$$로 움직이는 동안 한쪽 넓이는 늘고 다른 쪽 넓이는 줄지만, 둘의 합은 바뀌지 않습니다. 좌표의 일차식 안에 이런 넓이의 교환이 들어 있었던 셈입니다.

## 2. 점과 직선 사이의 거리

이번에는 $$P=(x,y)$$를 $$AB$$ 바깥쪽으로 옮겨 보겠습니다. 그림처럼 $$x,y>0$$, $$ax+by>ab$$인 위치를 생각하면, 사각형 $$OBPA$$를 두 가지 방식으로 나눌 수 있습니다.

대각선 $$OP$$를 따라 나누면 두 삼각형의 넓이 합은 여전히 $$\frac12(ax+by)$$입니다. 반면 대각선 $$AB$$를 따라 나누면, 원래의 삼각형 $$OAB$$에 새 삼각형 $$ABP$$를 붙인 모양입니다. 따라서

$$
\left[ABP\right]=\frac12(ax+by-ab).
$$

이 새 삼각형에서 $$AB$$를 밑변으로 택하면 높이가 바로 구하려는 거리 $$d$$입니다. 피타고라스 정리로 $$\lvert AB\rvert=\sqrt{a^2+b^2}$$이므로

$$
d=\frac{2\left[ABP\right]}{\lvert AB\rvert}
   =\frac{ax+by-ab}{\sqrt{a^2+b^2}}.
$$

<figure class="geometry-figure" id="fig-distance" markdown="1">
  <a href="{{ '/assets/img/blog/geometry-of-inner-product/fig02_distance.svg' | relative_url }}" target="_blank" rel="noopener">
    <img src="{{ '/assets/img/blog/geometry-of-inner-product/fig02_distance.svg' | relative_url }}" alt="같은 사각형을 대각선 OP와 AB로 각각 나누어 점 P에서 직선 AB까지의 거리를 구하는 그림" loading="lazy">
  </a>
  <figcaption markdown="span">그림 2. 왼쪽은 $$OP$$로 나누어 $$ax/2$$와 $$by/2$$를 읽은 그림이고, 오른쪽은 $$AB$$로 나누어 $$\left[ABP\right]$$와 그 높이 $$d$$를 읽은 그림입니다. 거리 공식의 분자는 $$\left[ABP\right]$$의 두 배, 분모는 밑변 $$AB$$의 길이입니다.</figcaption>
</figure>

$$P$$가 직선의 반대쪽에 있으면 넓이의 차이의 부호가 바뀝니다. 거리는 양수여야 하므로 이를 절댓값으로 처리하면 됩니다. 좌표축 바깥까지 포함하는 경우에는 방향을 정한 넓이로 같은 계산을 할 수 있습니다. 이 부호의 의미는 뒤에서 다시 살펴보겠습니다.

상수가 일반적인 $$c$$일 때에는 이 직선을 평행이동하면 됩니다.[^2] 그러면 다음 거리 공식을 얻습니다.

$$
\boxed{\displaystyle d=\frac{\lvert ax+by-c\rvert}{\sqrt{a^2+b^2}}}
$$

한 계수가 $$0$$인 경우는 수평선이나 수직선까지의 거리로 바로 확인할 수 있습니다. 계수의 부호가 다른 경우도 좌표축의 방향을 뒤집어 같은 그림으로 이해할 수 있습니다. 단, $$(a,b)\ne(0,0)$$이어야 합니다.

사실 제게 점과 직선 사이의 거리 공식은 살면서 처음 마주한, 정말 ‘지저분하게 생긴’ 수학 공식이었습니다. 비슷하게 느꼈던 분들도 계실 것 같습니다. 그런데 알고 보니 그 복잡해 보이는 식은 **‘삼각형 넓이의 두 배 ÷ 밑변 = 높이’**라는 분명한 의미를 가지고 있었던 것입니다!

## 3. 내적의 넓이 해석

이제 좌표평면 위의 두 벡터

$$
u=(a,b),\qquad v=(c,d)
$$

에서 새로 출발해 봅시다. 두 벡터의 내적은 좌표로 계산하면 $$ac+bd$$이고, 기하적으로는 $$\left\lVert u\right\rVert\left\lVert v\right\rVert\cos\theta$$입니다. 여기서 $$\theta$$는 두 벡터 사이의 각입니다. 제가 이해하고 싶었던 것은 **같은 축에 놓인 성분끼리 곱하는 계산이 왜 정사영을 재는가**였습니다.

우선 $$ac$$와 $$bd$$를 넓이로 이해하고 싶었습니다. 그런데 $$a,c$$는 모두 $$x$$축 방향의 성분이고, $$b,d$$는 모두 $$y$$축 방향의 성분입니다. 그대로는 각각을 서로 수직인 밑변과 높이로 삼을 수 없습니다. 그래서 **$$u$$를 $$90^\circ$$ 돌려 성분의 방향을 바꾸어 보자**는 생각을 했습니다. 결과만 보면 간단하지만, 제게는 이 회전을 떠올리기까지 꽤 오랜 시간이 걸렸습니다.

시계 방향으로 회전한 벡터를 $$Ru$$라고 쓰면

$$
Ru=(b,-a).
$$

이제 가로 방향에는 길이 $$b$$, 세로 방향에는 길이 $$a$$가 놓입니다. 이 벡터를 평행이동하여 $$A=(0,a)$$에서 출발시키면 끝점이 $$B=(b,0)$$가 됩니다. 따라서 $$\overrightarrow{AB}=Ru$$입니다. 평행이동으로 시점만 옮겼으므로 회전한 벡터의 길이와 방향은 그대로이고,

$$
\lvert AB\rvert=\left\lVert u\right\rVert,\qquad AB\perp u
$$

가 성립합니다. 여기에 $$v$$의 끝점 $$P=(c,d)$$를 놓고 $$O,B,P,A$$를 차례로 연결하면 사각형이 만들어집니다.[^3]

<figure class="geometry-figure" id="fig-vectors" markdown="1">
  <a href="{{ '/assets/img/blog/geometry-of-inner-product/fig03a_vectors.svg' | relative_url }}" target="_blank" rel="noopener">
    <img src="{{ '/assets/img/blog/geometry-of-inner-product/fig03a_vectors.svg' | relative_url }}" alt="벡터 u를 시계 방향으로 90도 회전하고 평행이동하여 사각형 OBPA를 만드는 과정" loading="lazy">
  </a>
  <figcaption markdown="span">그림 3. 두 벡터에서 도형을 만드는 과정. $$u=(a,b)$$를 회전한 뒤 평행이동하여 $$\overrightarrow{AB}=(b,-a)$$로 놓습니다. 다른 벡터 $$v=(c,d)$$는 $$\overrightarrow{OP}$$로 남습니다.</figcaption>
</figure>

이 사각형의 두 대각선에는 서로 다른 벡터가 놓여 있습니다. $$OP$$는 원래의 $$v$$이고, $$AB$$는 회전하여 옮긴 $$u$$입니다. **어느 대각선을 따라 삼각형 두 개로 나누느냐**에 따라, 같은 넓이에서 내적의 서로 다른 표현을 읽을 수 있습니다.

먼저 대각선 $$OP$$를 따라 나누어 봅시다. 삼각형 $$OPA$$에서는 세로 밑변 $$OA$$의 길이가 $$a$$이고, $$P$$에서 $$y$$축까지의 가로 높이가 $$c$$입니다. 삼각형 $$OBP$$에서는 가로 밑변 $$OB$$의 길이가 $$b$$이고 세로 높이가 $$d$$입니다. 따라서

$$
\left[OBPA\right]=\left[OPA\right]+\left[OBP\right]
 =\frac12 ac+\frac12 bd.
$$

같은 축에 있던 성분들을 회전으로 수직인 방향에 놓았기 때문에, 원하던 두 곱이 실제 넓이로 나타났습니다.

<figure class="geometry-figure" id="fig-dot" markdown="1">
  <a href="{{ '/assets/img/blog/geometry-of-inner-product/fig03_dot.svg' | relative_url }}" target="_blank" rel="noopener">
    <img src="{{ '/assets/img/blog/geometry-of-inner-product/fig03_dot.svg' | relative_url }}" alt="사각형 OBPA의 두 분할로 좌표곱의 합과 벡터의 정사영을 비교하는 그림" loading="lazy">
  </a>
  <figcaption markdown="span">그림 4. $$S$$는 사각형 $$OBPA$$의 넓이입니다. 왼쪽은 $$OP$$로 나누어 $$ac/2$$와 $$bd/2$$를 읽고, 오른쪽은 $$AB$$로 나누어 공통 밑변과 두 높이를 읽습니다. $$Q$$는 $$P$$를 $$u$$방향의 직선에 정사영한 점이며, $$OQ=h_O+h_P$$입니다.</figcaption>
</figure>

이번에는 대각선 $$AB$$를 따라 나누어 봅시다. 삼각형 $$OAB$$와 $$PAB$$가 같은 밑변 $$AB$$를 가지므로, 각각의 높이를 $$h_O,h_P$$라고 하면

$$
\left[OBPA\right]=\frac12\lvert AB\rvert(h_O+h_P).
$$

여기서 두 높이의 합을 그림 안에서 직접 확인할 수 있습니다. 원점에서 $$u$$방향으로 그은 직선이 $$AB$$와 만나는 점을 $$E$$, $$P$$에서 그 직선에 내린 수선의 발을 $$Q$$라 합시다. $$AB\perp u$$이므로 $$OE=h_O$$입니다. 또 $$PQ$$와 $$AB$$가 평행하므로 $$P$$와 $$Q$$는 $$AB$$에서 같은 높이에 있고, $$EQ=h_P$$입니다. 따라서

$$
h_O+h_P=OE+EQ=OQ.
$$

그런데 $$OQ$$는 바로 $$v$$를 $$u$$방향으로 정사영한 길이입니다. 직각삼각형 $$OPQ$$에서 $$OQ=\left\lVert v\right\rVert\cos\theta$$이고, 공통 밑변은 회전 전후의 길이가 같아 $$\lvert AB\rvert=\left\lVert u\right\rVert$$입니다. 결국 두 대각선으로 구한 넓이를 비교하면

$$
\frac12(ac+bd)
 =\frac12\left\lVert u\right\rVert\left\lVert v\right\rVert\cos\theta,
$$

즉,

$$
ac+bd=\left\lVert u\right\rVert\left\lVert v\right\rVert\cos\theta
$$

를 얻습니다.

회전은 좌표곱을 밑변과 높이의 곱으로 만들기 위한 선택이었습니다. 그렇게 만든 사각형 $$OBPA$$를 $$OP$$로 나누면 좌표곱이 보이고, $$AB$$로 나누면 정사영이 보입니다. 즉, 두 내적 공식의 대응을 찾는 과정에서의 핵심은 바로 **이 도형과 분할의 관계**였습니다.

## 4. 내적의 부피 해석

2차원에서 한 벡터를 회전한 이유는 그 성분들을 넓이 계산에 쓸 밑변으로 놓기 위해서였습니다. 이 역할을 3차원으로 옮겨 보면 어떨까요? 이번에는 두 벡터

$$
u=(a,b,c),\qquad v=(d,e,f)
$$

의 내적 $$ad+be+cf$$를 부피로 읽고 싶습니다. 삼각뿔의 부피는 밑면의 넓이와 높이의 곱의 $$1/3$$이므로, **$$u$$의 각 성분을 밑면의 넓이로, $$v$$의 각 성분을 그 밑면에 대한 높이로** 만들면 됩니다.

우선 $$a,b,c>0$$이라 하고, 양의 좌표축 위에 $$X,Y,Z$$를 잡아

$$
\left[OYZ\right]=a,\qquad
 \left[OZX\right]=b,\qquad
 \left[OXY\right]=c
$$

가 되게 합니다. $$a$$는 $$x$$축에 수직인 $$yz$$평면의 삼각형 넓이이고, $$b,c$$도 각각 $$y,z$$축에 수직인 좌표면의 삼각형 넓이입니다. 이 세 넓이와 구별하여, 좌표축 위의 길이는 $$OX=\alpha$$, $$OY=\beta$$, $$OZ=\gamma$$라고 쓰겠습니다. 필요한 조건은

$$
\frac{\beta\gamma}{2}=a,\qquad
 \frac{\gamma\alpha}{2}=b,\qquad
 \frac{\alpha\beta}{2}=c,
$$

입니다.[^4]

$$u$$로 이 세 밑면을 정한 다음, $$v$$의 끝점 $$P=(d,e,f)$$를 놓습니다. 그러면 $$P$$에서 $$yz$$평면까지의 높이는 $$d$$, $$zx$$평면까지의 높이는 $$e$$, $$xy$$평면까지의 높이는 $$f$$입니다. 좌표축과 좌표면을 함께 그려 보면 성분 하나가 어느 높이와 짝지어지는지가 분명해집니다.

<figure class="geometry-figure" id="fig-bases" markdown="1">
  <a href="{{ '/assets/img/blog/geometry-of-inner-product/fig04a_bases.svg' | relative_url }}" target="_blank" rel="noopener">
    <img src="{{ '/assets/img/blog/geometry-of-inner-product/fig04a_bases.svg' | relative_url }}" alt="벡터 u의 세 성분을 좌표면의 삼각형 넓이로 놓고 벡터 v의 성분을 높이로 읽는 그림" loading="lazy">
  </a>
  <figcaption markdown="span">그림 5. 왼쪽은 $$u=(a,b,c)$$의 성분을 세 좌표면 위의 넓이로 놓은 모습입니다. 오른쪽의 $$Q=(0,e,f)$$는 $$P$$를 $$yz$$평면에 정사영한 점입니다. 따라서 밑면 $$OYZ$$의 넓이는 $$a$$, 높이 $$PQ$$는 $$d$$입니다.</figcaption>
</figure>

이 세 밑면에 같은 꼭짓점 $$P$$를 붙이면 삼각뿔 $$OPYZ$$, $$OPZX$$, $$OPXY$$가 만들어지고, 각각의 부피는

$$
V_{OPYZ}=\frac13ad,\qquad
 V_{OPZX}=\frac13be,\qquad
 V_{OPXY}=\frac13cf
$$

입니다. 그림처럼 $$P$$가 삼각형 $$XYZ$$의 건너편에 있으면, 세 삼각뿔은 모서리 $$OP$$를 공유하면서 하나의 쌍삼각뿔을 채웁니다.[^5] 따라서 전체 부피는

$$
V=\frac13(ad+be+cf).
$$

이번에는 같은 입체를 삼각형 $$XYZ$$를 따라 잘라 봅시다. 이제는 $$XYZ$$를 공통 밑면으로 하는 두 삼각뿔 $$OXYZ$$, $$PXYZ$$가 됩니다. 밑면 넓이를 $$S$$, 두 높이를 $$h_O,h_P$$라고 하면

$$
V=\frac13S(h_O+h_P).
$$

<figure class="geometry-figure" id="fig-volume" markdown="1">
  <a href="{{ '/assets/img/blog/geometry-of-inner-product/fig04_volume.svg' | relative_url }}" target="_blank" rel="noopener">
    <img src="{{ '/assets/img/blog/geometry-of-inner-product/fig04_volume.svg' | relative_url }}" alt="쌍삼각뿔을 세 좌표면을 밑면으로 하는 세 삼각뿔과 공통 밑면 XYZ를 가진 두 삼각뿔로 나눈 그림" loading="lazy">
  </a>
  <figcaption markdown="span">그림 6. 같은 좌표계, 같은 꼭짓점, 같은 입체의 두 분할입니다. 왼쪽은 $$OP$$ 주위의 세 삼각뿔로 좌표곱의 합을 읽고, 오른쪽은 $$XYZ$$를 공통 밑면으로 하는 두 삼각뿔로 높이의 합을 읽습니다.</figcaption>
</figure>

2차원에서 회전한 벡터가 공통 밑변을 제공했다면, 여기서는 $$u$$의 성분으로 구성한 세 좌표면이 기울어진 공통 밑면 $$XYZ$$를 결정합니다. 이제 이 밑면의 넓이와 방향을 알아야 합니다. **$$S$$가 $$\left\lVert u\right\rVert$$이고 그 법선 방향이 $$u$$의 방향이라면**, 두 높이의 합은 다시 $$v$$의 정사영이 될 것입니다.

## 5. de Gua 정리와 법선 벡터

먼저 넓이부터 알아보겠습니다. $$OX$$, $$OY$$, $$OZ$$가 서로 수직인 삼각뿔에서는 맞은편 면 $$XYZ$$의 넓이와 세 좌표면 위의 넓이 사이에

$$
\boxed{S^2=a^2+b^2+c^2}
$$

가 성립합니다. 이 식은 de Gua 정리라고 부릅니다. 피타고라스 정리에서 길이의 제곱을 더하던 자리에 면적의 제곱이 들어간 모습입니다.

여기서 이 식을 내적이나 외적의 공식으로 바로 확인하면, 우리가 이해하려는 정사영 관계를 먼저 사용하게 되어 순환논리에 빠질 위험이 있습니다. 따라서 여기서는 직각삼각형 두 개만으로 계산해 보겠습니다.

<figure class="geometry-figure" id="fig-degua" markdown="1">
  <a href="{{ '/assets/img/blog/geometry-of-inner-product/fig05_degua.svg' | relative_url }}" target="_blank" rel="noopener">
    <img src="{{ '/assets/img/blog/geometry-of-inner-product/fig05_degua.svg' | relative_url }}" alt="서로 수직인 세 모서리를 가진 삼각뿔에서 de Gua 정리를 증명하기 위한 보조선 OD와 ZD" loading="lazy">
  </a>
  <figcaption markdown="span">그림 7. 같은 좌표축 위의 삼직각삼각뿔입니다. $$D$$는 $$O$$에서 $$XY$$에 내린 수선의 발입니다. 직각삼각형 $$OXY$$에서 $$OD$$를 구하고, 직각삼각형 $$ODZ$$에서 $$ZD$$를 구합니다.</figcaption>
</figure>

$$L=\lvert XY\rvert$$라 하고, $$O$$에서 $$XY$$에 내린 수선의 발을 $$D$$라고 합시다. 삼각형 $$OXY$$의 넓이를 두 방식으로 구하면

$$
L^2=\alpha^2+\beta^2,
 \qquad
 \frac12L\cdot OD=\frac12\alpha\beta,
 \qquad
 OD=\frac{\alpha\beta}{L}.
$$

$$OZ$$는 $$xy$$평면에 수직이므로 $$OD$$와도 수직입니다. 또한 $$XY$$는 $$OD$$와 $$OZ$$의 방향 모두에 수직이므로 $$ZD$$에도 수직입니다. 따라서 $$ZD$$는 삼각형 $$XYZ$$의 높이이고,

$$
ZD^2=\gamma^2+OD^2,
 \qquad S=\frac12L\cdot ZD.
$$

이를 합치면

$$
\begin{aligned}
 4S^2
 &=L^2ZD^2\\
 &=(\alpha^2+\beta^2)\gamma^2+\alpha^2\beta^2\\
 &=\beta^2\gamma^2+\gamma^2\alpha^2+\alpha^2\beta^2\\
 &=4(a^2+b^2+c^2).
\end{aligned}
$$

그러므로 $$S=\sqrt{a^2+b^2+c^2}=\left\lVert u\right\rVert$$입니다.

다음은 방향입니다. 삼각형 $$XYZ$$를 $$yz$$평면에 정사영하면 $$X$$가 $$O$$로 옮겨져 삼각형 $$OYZ$$가 됩니다. 나머지 두 좌표평면으로의 정사영도 각각 $$OZX$$, $$OXY$$입니다.

평면 위 도형을 다른 평면으로 정사영할 때, 넓이는 두 평면 사이 각의 코사인만큼 줄어듭니다. 두 평면의 교선 방향을 밑변으로 잡으면 밑변은 그대로이고, 그에 수직인 높이만 코사인만큼 줄어드는 것으로 이해할 수 있습니다. 이때 두 평면 사이의 각은 적절히 잡은 단위 법선 사이의 각과 같습니다.

$$XYZ$$의 단위 법선 중 세 성분이 양수인 것을 $$n=(n_x,n_y,n_z)$$라 합시다. $$yz$$평면의 법선은 $$x$$축 방향이고, $$n$$이 단위벡터이므로 그 방향과 이루는 각의 코사인은 $$n_x$$입니다. 따라서 세 정사영의 넓이는

$$
a=Sn_x,\qquad b=Sn_y,\qquad c=Sn_z.
$$

즉,

$$
(a,b,c)=Sn.
$$

세 좌표면의 넓이를 성분으로 모은 벡터는 기울어진 면의 **넓이와 법선 방향을 함께 기록**합니다.

이제 두 삼각뿔의 높이로 돌아오면, $$h_O+h_P$$는 $$\overrightarrow{OP}=v$$를 $$n$$방향으로 정사영한 길이입니다. $$n$$은 $$u$$와 같은 방향이므로 $$h_O+h_P=\left\lVert v\right\rVert\cos\theta$$입니다. 앞 절의 두 부피 계산을 비교하여

$$
\frac13(ad+be+cf)
 =\frac13\left\lVert u\right\rVert\left\lVert v\right\rVert\cos\theta,
$$

따라서

$$
ad+be+cf=\left\lVert u\right\rVert\left\lVert v\right\rVert\cos\theta
$$

를 얻습니다. 2차원에서는 하나의 변이 담당하던 역할을, 3차원에서는 하나의 삼각형 면이 담당합니다. 좌표곱은 세 작은 삼각뿔의 부피로, 정사영은 공통 밑면을 가진 두 삼각뿔의 높이로 나타납니다.

## 6. 방향 있는 넓이와 부피

지금까지는 그림을 실제 넓이와 부피의 합으로 볼 수 있는 위치에 $$P$$를 두었습니다. 하지만 내적은 음수가 될 수도 있고, 벡터는 어느 방향으로나 움직일 수 있습니다. 그림을 일반적인 벡터까지 확장하려면 **크기뿐 아니라 방향도 기록**해야 합니다.

2차원에서 $$u=(a,b)$$를 고정하여 만든 $$A=(0,a)$$, $$B=(b,0)$$에 대해 삼각형 $$OBP$$와 $$OPA$$를 꼭짓점 순서대로 읽어 봅시다. 반시계 방향이면 양수, 시계 방향이면 음수인 넓이를 쓰면, 임의의 입력벡터 $$v=(c,d)$$와 그 끝점 $$P=(c,d)$$에 대해

$$
\mathcal A(v)
 :=\left[OBP\right]_{\mathrm{or}}+\left[OPA\right]_{\mathrm{or}}
 =\frac12(bd+ac)
$$

입니다. $$P$$가 좌표축을 넘어가더라도 이 식은 그대로 유지됩니다. 사각형이 더는 볼록하지 않거나 일부가 겹치는 경우에도, 겹친 부분이 부호에 따라 더해지거나 상쇄됩니다.

3차원에서도 각 좌표평면에 대해 양의 축 방향을 양의 높이로 정합니다. 그러면 $$u=(a,b,c)$$로 정한 세 밑면에 $$v=(d,e,f)$$의 끝점 $$P$$를 붙여 얻는 방향 있는 부피의 합은

$$
\mathcal V(v)=\frac13(ad+be+cf)
$$

입니다. 이때 $$\mathcal V(v)$$는 모든 배치에서 하나의 볼록 입체의 보통 부피를 뜻하는 것이 아니라, 방향을 반영한 부피들의 합입니다.

따라서 위 그림에서 높이의 합으로 읽었던 값도 일반적으로는 방향 있는 높이의 차이로 읽어야 합니다. $$u$$와 $$v$$가 둔각을 이루면 $$u$$방향으로 잰 $$v$$의 정사영이 음수가 됩니다. 계수의 부호는 축의 방향을 바꾸어 다룰 수 있고, 일부 성분이 $$0$$인 경우에도 결과는 연속적으로 이어집니다. 다만 영벡터에는 방향이나 각이 정의되지 않으므로, 코사인을 쓰는 표현은 두 벡터가 모두 영벡터가 아닐 때로 한정합니다. 영벡터가 포함되면 좌표곱의 합은 바로 $$0$$입니다.

방향을 버리고 넓이나 부피의 크기만 남겼다면 $$v$$와 $$-v$$는 같은 값으로 측정되었을 것입니다. 이제는 입력의 방향을 뒤집으면 측정값의 부호도 뒤집힙니다. 이 성질을 덧셈과 배수에 대해서까지 살펴보면, 그림이 하나의 선형함수로 읽히기 시작합니다.

## 7. 선형함수와 쌍대공간

여기까지의 그림을 쌍대공간의 정의를 이해하는 출발점으로 삼아 보고 싶습니다.[^6] 핵심은 두 벡터에 서로 다른 역할을 주는 데 있습니다. **벡터 $$u$$ 하나를 고정해 측정의 기준으로 삼고, 다른 벡터 $$v$$를 그 기준에 넣어 보는 것입니다.**

앞의 양의 성분 구성에서 $$u$$를 고정하면, 2차원에서는 선분 $$AB$$가, 3차원에서는 세 좌표면 위의 밑면들이 정해집니다. $$v$$의 끝점을 움직이면 그때마다 방향 있는 넓이나 부피가 정해지죠. 넓이에 $$2$$를, 부피에 $$3$$을 곱한 값을 읽으면 두 그림은 모두 하나의 규칙

$$
\ell_u(v)=u\cdot v
$$

을 나타냅니다. 그림의 관점에서는 밑변이나 밑면을 고정한 채 높이를 재는 것이고, 함수의 관점에서는 벡터를 입력받아 실수 하나를 돌려주는 것입니다.

이 측정법에는 특별한 성질이 있습니다. 입력벡터를 더하면 측정값도 더해지고, 입력벡터를 실수배하면 측정값도 같은 배수로 바뀝니다.

$$
\ell_u(v+w)=\ell_u(v)+\ell_u(w),\qquad
 \ell_u(tv)=t\ell_u(v).
$$

고정된 법선 방향으로 잰 방향 있는 정사영 길이에 관한 성질이며, 좌표식으로도 바로 확인됩니다. 이 **선형성**을 남긴 채, 측정법을 만들 때 썼던 구체적인 삼각형과 삼각뿔은 잠시 잊어 봅시다. 어떤 벡터공간에서든 이러한 규칙을 따르는 측정법들을 한데 모아 새로운 공간으로 다룰 수 있지 않을까요?

이 질문에서 자연스럽게 다음 정의에 도달합니다. 실벡터공간 $$V$$의 쌍대공간은

$$
V^*=\{\ell:V\to\mathbb R\mid\ell\text{은 선형함수}\}
$$

입니다. 두 측정법의 결과를 더하거나 한 측정법의 결과를 실수배해도 다시 선형적인 측정법이 되므로, 이들은 실제로 하나의 벡터공간을 이룹니다. **공간 안의 벡터를 다루던 자리에서, 그 벡터를 선형적으로 측정하는 방법 자체를 대상으로 삼은 것**입니다. 넓이와 부피의 그림에서 쌍대공간으로 넘어가는 추상화를 저는 이렇게 이해하고 싶습니다.

이 정의에는 길이나 각, 내적이 필요하지 않습니다. 내적은 우리가 출발한 그림에서 $$u$$를 측정법 $$\ell_u$$로 바꾸어 주었던 추가 구조입니다. 유한차원 실내적공간에서는 모든 선형함수를 유일한 $$u$$에 대해 $$\ell_u(v)=\langle u,v\rangle$$로 나타낼 수 있지만, 이 대응은 선택한 내적에 의존합니다. 따라서 벡터와 쌍대벡터를 대응시킬 수 있다는 사실과 두 대상의 역할이 같다는 말은 구별해야 합니다.

이제 처음의 식으로 돌아가면

$$
ax+by=c
 \qquad\Longleftrightarrow\qquad
 \ell_{(a,b)}(x,y)=c
$$

는 고정된 측정법이 같은 값을 주는 점들을 모은 것입니다. $$c$$를 바꾸면 평행한 직선들이 생기고, 두 측정값의 차이의 절댓값을 $$\sqrt{a^2+b^2}$$로 나누면 그 사이의 거리가 됩니다. 처음에는 넓이로 읽었던 일차식이, 이제는 공간의 점들을 같은 측정값에 따라 나누는 선형함수로 읽힙니다.

지금까지의 내용을 정리해 보자면, 좌표곱을 넓이로 이해하려던 작은 질문에서 출발해, 같은 도형을 다르게 나누며 정사영을 만났고, 그 도형이 벡터를 측정하는 방식을 추상화하며 쌍대공간에 이르렀습니다. 이처럼 제게는 새로운 공식을 하나 더 얻는 것만큼이나, **이미 알고 있던 계산이 어떤 그림을 담고 있었는지, 그 그림에서 무엇을 남겨 다음 개념으로 가져갈 수 있는지**를 알아보는 과정이 흥미롭습니다.

그럼 다음 글에서 뵙겠습니다!

[^1]: 여기서는 $$b\ne0$$인 경우를 떠올리고 있습니다. $$b=0$$, $$a\ne0$$이면 $$x=c/a$$라는 수직선입니다.

[^2]: $$a\ne0$$일 때 $$t=(c-ab)/a$$만큼 $$x$$방향으로 옮기면 $$ax+by=c$$가 됩니다. 평행이동 전 좌표에서 $$P$$를 $$(x-t,y)$$로 읽으면 거리 공식의 분자는 $$\lvert a(x-t)+by-ab\rvert=\lvert ax+by-c\rvert$$입니다.

[^3]: 우선 $$a,b,c,d>0$$, $$ac+bd>ab$$인 볼록한 배치로 그립니다. 이때 $$O$$와 $$P$$는 $$AB$$의 반대쪽에 있고 두 대각선이 내부에서 만납니다. 다른 배치까지의 확장은 뒤에서 부호 있는 넓이로 다룹니다.

[^4]: 예를 들어 $$\alpha=\sqrt{2bc/a}$$, $$\beta=\sqrt{2ca/b}$$, $$\gamma=\sqrt{2ab/c}$$로 정하면 세 조건이 모두 성립합니다.

[^5]: 정확히는 $$d,e,f>0$$, $$d/\alpha+e/\beta+f/\gamma>1$$인 배치입니다. 그러면 $$OP$$가 삼각형 $$XYZ$$의 내부를 지나고 세 삼각뿔의 내부가 겹치지 않습니다.

[^6]: 쌍대공간이 역사적으로 이렇게 정의되었다는 뜻은 아닙니다. 이 글에서 따라온 그림을 그 정의의 동기로 삼아 보자는 것입니다.

</div>
