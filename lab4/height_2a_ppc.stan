data{
  int<lower=0> N;
  real weight[N];
}

generated quantities {
  real alpha=normal_rng(155,8);
  real beta=normal_rng(0, 1);
  real<lower=0> sigma=normal_rng(4, 1);
  real height[N];

  for (i in 1:N){
    height[i] = normal_rng(alpha + beta*weight[i], sigma);
  }
}