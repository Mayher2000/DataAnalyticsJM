data {
  int<lower=0> N;  // Number of observations
  real heights[N];  // Heights of people
}

parameters {
  real mu;  // Mean of heights
  real<lower=0> sigma;  // Standard deviation of heights
}

model {
  // Priors
  mu ~ normal(155, 8);
  sigma ~ normal(4, 1);

  // Likelihood
  heights ~ normal(mu, sigma);
}

generated quantities {
  real height_sim = normal_rng(mu, sigma);
}