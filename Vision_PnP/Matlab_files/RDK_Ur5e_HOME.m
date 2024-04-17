function RDK_Ur5e_HOME()
    %replaced by global
    %RDK = Robolink;
    global RDK;
    
    rdk_real_robot = RDK.getParam('RUN_MODE');
    %RUN_Mode "0"=false =>simulation
    %RUN_Mode "1"=true =>real-robot
    
    if rdk_real_robot == "0"
       %SIM
       fprintf('RDK_UR5e_HOME_SIM ')
       run = RDK.Item('UR5e_HOME_SIM');
    else
       %REL
       fprintf('RDK_UR5e_HOME_REL ')
       run = RDK.Item('UR5e_HOME_REL');
    end
    run.RunProgram();
    fprintf('going home')
    while run.Busy()
        fprintf('.')
        pause(0.05)
    end
    fprintf('_done! \n')
end