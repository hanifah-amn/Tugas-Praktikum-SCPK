function varargout = hitungLVBalok(varargin)
% HITUNGLVBALOK MATLAB code for hitungLVBalok.fig
%      HITUNGLVBALOK, by itself, creates a new HITUNGLVBALOK or raises the existing
%      singleton*.
%
%      H = HITUNGLVBALOK returns the handle to a new HITUNGLVBALOK or the handle to
%      the existing singleton*.
%
%      HITUNGLVBALOK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HITUNGLVBALOK.M with the given input arguments.
%
%      HITUNGLVBALOK('Property','Value',...) creates a new HITUNGLVBALOK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hitungLVBalok_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hitungLVBalok_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hitungLVBalok

% Last Modified by GUIDE v2.5 07-Apr-2021 13:36:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hitungLVBalok_OpeningFcn, ...
                   'gui_OutputFcn',  @hitungLVBalok_OutputFcn, ...
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


% --- Executes just before hitungLVBalok is made visible.
function hitungLVBalok_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hitungLVBalok (see VARARGIN)

% Choose default command line output for hitungLVBalok
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes hitungLVBalok wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = hitungLVBalok_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function panjang_Callback(hObject, eventdata, handles)
% hObject    handle to panjang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of panjang as text
%        str2double(get(hObject,'String')) returns contents of panjang as a double


% --- Executes during object creation, after setting all properties.
function panjang_CreateFcn(hObject, eventdata, handles)
% hObject    handle to panjang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function lebar_Callback(hObject, eventdata, handles)
% hObject    handle to lebar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lebar as text
%        str2double(get(hObject,'String')) returns contents of lebar as a double


% --- Executes during object creation, after setting all properties.
function lebar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lebar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function tinggi_Callback(hObject, eventdata, handles)
% hObject    handle to tinggi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tinggi as text
%        str2double(get(hObject,'String')) returns contents of tinggi as a double


% --- Executes during object creation, after setting all properties.
function tinggi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tinggi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in tombolLuas.
function tombolLuas_Callback(hObject, eventdata, handles)
% hObject    handle to tombolLuas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
panjang = get(handles.panjang,'string');
lebar = get(handles.lebar,'string');
tinggi = get(handles.tinggi,'string');

p = str2double(panjang);
l = str2double(lebar);
t = str2double(tinggi);

%operasi perhitungan luas balok
hasilLuas = 2*((p*l)+(p*t)+(l*t));
set(handles.hasilLuas,'string',(hasilLuas));



% --- Executes on button press in tombolVolume.
function tombolVolume_Callback(hObject, eventdata, handles)
% hObject    handle to tombolVolume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
panjang = get(handles.panjang,'string');
lebar = get(handles.lebar,'string');
tinggi = get(handles.tinggi,'string');

p = str2double(panjang);
l = str2double(lebar);
t = str2double(tinggi);

%operasi perhitungan volume balok
hasilVolume = p*l*t;
set(handles.hasilVolume,'string',(hasilVolume));
