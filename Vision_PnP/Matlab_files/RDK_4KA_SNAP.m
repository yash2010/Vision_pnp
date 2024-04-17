function RDK_4KA_SNAP()
    %replaced by global
    %RDK = Robolink()
    %rdk_real_robot = 1;
    %RDK.setParam('RUN_MODE', num2str(rdk_real_robot));
    global RDK;

    rdk_real_robot = RDK.getParam('RUN_MODE');
    %RUN_Mode "0"=false =>simulation
    %RUN_Mode "0"=true =>real-robot

    if rdk_real_robot == "0"
        RDK.setRunMode(RDK.RUNMODE_SIMULATE)
        CameraSnapshot = RDK.Item('4ka_sim');
        fprintf('snapping sim_')
        CameraSnapshot.RunProgram();
        
    else 
        RDK.setRunMode(RDK.RUNMODE_SIMULATE)
        CameraSnapshot = RDK.Item('4ka_real');    
        fprintf('snapping rel_')
        CameraSnapshot.RunProgram();
        RDK.setRunMode(RDK.RUNMODE_RUN_ROBOT)
    end
    
    while CameraSnapshot.Busy()
        fprintf('.')
        pause(0.05)
    end
    fprintf('_snap_')
    pause(0.05)    
    fprintf('_done! \n')
    
end