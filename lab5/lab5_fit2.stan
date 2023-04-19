data {
    int<lower=0> N;
    array[N] real<lower=0> milesFlown;
    array[N] int<lower=0> accidents;
}

parameters {
   array[N] real alfa;
   real theta;
}

transformed parameters {
   array[N] real lambda;
   for (i in 1:N) {
       lambda[i] = exp(alfa[i] + theta * milesFlown[i]);
    }
}

model {
   alfa ~ normal(2.5, 0.001);
   theta ~ normal(0.0001, 0.00005);
   accidents ~ poisson(lambda);
}

generated quantities {
    array[N] int<lower=0> y;
    for (i in 1:N) {
       y[i] = poisson_rng(lambda[i]);
    }
}