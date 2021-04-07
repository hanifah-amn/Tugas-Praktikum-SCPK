function varargout = cekTahunKabisat(varargin)
% CEKTAHUNKABISAT MATLAB code for cekTahunKabisat.fig
%      CEKTAHUNKABISAT, by itself, creates a new CEKTAHUNKABISAT or raises the existing
%      singleton*.
%
%      H = CEKTAHUNKABISAT returns the handle to a new CEKTAHUNKABISAT or the handle to
%      the existing singleton*.
%
%      CEKTAHUNKABISAT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CEKTAHUNKABISAT.M with the given input arguments.
%
%      CEKTAHUNKABISAT('Property','Value',...) creates a new CEKTAHUNKABISAT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cekTahunKabisat_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cekTahunKabisat_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cekTahunKabisat

% Last Modified by GUIDE v2.5 07-Apr-2021 13:03:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cekTahunKabisat_OpeningFcn, ...
                   'gui_OutputFcn',  @cekTahunKabisat_OutputFcn, ...
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


% --- Executes just before cekTahunKabisat is made visible.
function cekTahunKabisat_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cekTahunKabisat (see VARARGIN)

% Choose default command line output for cekTahunKabisat
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cekTahunKabisat wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cekTahunKabisat_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function input_Callback(hObject, eventdata, handles)
% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input as text
%        str2double(get(hObject,'String')) returns contents of input as a double


% --- Executes during object creation, after setting all properties.
function input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tombolCek.
function tombolCek_Callback(hObject, eventdata, handles)
% hObject    handle to tombolCek (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tahun = get(handles.input, 'string');
tahun = str2num(tahun);
if(mod(tahun,4)==0)
    hasilCek = "merupakan tahun kabisat";
else
    hasilCek = "bukan tahun kabisat";
end
set(handles.hasilCek, 'string', (hasilCek));
