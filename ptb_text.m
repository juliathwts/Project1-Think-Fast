% ptb_text.m
%Boilerplate
%Clear all screens and figures as well as vriables in the workspace
sca;
close all;
clear all;
Screen('preference', 'SkipSyncTests', 1);
PsychDefaultSetup(2);
% testing ptb - creating grey screen
screens = Screen('Screens');
screenNumber = max(screens);
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);
grey = white/2; 

% 2 X 45 matrix 
%organize this matrix by word type so that we can write easy conditionals
%to categorize RT type 
%   is column 1 only prompt or randomize after 
str1 = "Bonjour monde"; %string1 = left 
% some conditional that can recognize whether str1 is the prompt or choice
% word
mytext1 = char(str1);
str2 = "Hello world"; %string2 = right 
mytext2 = char(str2);

[window, windowRect] = PsychImaging('OpenWindow', screenNumber,grey);
[screenXpixels, screenYpixels] = Screen('WindowSize', window);
Screen('TextSize', window, 50);
Screen('TextFont', window, 'Times');
DrawFormattedText(window, mytext1 , 'center', screenYpixels * 0.5, [0 1 0],[],[],[],[],[],[1 1 screenXpixels *0.5 screenYpixels]);
DrawFormattedText(window, mytext2, 'center', screenYpixels * 0.5, [0 1 0],[],[],[],[],[],[screenXpixels *0.5 1 screenXpixels screenYpixels]);
%winRect = [left top right bottom] 
% sx == 'centerblock' to center multiple lines of text
Screen('Flip', window);
KbStrokeWait;
sca;  

%
% else  %% keyboard response       
%             while 1
%                 [keyIsDown, secs, keyCode] = KbCheck;
%                 FlushEvents('keyDown');
%                 if keyIsDown
%                     nKeys = sum(keyCode);
%                     if nKeys==1
%                         if keyCode(Key1) && answer == 1 %keyCode(Key2) 
%                             %put conditions here 
%                             rt = 1000.*(GetSecs-timeStart);
%                             keypressed=find(keyCode);
%                             Screen('Flip', mainwin);
%                             break;
%                         if keyCode(Key2) && answer == 2 %keyCode(Key2) 
%                             %put conditions here 
%                             rt = 1000.*(GetSecs-timeStart);
%                             keypressed=find(keyCode);
%                             Screen('Flip', mainwin);
%                             break; 
%                             
%                         elseif keyCode(escKey)
%                             ShowCursor; fclose(outfile);  Screen('CloseAll'); return
%                         end
%                         keyIsDown=0; keyCode=0;
%                     end
%                 end
%             end
%             if (keypressed==corrkey(1)&&answer==1)||(keypressed==corrkey(2)&&answer==2)
%                 correct=1;Snd('Play', Beep4);
%                 % doesnt apply bc there is no incorrect answer
%                 %Manipulate this part so that Rt is only recorded on
%                 %correct key presses
%             else
%                 correct=0; Snd('Play', Beep1); WaitSecs(ErrorDelay);
%             end
%         end
%         
%         Screen('FillRect', mainwin ,bgcolor); Screen('Flip', mainwin);
% 

