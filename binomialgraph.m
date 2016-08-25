function varargout = binomialgraph(varargin)
% BINOMIALGRAPH M-file for binomialgraph.fig
%      BINOMIALGRAPH, by itself, creates a new BINOMIALGRAPH or raises the existing
%      singleton*.
%
%      H = BINOMIALGRAPH returns the handle to a new BINOMIALGRAPH or the handle to
%      the existing singleton*.
%
%      BINOMIALGRAPH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BINOMIALGRAPH.M with the given input arguments.
%
%      BINOMIALGRAPH('Property','Value',...) creates a new BINOMIALGRAPH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before binomialgraph_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to binomialgraph_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help binomialgraph

% Last Modified by GUIDE v2.5 20-Oct-2011 01:59:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @binomialgraph_OpeningFcn, ...
                   'gui_OutputFcn',  @binomialgraph_OutputFcn, ...
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


% --- Executes just before binomialgraph is made visible.
function binomialgraph_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to binomialgraph (see VARARGIN)

% Choose default command line output for binomialgraph
handles.output = hObject;


axes(handles.axes1);
bar3(varargin{1},0.25,'detached');
xlabel('Option Value');
ylabel('Time to Expiry');
zlabel('Option Value');




% Update handles structure
guidata(hObject, handles);

% UIWAIT makes binomialgraph wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = binomialgraph_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in graphoption.
function graphoption_Callback(hObject, eventdata, handles)
% hObject    handle to graphoption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global O;
global ST;
global P;

towers = get(handles.graphoption,'Value');


if(towers ==1)
    tree = ST;
elseif(towers == 2)
    tree = P;
else
    tree = O;
end

axes(handles.axes1);
bar3(tree,0.25,'detached');
if(towers ==1)
    zlabel('Stock Price');
elseif(towers == 2)
    zlabel('Probability');
else
    zlabel('Option Price');
end
ylabel('Time to Expiry');
xlabel('Stock Value');

% Update handles structure
guidata(hObject, handles);


% Hints: contents = get(hObject,'String') returns graphoption contents as cell array
%        contents{get(hObject,'Value')} returns selected item from graphoption


% --- Executes during object creation, after setting all properties.
function graphoption_CreateFcn(hObject, eventdata, handles)
% hObject    handle to graphoption (see GCBO)
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
if(get(handles.checkbox1,'Value') == 1)
    datacursormode on;
else
    datacursormode off;
end
% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value') ==1 )
    rotate3d on;
else
    rotate3d off;
end
% Hint: get(hObject,'Value') returns toggle state of checkbox2


