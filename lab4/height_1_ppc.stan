// This model is responsible for sampling mu and sigma
generated quantities {
  // First parameters:
//   real mu = normal_rng(170, 15); // sample mean from normal distribution
//   real sigma = normal_rng(15, 5); // sample standard deviation from normal distribution
//   real height = normal_rng(mu, sigma); 
  // Second parameters:
  real <lower=0> mu = normal_rng(155, 8); // sample mean from normal distribution
  real <lower=0> sigma = normal_rng(4, 1); // sample standard deviation from normal distribution
  real <lower=135, upper=180> height = normal_rng(mu, sigma); 
  
}