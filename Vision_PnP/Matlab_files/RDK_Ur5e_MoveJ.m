function RDK_Ur5e_MoveJ(Target)
    %replaced by global
    %RDK = Robolink;
    global RDK;
    
    % Get the robot item:
    robot = RDK.Item('UR5e');
    Target = RDK.Item(Target);
    
    robot.setPoseFrame(Target.Parent())
    robot.MoveJ(Target)
    pause(0.05)
end

% Python-CODE "get Optimal Joint value"
% def getOptimalJoints(target):
%     #print("getting optimal joints for ", target)
%     ik = robot.SolveIK_All(target, robot.PoseTool())
%     #print("Inverse Kin",ik)
%     selConfigs = []
%     for j in ik:
%         conf = robot.JointsConfig(j).list()
%         rear  = conf[0] # 1 if Rear , 0 if Front
%         lower = conf[1] # 1 if Lower, 0 if Upper (elbow)
%         flip  = conf[2] # 1 if Flip , 0 if Non flip (Flip is usually when Joint 5 is negative)
%         if rear == 1 and lower == 0 and flip == 1:
%             #print("Config: ",conf, j)
%             #print("Caculated Joints Postion: ", j)
%             selConfigs.append(j)
%     #print("Found Configs: ", len(selConfigs))
%     selConfigsNp = np.array(selConfigs)
%     currJoints = robot.Joints()
%     #print("Configs:", selConfigs)
%     #print("Current Joint: ",currJoints)
%     jointWeights = [4,1,1,3,2,1]
%     deltaConfigs = (selConfigsNp[:,:6] - currJoints)**2
%     for d in deltaConfigs:
%         for i in range(6):
%             d[i] = d[i]*jointWeights[i]
%     normConfigs = np.sqrt(np.sum(deltaConfigs,axis=1))
%     #print("Weights:", normConfigs)
%     selJoint = selConfigs[np.argmin(normConfigs)]
%     #print("Selected Joint is: ", selJoint)
%     return selJoint