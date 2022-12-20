# GRM

## Statistical modelling

### Transformations

## Exponential family of distributions

### $f(y;\theta)=\mathrm{exp} \{a(y)b(\theta)+c(\theta)+d(y)\}$

### $a(y)$

- $a(y)=y$
- $\mathrm{E}\{a(Y)\}=-\frac{c'(\theta)}{b'(\theta)}$
- $\mathrm{var}\{a(Y)\}$

#### Maximum likelihood estimation

## Introduction to GLMs

### Model matrix

#### $X=(\textbf{x}^T_1,...,\textbf{x}^T_n)^T$, $n\times p$

### Parameters

#### $\beta=(\beta_1,...,\beta_p)^T$, $p$

### Link function

- $\mu_i=\mathrm{E}(Y_i)$
- $g(\mu_i)=\textbf{x}^T_i\beta$

### $Y_i \sim f(y;\theta)=\mathrm{exp} \{yb(\theta)+c(\theta)+d(y)\}$

## Multiple regression

### Simple Linear Model

### Normal Linear Model

#### Least squares estimation

#### Residuals

- $P_X=X(X^TX)^{-1}X^T$.
- $e=(I_n-P_X)y$
- $\sum^n_{i=1}e_i=0$
- $\mathrm{E}(\textbf{E}|X)=0$
- $\mathrm{var}(\textbf{E}|X)=\sigma^2(I_n-P_X)$

#### Estimation of $\sigma^2$

#### $\dot{x}=x-\bar{x}$

## Inference for linear models

### Single linear function of $\beta$

#### $\lambda=c^T \beta$

#### Estimate standard error

- $\textrm{ESE}(c^T\hat{\beta})$
- $\textrm{ESE}(\hat{\beta}_r )$

#### t-statistic for $\hat{\lambda}$

#### 95% confidence interval for $\hat{\lambda}$

#### Future responses of $\beta$

### Single linear function of $\dot{\beta}$

#### Estimated standard error

- $\textrm{ESE}(c_0\hat{\gamma}+c^T\hat{\dot{\beta}})$
- $\textrm{ESE}(\hat{\dot{\beta}}_r)$

#### Future responses of $\dot{\beta}$

### Two simple linear regression

### Tests of the hypotheses

#### $\textrm{H}_0:\beta=0$

#### $\textrm{H}_0:\dot{\beta}=0$

#### $\textrm{H}_0:\beta_{q+1}=...=\beta_k=0$

#### Testing fit of model with replicate data

##### [Lake of Fit](Lack-of-Fit.md)

##### Pure Error

##### Between groups Sum of Squares

##### Within groups Sum of Squares

##### $\textrm{H}_0:$ responses have linear regression on $x$

## Generalized linear models

### Canonical link functions

#### $b(\theta)$ from $f(y;\theta)=\mathrm{exp} \{a(y)b(\theta)+c(\theta)+d(y)\}$

#### $g(\mu_i)=b(\mu_i)$

### Estimation

#### use MLE to fit a GLM

#### iterative procedure to determine the MLEs

## Generalized linear mixed models

### fixed effects

### random effects
