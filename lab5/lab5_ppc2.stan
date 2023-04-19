data {
    int<lower=0> N;
    array[N] real<lower=0> milesFlown;
}

generated quantities {
    real theta = normal_rng(0.0001, 0.00005);
    array[N] real alfa;
    array[N] real lambda;
    array[N] int<lower=0> y; //number of accidents
    for (i in 1:N) {
        alfa[i] = normal_rng(2.5, 0.001);
        lambda[i] = exp(alfa[i] + theta * milesFlown[i]);
        y[i] = poisson_rng(lambda[i]);
    }
}