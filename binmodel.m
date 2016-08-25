
%%% Start of binmodel subroutine %%%%%% 

function [OptionValue, O, P, ST] =  binmodel(AssetPrice, StrikePrice, InterestRate, NumberofSteps, TimeofExpiry, Volatility, OptionType1, OptionType2)

A = AssetPrice;
E = StrikePrice;
vol = Volatility;
dt = (TimeofExpiry/NumberofSteps)/12;
r = InterestRate;      

TotalElements = (NumberofSteps + 1)*(NumberofSteps + 2)/2;
global prob;
S = zeros(1, TotalElements, 'double');
prob = zeros (1, TotalElements, 'double');
u = 1 + vol * sqrt(dt);
v = 1 - vol * sqrt(dt);
p = (exp(r * dt) - v)/(u - v);


S(1) = A;
prob(1) = 1;
terms_p = 1; % terms passed, index_p = index of term that has passed, index_w = index of term on which we are working.


for level =  1 : NumberofSteps
   index_p = terms_p - level+ 1;
   index_w = terms_p + 1;
     
%    S(index_w) = v * S(index_p);
  % index_w = index_w + 1;
   for i = index_p : terms_p
       prob(index_w) = prob(index_w) + (1-p) * prob(index_p);
       S(index_w) = v * S(i); 
       
       prob(index_w + 1) = prob(index_w + 1) + p * prob(index_p);
       S(index_w + 1) = u * S(i);       
       
       index_w = index_w + 1;
   end
   
   terms_p = terms_p + level + 1;     
   
end


% Euro Call Option
% Pay- off function = V = max(S - E, 0 ) 

global vc;
vc = zeros(1, TotalElements, 'double');

for i = (TotalElements - NumberofSteps) : TotalElements
    %%% Call Option %%%%
    if (OptionType2 == 1)       
        
        vc(i) = max((S(i) - E),0);
        
        
        
    %%%%% Put Option %%%% 
    elseif (OptionType2 == 2)
        vc(i) = max((E - S(i)), 0);
    end
end

for level = NumberofSteps-1 : -1 : 0
    vindex_p = (level + 2)*(level + 3)/2;
    vindex_w = (level + 1)*(level + 2)/2;
    
    start = vindex_w;
    for i = start : -1 : vindex_w - level
        temp = exp(-1 * r * dt) * (( p)* vc(vindex_p) + (1-p)*vc(vindex_p-1));
        vindex_p = vindex_p - 1;
        %%%%% If European Option %%%%%%%
        if(OptionType1 == 1)
            vc(i) = temp;
        %%%%% If American Option %%%%%%%%
        elseif (OptionType1 == 2)
            %%% Call Option %%%%
            if (OptionType2 == 1)
                vc(i) = max((S(i) - E), 0);
                %%%%% Put Option %%%% 
            elseif (OptionType2 == 2)
                vc(i) = max((E - S(i)), 0);
            end
            vc(i) = max(temp, vc(i));                   
        end
    end
end

OptionValue = vc(1);

global P;
global O;
global ST;
P = zeros (NumberofSteps + 1, 2*NumberofSteps + 1, 'double');
O = zeros (NumberofSteps + 1, 2*NumberofSteps + 1, 'double');
ST = zeros (NumberofSteps + 1, 2*NumberofSteps + 1, 'double');


index = 1;
start = int8((2*NumberofSteps+1)/2);
P(1, start) = prob(1);
O(1, start) = vc(1);
ST(1, start) = S(1);
index = index + 1;

for level = 1 : NumberofSteps
    a = start - 1;
    for t = 0 : level
        P(level + 1, a) = prob(index);
        O(level + 1, a) = vc(index);
        ST(level + 1, a) = S(index);       
        a = a + 2;        
        index = index + 1;        
    end
    start = start -1;
end