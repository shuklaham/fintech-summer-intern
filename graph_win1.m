function [hist_close,hist_date] = volatility_graph(stock_symbol,flag)


% Define starting year (the further back in time, the longer it takes to download)

[this_year, this_month, this_day] = datevec(date);

                
        
        if(flag == 1) %%% for 1 month
        % date cases        
            start_day = this_day - 3;
            start_month = this_month - 1;
            start_year = this_year;
            
            end_year = this_year;
            end_month = this_month;
            end_day = this_day -3;
            
            if((this_month == 1) && (this_day >3))
                start_year = this_year - 1;
                start_month = 12;
                
            elseif((this_month == 1) && (this_day < 3))
                start_year = this_year - 1;
                start_month = 11;
                start_day = this_day - 3 + 31;
                
                end_day = this_day - 3  + 31;
                end_month = 12;
                end_year = this_year -1;
                
            elseif((this_month == 2) && (this_day <= 3))
                start_year = this_year - 1;
                start_month = 12;
                start_day = this_day - 3 + 31;
                
                end_day = this_day - 3  + 31;
                end_month = 1;
                
            elseif(this_day < 3)
                start_day = this_day - 3 + 31;
                start_month = this_month - 2;
                
                end_month = this_month - 1;
                end_day = this_day - 3 + 31;
            end
            
        else
            start_day = this_day - 3;
            start_month = this_month - 3;
            start_year = this_year;
            
            end_year = this_year;
            end_month = this_month;
            end_day = this_day -3;
            
            if((this_month <=3) && (this_day >3))
                start_year = this_year - 1;
                start_month = this_month - 3 + 12;
                
            elseif((this_month <=3) && (this_day <= 3))
                start_year = this_year - 1;
                start_month = this_month -4 + 12;
                start_day = this_day - 3 + 31;
                
                end_day = this_day - 3  + 31;
                end_month = this_month -1;
                end_year = this_year -1;
                
            elseif((this_month == 1) && (this_day < 3))
                start_year = this_year - 1;
                start_month = this_month - 4 + 12;
                start_day = this_day - 3 + 31;
                
                end_day = this_day - 3  + 31;
                end_month = 12;
                end_year = this_year - 1;
                
            elseif(this_day < 3)
                start_day = this_day - 3 + 31;
                start_month = this_month - 4;
                
                end_month = this_month - 1;
                end_day = this_day - 3 + 31;
            end
        end
         %%% Febuary case
       if(((start_month == 2) && (start_day == 31 || start_day == 30)) || ((end_month == 2) && (end_day == 31 || end_day == 30)))
           start_day = 28;
           end_day = start_day;
       end
       
        
   % Build URL string
   global url_string;
url_string = 'http://ichart.finance.yahoo.com/table.csv?';
url_string = strcat(url_string, '&s=', upper(stock_symbol)   );
url_string = strcat(url_string, '&a=', num2str(start_month-1) );
url_string = strcat(url_string, '&b=', num2str(start_day)     );
url_string = strcat(url_string, '&c=', num2str(start_year)    );    
url_string = strcat(url_string, '&d=', num2str(end_month-1)    );
url_string = strcat(url_string, '&e=', num2str(end_day)    );
url_string = strcat(url_string, '&f=', num2str(end_year)    );
url_string = strcat(url_string, '&g=d&ignore.csv');
%url_string = strcat('http://ichart.finance.yahoo.com/table.csv?s=',stock_symbol,'&a=05&b=10&c=2011&d=05&e=30&f=2011&g=d&ignore=.csv');


% Open a connection to the URL and retrieve data into a buffer
buffer      = java.io.BufferedReader(...
              java.io.InputStreamReader(...
              openStream(...
              java.net.URL(url_string))));


% Read the first line (a header) and discard
dummy   = readLine(buffer);


% Read all remaining lines in buffer
ptr = 1;
while 1
    % Read line
    buff_line = char(readLine(buffer)); 
    
    % Break if this is the end
    if length(buff_line)<3, break; end
    
    % Find comma delimiter locations
    commas    = find(buff_line== ',');
    
    % Extract high, low, open, close, etc. from string
    DATEvar   = buff_line(1:commas(1)-1);
    OPENvar   = str2num( buff_line(commas(1)+1:commas(2)-1) );
    HIGHvar   = str2num( buff_line(commas(2)+1:commas(3)-1) );
    LOWvar    = str2num( buff_line(commas(3)+1:commas(4)-1) );
    CLOSEvar  = str2num( buff_line(commas(4)+1:commas(5)-1) );
    VOLvar    = str2num( buff_line(commas(5)+1:commas(6)-1) );
    adj_close = str2num( buff_line(commas(6)+1:end) );

    %Adjust for dividends, splits, etc.
    DATEtemp{ptr,1} = DATEvar;
    OPENtemp(ptr,1) = OPENvar  * adj_close / CLOSEvar;
    HIGHtemp(ptr,1) = HIGHvar  * adj_close / CLOSEvar;
    LOWtemp (ptr,1) = LOWvar   * adj_close / CLOSEvar;
    CLOSEtemp(ptr,1)= CLOSEvar * adj_close / CLOSEvar;
    VOLtemp(ptr,1)  = VOLvar;

    ptr = ptr + 1;
end

% Reverse to normal chronological order, so 1st entry is oldest data point
hist_date  = flipud(DATEtemp);
%hist_open  = flipud(OPENtemp);
%hist_high  = flipud(HIGHtemp);
%hist_low   = flipud(LOWtemp);
hist_close = flipud(CLOSEtemp);
%hist_vol   = flipud(VOLtemp);
end