% Window 1
function varargout = win1(varargin)
% WIN1 M-file for win1.fig
%      WIN1, by itself, creates a new WIN1 or raises the existing
%      singleton*.
%
%      H = WIN1 returns the handle to a new WIN1 or the handle to
%      the existing singleton*.
%
%      WIN1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WIN1.M with the given input arguments.
%
%      WIN1('Property','Value',...) creates a new WIN1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before win1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property
%      application
%      stop.  All inputs are passed to win1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help win1

% Last Modified by GUIDE v2.5 08-Oct-2011 15:04:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @win1_OpeningFcn, ...
                   'gui_OutputFcn',  @win1_OutputFcn, ...
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


% --- Executes just before win1 is made visible.
function win1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to win1 (see VARARGIN)

% Choose default command line output for win1
handles.output = hObject;

% set(hObject,'toolbar','figure');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes win1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = win1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1

global mylist;
global index;
index = get(handles.listbox1,'Value');
mylist = {'MMM','AA','AXP','T','BAC','BA','CAT','CVX','CSCO','KO','DD','XOM',...
'GE','HPQ','HD','INTC','IBM','JNJ','JPM','KFT','MCD','MRK','MSFT','PFE','PG',...
'TRV','UTX','VZ','WMT','DIS'};
ticker = cell2mat(mylist(index));

[hist_close,hist_date] = graph_win1(ticker,1);
axes(handles.axes1);
startDate = datenum(hist_date(1));
% Select an ending date:
endDate = datenum(hist_date(end));
% Create xdata to correspond to the number of 
% months between the start and end dates:
dim = size(hist_close);
xData = linspace(startDate,endDate,dim(1,1));
xData = xData';
plot(xData,hist_close);
datetick('x',19,'keepticks'); % dd/mm format



guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white'); 
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stocksummary();


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
volwin();




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

options();


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global mylist;
index = get(handles.listbox1,'Value');
stock_symbol = cell2mat(mylist(index));

%contents = get(hObject,'String'); % returns popupmenu1 contents as cell array
option = get(hObject,'Value'); % returns selected item from popupmenu1

if(option == 1)
    [hist_close,hist_date] = graph_win1(stock_symbol,1);
    axes(handles.axes1);
    startDate = datenum(hist_date(1));
    % Select an ending date:
    endDate = datenum(hist_date(end));
    % Create xdata to correspond to the number of 
    % months between the start and end dates:
    dim = size(hist_close);
    xData = linspace(startDate,endDate,dim(1,1));
    xData = xData';
    plot(xData,hist_close);
    datetick('x',19,'keepticks'); % dd/mm format
else
    [hist_close,hist_date] = graph_win1(stock_symbol,3);
    axes(handles.axes1);
    startDate = datenum(hist_date(1));
    % Select an ending date:
    endDate = datenum(hist_date(end));
    % Create xdata to correspond to the number of 
    % months between the start and end dates:
    dim = size(hist_close);
    xData = linspace(startDate,endDate,dim(1,1));
    xData = xData';
    plot(xData,hist_close);
    datetick('x',19,'keepticks');
end
    
    %%% Last Step 
    guidata(hObject, handles);





% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1

checkvalue = get(hObject,'Value');
if(checkvalue == 1)
    datacursormode on;
else
    datacursormode off;
end


