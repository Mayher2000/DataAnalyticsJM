data{

  int<lower=0> N;
  real heights[N];
  real weight[N];

}

parameters{

  real<lower=0> alpha;
  real<lower=0> beta;
  real<lower=0> sigma;

}

transformed parameters {

   real heights_pred[N];

    for(i in 1:N){
      heights_pred[i] = alpha + beta * weight[i];
    }

}

model {

   alpha~ normal(165,8);
   beta ~ lognormal(0,1);
   sigma ~ normal(4, 1); 
   heights ~ normal(heights_pred,sigma);

   for(i in 1:N){
    heights[i] ~ normal(heights_pred[i],sigma);
   }

}

generated quantities {

  real height[N];
  for(i in 1:N){
    height[i] = normal_rng(heights_pred[i], sigma);
  }
  
}