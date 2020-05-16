function [PL , PLV , APD , APDV , MPD , MPDV , TT] = Simulator3(lambda,n,C,f,P)
% INPUT PARAMETERS:
%  lambda - packet rate (packets/sec)
%  C      - link bandwidth (Mbps)
%  f      - queue size (Bytes)
%  P      - number of packets (stopping criterium)
% OUTPUT PARAMETERS:
%  PL   - packet loss (%)
%  APD  - average packet delay (milliseconds)
%  MPD  - maximum packet delay (milliseconds)
%  TT   - transmitted throughput (Mbps)

%Events:
ARRIVAL= 0;       % Arrival of a packet            
DEPARTURE= 1;     % Departure of a packet
DATA = 0;
VOIP = 1;
%State variables:
State = 0;          % 0 - connection free; 1 - connection bysy
QueueOccupation= 0; % Occupation of the queue (in Bytes)
QueueOccupationV= 0; % Occupation of the queue (in Bytes)
Queue= [];          % Size and arriving time instant of each packet in the queue
QueueV= [];          % Size and arriving time instant of each packet in the queue
%Statistical Counters:
TotalPackets= 0;       % No. of packets arrived to the system
TotalPacketsV= 0;       % No. of packets arrived to the system
LostPackets= 0;        % No. of packets dropped due to buffer overflow
LostPacketsV= 0;        % No. of packets dropped due to buffer overflow
TransmittedPackets= 0; % No. of transmitted packets
TransmittedPacketsV= 0; % No. of transmitted packets
TransmittedBytes= 0;   % Sum of the Bytes of transmitted packets
Delays= 0;             % Sum of the delays of transmitted packets
DelaysV= 0;             % Sum of the delays of transmitted packets
MaxDelay= 0;           % Maximum delay among all transmitted packets
MaxDelayV= 0;           % Maximum delay among all transmitted packets
%Auxiliary variables:
% Initializing the simulation clock:
Clock= 0;

% Initializing the List of Events with the first ARRIVAL:
EventList = [ARRIVAL , Clock + exprnd(1/lambda) , GeneratePacketSize() , 0, DATA];
for i=1:n
    EventList = [EventList; ARRIVAL , Clock + 0.02*rand() , GeneratePacketSizeVOIP() , 0, VOIP];
end
%Similation loop:
while TransmittedPackets+TransmittedPacketsV<P               % Stopping criterium
    EventList= sortrows(EventList,2);    % Order EentList by time
    if size(EventList,1)>0
        Event= EventList(1,1);               % Get first event and 
        Clock= EventList(1,2);               %   and
        PacketSize= EventList(1,3);          %   associated
        ArrivalInstant= EventList(1,4);      %   parameters.
        Type=EventList(1,5 );
        EventList(1,:)= [];                  % Eliminate first event
    else
        Event= EventList(1,1);               % Get first event and 
        Clock= EventList(1,2);               %   and
        PacketSize= EventList(1,3);          %   associated
        ArrivalInstant= EventList(1,4);      %   parameters.
        Type=EventList(1,5 );
        EventList(1,:)= [];                  % Eliminate first event
    end
    switch Event
        case ARRIVAL                     % If first event is an ARRIVAL
            switch Type
                case DATA
                    TotalPackets= TotalPackets+1;
                    EventList = [EventList; ARRIVAL , Clock + exprnd(1/lambda) , GeneratePacketSize() , 0, DATA];
                    if State==0
                        State= 1;
                        EventList = [EventList; DEPARTURE , Clock + 8*PacketSize/(C*10^6) , PacketSize , Clock, DATA];
                    else
                        if QueueOccupation + QueueOccupationV + PacketSize <= f
                            Queue= [Queue;PacketSize , Clock, Type];
                            QueueOccupation= QueueOccupation + PacketSize;
                        else
                            LostPackets= LostPackets + 1;
                        end
                    end
                case VOIP
                    TotalPacketsV= TotalPacketsV+1;
                    EventList = [EventList; ARRIVAL , Clock + 0.016+0.008*rand() , GeneratePacketSizeVOIP() , 0, VOIP];
                    if State==0
                        State= 1;
                        EventList = [EventList; DEPARTURE , Clock +  8*PacketSize/(C*10^6) , PacketSize , Clock, VOIP];
                    else
                        if QueueOccupation + QueueOccupationV + PacketSize <= f
                            QueueV= [QueueV;PacketSize , Clock, Type];
                            QueueOccupationV= QueueOccupationV + PacketSize;
                        else
                            LostPacketsV= LostPacketsV + 1;
                        end
                    end
            end
        case DEPARTURE                     % If first event is a DEPARTURE
            switch Type
                case DATA
                    TransmittedBytes= TransmittedBytes + PacketSize;
                    Delays= Delays + (Clock - ArrivalInstant);
                    if Clock - ArrivalInstant > MaxDelay
                        MaxDelay= Clock - ArrivalInstant;
                    end
                    TransmittedPackets= TransmittedPackets + 1;
                    if QueueOccupationV > 0
                        EventList = [EventList; DEPARTURE , Clock + 8*QueueV(1,1)/(C*10^6) , QueueV(1,1) , QueueV(1,2), QueueV(1,3)];
                        QueueOccupationV= QueueOccupationV - QueueV(1,1);
                        QueueV(1,:)= [];
                    elseif QueueOccupation > 0
                        EventList = [EventList; DEPARTURE , Clock + 8*Queue(1,1)/(C*10^6) , Queue(1,1) , Queue(1,2), Queue(1,3)];
                        QueueOccupation= QueueOccupation - Queue(1,1);
                        Queue(1,:)= [];
                    else
                        State= 0;
                    end
                case VOIP
                    TransmittedBytes= TransmittedBytes + PacketSize;
                    DelaysV= DelaysV + (Clock - ArrivalInstant);
                    if Clock - ArrivalInstant > MaxDelayV
                        MaxDelayV= Clock - ArrivalInstant;
                    end
                    TransmittedPacketsV= TransmittedPacketsV + 1;
                    if QueueOccupationV > 0
                        EventList = [EventList; DEPARTURE , Clock + 8*QueueV(1,1)/(C*10^6) , QueueV(1,1) , QueueV(1,2), QueueV(1,3)];
                        QueueOccupationV= QueueOccupationV - QueueV(1,1);
                        QueueV(1,:)= [];
                     elseif QueueOccupation > 0
                        EventList = [EventList; DEPARTURE , Clock + 8*Queue(1,1)/(C*10^6) , Queue(1,1) , Queue(1,2), Queue(1,3)];
                        QueueOccupation= QueueOccupation - Queue(1,1);
                        Queue(1,:)= [];
                    else
                        State= 0;
                    end
            end
    end
end

%Performance parameters determination:
PL= 100*LostPackets/TotalPackets;      % in %
PLV= 100*LostPacketsV/TotalPacketsV;      % in %
APD= 1000*Delays/TransmittedPackets;   % in milliseconds
APDV= 1000*DelaysV/TransmittedPacketsV;   % in milliseconds
MPD= 1000*MaxDelay;                    % in milliseconds
MPDV= 1000*MaxDelayV;                    % in milliseconds
TT= 10^(-6)*TransmittedBytes*8/Clock;  % in Mbps

end

function out= GeneratePacketSize()
    aux= rand();
    if aux <= 0.16
        out= 64;
    elseif aux >= 0.78
        out= 1518;
    else
        out = randi([65 1517]);
    end
end

function out= GeneratePacketSizeVOIP()
    out = randi([110 130]);
end