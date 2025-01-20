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

    % define persistent variables 
    persistent aircraftHandle;
    persistent vertices
    persistent faces
    persistent faceColors


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
    else
        v = transformVertices(vertices,pn,pe,pd,phi,theta,psi);
        set(aircraftHandle,'Vertices',v,'Faces',faces);
        view(viewAzimuth,viewElevation)
        axis(calvViewLimits(p,viewSize));
        drawnow
    end
end

function [v,f,c] = defineAircraftBody
    fuseL1 = 1;
    fuseL2 = 0.5;
    wingL = 0.5;
    tailWingW = 0.75;
    % TODO

    % define the location of vertices
    v = ...
         [
                fuseL1              0           0;          % point 1
                fuseL2              fuseW/2     -fuseH/2;   % point 2
                % TODO
        ];
    % define the faces
    f = ...
        [
                1   2   3   1;
                1   3   4   1;
                % TODO
        ];
    % define colors for each face    
    myred = [1, 0, 0];
    mygreen = [0, 1, 0];
    myblue = [0, 0, 1];
    myyellow = [1, 1, 0];
    mycyan = [0, 1, 1];
    c = ...
        [
            myred;
            myblue;
            myyellow;
            % TODO
        ];
end

function vertices = transformVertices(vertices,pn,pe,pd,phi,theta,psi)
    R = rotation_matrix(phi,theta,psi);
    vertices = R'*vertices';  % rotate
    vertices = translate(vertices, pn, pe, pd);  % translate
    R_to_ENU = [...
            0, 1, 0;...
            1, 0, 0;...
            0, 0, -1;...
        ];  % transform vertices from NED to ENU (for matlab rendering)
    vertices = R_to_ENU * vertices;
    vertices = vertices';
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