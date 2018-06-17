function individual = mutation(new_individual)
global MUTATION_PROBABILITY;
global N_INDIVIDUAL;
global N_GEN;

number_gen_mutation = round(MUTATION_PROBABILITY * (N_INDIVIDUAL * N_GEN));
mutation = ceil(rand(1, number_gen_mutation) * (N_INDIVIDUAL * N_GEN));
for i = 1 : number_gen_mutation
    indv_number = ceil(mutation(i) / N_GEN);
    gen_number = mod(mutation(i), N_GEN);
    if gen_number == 0
        gen_number = N_GEN;
    end
    if new_individual(indv_number, gen_number) == 1
        new_individual(indv_number, gen_number) = 0;
    else
        new_individual(indv_number, gen_number) = 1;
    end
end

individual = new_individual;