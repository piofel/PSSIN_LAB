function draw_aircraft(uu)
    p = uu(1:3);
    pn       = uu(1);       % inertial North position     
    pe       = uu(2);       % inertial East position
    pd       = uu(3);       % inertial Down position
    phi      = uu(4);       % roll angle         
    theta    = uu(5);       % pitch angle     
    psi      = uu(6);       % yaw angle
    t        = uu(7);
    viewSize = uu(8);
    viewAzimuth = uu(9);
    viewElevation = uu(10);
    viewEnabled = uu(11);

    % define persistent variables 
    persistent aircraftHandle;
    persistent vertices
    persistent faces
    persistent faceColors

    % first time function is called, initialize plot and persistent vars
    if t==0
        figure(1);
        clf;
        [vertices, faces, faceColors] = defineAircraftBody;
        v = transformVertices(vertices,pn,pe,pd,phi,theta,psi);
        aircraftHandle = patch('Vertices',v,'Faces',faces, ...
            'FaceVertexCData',faceColors,'FaceColor','flat');
        title('Aircraft')
        xlabel('East')
        ylabel('North')
        zlabel('Height')
        view(viewAzimuth,viewElevation)
        axis(calvViewLimits(p,viewSize));
        hold on
        grid on
    else  % at every other time step, redraw
        figure(1);
        v = transformVertices(vertices,pn,pe,pd,phi,theta,psi);
        set(aircraftHandle,'Vertices',v,'Faces',faces);
        view(viewAzimuth,viewElevation)
        axis(calvViewLimits(p,viewSize));
        drawnow
    end
end

function [v,f,c] = defineAircraftBody
    fuseL1 = TODO
    fuseL2 = TODO
    fuseL3 = TODO
    fuseH = TODO
    wingW = TODO
    tailWingW = TODO
    % define the location of vertices
    v = TODO
    % define the faces
    f = TODO
    % define colors for each face    
    myred = [1, 0, 0];
    mygreen = [0, 1, 0];
    myblue = TODO
    c = TODO
end

function v = transformVertices(vertices,pn,pe,pd,phi,theta,psi)
    v = angle2dcm(psi,theta,phi)'*vertices';  % rotate
    v = translate(v, pn, pe, pd)';  % translate
    r = [...
            0, 1, 0;...
            1, 0, 0;...
            0, 0, -1;...
        ];  % transform vertices from NED to ENU 
            % (for matlab rendering)
    v=v*r;
end

function v = translate(v,pn,pe,pd)
    v = v + repmat([pn;pe;pd],1,size(v,2));
end

function limits = calvViewLimits(positionVector, viewSize)
    x1 = positionVector(1) - viewSize;
    x2 = positionVector(1) + viewSize;
    y1 = positionVector(2) - viewSize;
    y2 = positionVector(2) + viewSize;
    z1 = -positionVector(3) - viewSize;
    z2 = -positionVector(3) + viewSize;
    limits = [y1,y2,x1,x2,z1,z2]; % ENU coordinates while positionVector is in NED
end