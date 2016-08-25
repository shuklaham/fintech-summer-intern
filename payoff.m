function varargout = payoff(varargin)
% PAYOFF M-file for payoff.fig
%      PAYOFF, by itself, creates a new PAYOFF or raises the existing
%      singleton*.
%
%      H = PAYOFF returns the handle to a new PAYOFF or the handle to
%      the existing singleton*.
%
%      PAYOFF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAYOFF.M with the given input arguments.
%
%      PAYOFF('Property','Value',...) creates a new PAYOFF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before payoff_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to payoff_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help payoff

% Last Modified by GUIDE v2.5 15-Oct-2011 15:39:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @payoff_OpeningFcn, ...
                   'gui_OutputFcn',  @payoff_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before payoff is made visible.
function payoff_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to payoff (see VARARGIN)

% Choose default command line output for payoff

handles.output = hObject;



%optionshandles = options;
%optionsdata = guidata(optionshandles);
axes(handles.axes1);
        
if(varargin{1} ==1)
    if(varargin{2} == 2) % Buy a Call option
        strikeprice1 = str2num(varargin{3});
        premium1 = str2num(varargin{5});
        x = 0 : 0.2 : 2 * strikeprice1;
        %for i = 1 : numel(x) 
        y = max(x - strikeprice1, 0) - premium1;
        
        %end
        plot(x,y,'g',x,0,'r',strikeprice1,0,'*r');
        xlabel('Share Price');
        ylabel('Value at Expiration');
    elseif(varargin{2} == 3) % Sell a Put option
        strikeprice1 = str2num(varargin{3});
        premium1 = str2num(varargin{5});
        x = 0 : 0.2 : 2 * strikeprice1;
        y = -1 * (max(strikeprice1 - x, 0)) + premium1;
        plot(x,y,'g',x,0,'r',strikeprice1,0,'*r');
        xlabel('Share Price');
        ylabel('Value at Expiration');       
    elseif(varargin{2} == 4) % Bull Spread using two calls; selling at higher strike price
        strikeprice1 = str2num(varargin{3});
        premium1 = str2num(varargin{5});
        strikeprice2 = str2num(varargin{4});
        premium2 = str2num(varargin{6});
        if(strikeprice1 > strikeprice2)
            x = 0 : 0.2 : (2*strikeprice1);
            %lsprice = strikeprice2;
            %hsprice = strikeprice1;
            y = max(x - strikeprice2,0) - premium2 + (-1) * max((x - strikeprice1),0) + premium1 ;
        else
            x = 0: 0.2 : (2*strikeprice2);
            %lsprice = strikeprice1;
            %hsprice = strikeprice2;
            y = max((x - strikeprice1),0) - premium1 + (-1) * max(x - strikeprice2,0) + premium2 ;
        end
        % buy a Call with a lower strike price and sell another Call with a
        % higher strike price.        
        plot(x,y,'r',x,0,'g',strikeprice1,0,'*r',strikeprice2,0,'*r');
        xlabel('Share Price');
        ylabel('Value at Expiration');           
    elseif(varargin{2} == 5) % Bull Spread using two puts; selling at higher strike price
        % buy a Put Option with a lower strike
        % price and sell another one with a higher strike price. In this case however, the Put Option with the lower
        % strike price will carry a higher premium than that with the higher strike price.
        strikeprice1 = str2num(varargin{3});
        premium1 = str2num(varargin{5});
        strikeprice2 = str2num(varargin{4});
        premium2 = str2num(varargin{6});
        if(strikeprice1 > strikeprice2)
            x = 0: 0.2 : (2*strikeprice1);
            y = (-1)* max((strikeprice1 - x),0) + premium1 + max((strikeprice2 - x),0) - premium2 ;
            
        else
            x = 0: 0.2: (2*strikeprice2);
            %lsprice = strikeprice1;
            %hsprice = strikeprice2;
            y = max((x - strikeprice1),0) - premium1+ (-1) * max((x - strikeprice2),0) + premium2 ;
        end
        plot(x,y,'r',x,0,'g',strikeprice1,0,'*r',strikeprice2,0,'*r');
        xlabel('Share Price');
        ylabel('Value at Expiration');          
    end
   elseif(varargin{1} == 2) % Bear Strategy
       if(varargin{2} == 2) % Sell a Call
           strikeprice1 = str2num(varargin{3});
           premium1 = str2num(varargin{5});
           x = 0 : 0.2 : 2 * strikeprice1;
           y = (-1)* max(x - strikeprice1, 0) + premium1;
           plot(x,y,'g',x,0,'r',strikeprice1,0,'*r');
           xlabel('Share Price');
           ylabel('Value at Expiration');
       elseif(varargin{2} == 3) % Buy a Put
           strikeprice1 = str2num(varargin{3});
           premium1 = str2num(varargin{5});
           x = 0 : 0.2 : 2 * strikeprice1;
           y = (max(strikeprice1 - x, 0)) - premium1;
           plot(x,y,'g',x,0,'r',strikeprice1,0,'*r');
           xlabel('Share Price');
           ylabel('Value at Expiration');  
       elseif(varargin{2} == 4) % Buy a Bear Spread using two Calls; sell with lower strike price 
           strikeprice1 = str2num(varargin{3});
           premium1 = str2num(varargin{5});
           strikeprice2 = str2num(varargin{4});
           premium2 = str2num(varargin{6});
           if(strikeprice1 > strikeprice2)
               x = 0 : 0.2 : (2*strikeprice1);
               y = max((x - strikeprice1),0) - premium1 + (-1) * max((x - strikeprice2),0) + premium2 ;
           else
               x = 0: 0.2 : (2*strikeprice2);
               y = max((x - strikeprice2),0) - premium2 + (-1) * max((x - strikeprice1),0) + premium1 ;
           end
           plot(x,y,'r',x,0,'g',strikeprice1,0,'*r',strikeprice2,0,'*r'); 
           xlabel('Share Price'); 
           ylabel('Value at Expiration'); 
       elseif(varargin{2} == 5) % Bear Spread using two Puts; selling with lower strike price
           strikeprice1 = str2num(varargin{3}); 
           premium1 = str2num(varargin{5});
           strikeprice2 = str2num(varargin{4});
           premium2 = str2num(varargin{6});
           if(strikeprice1 > strikeprice2)
               x = 0 : 0.2 : (2*strikeprice1);
               y = (-1)* max((strikeprice2 - x),0) + premium2 + max((strikeprice1 - x),0) - premium1;
           else
               x = 0: 0.2 : (2*strikeprice2);
               y = (-1)* max((strikeprice1 - x),0) + premium1 + max((strikeprice2 - x),0) - premium2;
           end
        plot(x,y,'r',x,0,'g',strikeprice1,0,'*r',strikeprice2,0,'*r');
        xlabel('Share Price');
        ylabel('Value at Expiration');
    end
    else
         if(varargin{2} == 2) % Straddle
            strikeprice1 = str2num(varargin{3});
            premium1 = str2num(varargin{5});
            strikeprice2 = str2num(varargin{4});
            premium2 = str2num(varargin{6});
            x = 0 : 0.2 : (2 * strikeprice1);
            if(strcmp(varargin{7},'Call Option')&& strcmp(varargin{8},'Put Option'))
                y = max((x - strikeprice1),0) + max((strikeprice2 - x),0) - premium1 - premium2;            
            elseif(strcmp(varargin{7},'Put Option')&& strcmp(varargin{8},'Call Option'))
                y = max((strikeprice1 - x(i)),0) + max((x(i) - strikeprice2),0) - premium1 - premium2;
            end
            plot(x,y,'r',x,0,'g',strikeprice1,0,'*r');
            xlabel('Share Price');
            ylabel('Value at Expiration');
         elseif(varargin{2} == 3) % Strangle
             strikeprice1 = str2num(varargin{3});
             premium1 = str2num(varargin{5});
             strikeprice2 = str2num(varargin{4});
             premium2 = str2num(varargin{6});
             x = 0 : 0.2 : (2 * max(strikeprice1,strikeprice2));
             if(strcmp(varargin{7},'Call Option')&& strcmp(varargin{8},'Put Option'))
                 y = max((x - strikeprice1),0) + max((strikeprice2 - x),0) - premium1 - premium2;                 
            elseif(strcmp(varargin{7},'Put Option')&& strcmp(varargin{8},'Call Option'))
                 y = max((strikeprice1 - x),0) + max((x - strikeprice2),0) - premium1 - premium2;
             end
            plot(x,y,'r',x,0,'g',strikeprice1,0,'*r',strikeprice2,0,'*r');
            xlabel('Share Price');
           ylabel('Value at Expiration');
         end       
end

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes payoff wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = payoff_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object deletion, before destroying properties.
function axes1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


