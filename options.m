function varargout = options(varargin)
% OPTIONS M-file for options.fig
%      OPTIONS, by itself, creates a new OPTIONS or raises the existing
%      singleton*.
%
%      H = OPTIONS returns the handle to a new OPTIONS or the handle to
%      the existing singleton*.
%
%      OPTIONS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OPTIONS.M with the given input arguments.
%
%      OPTIONS('Property','Value',...) creates a new OPTIONS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before options_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to options_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help options

% Last Modified by GUIDE v2.5 20-Oct-2011 13:27:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @options_OpeningFcn, ...
                   'gui_OutputFcn',  @options_OutputFcn, ...
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


% --- Executes just before options is made visible.
function options_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to options (see VARARGIN)

% Choose default command line output for options

handles.output = hObject;
global index;
global callflag;
global putflag;
global mylist;
%global where;
callflag = 0;
putflag = callflag;
win1handles = win1;
win1guidata = guidata(win1handles);

index = get(win1guidata.listbox1,'Value');

contents = get(win1guidata.listbox1,'String');
company_name = cell2mat(contents(index));



set(handles.companytitle,'String',company_name);

global introtext;
introtext = 'Select the nature of market from 1st panel.';
set(handles.helptext,'FontSize',25);
set(handles.helptext,'HorizontalAlignment','center');
set(handles.helptext,'String',introtext);

today = date;
monthnum = datevec(date);
monthnum = monthnum(2);
months = {'Jan';'Feb';'Mar';'Apr';'May';'Jun';'July';'Aug';'Sep';'Oct';'Nov';'Dec'};
j = 1;
for i = monthnum + 1 : monthnum + 5
    if(i>12)
        monthmenu{j} = months{rem(i,12)};
    else
        monthmenu{j} = months{i};
    end
    j = j + 1;
end
yearnum = str2num(today(8:11));
yearmenu = {num2str(yearnum);num2str(yearnum + 1);num2str(yearnum + 2)};
set(handles.callmonths,'String',monthmenu);
set(handles.putmonths,'String',monthmenu);
set(handles.callyears,'String',yearmenu);
set(handles.putyears,'String',yearmenu);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes options wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = options_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in callmonths.
function callmonths_Callback(hObject, eventdata, handles)
% hObject    handle to callmonths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns callmonths contents as cell array
%        contents{get(hObject,'Value')} returns selected item from callmonths


% --- Executes during object creation, after setting all properties.
function callmonths_CreateFcn(hObject, eventdata, handles)
% hObject    handle to callmonths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in callbox.
function callbox_Callback(hObject, eventdata, handles)
% hObject    handle to callbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns callbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from callbox


% --- Executes during object creation, after setting all properties.
function callbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to callbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in putbox.
function putbox_Callback(hObject, eventdata, handles)
% hObject    handle to putbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns putbox contents as cell array
%        contents{get(hObject,'Value')} returns selected item from putbox


% --- Executes during object creation, after setting all properties.
function putbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to putbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in callyears.
function callyears_Callback(hObject, eventdata, handles)
% hObject    handle to callyears (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns callyears contents as cell array
%        contents{get(hObject,'Value')} returns selected item from callyears


% --- Executes during object creation, after setting all properties.
function callyears_CreateFcn(hObject, eventdata, handles)
% hObject    handle to callyears (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in putmonths.
function putmonths_Callback(hObject, eventdata, handles)
% hObject    handle to putmonths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns putmonths contents as cell array
%        contents{get(hObject,'Value')} returns selected item from putmonths


% --- Executes during object creation, after setting all properties.
function putmonths_CreateFcn(hObject, eventdata, handles)
% hObject    handle to putmonths (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in putyears.
function putyears_Callback(hObject, eventdata, handles)
% hObject    handle to putyears (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns putyears contents as cell array
%        contents{get(hObject,'Value')} returns selected item from putyears


% --- Executes during object creation, after setting all properties.
function putyears_CreateFcn(hObject, eventdata, handles)
% hObject    handle to putyears (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in getcalloptions.
function getcalloptions_Callback(hObject, eventdata, handles)
% hObject    handle to getcalloptions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global index; % To get right ticker

global calladdtable;
global callexpiry;


% To make user first choose strategy
status1 = get(handles.nature_bull,'Value');
status2 = get(handles.nature_bear,'Value');
status3 = get(handles.nature_volatile,'Value');

if(status1 == 0 && status2 == 0 && status3 == 0)
    errordlg('Choose strategy first','Options')
else

% Preparing the URL    
mylist = {'MMM','AA','AXP','T','BAC','BA','CAT','CVX','CSCO','KO','DD','XOM',...
'GE','HPQ','HD','INTC','IBM','JNJ','JPM','KFT','MCD','MRK','MSFT','PFE','PG',...
'TRV','UTX','VZ','WMT','DIS'};

%win1handles = win1;
%win1guidata = guidata(win1handles);
%index = get(win1guidata.listbox1,'Value');

ticker = mylist(index);

% Month  for URL
listofmonths = {'Jan';'Feb';'Mar';'Apr';'May';'Jun';'July';'Aug';'Sep';'Oct';'Nov';'Dec'};
currentmonths = get(handles.callmonths,'String');
for i = 1 : 12
    if(strcmp(listofmonths{i},currentmonths{get(handles.callmonths,'Value')}))
        break;
    end
end

% Year for URL
year = get(handles.callyears,'String');

urlstring = 'http://finance.yahoo.com/q/op?s=';
urlstring = strcat(urlstring,ticker,'&m=',year{get(handles.callyears,'Value')},'-',num2str(i));


% Getting the expiry
expiry = getTableFromWeb_mod(cell2mat(urlstring),5);
callexpiry = expiry{2};
set(handles.callexpiry,'String',callexpiry);

% Getting the CAll Table
call_out_table = getTableFromWeb_mod(cell2mat(urlstring),6);

calladdtable = call_out_table;

% 2nd row onwards
[row col] = size(call_out_table);
for i = 2 : row
    for j = 1 : col -1
        call_out_table{i,1} = sprintf('%s%s%s',call_out_table{i,1},blanks(10),call_out_table{i,j+1});
        call_table{i,1} = call_out_table{i,1};
    end
end
% 1st row 
call_table{1,1} = sprintf('%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s',call_out_table{1,1},blanks(20),call_out_table{1,2}...
    ,blanks(28),call_out_table{1,3},blanks(10),call_out_table{1,4},blanks(10),call_out_table{1,5},blanks(10),...
     call_out_table{1,6},blanks(10),call_out_table{1,7},blanks(10),call_out_table{1,8}); 

set(handles.callbox,'Value',1); 
set(handles.callbox,'String',call_table);
end





% --- Executes on button press in getputoptions.
function getputoptions_Callback(hObject, eventdata, handles)
% hObject    handle to getputoptions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global index; % To get right ticker
global putflag; % Used in Add button
global putaddtable; % Put Option Table
putflag = 1;
global putexpiry;
global listofmonths; % used in Add options


status1 = get(handles.nature_bull,'Value');
status2 = get(handles.nature_bear,'Value');
status3 = get(handles.nature_volatile,'Value');

if(status1 == 0 && status2 == 0 && status3 == 0)
    errordlg('Choose strategy first','Options')
    
else
    
% Preparing the URL
mylist = {'MMM','AA','AXP','T','BAC','BA','CAT','CVX','CSCO','KO','DD','XOM',...
'GE','HPQ','HD','INTC','IBM','JNJ','JPM','KFT','MCD','MRK','MSFT','PFE','PG',...
'TRV','UTX','VZ','WMT','DIS'};

% win1handles = win1;
% win1guidata = guidata(win1handles);

% Getting Ticker 
ticker = mylist(index);
% Getting month 
listofmonths = {'Jan';'Feb';'Mar';'Apr';'May';'Jun';'July';'Aug';'Sep';'Oct';'Nov';'Dec'};
currentmonths = get(handles.callmonths,'String');
for i = 1 : 12
    if(strcmp(listofmonths{i},currentmonths{get(handles.putmonths,'Value')}))
        break;
    end
end
% Getting year
year = get(handles.putyears,'String');

urlstring = 'http://finance.yahoo.com/q/op?s=';
urlstring = strcat(urlstring,ticker,'&m=',year{get(handles.putyears,'Value')},'-',num2str(i));

% Getting the expiry details
expiry = getTableFromWeb_mod(cell2mat(urlstring),7);
putexpiry = expiry{2};

set(handles.putexpiry,'String',putexpiry);

% Getting the put table
put_out_table = getTableFromWeb_mod(cell2mat(urlstring),8);

putaddtable = put_out_table;


[row col] = size(put_out_table);
for i = 2 : row
    for j = 1 : col -1
        put_out_table{i,1} = sprintf('%s%s%s',put_out_table{i,1},blanks(10),put_out_table{i,j+1});
        put_table{i,1} = put_out_table{i,1};
    end
end

put_table{1,1} = sprintf('%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s',put_out_table{1,1},blanks(20),...
                 put_out_table{1,2},blanks(28),put_out_table{1,3},blanks(10),put_out_table{1,4},...
                 blanks(10),put_out_table{1,5},blanks(10),put_out_table{1,6},blanks(10),put_out_table{1,7},blanks(10),put_out_table{1,8});
set(handles.putbox,'Value',1);             
set(handles.putbox,'String',put_table);
end




% --- Executes on button press in optiontype1.
function optiontype1_Callback(hObject, eventdata, handles)
% hObject    handle to optiontype1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of optiontype1

    


% --- Executes on button press in optiontype2.
function optiontype2_Callback(hObject, eventdata, handles)
% hObject    handle to optiontype2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of optiontype2



% --- Executes on button press in vizpayoff.
function vizpayoff_Callback(hObject, eventdata, handles)
% hObject    handle to vizpayoff (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(handles.nature_bull,'Value')== 1)
    panel1 = 1;
elseif(get(handles.nature_bear,'Value')== 1)
    panel1 = 2;
elseif(get(handles.nature_volatile,'Value')== 1)
    panel1 = 3;
else
    panel1 = 0;
end
if(get(handles.strategymenu,'Value') == 1)
    panel = 1; 
elseif(get(handles.strategymenu,'Value') == 2)
    panel2 = 2;
elseif(get(handles.strategymenu,'Value') == 3)
    panel2 = 3;
elseif(get(handles.strategymenu,'Value') == 4)
    panel2 = 4;
elseif(get(handles.strategymenu,'Value') == 5)
    panel2 = 5;
end
    
if((isempty(get(handles.optiontype1,'String')) && isempty(get(handles.optiontype2,'String')) || (panel1 == 0) || (panel2 == 1)))
    errordlg('Add any option first or Choose a strategy or choose your nature')
else
    payoff(panel1,panel2,get(handles.strikeprice1,'String'),get(handles.strikeprice2,'String'),get(handles.premium1,'String'),get(handles.premium2,'String'),get(handles.optiontype1,'String'),get(handles.optiontype2,'String'));
end
% Update handles structure
guidata(hObject, handles);
    


% --- Executes on button press in calculator.
function calculator_Callback(hObject, eventdata, handles)
% hObject    handle to calculator (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if((get(handles.optiontype1,'Value') == 1) && (get(handles.optiontype2,'Value') == 1))
    warndlg('Select only one option')
elseif((get(handles.optiontype1,'Value') ~= 1) && (get(handles.optiontype2,'Value') ~= 1))
    warndlg('Select only option first')
elseif((get(handles.optiontype1,'Value') == 1))
    calculator(1);
elseif((get(handles.optiontype2,'Value') == 1))
    calculator(2);
end


% --- Executes on selection change in strategymenu.
function strategymenu_Callback(hObject, eventdata, handles)
% hObject    handle to strategymenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global introtext;
status1 = get(handles.nature_bull,'Value');
status2 = get(handles.nature_bear,'Value');
status3 = get(handles.nature_volatile,'Value');

if(status1 == 0 && status2 == 0 && status3 == 0)
    set(handles.strategymenu,'Enable','off');
    set(handles.helptext,'String',introtext);
end

if(status1 == 1)
    if(get(handles.strategymenu,'Value') == 2)
        set(handles.helptext,'FontSize',20);
        set(handles.helptext,'String','Set the expiry dates and obtain various Call options by pressing Get button. Press Add button to analyze it separately.');
    elseif(get(handles.strategymenu,'Value') == 3)
        set(handles.helptext,'FontSize',20);
        set(handles.helptext,'String','Set the expiry dates and obtain various Put options by pressing Get button. Press Add button to analyze it separately.');
    elseif(get(handles.strategymenu,'Value') == 4)
        set(handles.helptext,'FontSize',16);
        set(handles.helptext,'String','A bull call spread is constructed by buying a call option with a low exercise price (K), and selling another call option with a higher exercise price.');
    elseif(get(handles.strategymenu,'Value') == 5)
        set(handles.helptext,'FontSize',15);
        set(handles.helptext,'String','A bull put spread is constructed by selling higher striking in-the-money put options and buying the same number of lower striking in-the-money put options on the same underlying security with the same expiration date.');
    end
elseif(status2 == 1)
    if(get(handles.strategymenu,'Value') == 2)
        set(handles.helptext,'FontSize',20);
        set(handles.helptext,'String','Set the expiry dates and obtain various Put options by pressing Get button. Press Add button to analyze it separately.');
    elseif(get(handles.strategymenu,'Value') == 3)
        set(handles.helptext,'FontSize',20);
        set(handles.helptext,'String','Set the expiry dates and obtain various Call options by pressing Get button. Press Add button to analyze it separately.');
    elseif(get(handles.strategymenu,'Value') == 4)
        set(handles.helptext,'FontSize',14);
        set(handles.helptext,'String',' Bear call spread is entered by buying call options of a certain strike price and selling the same number of call options of lower strike price (in the money) on the same underlying security with the same expiration month.');
    elseif(get(handles.strategymenu,'Value') == 5)
        set(handles.helptext,'FontSize',14);
        set(handles.helptext,'String','Bear put spread entered by buying higher striking in-the-money put options and selling the same number of lower striking out-of-the-money put options on the same underlying security and the same expiration month.');
    end
elseif(status3 == 1)
    if(get(handles.strategymenu,'Value') == 2)
        set(handles.helptext,'FontSize',15);
        set(handles.helptext,'String','A Straddle is a strategy where you buy a Call Option as well as a Put Option on the same underlying scrip (or index) for the same expiry date for the same strike price. It should be used when major events are taking place.');
    elseif(get(handles.strategymenu,'Value') == 3)
        set(handles.helptext,'FontSize',16);
        set(handles.helptext,'String','A Strangle is a slightly safer Strategy in the sense that you buy a Call and a Put but at different strike prices rather than one single strike price as in the case of a Straddle.');
    end    
end

%% Taking care of Add operations
if((get(handles.nature_bull,'Value')== 1) || (get(handles.nature_bear,'Value')== 1))
    if((get(handles.strategymenu,'Value') == 2))
        set(handles.optiontype2,'Enable','off');
        % set(handles.text26,'Enable','off');
        set(handles.addputoption,'Enable','off');
        set(handles.addcalloption,'Enable','on');
    elseif(get(handles.strategymenu,'Value') == 4)
        set(handles.optiontype2,'Enable','on');
        % set(handles.text26,'Enable','on');
        set(handles.addputoption,'Enable','off');
        set(handles.addcalloption,'Enable','on');
    elseif((get(handles.strategymenu,'Value') == 3))
        set(handles.optiontype2,'Enable','off');
        % set(handles.text26,'Enable','off');
        set(handles.addcalloption,'Enable','off');
        set(handles.addputoption,'Enable','on');
    elseif(get(handles.strategymenu,'Value') == 5)
        set(handles.optiontype2,'Enable','on');
        % set(handles.text26,'Enable','on');
        set(handles.addcalloption,'Enable','off');
        set(handles.addputoption,'Enable','on');
    end
elseif(get(handles.nature_volatile,'Value')== 1)
     set(handles.optiontype2,'Enable','on');
     % set(handles.text26,'Enable','on');
     set(handles.addputoption,'Enable','on');
     set(handles.addcalloption,'Enable','on');    
end       


% Hints: contents = get(hObject,'String') returns strategymenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from strategymenu


% --- Executes during object creation, after setting all properties.
function strategymenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to strategymenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in nature_bull.
function nature_bull_Callback(hObject, eventdata, handles)
% hObject    handle to nature_bull (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of nature_bull

global introtext;
global bull_strategy;

status1 = get(handles.nature_bull,'Value');
status2 = get(handles.nature_bear,'Value');
status3 = get(handles.nature_volatile,'Value');

if(status1 == 0 && status2 == 0 && status3 == 0)
    set(handles.strategymenu,'Enable','off');
    set(handles.helptext,'String',introtext);
end

bullhelp = 'You believe that share price would increase in future. Select any one strategy from popupmenu in 2nd panel.';


if(status1 == 1) 
    set(handles.strategymenu,'Enable','on');
    set(handles.nature_bear,'Value',0);
    set(handles.nature_volatile,'Value',0);
    bull_strategy = {'[BULLISH STRATEGIES]';'Buy a Call';'Sell a Put';'Buy Bull Spread using two Calls';'Buy Bull Spread using two Puts'};
    set(handles.strategymenu,'String',bull_strategy);
    set(handles.helptext,'FontSize',20);
    set(handles.helptext,'HorizontalAlignment','center');
    set(handles.helptext,'String',bullhelp);
end
    
    



% --- Executes on button press in nature_bear.
function nature_bear_Callback(hObject, eventdata, handles)
% hObject    handle to nature_bear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of nature_bear
global introtext;


status1 = get(handles.nature_bull,'Value');
status2 = get(handles.nature_bear,'Value');
status3 = get(handles.nature_volatile,'Value');

if(status1 == 0 && status2 == 0 && status3 == 0)
    set(handles.strategymenu,'Enable','off');
    set(handles.helptext,'String',introtext);
end

bearhelp = 'You believe that share price would decrease in future. Select any one strategy from popupmenu in 2nd panel.';


if(status2 == 1) 
    set(handles.strategymenu,'Enable','on');
    set(handles.nature_bull,'Value',0);
    set(handles.nature_volatile,'Value',0);
    bear_strategy = {'[BEARISH STRATEGIES]';'Sell a Call';'Buy a Put';'Buy Bear Spread using two Calls';'Buy Bear Spread using two Puts'};
    set(handles.strategymenu,'String',bear_strategy);
    set(handles.helptext,'FontSize',20);
    set(handles.helptext,'HorizontalAlignment','center');
    set(handles.helptext,'String',bearhelp);
end


% --- Executes on button press in nature_volatile.
function nature_volatile_Callback(hObject, eventdata, handles)
% hObject    handle to nature_volatile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global introtext;

status1 = get(handles.nature_bull,'Value');
status2 = get(handles.nature_bear,'Value');
status3 = get(handles.nature_volatile,'Value');

if(status1 == 0 && status2 == 0 && status3 == 0)
    set(handles.strategymenu,'Enable','off');
    set(handles.helptext,'String',introtext);
end

neu_volhelp = 'Share price would stay where it is or it may move either ways. Select any one strategy from popupmenu in 2nd panel.';


if(status3 == 1) 
    set(handles.strategymenu,'Enable','on');
    set(handles.nature_bull,'Value',0);
    set(handles.nature_bear,'Value',0);
    set(handles.strategymenu,'Value',1); % Since array size is different
    neu_vol_strategy = {'[Neutral-Volatile STRATEGIES]';'Straddle';'Strangle'};
    set(handles.strategymenu,'String',neu_vol_strategy);
    set(handles.strategymenu,'Visible','on');
    set(handles.helptext,'FontSize',20);
    set(handles.helptext,'HorizontalAlignment','center');
    set(handles.helptext,'String',neu_volhelp);
end

% Hint: get(hObject,'Value') returns toggle state of nature_volatile


% --- Executes on button press in addcalloption.
function addcalloption_Callback(hObject, eventdata, handles)
% hObject    handle to addcalloption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


global calladdtable;
global callexpiry;
global listofmonths;

if((get(handles.nature_bull,'Value')== 1) || (get(handles.nature_bear,'Value')== 1))     % Adding only one Call option
    if(get(handles.strategymenu,'Value') == 2)
        %pushbutton7_Callback(hObject, eventdata, handles);
        addcall(hObject, eventdata, handles, calladdtable,callexpiry,1);
    elseif(get(handles.strategymenu,'Value') == 4) % Two call option
        if((isempty(get(handles.optiontype1,'String')) ~= 1) && (isempty(get(handles.optiontype2,'String')) ~= 1))
            warndlg('First Clear all the options', 'Warning')
        elseif((isempty(get(handles.optiontype1,'String')) ~= 1) && (isempty(get(handles.optiontype2,'String'))== 1))
            addcall(hObject, eventdata, handles, calladdtable, callexpiry, 2);
        elseif((isempty(get(handles.optiontype1,'String')) == 1) && (isempty(get(handles.optiontype2,'String'))~= 1))
            addcall(hObject, eventdata, handles, calladdtable, callexpiry, 1);
        else
            addcall(hObject, eventdata, handles, calladdtable, callexpiry, 1);
        end
    end
elseif(get(handles.nature_volatile,'Value')== 1) % Straddle and Strangle
    if((isempty(get(handles.optiontype1,'String')) ~= 1) && (isempty(get(handles.optiontype2,'String')) ~= 1))
            warndlg('First Clear all the options', 'Warning')
    elseif((isempty(get(handles.optiontype1,'String')) ~= 1) && (isempty(get(handles.optiontype2,'String'))== 1))
            addcall(hObject, eventdata, handles, calladdtable, callexpiry, 2);
    elseif((isempty(get(handles.optiontype1,'String')) == 1) && (isempty(get(handles.optiontype2,'String'))~= 1))
        addcall(hObject, eventdata, handles, calladdtable, callexpiry, 1);
    else
        addcall(hObject, eventdata, handles, calladdtable, callexpiry, 1);
    end
end
         

% --- Executes on button press in addputoption.
function addputoption_Callback(hObject, eventdata, handles)
% hObject    handle to addputoption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global putaddtable;
global putexpiry;
global listofmonths;


if((get(handles.nature_bull,'Value')== 1) || (get(handles.nature_bear,'Value')== 1))     % Adding only one Put option
    if(get(handles.strategymenu,'Value') == 3)
        %pushbutton7_Callback(hObject, eventdata, handles);
        addput(hObject, eventdata, handles, putaddtable,putexpiry,1);
        
    elseif(get(handles.strategymenu,'Value') == 5) % Two put option
        if((isempty(get(handles.optiontype1,'String')) ~= 1) && (isempty(get(handles.optiontype2,'String')) ~= 1))
            warndlg('First Clear all the options', 'Warning')
        elseif((isempty(get(handles.optiontype1,'String')) ~= 1) && (isempty(get(handles.optiontype2,'String'))== 1))
            addput(hObject, eventdata, handles, putaddtable, putexpiry, 2);
        elseif((isempty(get(handles.optiontype1,'String')) == 1) && (isempty(get(handles.optiontype2,'String'))~= 1))
            addput(hObject, eventdata, handles, putaddtable, putexpiry, 1);
        else
            addput(hObject, eventdata, handles, putaddtable, putexpiry, 1);
        end
    end
elseif(get(handles.nature_volatile,'Value')== 1) % Straddle and Strangle
    if((isempty(get(handles.optiontype1,'String')) ~= 1) && (isempty(get(handles.optiontype2,'String')) ~= 1))
            warndlg('First Clear all the options', 'Warning')
        elseif((isempty(get(handles.optiontype1,'String')) ~= 1) && (isempty(get(handles.optiontype2,'String'))== 1))
            addput(hObject, eventdata, handles, putaddtable, putexpiry, 2);
        elseif((isempty(get(handles.optiontype1,'String')) == 1) && (isempty(get(handles.optiontype2,'String'))~= 1))
            addput(hObject, eventdata, handles, putaddtable, putexpiry, 1);
        else
            addput(hObject, eventdata, handles, putaddtable, putexpiry, 1);
    end   
end
    


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.optiontype1,'String','');
set(handles.optiontype2,'String','');
set(handles.strikeprice1,'String','');
set(handles.strikeprice2,'String','');
set(handles.expiry1,'String','');
set(handles.expiry2,'String','');
set(handles.premium1,'String','');
set(handles.premium2,'String','');


function addcall(hObject, eventdata, handles, calladdtable,callexpiry, where)



%global where;
listofmonths = {'Jan';'Feb';'Mar';'Apr';'May';'Jun';'July';'Aug';'Sep';'Oct';'Nov';'Dec'};
callnumber = get(handles.callbox,'Value');
if (where == 1)
    set(handles.strikeprice1,'String',calladdtable{callnumber,1});
    %set(handles.premium1,'String',calladdtable{callnumber,3});
    set(handles.optiontype1,'String','Call Option');
else
    set(handles.strikeprice2,'String',calladdtable{callnumber,1});
    %set(handles.premium2,'String',calladdtable{callnumber,3});
    set(handles.optiontype2,'String','Call Option');
end


% Months to be calculated
for a = 1 : 12
    check = strfind(callexpiry,listofmonths{a});
    if(isempty(check) ~= 1)
        
        break;
    end
end
b = datevec(date);
if(a > b(2))
    monthstoexpire = a - b(2);
    if(where == 1)
        set(handles.expiry1,'String',num2str(monthstoexpire));
    else
        set(handles.expiry2,'String',num2str(monthstoexpire));
    end
elseif( a < b(2))
    monthstoexpire = a - b(2) + 12;
    if(where == 1)
        set(handles.expiry1,'String',num2str(monthstoexpire));
    else
        set(handles.expiry2,'String',num2str(monthstoexpire));
    end
elseif(a == b(2))
    errdlg('Choose options of different expiry');
    if(where == 1)
        set(handles.optiontype1,'String','');
        set(handles.strikeprice1,'String','');
        set(handles.premium1,'String','');            
        set(handles.expiry2,'String','');
    else
        set(handles.optiontype2,'String','');
        set(handles.strikeprice2,'String','');
        set(handles.premium2,'String','');
        set(handles.expiry2,'String','');
    end
end


function addput(hObject, eventdata, handles, putaddtable, putexpiry, where)



%global where;
listofmonths = {'Jan';'Feb';'Mar';'Apr';'May';'Jun';'July';'Aug';'Sep';'Oct';'Nov';'Dec'};
%set(handles.optiontype1,'String','Put Option');
putnumber = get(handles.putbox,'Value');
if (where == 1)
    set(handles.strikeprice1,'String',putaddtable{putnumber,1});
    set(handles.optiontype1,'String','Put Option');
    %set(handles.premium1,'String',putaddtable{putnumber,3});
    
else
    set(handles.strikeprice2,'String',putaddtable{putnumber,1});
    set(handles.optiontype2,'String','Put Option');
    %set(handles.premium2,'String',putaddtable{putnumber,3});
end

% Months to be calculated
for a = 1 : 12
    check = strfind(putexpiry,listofmonths{a});
    if(isempty(check) ~= 1)
        break;
    end
end
b = datevec(date);
if(a > b(2))
    monthstoexpire = a - b(2);    
    if(where == 1)
        set(handles.expiry1,'String',num2str(monthstoexpire));        
    else
        set(handles.expiry2,'String',num2str(monthstoexpire));
    end
elseif( a < b(2))
    monthstoexpire = a - b(2) + 12;
    if(where == 1)
        set(handles.expiry1,'String',num2str(monthstoexpire));
    else
        set(handles.expiry2,'String',num2str(monthstoexpire));
    end
elseif(a == b(2))
    errdlg('Choose options of different expiry');
    if(where == 1)
        set(handles.optiontype1,'String','');
        set(handles.strikeprice1,'String','');
        set(handles.premium1,'String','');            
        set(handles.expiry2,'String','');
    else
        set(handles.optiontype2,'String','');
        set(handles.strikeprice2,'String','');
        set(handles.premium2,'String','');
        set(handles.expiry2,'String','');
    end
end

