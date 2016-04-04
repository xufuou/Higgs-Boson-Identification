function varargout = pr_gui(varargin)
% pr_gui MATLAB code for pr_gui.fig
%      pr_gui, by itself, creates a new pr_gui or raises the existing
%      singleton*.
%
%      H = pr_gui returns the handle to a new pr_gui or the handle to
%      the existing singleton*.
%
%      pr_gui('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in pr_gui.M with the given input arguments.
%
%      pr_gui('Property','Value',...) creates a new pr_gui or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pr_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pr_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pr_gui

% Last Modified by GUIDE v2.5 30-May-2015 21:44:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pr_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @pr_gui_OutputFcn, ...
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


% --- Executes just before pr_gui is made visible.
function pr_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pr_gui (see VARARGIN)

% Choose default command line output for pr_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pr_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pr_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in mv_opt.
function mv_opt_Callback(hObject, eventdata, handles)
% hObject    handle to mv_opt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns mv_opt contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mv_opt

setDisable(handles.mv_list);

[z, opts] = pr_missing_values('', 'list-opts', '', getCurrentPopupString(hObject));
for o = opts{1}
    switch o.type
        case 'list'
            setEnable(handles.mv_list);
            set(handles.mv_list, 'String', o.values);
    end;
end;

% --- Executes during object creation, after setting all properties.
function mv_opt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mv_opt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
[dataset, types]= pr_missing_values('', 'list-types');
set(hObject,'String',types);

% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addStep(handles, 'MV', getCurrentPopupString(handles.mv_opt), { getCurrentPopupString(handles.mv_list) });

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on selection change in mv_list.
function mv_list_Callback(hObject, eventdata, handles)
% hObject    handle to mv_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns mv_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from mv_list



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on pushbutton19 and none of its controls.
function pushbutton19_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
hsurf = uicontrol('Style','pushbutton','String','Surf',...
           'Position',[315,220,70,25]);


% --- Executes on selection change in popupmenu22.
function popupmenu22_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu22 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu22


% --- Executes during object creation, after setting all properties.
function popupmenu22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
[dataset, types]= pr_plot('', 'list-types');
set(hObject,'String',types);

% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu23.
function popupmenu23_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu23 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu23


% --- Executes during object creation, after setting all properties.
function popupmenu23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function e_opt_CreateFcn(hObject, eventdata, handles)


% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addStep(handles, 'E', 'evaluate', { get(handles.e_text2, 'String') });


% --- Executes on selection change in popupmenu21.
function popupmenu21_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu21 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu21


% --- Executes during object creation, after setting all properties.
function popupmenu21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in c_opt.
function c_opt_Callback(hObject, eventdata, handles)
% hObject    handle to c_opt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns c_opt contents as cell array
%        contents{get(hObject,'Value')} returns selected item from c_opt
setDisable(handles.c_text1);
setDisable(handles.c_text2);
setString(handles.c_text2, ' ');

[z,z, opts] = pr_classify('', '', 'list-opts', getCurrentPopupString(hObject));
for i = opts
    o = i{1};
    switch o.type
        case 'text'
           setEnable(handles.c_text1);
           setEnable(handles.c_text2);
           setString(handles.c_text1, o.title);
           setString(handles.c_text2, o.default);
    end;
end;

% --- Executes during object creation, after setting all properties.
function c_opt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c_opt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
[dataset, z, types]= pr_classify('', '', 'list-types');
set(hObject,'String',types);

% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addStep(handles, 'C', getCurrentPopupString(handles.c_opt), { get(handles.c_text2, 'String') });


% --- Executes on selection change in popupmenu17.
function popupmenu17_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu17 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu17


% --- Executes during object creation, after setting all properties.
function popupmenu17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in fs_opt.
function fs_opt_Callback(hObject, eventdata, handles)
% hObject    handle to fs_opt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns fs_opt contents as cell array
%        contents{get(hObject,'Value')} returns selected item from fs_opt
setDisable(handles.fs_list);
setDisable(handles.fs_text1);
setDisable(handles.fs_text2);
set(handles.fs_list, 'String', ' ');

[z, z, opts] = pr_feature_selection('', '', 'list-opts', getCurrentPopupString(hObject));


for i = opts
    o = i{1};
    switch o.type
        case 'text'
           setEnable(handles.fs_text1);
           setEnable(handles.fs_text2);
           setString(handles.fs_text1, o.title);
           setString(handles.fs_text2, o.default);
        case 'list'
            setEnable(handles.fs_list);
            set(handles.fs_list, 'String', o.values);
    end;
end;


% --- Executes during object creation, after setting all properties.
function fs_opt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fs_opt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
[dataset, tst_dataset, types]= pr_feature_selection('', '', 'list-types');
set(hObject,'String',types);

% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addStep(handles, 'FS', getCurrentPopupString(handles.fs_opt), { get(handles.fs_text2, 'String') getCurrentPopupString(handles.fs_list) });


% --- Executes on selection change in fs_list.
function fs_list_Callback(hObject, eventdata, handles)
% hObject    handle to fs_list (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns fs_list contents as cell array
%        contents{get(hObject,'Value')} returns selected item from fs_list



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in p_preset.
function p_preset_Callback(hObject, eventdata, handles)
% hObject    handle to p_preset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns p_preset contents as cell array
%        contents{get(hObject,'Value')} returns selected item from p_preset



% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    data = guidata(handles.figure1);
    preset = data.presets{get(handles.p_preset, 'Value')};
    
    [FileName,PathName,FilterIndex] = uiputfile('*.mat', 'Choose the name of the preset');
    save([PathName FileName],'-struct', 'preset');

% --- Executes on button press in pushbutton35.
function pushbutton35_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    data = guidata(handles.figure1);
    applyPreset(handles, data.presets{get(handles.p_preset, 'Value')});

% --- Executes on selection change in fe_opt.
function fe_opt_Callback(hObject, eventdata, handles)
% hObject    handle to fe_opt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns fe_opt contents as cell array
%        contents{get(hObject,'Value')} returns selected item from fe_opt


% --- Executes during object creation, after setting all properties.
function fe_opt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fe_opt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
[dataset, types]= pr_feature_extraction('', 'list-types');
set(hObject,'String',types);

% --- Executes on button press in pushbutton36.
function pushbutton36_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton37.
function pushbutton37_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
addStep(handles, 'FE', getCurrentPopupString(handles.fe_opt), { '' });


% --- Executes on selection change in popupmenu27.
function popupmenu27_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu27 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu27


% --- Executes during object creation, after setting all properties.
function popupmenu27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton38.
function pushbutton38_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton38 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function fs_text2_Callback(hObject, eventdata, handles)
% hObject    handle to fs_text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fs_text2 as text
%        str2double(get(hObject,'String')) returns contents of fs_text2 as a double


% --- Executes during object creation, after setting all properties.
function fs_text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fs_text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function c_text2_Callback(hObject, eventdata, handles)
% hObject    handle to c_text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of c_text2 as text
%        str2double(get(hObject,'String')) returns contents of c_text2 as a double


% --- Executes during object creation, after setting all properties.
function c_text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to c_text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
newdata = {};
newdata.new = 'new';
newdata.presets = {};
newdata.presets{1} = {};
newdata.presets{1}.title = 'New preset';
newdata.presets{1}.items = {};
guidata(hObject, newdata);
%data = guidata(hObject)


%
%
%   HELPERS
%
%
% --- Executes during object creation, after setting all properties.


function str = getCurrentPopupString(hh)
    str = '';
    try
        pmItems     = get(hh,'String');
        str = pmItems{get(hh,'Value')};
    catch
    end

function setEnable(hh)
    %set(hh,'Enable','on');
    set(hh,'Visible','on');
 
function setDisable(hh)
    %set(hh,'Enable','off');
    set(hh,'Visible','off');
  
function setString(hh, str)
    set(hh,'String', str);

function getString(hh)
    get(hh,'String');
    
function addStep(handles, step, func, values)
    data = guidata(handles.figure1);
    
    pres = data.presets{get(handles.p_preset, 'Value')};

    
    newitem = {};
    newitem.step = step;
    newitem.func = func;
    newitem.values = values;
    
    
    next = length(data.presets{get(handles.p_preset, 'Value')}.items) + 1;
    
    data.presets{get(handles.p_preset, 'Value')}.items{next} = newitem;

    
    %disp(data.presets{1});
    
    guidata(handles.figure1, data);
   
    updatePreset(handles, data.presets{1});
          
function updatePreset(handles, preset)

    %clear
    newData = [];
    set(handles.p_table,'Data',newData);
    
    i = 1;
    for item = preset.items
        oldData = get(handles.p_table,'Data');
        item = item{1};
       
        
        newRow = [item.step, item.func, {strjoin(item.values,',')}];

        newData = [oldData; newRow];
        set(handles.p_table,'Data',newData);
        i = i + 1;
    end;


function putLog(log, time, step, func, str)
    %newData = [];
    %set(log,'Data',newData);

    oldData = get(log,'Data');
    
    newRow = [time, step, func, {str}];

    disp(newRow);

    newData = [oldData; newRow];
    set(log,'Data', newData);

    
function applyPreset(handles, preset)
    data = guidata(handles.figure1);
        
    for item = preset.items
       item = item{1};
       disp(item);
       str = 'error';
       
       tic;
       switch item.step
           case 'MV'
               [data.dataset, str] = pr_missing_values( data.dataset, item.func, 'true', item.values{1} );
               [data.tst_dataset, str] = pr_missing_values( data.tst_dataset, item.func, 'true', item.values{1} );
           case 'FE'
               [ data.dataset, str ] = pr_feature_extraction( data.dataset, item.func, item.values );
           case 'FS'
               disp(item.values{1});
               disp(item.values{2});
               [ data.dataset,data.tst_dataset, str ] = pr_feature_selection( data.dataset, data.tst_dataset, item.func, str2num(item.values{1}), item.values{2});
           case 'C'
               [ data.model,data.ypred, str ] = pr_classify(data.dataset, data.tst_dataset, item.func, str2num(item.values{1}) );
           case 'E'
               [data.tst_stat, str] = pr_evaluation(data.ypred,data.tst_dataset);
           case 'P'
               [ data.dataset, str ] = pr_plot( data.dataset, item.func, '' );
       end;
       elapsed = num2str(toc);
       
       putLog(handles.l_table, elapsed, item.step, item.func, str);
       
       disp(str);
    end;



% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupmenu28.
function popupmenu28_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu28 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu28


% --- Executes during object creation, after setting all properties.
function popupmenu28_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton39.
function pushbutton39_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton39 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = guidata(hObject);
[FileName,PathName,FilterIndex] = uigetfile('*.*','Open test dataset');
tic;
[data.tst_dataset, str] = pr_load([PathName FileName], FileName);
elapsed = num2str(toc);
setString(handles.d_test, FileName);
guidata(hObject, data);
putLog(handles.l_table, elapsed, 'D', 'loadtrain', str);
% --- Executes on button press in pushbutton40.
function pushbutton40_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton40 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = guidata(hObject);
[FileName,PathName,FilterIndex] = uigetfile('*.*','Open train dataset');
tic;
[data.dataset, str]= pr_load([PathName FileName], FileName);
elapsed = num2str(toc);
setString(handles.d_train, FileName);
guidata(hObject, data);

putLog(handles.l_table, elapsed, 'D', 'loadtrain', str);

% --- Executes on selection change in popupmenu29.
function popupmenu29_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu29 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu29


% --- Executes during object creation, after setting all properties.
function popupmenu29_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton41.
function pushbutton41_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton41 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
data = guidata(hObject);

[FileName,PathName,FilterIndex] = uigetfile('*.*','Open preset');

data.presets{1} = load([PathName FileName]);

updatePreset(handles, data.presets{1});

guidata(hObject, data);


% --- Executes during object creation, after setting all properties.
function p_table_CreateFcn(hObject, eventdata, handles)
% hObject    handle to p_table (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
newData = [];
set(hObject,'Data',newData);


% --- Executes during object creation, after setting all properties.
function l_table_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l_table (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
newData = [];
set(hObject,'Data',newData);


% --- Executes during object creation, after setting all properties.
function pushbutton20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function e_text2_Callback(hObject, eventdata, handles)
% hObject    handle to e_text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of e_text2 as text
%        str2double(get(hObject,'String')) returns contents of e_text2 as a double


% --- Executes during object creation, after setting all properties.
function e_text2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to e_text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
