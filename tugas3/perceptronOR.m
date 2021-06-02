function varargout = perceptronOR(varargin)
% PERCEPTRONOR MATLAB code for perceptronOR.fig
%      PERCEPTRONOR, by itself, creates a new PERCEPTRONOR or raises the existing
%      singleton*.
%
%      H = PERCEPTRONOR returns the handle to a new PERCEPTRONOR or the handle to
%      the existing singleton*.
%
%      PERCEPTRONOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PERCEPTRONOR.M with the given input arguments.
%
%      PERCEPTRONOR('Property','Value',...) creates a new PERCEPTRONOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before perceptronOR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to perceptronOR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help perceptronOR

% Last Modified by GUIDE v2.5 02-Jun-2021 15:51:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @perceptronOR_OpeningFcn, ...
                   'gui_OutputFcn',  @perceptronOR_OutputFcn, ...
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


% --- Executes just before perceptronOR is made visible.
function perceptronOR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to perceptronOR (see VARARGIN)

% Choose default command line output for perceptronOR
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes perceptronOR wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = perceptronOR_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%pola input yang akan dihitung
p1 = [1;1];
p2 = [1;0];
p3 = [0;1];
p4 = [0;0];
p = [p1 p2 p3 p4];

%target
t1 = 1;
t2 = 1;
t3 = 1;
t4 = 0;
t = [t1 t2 t3 t4];

net = newp([0 1;0 1],1);

%bobot awal
w1 = str2double(get(handles.bobot1,'string'));
w2 = str2double(get(handles.bobot2,'string'));
bobot = [w1 w2];
net.IW{1,1} = bobot;

%bias awal
w0 = str2double(get(handles.bias,'string'));
bias = [w0];
net.b{1} = bias;

train(net,p,t);
set(handles.bobotBaru,'string',(net.IW{1,1}));
set(handles.biasBaru,'string',(net.b{1}));
