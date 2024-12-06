% 求取大于活等于x的最小2的幂
function result = nextpow2(x)
    if x == 0
        result = 1;
    else
        result = 2.^ ceil(log2(x));
    end
end