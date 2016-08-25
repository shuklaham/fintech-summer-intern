function [OptionValue, OVarray, t, S] = blackscholes(OptionType, AssetPrice, StrikePrice, InterestRate, ...
          TimeofExpiry, Volatility)
      
S = 0 : 2*StrikePrice/20 : 2 * StrikePrice - 2*StrikePrice/20;

T = TimeofExpiry;
t = 0 : T/10 : T - T/10;
d1 = zeros(20,10);
d2 = zeros(20,10);
OVarray = zeros(20,10);
E = StrikePrice;
r = InterestRate;
v = Volatility;

if(OptionType == 1) %%% Call %%%
    a = (log(AssetPrice/E) + (r + 0.5 * v * v)*T)/v*sqrt(T);
    b = a - v * sqrt(T);
    OptionValue = (AssetPrice * normcdf(a, 0, 1)) - (E * exp(-1 * r * T) * normcdf(b,0,1));
    for i = 1 : 20
        for j = 1 : 10
            d1(i,j) = (log(S(i)/E) + (r + 0.5 * v * v)*(T - t(j)))/v * sqrt(T - t(j));
            d2(i,j) = d1(i,j) - v * sqrt(T - t(j));
            OVarray(i,j) = (S(i)* normcdf(d1(i,j),0,1)) - (E * exp(-1 * r * (T - t(j)))* normcdf(d2(i,j),0,1));
            if(S(i) <= E)
                OVarray(i,j) = 0;
            end
        end
    end
else %%% Put Option
    a = (log(AssetPrice/E) + (r + 0.5 * v * v)*T)/v*sqrt(T);
    b = a - v * sqrt(T);
    OptionValue = -(AssetPrice * normcdf(-a, 0, 1)) + (E * exp(-1 * r * T) * normcdf(-b,0,1));
    for i = 1 : 20
        for j = 1 : 10
            d1(i,j) = (log(S(i)/E) + (r + 0.5 * v * v)*(T - t(j)))/v * sqrt(T - t(j));
            d2(i,j) = d1(i,j) - v * sqrt(T - t(j));
            OVarray(i,j) = -(S(i)* normcdf(-d1(i,j),0,1)) + (E * exp(-1 * r * (T - t(j)))* normcdf(-d2(i,j),0.1));
            if(S(i) >= E)
                OVarray(i,j) = 0;
            end
        end
    end
end
    
%surf(t,S,OVarray);


