# 拟合欠佳检验

## Lack of Fit

 **LFSS**: "**lake-of-fit sum squares**" represents variability of $y$ that cannot be explained by the *given model*. This value may be reduced if a better model is used.

 即当前模型所产生的误差

## Pure Error

**PESS**: "**pure-error sum of squares**" measures the *inherent variability* of $y$ which cannot be explained by any model.

即系统的固定误差，不能被任何模型所解释

## F-statistic

$$
F=\dfrac{\textrm{LFSS/degrees of freedom}}{\textrm{PESS/degrees of freedom}}
$$

## Mathematical details

For a given model

$$
\mathbf{Y}=\mathbf{X}\beta+\epsilon
$$

### one-way classification

suppose $Y_{jk}\in\mathbf{Y}$ are independent with distributions $N(\mu_j,\sigma^2)$, where $j=1,...g$; $k=1,...,n_j$.

$$
\mu_j=\beta_0+\beta_1x_j
$$

即把 $Y_{ij}$ 分组, 在不同 $j$ 组中的 $Y_{ij}$ 服从不同的分布

### $\mathrm{H}_0: \mu_1=...=\mu_g$

即假设$Y_{ij}$ 服从相同的分布, i.e. 假设响应变量对 $x$ 有线性回归关系

构造 $F$ 统计量: 
$$F=\dfrac{\textrm{hypothesis MS}}{\textrm{within-groups MS}}=\dfrac{(\textrm{between-groups SS}-\textrm{regression SS})/(g-2)}{\textrm{within-groups SS}/(n-g)}$$

其中 $\textrm{between-groups SS}=\sum_j n_j(\bar{y}_j-\bar{y})^2$, $\textrm{within-groups SS}=\sum_j\sum_k n_j(y_{jk}-\bar{y}_j)^2$.
另外 $\textrm{total SS}=\sum_j\sum_k (y_{jk}-\bar{y})^2$.

如果NULL假设成立, 那么 $\textrm{between-groups SS}$ 不会过大.

## apply in R

```r
anova(lm(y~x),lm(y~as.factor(x)))
```
