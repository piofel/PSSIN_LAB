function autopilot_sfcn(block)
    setup(block);
%endfunction

function setup(block)

  % Register the number of ports.
  block.NumInputPorts  = 2;
  block.NumOutputPorts = 1;
  
  % Set up the port properties to be inherited or dynamic.
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;

  % Override the input port properties.
  block.InputPort(1).DatatypeID  = 0;  % double
  block.InputPort(1).Complexity  = 'Real';
  block.InputPort(2).DatatypeID  = 0;  % double
  block.InputPort(2).Complexity  = 'Real';
  
  % Override the output port properties.
  block.OutputPort(1).DatatypeID  = 0; % double
  block.OutputPort(1).Complexity  = 'Real';

  % Register the parameters.
  block.NumDialogPrms     = 1;
  block.DialogPrmsTunable = {'Nontunable'};
  
  % Set up the continuous states.
  block.NumContStates = 0;

  block.InputPort(1).Dimensions        = 19;
  block.InputPort(1).DirectFeedthrough = false;
  block.InputPort(2).Dimensions        = 3;
  block.InputPort(2).DirectFeedthrough = false;

  block.OutputPort(1).Dimensions       = 16;

  % Register the sample times.
  %  [positive_num offset] : Discrete sample time
  Ts = block.DialogPrm(1).Data(20);
  block.SampleTimes = [Ts 0];

  block.SimStateCompliance = 'DefaultSimState';

  % Register methods
  block.RegBlockMethod('PostPropagationSetup',    @DoPostPropSetup);
  block.RegBlockMethod('InitializeConditions',    @InitConditions);  
  block.RegBlockMethod('Outputs',                 @Output);  
  block.RegBlockMethod('Update',                  @Update);

%endfunction

function DoPostPropSetup(block)
  
    block.NumDworks = 0;

%endfunction

function InitConditions(block)

    xhat = block.InputPort(1).Data;
    commandSignals = block.InputPort(2).Data;
    autopilotParams = block.DialogPrm(1).Data;
    piInitFlag = 1;
    autopilot(xhat,commandSignals,autopilotParams,piInitFlag);

%endfunction

function Output(block)

    autopilotParams = block.DialogPrm(1).Data;
    xhat = block.InputPort(1).Data;
    commandSignals = block.InputPort(2).Data;
    piInitFlag = 0;
    y = autopilot(xhat,commandSignals,autopilotParams,piInitFlag);
    block.OutputPort(1).Data = y;

%endfunction

function Update(block)
    
%endfunction


