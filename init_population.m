function individual = init_population()
global UB;
global LB;
global N_INDIVIDUAL;
global N_GEN;
global TOTAL_BIT;
global REAL_VALUE;
r = max(UB)-min(LB); % range paling maksimum diantara range semua variabel
% menentukan banyaknya angkat dibelakang koma untuk perhitungan fitness,
% cth : 12.12345 (5 angka dibelakang koma)

r = r * 10 ^ REAL_VALUE;
% menentukan parameter populasi, khusus untuk penentuan jumlah kromosom,
% perlu ada perhitungan lebih lanjut
% menentukan parameter jumlah gen dalam kromosom
TOTAL_BIT = 1;
power = 0;
while(TOTAL_BIT < r)
    power = power + 1;
    TOTAL_BIT = TOTAL_BIT + (2 ^ power);
end
power = power + 1;
N_GEN = power * 2;

individual = floor(rand(N_INDIVIDUAL, N_GEN) * 2);