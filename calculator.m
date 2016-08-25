function varargout = calculator(varargin)
% CALCULATOR M-file for calculator.fig
%      CALCULATOR, by itself, creates a new CALCULATOR or raises the existing
%      singleton*.
%
%      H = CALCULATOR returns the handle to a new CALCULATOR or the handle to
%      the existing singleton*.
%
%      CALCULATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALCULATOR.M with the given input arguments.
%
%      CALCULATOR('Property','Value',...) creates a new CALCULATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before calculator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to calculator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help calculator

% Last Modified by GUIDE v2.5 16-Oct-2011 19:34:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @calculator_OpeningFcn, ...
                   'gui_OutputFcn',  @calculator_OutputFcn, ...
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


% --- Executes just before calculator is made visible.
function calculator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to calculator (see VARARGIN)

% Choose default command line output for calculator
global index;

handles.level = varargin{1};
handles.output = hObject;

optionshandles = options;
optionsdata = guidata(optionshandles);


mylist = {'MMM','AA','AXP','T','BAC','BA','CAT','CVX','CSCO','KO','DD','XOM',...
'GE','HPQ','HD','INTC','IBM','JNJ','JPM','KFT','MCD','MRK','MSFT','PFE','PG',...
'TRV','UTX','VZ','WMT','DIS'};

set(handles.ticker,'String',mylist{index});
shareprice = str2num(get_last_trade(mylist{index}));
set(handles.lasttrade,'String',num2str(shareprice));


if((get(optionsdata.optiontype1,'Value') == 1))
    handles.sprice = str2num(get(optionsdata.strikeprice1,'String'));
    handles.expiry = str2num(get(optionsdata.expiry1,'String'));
    if(strcmp(get(optionsdata.optiontype1,'String'),'Call Option'))
        handles.IV = max((shareprice - handles.sprice),0);
        handles.type = 1;
    else
        handles.IV = max((handles.sprice - shareprice),0);
        handles.type = 2;
    end
else
    handles.sprice = str2num(get(optionsdata.strikeprice2,'String'));
    handles.expiry = str2num(get(optionsdata.expiry2,'String'));
    if(strcmp(get(optionsdata.optiontype2,'String'),'Call Option'))
        handles.IV = max((shareprice - handles.sprice),0);
        handles.type = 1;
    else
        handles.IV = max((handles.sprice - shareprice),0);
        handles.type = 2;
    end
end

        



% Update handles structure
guidata(hObject, handles);

% UIWAIT makes calculator wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = calculator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function editvol_Callback(hObject, eventdata, handles)
% hObject    handle to editvol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editvol as text
%        str2double(get(hObject,'String')) returns contents of editvol as a double


% --- Executes during object creation, after setting all properties.
function editvol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editvol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editrate_Callback(hObject, eventdata, handles)
% hObject    handle to editrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editrate as text
%        str2double(get(hObject,'String')) returns contents of editrate as a double


% --- Executes during object creation, after setting all properties.
function editrate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushblack.
function pushblack_Callback(hObject, eventdata, handles)
% hObject    handle to pushblack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



AssetPrice = str2num(get(handles.lasttrade,'String'));

InterestRate = str2num(get(handles.editrate,'String'));
Volatility = str2num(get(handles.editvol,'String'));

[OptionValue, OVarray, t, S] = blackscholes(handles.type, AssetPrice, handles.sprice, InterestRate, ...
          (handles.expiry)/12, Volatility);
      
set(handles.optionblack,'String',num2str(OptionValue));
premium = OptionValue - handles.IV;
set(handles.blackpremium,'String',num2str(premium));





function optionblack_Callback(hObject, eventdata, handles)
% hObject    handle to optionblack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of optionblack as text
%        str2double(get(hObject,'String')) returns contents of optionblack as a double


% --- Executes during object creation, after setting all properties.
function optionblack_CreateFcn(hObject, eventdata, handles)
% hObject    handle to optionblack (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in blackgraph.
function blackgraph_Callback(hObject, eventdata, handles)
% hObject    handle to blackgraph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


AssetPrice = str2num(get(handles.lasttrade,'String'));

InterestRate = str2num(get(handles.editrate,'String'));
Volatility = str2num(get(handles.editvol,'String'));

[OptionValue, OVarray, t, S] = blackscholes(handles.type, AssetPrice, handles.sprice, InterestRate, ...
          (handles.expiry)/12, Volatility);

bsgraph(OVarray,t, S);
      
      
      



function blackpremium_Callback(hObject, eventdata, handles)
% hObject    handle to blackpremium (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blackpremium as text
%        str2double(get(hObject,'String')) returns contents of blackpremium as a double


% --- Executes during object creation, after setting all properties.
function blackpremium_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blackpremium (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editsteps_Callback(hObject, eventdata, handles)
% hObject    handle to editsteps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editsteps as text
%        str2double(get(hObject,'String')) returns contents of editsteps as a double


% --- Executes during object creation, after setting all properties.
function editsteps_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editsteps (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbin.
function pushbin_Callback(hObject, eventdata, handles)
% hObject    handle to pushbin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



AssetPrice = str2num(get(handles.lasttrade,'String'));

InterestRate = str2num(get(handles.editrate,'String'));
Volatility = str2num(get(handles.editvol,'String'));
NumberofSteps = str2num(get(handles.editsteps,'String'));



OptionValue =  binmodel(AssetPrice, handles.sprice, InterestRate, ...
          NumberofSteps, handles.expiry, Volatility, 1, handles.type);
      
set(handles.optionbin,'String',num2str(OptionValue));
premium = OptionValue - handles.IV;
set(handles.binpremium,'String',num2str(premium));



optionshandles = options;
optionsdata = guidata(optionshandles);
if(handles.level == 1)
    set(optionsdata.premium1,'String',num2str(premium));
else
    set(optionsdata.premium2,'String',num2str(premium));
end





function optionbin_Callback(hObject, eventdata, handles)
% hObject    handle to optionbin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of optionbin as text
%        str2double(get(hObject,'String')) returns contents of optionbin as a double


% --- Executes during object creation, after setting all properties.
function optionbin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to optionbin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bingraph.
function bingraph_Callback(hObject, eventdata, handles)
% hObject    handle to bingraph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





%global P;
%global O;
%global ST;

AssetPrice = str2num(get(handles.lasttrade,'String'));

InterestRate = str2num(get(handles.editrate,'String'));
Volatility = str2num(get(handles.editvol,'String'));
NumberofSteps = str2num(get(handles.editsteps,'String'));



[OptionValue, O, P, ST] =  binmodel(AssetPrice, handles.sprice, InterestRate, ...
          NumberofSteps, handles.expiry, Volatility, 1, handles.type);


      
binomialgraph(O, P, ST);  



function binpremium_Callback(hObject, eventdata, handles)
% hObject    handle to binpremium (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of binpremium as text
%        str2double(get(hObject,'String')) returns contents of binpremium as a double


% --- Executes during object creation, after setting all properties.
function binpremium_CreateFcn(hObject, eventdata, handles)
% hObject    handle to binpremium (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


