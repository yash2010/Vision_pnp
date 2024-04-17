function RDK_HandE_DO(run_task,run_part)
    %test_values without global
    %RDK = Robolink;
    %run_task = "activate"; %activate, open, open_20mm, close
    %run_part=["pick" "red"]; %[ "", "pick", "place"] ["", "red", "green", "blue"]
    
    %replaced by global
    global RDK;

    rdk_real_robot = RDK.getParam('RUN_MODE');
    %RUN_Mode "0"=false =>simulation
    %RUN_Mode "1"=true =>real-robot
    
    if rdk_real_robot == "0"
        %SIM
        if run_task == "activate"
            fprintf('SIM: Gripper ' + run_task)
            run = RDK.Item('HandE_CLOSE_SIM'); %dummy
        elseif run_task == "open"
            fprintf('SIM: Gripper ' + run_task)
            run = RDK.Item('HandE_OPEN_SIM');
        elseif run_task == "open_20mm"
            fprintf('SIM: Gripper ' + run_task)
            run = RDK.Item('HandE_OPEN_SIM_20mm');
        elseif run_task == "close"
            fprintf('SIM: Gripper ' + run_task)
            run = RDK.Item('HandE_CLOSE_SIM');
        else
            fprintf(strcat('Error! run_task = activate, open, open_20mm, close ??? \n'))
            return
        end
    else
        %REL
        if run_task == "activate"
            fprintf('REL: Gripper ' + run_task)
            run = RDK.Item('Hand-E_DO_ACTIVATE');
        elseif run_task == "open"
            fprintf('REL: Gripper ' + run_task)
            run = RDK.Item('HandE_OPEN_DIO');
        elseif run_task == "open_20mm"
            fprintf('REL: Gripper ' + run_task)
            run = RDK.Item('HandE_CLOSE_DIO');
        elseif run_task == "close"
            fprintf('REL: Gripper ' + run_task)
            run = RDK.Item('HandE_CLOSE_DIO');
        else
            fprintf(strcat('Error! run_task = activate, open, open_20mm, close ??? \n'))
            return
        end
    end
    
    %run selection
    run.RunProgram();
    while run.Busy()
        fprintf('.')
        pause(0.05)
    end
    
    fprintf('_done! \n')
    
    if "0" == "0"
        %SIM %attach part
        if run_part(1) == "pick"
            fprintf('SIM: PICK: ' + run_part(2) + ' part')
            run = RDK.Item( char( 'pick_'+run_part(2)+'_sim') );
            %run selection
            run.RunProgram();
            while run.Busy()
                fprintf('.')
                pause(0.05)
            end
            fprintf('_done! \n')
        elseif run_part(1) == "place"
            fprintf('SIM: PLACE: ' + run_part(2) + ' part')
            run = RDK.Item( char( 'place_'+run_part(2)+'_sim') );
            %run selection
            run.RunProgram();
            while run.Busy()
                fprintf('.')
                pause(0.05)
            end
            fprintf('_done! \n')
        else
            fprintf('SIM: PICK: no part selected!\n')
    end
    
    
end