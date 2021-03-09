% MY MAIN QUESTION: how do you pull out the response time from the
% respective conditions from the response time loop?

% Boilerplate
% Clear all screens and figures as well as all variables in the workspace

sca;
close all;
clear all;
% Skip some tests in case your initial ScreenTest command failed. Ignore otherwise
% Screen('Preference', 'SkipSyncTests', 1); 
% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);
 
%idea 2
%after rt is found

% Screen('Preference', 'SkipSyncTests', 1);
% %   Screen parameters
% [mainwin, screenrect] = Screen(0, 'OpenWindow');
% Screen('FillRect', mainwin, bgcolor);
% center = [screenrect(3)/2 screenrect(4)/2];
% centerq1 = [screenrect(3)/4 screenrect(4)/2];
% centerq2 = [screenrect(3)*.75 screenrect(4)/2];
% Screen(mainwin, 'Flip');

for ii = 1:45
%     rt = rand
    rt_sema(ii) = rt; % at the bottom of for loop, array storing rts 
end
%outside looop
mean_rt_sema = mean(rt_sema);
%then back to line 24

mean_rt_sema_str = string(mean_rt_sema);
mean_rt_sema_text = append('Average Response Time in Semantic Condition =', char(mean_rt_sema_str));% do this for all 3 conditions at the end of everything


Screen('DrawText', mainwin, mean_rt_sema_text, center(1), center(2)*.33); %this one should be printed at the centre top of the screen roughly
Screen('DrawText', mainwin, mean_rt_unrel_text, center(1), center(2)*.5); %this at the centre centre
Screen('DrawText', mainwin, mean_rt_synt_text, center(1), center(2)*.66); %not sure how to place this at the bottom




