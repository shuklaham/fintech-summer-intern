function varargout = bsgraph(varargin)
% BSGRAPH M-file for bsgraph.fig
%      BSGRAPH, by itself, creates a new BSGRAPH or raises the existing
%      singleton*.
%
%      H = BSGRAPH returns the handle to a new BSGRAPH or the handle to
%      the existing singleton*.
%
%      BSGRAPH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BSGRAPH.M with the given input arguments.
%
%      BSGRAPH('Property','Value',...) creates a new BSGRAPH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bsgraph_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bsgraph_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bsgraph

% Last Modified by GUIDE v2.5 20-Oct-2011 02:03:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bsgraph_OpeningFcn, ...
                   'gui_OutputFcn',  @bsgraph_OutputFcn, ...
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


% --- Executes just before bsgraph is made visible.
function bsgraph_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bsgraph (see VARARGIN)

% Choose default command line output for bsgraph
handles.output = hObject;

axes(handles.axes1);

surf(varargin{2}, varargin{3},varargin{1});

xlabel('Time');
ylabel('Stock Price');
zlabel('Option Value');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bsgraph wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bsgraph_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(get(hObject,'Value') == 1)
    datacursormode on;
else
    datacursormode off;
end

    


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
    


