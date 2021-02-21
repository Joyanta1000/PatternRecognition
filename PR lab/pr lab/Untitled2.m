x = [1 3 2 4];
y = [2 3 1 3];
sum = 0;
sum_of_nex = 0;
sum_of_nex_y = 0;

for n = 1 : length(x)

  for k = 1 : x(n)
    next = k;
  end
  for k_1 = 1 : y(n)
    next_y = k_1;
  end
  
  multiply = next * next_y
  
  sum = sum + multiply;
end


for n = 1 : length(x)

  for k = 1 : x(n)
    nex = k*k;
  end
  for k_1 = 1 : y(n)
    nex_y = k_1 * k_1;
  end
  sum_of_nex = sum_of_nex+nex;
  sum_of_nex_y = sum_of_nex_y + nex_y;
end

ino = sum_of_nex * sum_of_nex_y;
norm_den = sqrt(ino);

norm_corr = sum / norm_den;
