function fitness(individual)
global N_INDIVIDUAL; global N_GEN; global N_VAR;
global LB; global UB;
global TOTAL_BIT;
global GLOBAL_BEST_FITNESS; global BEST_FITNESS;
global I_GENERATION;
global BEST_X; global AVG_FITNESS; global MAX_FITNESS; global MIN_FITNESS; global TOTAL_FITNESS;
global FITNESS_PROBABILITY;
global CUMULATIVE_FITNESS;
global SEARCH_METHOD;

x = [];
z = N_GEN/N_VAR;
for i = 1 : N_VAR
    for j=1 : N_INDIVIDUAL
        x_tmp(j) = 0;
    end
    for j=1 : N_INDIVIDUAL
        for k=1 : z
            if individual(j, k+(z*(i-1))) == 1
                x_tmp(j) = x_tmp(j) + (2^(k-1));
            end
        end
    end
    x = [x x_tmp];
end
%menghitung nilai x berdasarkan upperbound dan lowerbound
x_inrange = [];
for i = 1 : N_VAR
    r = UB(i)-LB(i);
    range = LB(i) + ((r/TOTAL_BIT) * x(1+((i-1)*N_INDIVIDUAL):(i*N_INDIVIDUAL)));
    x_inrange = [x_inrange range];
end
%hitung nilai fitness dari seluruh individu
for i=1 : N_INDIVIDUAL
    fitness(i) = 10.4 + x_inrange(i) * (sin(3*pi*x_inrange(i))) + x_inrange(i+N_INDIVIDUAL) * (sin(13*pi*x_inrange(i+N_INDIVIDUAL)));
    if SEARCH_METHOD == 'MIN'
        fitness(i) = 1/fitness(i);
        if GLOBAL_BEST_FITNESS > fitness(i)
            BEST_FITNESS(I_GENERATION) = fitness(i);
            GLOBAL_BEST_FITNESS = fitness(i);
            for j=1 : N_VAR
                BEST_X(j) = x_inrange(i+((j-1)*N_INDIVIDUAL));
                BEST_X(j) = 1 / BEST_X(j);
            end
        else
            BEST_FITNESS(I_GENERATION) = GLOBAL_BEST_FITNESS;
        end
    else
        if GLOBAL_BEST_FITNESS < fitness(i)
            BEST_FITNESS(I_GENERATION) = fitness(i);
            GLOBAL_BEST_FITNESS = fitness(i);
            for j=1 : N_VAR
                BEST_X(j) = x_inrange(i+((j-1)*N_INDIVIDUAL));
            end
        else
            BEST_FITNESS(I_GENERATION) = GLOBAL_BEST_FITNESS;
        end
    end
    
end
AVG_FITNESS(I_GENERATION) = mean(fitness);
MAX_FITNESS(I_GENERATION) = max(fitness);
MIN_FITNESS(I_GENERATION) = min(fitness);
TOTAL_FITNESS = sum(fitness);
for i=1 : N_INDIVIDUAL
    FITNESS_PROBABILITY(i) = fitness(i)/TOTAL_FITNESS;
end

CUMULATIVE_FITNESS = cumsum(FITNESS_PROBABILITY);