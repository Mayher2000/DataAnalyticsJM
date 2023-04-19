
data {
    int<lower=0> N;  // Years analyzed
    array[N] real<lower=0> milesFlown;  // Miles flown each year 
}

generated quantities {
    real alfa = normal_rng(1.8, 0.001);
    real theta = normal_rng(0.0002, 0.00005);
    array[N] real lambda;
    array[N] real<lower=0> y; // Number of accidents

    for (i in 1:N) {
       lambda[i] = exp(alfa + theta * milesFlown[i]);
       y[i] = poisson_rng(lambda[i]);
    }
}