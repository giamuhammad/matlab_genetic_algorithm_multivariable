clc;
% initial parameter
global N_INDIVIDUAL;
global N_VAR;
global REAL_VALUE;
global LB;
global UB;
global I_GENERATION;
global GLOBAL_BEST_FITNESS;
global BEST_FITNESS;
global BEST_X;
global AVG_FITNESS;
global MAX_FITNESS;
global MIN_FITNESS;
BEST_FITNESS = [];
BEST_X = [];
AVG_FITNESS = [];
MAX_FITNESS = [];
MIN_FITNESS = [];
global MUTATION_PROBABILITY;
global CROSSOVER_PROBABILITY;
global SEARCH_METHOD;
SEARCH_METHOD = 'MAX';
if SEARCH_METHOD == 'MAX'
    GLOBAL_BEST_FITNESS = -9999999; 
elseif SEARCH_METHOD == 'MIN'
    GLOBAL_BEST_FITNESS = 9999999;
end
N_INDIVIDUAL = 16; % individu per populasi
REAL_VALUE = 4; % 4 angka di belakang koma. semakin kecil jumlah gen pada kromosom juga akan semakin kecil
MUTATION_PROBABILITY = 0.1;
CROSSOVER_PROBABILITY = 0.8;
% diketahui untuk mencari nilai maksimum f(x1, x2) = 10.4+ x1 *
% sin(3*pi*x1) + x2 * sin(13*pi*x2) dimana
% -2 <= x1 <= 15.5 dan 3.27 <= x2 <= 8.75
UB = [15.5, 8.75]; % upper bound 
LB = [-2 3.27]; % lower bound
N_VAR = length(UB); % 2 variabel, x1 dan x2
N_GENERATION = 100;

individual = init_population();

for i=1 : N_GENERATION
    I_GENERATION = i;
    fitness(individual);
    parent = selection(individual);
    %individual
    new_individual = crossover(individual, parent);
    %new_individual
    individual = mutation(new_individual);
end

plot(BEST_FITNESS, 'Color', 'red', 'linewidth', 2);
hold on;
plot(MAX_FITNESS, 'Color', 'green');
plot(AVG_FITNESS, 'Color', 'blue');
plot(MIN_FITNESS, 'Color', 'black');
title('Best, Max, Mean, Min Fitness', 'fontweight', 'bold');
xlabel('Generation');
ylabel('f(x(i))');
legend('Best', 'Maximum', 'Mean', 'Minimum', 'Location', 'Southoutside', 'Orientation', 'Horizontal');
hold off;

disp('Best x(i)');
disp(BEST_X);
disp('Best Fitness Value');
disp(BEST_FITNESS(I_GENERATION));
%disp(MAX_FITNESS(I_GENERATION));
disp(AVG_FITNESS(I_GENERATION));
%disp(MIN_FITNESS(I_GENERATION));
