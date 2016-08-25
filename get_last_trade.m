
function shareprice = get_last_trade(stock_symbol)

stock_symbol = upper(stock_symbol);
str1 = 'http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22';
str2 = '%22)%0A%09%09&format=json&diagnostics=true&env=http%3A%2F%2Fdatatables.org%2Falltables.env&callback=cbfunc';

urlstring = strcat(str1,stock_symbol,str2);

string = urlread(urlstring);

startpointer = strfind(string,'"LastTradePriceOnly"');

i = startpointer + 22; % For first character after "
j = 1;
while(string(i) ~= '"')
    last_trade(j) = string(i);
    j = j + 1;
    i = i + 1;
end
j = j - 1;
shareprice = last_trade;