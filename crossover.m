function new_individual = crossover(individual, parent)
global N_INDIVIDUAL;
global CUMULATIVE_FITNESS;
global N_GEN;
global CROSSOVER_PROBABILITY;

%crossover_location = floor(rand(1,1) * (N_CHROMOSOME - 2)) + 1;
crossover_location = floor(CROSSOVER_PROBABILITY * (N_GEN - 2)) + 1;
new_individual = individual;
for i = 1 : (N_INDIVIDUAL/2)
    index = ((i-1)*2);
    for j = 1 : crossover_location
        %break;
        new_individual(index+1,j) = individual(parent(index+1), j);
        new_individual(index+2,j) = individual(parent(index+2), j);
    end
    for j = 1 : crossover_location
        new_individual(index+1,j) = individual(parent(index+2), j);
        new_individual(index+2,j) = individual(parent(index+1), j);
    end
end