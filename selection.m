function parent = selection(individual)
global N_INDIVIDUAL;
global CUMULATIVE_FITNESS;

roulete = rand(1, N_INDIVIDUAL);
for i = 1 : N_INDIVIDUAL
    for j = 1 : N_INDIVIDUAL
        if roulete(i) <= CUMULATIVE_FITNESS(j)
            parent(i) = j;
            break;
        end
    end
end