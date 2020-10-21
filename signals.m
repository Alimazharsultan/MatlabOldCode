function varargout = signals(varargin)
% SIGNALS MATLAB code for signals.fig
%      SIGNALS, by itself, creates a new SIGNALS or raises the existing
%      singleton*.
%
%      H = SIGNALS returns the handle to a new SIGNALS or the handle to
%      the existing singleton*.
%
%      SIGNALS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIGNALS.M with the given input arguments.
%
%      SIGNALS('Property','Value',...) creates a new SIGNALS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before signals_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to signals_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help signals

% Last Modified by GUIDE v2.5 18-Jun-2019 15:09:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @signals_OpeningFcn, ...
                   'gui_OutputFcn',  @signals_OutputFcn, ...
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


% --- Executes just before signals is made visible.
function signals_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to signals (see VARARGIN)

% Choose default command line output for signals
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes signals wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = signals_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

    
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu1.

function ampin_Callback(hObject, eventdata, handles)
% hObject    handle to ampin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ampin as text
%        str2double(get(hObject,'String')) returns contents of ampin as a double


% --- Executes during object creation, after setting all properties.
function ampin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ampin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freqin_Callback(hObject, eventdata, handles)
% hObject    handle to freqin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freqin as text
%        str2double(get(hObject,'String')) returns contents of freqin as a double


% --- Executes during object creation, after setting all properties.
function freqin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freqin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function phasein_Callback(hObject, eventdata, handles)
% hObject    handle to phasein (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of phasein as text
%        str2double(get(hObject,'String')) returns contents of phasein as a double


% --- Executes during object creation, after setting all properties.
function phasein_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phasein (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
fs = 22000;                         %frequency of audio signal
ts = 1/fs;                          %step time
N = 200;            
tmax = (N-1)*ts;                     %maximum value of time (5 seconds) 
t = 0 : 1/fs : tmax;                %defining time domain for plotting 
contents = cellstr(get(hObject, 'String'));
popChoice = contents(get(hObject, 'Value'));
assignin('base', 'popChoice', popChoice);
if(strcmp(popChoice,'1'))
    popVal = 1
    f(1) = str2num(get(handles.freqin,'String'))
    a(1) = str2num(get(handles.ampin,'String'))
    w(1) = str2num(get(handles.phasein,'String'))
    h = a(1) * sin( 2 * pi * f(1) * t + w(1) )
    
    plot(h)
    
elseif(strcmp(popChoice,'2'))
    a(2) = str2num(get(handles.ampin,'String'));
    f(2) = str2num(get(handles.freqin,'String'));
    w(2) = str2num(get(handles.phasein,'String'));
    h = a(2) * sin( 2 * pi * f(2) * t + w(2) );
    plot(h(2))
    popVal =2;
elseif(strcmp(popChoice,'3'))
    a(3) = str2num(get(handles.ampin,'String'));
    f(3) = str2num(get(handles.freqin,'String'));
    w(3) = str2num(get(handles.phasein,'String'));
    h(3) = a(3) * sin( 2 * pi * f(3) * t + w(3) );
    plot(h(3))
    popVal =3;
elseif(strcmp(popChoice,'4'))
    a(4) = str2num(get(handles.ampin,'String'));
    f(4) = str2num(get(handles.freqin,'String'));
    w(4) = str2num(get(handles.phasein,'String'));
    h(4) = a(4) * sin( 2 * pi * f(4) * t + w(4) );
    plot(h(4))
    popVal =4;
    
elseif(strcmp(popChoice,'5'))
    popVal =5;
elseif(strcmp(popChoice,'6'))
    popVal =6;
elseif(strcmp(popChoice,'7'))
    popVal =7;
elseif(strcmp(popChoice,'8'))
    popVal =8;
elseif(strcmp(popChoice,'9'))
    popVal =9;
elseif(strcmp(popChoice,'10'))
    popVal =10;
end
% --- Executes during object creation, after setting all properties.



