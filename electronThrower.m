function [ ] = electronThrower( type )
%Simulates electron subjected to a force
%   No output argument, just pass in type and number of electrons


    global C

    addpath ../geom2d/geom2d

    C.q_0 = 1.60217653e-19;             % electron charge
    C.hb = 1.054571596e-34;             % Dirac constant
    C.h = C.hb * 2 * pi;                    % Planck constant
    C.m_0 = 9.10938215e-31;             % electron mass
    C.kb = 1.3806504e-23;               % Boltzmann constant
    C.eps_0 = 8.854187817e-12;          % vacuum permittivity
    C.mu_0 = 1.2566370614e-6;           % vacuum permeability
    C.c = 299792458;                    % speed of light
    C.g = 9.80665; %metres (32.1740 ft) per s²

    
    angl = 45;
    %PlotTraj = 1;
    %MaxC = 10000;
    %doPlot = 1;

    v0 = 1;
    g = 9.78;
    c = 2;
    dt = 1;
    
    
    if type == 1
        frce = 40;
    elseif type == 2
        frce = 80;
    else 
        frce = 160;
    end
    
    
    xP = 0;
    yP = 0;

    sumv = 0;
    vxP = 0;
    vyP = 0;
    vx = 0;
    vy = 0;
    
    
    for i = 1:1000
        
        prevx = xP;
        prevy = yP;
        vxP = vx;
        vyP = vy;
        accel = frce/1.2;
        vx = vxP + accel * i * cosd(angl);
        vy = vyP + accel * i * sind(angl);
        vel = sqrt((vx*vx)+(vy*vy));
        
        sumv = sumv + vel;
        avvel = sumv/i;
        
        if rand <= 0.05
            vx = 0;
            vy = 0;
            vel = 0;
        end
        
        xP = xP + (vx * dt * i);
        yP = yP + (vy * dt * i);
        
        
        
        hold on
        subplot(2,1,1), plot(xP, yP, '.b');
        xlabel("distance");
        ylabel("distanceY");
        
        hold on
        
        
        subplot(2,1,2), plot(i, vel,'.');
        xlabel("time");
        ylabel("Velocity");
        title(["Dift Velocity = " num2str(avvel)]);
        hold on
        
        
        pause(0.01);
    end
    
    
    


end