%%%%%%% First time integrating elements 
%%%%%%%%%%%%%%
% Basic setup, intializing variables 
sca;
close all;
clear all;
Screen('preference', 'SkipSyncTests', 1);
PsychDefaultSetup(2);
% testing ptb - creating grey screen
screens = Screen('Screens');
screenNumber = max(screens);      
rand('state', sum(100*clock)); %zeroing computer clock for RT recording??
KbName('UnifyKeyNames');
Key1=KbName('LeftArrow'); Key2=KbName('RightArrow');
spaceKey = KbName('space'); escKey = KbName('ESCAPE');
corrkey = [80, 79]; % left and right arrow
white_I = WhiteIndex(screenNumber);
black_I = BlackIndex(screenNumber);
grey = white_I/2; 
%gray = [127 127 127 ];
white = [ 255 255 255]; black = [ 0 0 0];
bgcolor = white; textcolor = black;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Screen parameters
[mainwin, screenrect] = Screen(0, 'OpenWindow');
Screen('FillRect', mainwin, bgcolor);
center = [screenrect(3)/2 screenrect(4)/2];
centerq1 = [screenrect(3)/4 screenrect(4)/2];
centerq2 = [screenrect(3)*.75 screenrect(4)/2];
Screen(mainwin, 'Flip');
%KbStrokeWait;
%sca; 
%%%%%%%
sad = ["Sad" "Bug" "Peanut" "Water" "Depressed" "Unhappy" "Miserable" "Sed" "Said" "Scad"];
happy = ["Happy" "Cantaloupe" "Unicorn" "Toes" "Delighted" "Joyful" "Glad" "Hobby" "Hoppy" "Hippy"];
scared = ["Scared" "Slipper" "Round" "Porch" "Afraid" "Frightened" "Terrified" "Squared" "Scarred" "Scored"];
nervous = ["Nervous" "Gate" "Lost" "Bumper" "Stressed" "Anxious" "Worried" "Nervus" "Famous" "Nervosa"];
angry = ["Angry" "Clip" "Orange" "Pink" "Furious" "Upset" "Mad" "Ambry" "Hungry" "Anger"];
red = ["Red" "Bug" "Peanut" "Water" "Blood" "Tomato" "Crimson" "Reed" "Rid" "Rod"];
black = ["Black" "Cantaloupe" "Unicorn" "Toes" "Crow" "Ebony" "Midnight" "Back" "Block" "Blake"];
blue = ["Blue" "Slipper" "Round" "Porch" "Sky" "Navy" "Ocean" "Blu" "Blew" "Bleu"];
teal = ["Teal" "Gate" "Lost" "Bumper" "Turquoise" "Aqua" "Cyan" "Teale" "Tale" "Teel"];
green = ["Green" "Orange" "Pink" "Furious" "Mint" "Grass" "Leaf" "Greene" "Gene" "Grene"];
cat = ["Cat" "Bug" "Peanut" "Water" "Meow" "Kitten" "Feline" "Cot" "Kat" "Chat"];
dog = ["Dog" "Cantaloupe" "Unicorn" "Toes" "Bark" "Canine" "Puppy" "Dug" "Doggy" "Doug"];
bird = ["Bird" "Slipper" "Round" "Porch" "Fly" "Wings" "Chirp" "Birdy" "Birde" "Bride"];
fish = ["Fish" "Gate" "Lost" "Bumper" "Ocean" "Scale" "Swim" "Fisch" "Fiche" "Fishy"];
rabbit = ["Rabbit" "Clip" "Orange" "Pink" "Bunny" "Easter" "Carrot" "Rabbet" "Rabid" "Rapid"];
words = [sad; happy; scared; nervous; angry; red; black; blue; teal; green; cat; dog; bird; fish; rabbit];
% 15 x 10 matrix containing all words
exp_words = strings(45,2); %create empty string array of dimesions 45 x 2
exp_words(:,1)= ["Sad" "Sad" "Sad" "Happy" "Happy" "Happy" "Scared" "Scared" "Scared" "Nervous" "Nervous" "Nervous" ...
    "Angry" "Angry" "Angry" "Red" "Red" "Red" "Black" "Black" "Black" "Blue" "Blue" "Blue" "Teal" "Teal" "Teal" "Green" ...
    "Green" "Green" "Cat" "Cat" "Cat" "Dog" "Dog" "Dog" "Bird" "Bird" "Bird" "Fish" "Fish" "Fish" "Rabbit" "Rabbit" "Rabbit"];

for ii = 1:15
    exp_words(ii*3 -2,2) = words(ii,randi([2 4],1,1)); 
    exp_words(ii*3 -1,2) = (words(ii,randi([5 7],1,1)));
    exp_words(ii*3 ,2) = (words(ii,randi([8 10],1,1)));
end
%create boolean statements to determine if str word is unrelated, syntactic, or semantic 
% XXXX_wrd is >= 1 if target_wrd is in that category, 0 otherwise
target_wrd = words(1,4) ;
unrel_wrd = sum(sum(target_wrd == words(:,2:4)));
synt_wrd = sum(sum(target_wrd == words(:,5:7)));
sema_wrd = sum(sum(target_wrd == words(:,8:10)));
% brainstorming how to connect boolean variables to RT loop 
rt_unrel = 0;
rt_synt = 0;
rt_sema = 0;
if unrel_wrd > 0
    rt_unrel = rt_unrel + 1;
elseif synt_wrd > 0
    rt_synt = rt_synt + 1;
elseif sema_wrd > 0
    rt_sema = rt_sema + 1;
end

%rearrange exp_words to mix order
exp_order = (exp_words(randperm(45),:));
exp_order = rot90(exp_order); %now prompt words are all in row 2 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Experimental instructions, wait for a spacebar response to start
Screen('FillRect', mainwin ,bgcolor);
Screen('TextSize', mainwin, 24);
% Revanna: modify instruction text here
Screen('DrawText',mainwin,'Press the arrow key that corresponds to the location of the prompt word. Press spacebar to start the experiment.' ,center(1)-450,center(2)-20,textcolor);
Screen('Flip',mainwin );
%KbStrokeWait;
%sca;

keyIsDown=0;
while 1
    [keyIsDown, secs, keyCode] = KbCheck;
    if keyIsDown
        if keyCode(spaceKey)
            break ;
        elseif keyCode(escKey)
            ShowCursor;
            fclose(outfile);
            Screen('CloseAll');
            return;
        end
    end
end
WaitSecs(0.3);
%%%%% 
location = 0;
for ii = 1:45
%in trial loop after star position is randomized 
%psychImaging and screen command are conflicting????
% [window, windowRect] = PsychImaging('OpenWindow', screenNumber,grey);
% [screenXpixels, screenYpixels] = Screen('WindowSize', window);
% Screen('TextSize', window, 50);
% Screen('TextFont', window, 'Times');
str1 = exp_order(1,ii); % str1 = CHOICE WORD
str2 = exp_order(2, ii); %sstr2 = PROMPT WORD 
trial_choice = [str1; str2];% turn choice into column vector to use shuffle function
mytext = Shuffle(trial_choice); %Nada: did shuffle actually work? cause for me I have to use trial_choice(randperm(2)) every single time!!!!
char1 = char(mytext(1));
char2 = char(mytext(2));
if mytext(1) == str2 %check were prompt word ended up after shuffle
    %Nada: you can just have location = find(mytext,str2); instead of
    %condition, then%
    %%if location == 1 
    %   correct_key = 79 or keyCode(Key1); 
    %else
    %   correct_key = 80 or keyCode(Key2);
    %end
    location = 1;
else
    location = 2;
end
 Screen('DrawText',mainwin,char1 ,centerq1(1)-50,centerq1(2)-20,textcolor);
 Screen('DrawText',mainwin,char2 ,centerq2(1)-50,centerq2(2)-20,textcolor);
% DrawFormattedText(window, char1 , 'center', screenYpixels * 0.5, [0 1 0],[],[],[],[],[],[1 1 screenXpixels *0.5 screenYpixels]);
% DrawFormattedText(window, char2, 'center', screenYpixels * 0.5, [0 1 0],[],[],[],[],[],[screenXpixels *0.5 1 screenXpixels screenYpixels]);
 Screen('Flip', mainwin); % must flip for the stimulus to show up on the mainwin
        %ShowCursor('hand');       
        
        %now record response
        timeStart = GetSecs;keyIsDown=0; correct=0; rt=0;
         while 1
                [keyIsDown, secs, keyCode] = KbCheck;
                FlushEvents('keyDown');
                if keyIsDown
                    nKeys = sum(keyCode);
                    if nKeys==1
                        if keyCode(Key1)||keyCode(Key2) 
                            %put conditions here
                       %Nada: extra condition%       
                            %if getkey == correct_key (defined in line 124 comment) 
                                rt = 1000.*(GetSecs-timeStart);
                                keypressed=find(keyCode);
                                Screen('Flip', mainwin);
                                break;
                            %end
                        elseif keyCode(escKey)
                            ShowCursor;  Screen('CloseAll'); return
                        end
                        keyIsDown=0; keyCode=0;
                    end
                end
         end
%             if (keypressed==corrkey(1)&&answer==1)||(keypressed==corrkey(2)&&answer==2)
%                 correct=1;Snd('Play', Beep4);
%                 % doesnt apply bc there is no incorrect answer
%                 %Manipulate this part so that Rt is only recorded on
%                 %correct key presses
%
%             else
%                 correct=0; Snd('Play', Beep1); WaitSecs(ErrorDelay);
            %end
           
            %is there a flipping issue here??
            Screen('FillRect', mainwin ,bgcolor); Screen('Flip', mainwin);
        
        WaitSecs(1);
end
        
        
sca;
