function varargout = spkSmartphone(varargin)
% SPKSMARTPHONE MATLAB code for spkSmartphone.fig
%      SPKSMARTPHONE, by itself, creates a new SPKSMARTPHONE or raises the existing
%      singleton*.
%
%      H = SPKSMARTPHONE returns the handle to a new SPKSMARTPHONE or the handle to
%      the existing singleton*.
%
%      SPKSMARTPHONE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SPKSMARTPHONE.M with the given input arguments.
%
%      SPKSMARTPHONE('Property','Value',...) creates a new SPKSMARTPHONE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before spkSmartphone_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to spkSmartphone_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help spkSmartphone

% Last Modified by GUIDE v2.5 23-Jun-2021 18:44:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @spkSmartphone_OpeningFcn, ...
                   'gui_OutputFcn',  @spkSmartphone_OutputFcn, ...
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

    
% --- Executes just before spkSmartphone is made visible.
function spkSmartphone_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to spkSmartphone (see VARARGIN)

% Choose default command line output for spkSmartphone
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes spkSmartphone wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = spkSmartphone_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tombolHitung.
function tombolHitung_Callback(hObject, eventdata, handles)
% hObject    handle to tombolHitung (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%input data berdasarkan kriteria
%ram, memori internal, kapasitas baterai, harga
data = [2,128,6000,5100000; %S1
        8,128,4000,5700000; %S2
        2,128,4000,4600000; %S3
        4,256,6000,9900000]; %S4

%nilai atribut; 0=cost, 1=benefit
k = [1,1,1,0];

%bobot kriteria
w = [0.25,0.20,0.25,0.30];

%normalisasi matriks
[m n] = size(data);
%matriks kosong, untuk hasil normalisasi
R = zeros(m,n); 
for j=1:n
    if k(j)==1
        R(:,j)=data(:,j)./max(data(:,j));
    else
        R(:,j)=min(data(:,j))./data(:,j);
    end
end

%proses pemeringkatan
na=0;
s=0;
for i=1:m
    V(i)=sum(w.*R(i,:))
    if V(i)>na
        na=V(i);
        s=i;
    end
end

s=num2str(s);
set(handles.hasilAlternatif,'string',s);

% --- Executes when entered data in editable cell(s) in tabelSmartphone.
function tabelSmartphone_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to tabelSmartphone (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in tombolData.
function tombolData_Callback(hObject, eventdata, handles)
% hObject    handle to tombolData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
form = guidata(gcbo);
%ram, memori internal, kapasitas baterai, harga
data = [2,128,6000,5100000; %S1
        8,128,4000,5700000; %S2
        2,128,4000,4600000; %S3
        4,256,6000,9900000]; %S4
set(form.tabelSmartphone,'data',data);

% --- Executes when selected cell(s) is changed in tabelSmartphone.
function tabelSmartphone_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to tabelSmartphone (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)

