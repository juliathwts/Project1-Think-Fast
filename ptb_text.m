%%%%%%% First time integrating elements 
%%%%%%%%%%%%%%
% Basic setup, intializing variables 
sca;
close all;
clear all;
Screen('preference', 'SkipSyncTests', 1);
PsychDefaultSetup(2);

%choosing the primary screen for the display of the program
screens = Screen('Screens');
screenNumber = max(screens); 

rand('state', sum(100*clock)); %zeroing computer clock for RT recording
KbName('UnifyKeyNames');    %unifying key names for all types of laptops

%Assigning buttons to variables
Key1=KbName('LeftArrow');
Key2=KbName('RightArrow');
spaceKey = KbName('space');
escKey = KbName('ESCAPE');

white = [ 255 255 255]; black = [ 0 0 0];
bgcolor = black; textcolor = white;

%Initiating variables for RT recording loop
unrel_counter = 1;
synt_counter = 1;
sema_counter = 1;
rt_unrel = ones(1,15);
rt_synt = ones(1,15);
rt_sema = ones(1,15);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Screen parameters
[mainwin, screenrect] = Screen(0, 'OpenWindow'); %screenrect = [left top right bottom]
Screen('FillRect', mainwin, bgcolor);
center = [screenrect(3)/2 screenrect(4)/2];     %position of prompt word in prompt screen
centerq1 = [screenrect(3)/4 screenrect(4)/2];   %position of prompt word in choice screen
centerq2 = [screenrect(3)*.75 screenrect(4)/2]; %position of choice word in chocie screen
Screen(mainwin, 'Flip');

%%%%%%% vectors of choice words associated with each prompt word
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

%loop to randomizes, in an organized way, the assignment of choice words from each category in second column of exp_words to col 1 words%
for ii = 1:15
    exp_words(ii*3 -2,2) = words(ii,randi([2 4],1,1)); 
    exp_words(ii*3 -1,2) = (words(ii,randi([5 7],1,1)));
    exp_words(ii*3 ,2) = (words(ii,randi([8 10],1,1)));
end


%rearrange exp_words to mix order
exp_order = (exp_words(randperm(45),:));
exp_order = rot90(exp_order); %now prompt words are all in row 2 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Experimental instructions, wait for a spacebar response to start
Screen('FillRect', mainwin ,bgcolor);
Screen('TextSize', mainwin, 24);
% Display instruction text here
Screen('DrawText',mainwin,'Press the arrow key that corresponds to the location of the prompt word.' ,center(1)-350,center(2)-20,textcolor);
Screen('DrawText',mainwin,'Press spacebar to start the experiment' ,center(1)-350,center(2)+30,textcolor);
Screen('Flip',mainwin );

%%Determining effect of pressed keys. 
%effect = start if space OR close if esc.
keyIsDown=0;
while 1
    [keyIsDown, secs, keyCode] = KbCheck;
    if keyIsDown
        if keyCode(spaceKey)
            break ;
        elseif keyCode(escKey)
            ShowCursor;
            Screen('CloseAll');
            return;
        end
    end
end
WaitSecs(0.3);
%%%%% 

for ii = 1:45
%in trial loop after star position is randomized 

str1 = exp_order(1,ii); % str1 = CHOICE WORD
str2 = exp_order(2, ii); %sstr2 = PROMPT WORD 
pt_word = char(str2); %convert prompt word to characters for screen command
trial_choice = [str1; str2];% turn choice into column vector to use shuffle function
mytext = Shuffle(trial_choice);  %randomize the order of the choice words
char1 = char(mytext(1));    %switch to char so it can be displayed with screen
char2 = char(mytext(2));
% find function didnt work bc incorrect data type
%find where prompt word ended up after shuffle
if mytext(1) == str2 
    location = 1;
else
    location = 2;
end

%Displayign the choice options
 Screen('DrawText',mainwin,char1 ,centerq1(1)-50,centerq1(2)-20,textcolor);
 Screen('DrawText',mainwin,char2 ,centerq2(1)-50,centerq2(2)-20,textcolor);

 Screen('Flip', mainwin); % must flip for the stimulus to show up on the mainwin
           
        
        %now record response
        timeStart = GetSecs;keyIsDown=0; correct=0; rt=0;
        
        %%Determining effect of first pressed keys. 
        %effect = record time if left/right arrows are pressed correctly OR close if esc.
        %Loop is to ensure reaction time id calculated correctly regardless
        %of how many times wrong arrow is pressed
         while 1
                [keyIsDown, secs, keyCode] = KbCheck;
                FlushEvents('keyDown');
                if keyIsDown    %Assess if a key is pressed
                    nKeys = sum(keyCode);       %Assess number of keys pressed
                    if nKeys==1     
                        if keyCode(Key1)||keyCode(Key2) 
                             if keyCode(Key1) && location == 1  %Press left arrow key correctly
                                rt = GetSecs-timeStart;     %Calculate time since the 2 options appeared and key was pressed
                                Screen('Flip', mainwin);    %Switch screen
                                break;
                             elseif keyCode(Key2) && location ==2 %Press right arrow correctly
                                  rt = GetSecs-timeStart; 
                                Screen('Flip', mainwin);
                                break;
                             end
                        elseif keyCode(escKey)  %esc key pressed
                            ShowCursor;  Screen('CloseAll'); return
                        end
                        keyIsDown=0; keyCode=0;
                    end
                end
         end
         
 % code to determine thematic category of choice word/ storing category of
 % RT data 
unrel_wrd = sum(sum(str1 == words(:,2:4)));
synt_wrd = sum(sum(str1 == words(:,5:7)));
sema_wrd = sum(sum(str1 == words(:,8:10))); 

%Assign recorded reaction time to correct category vector and correct index
if unrel_wrd > 0
    rt_unrel(unrel_counter) = rt;
    unrel_counter = unrel_counter +1; %move index up by 1
elseif synt_wrd > 0
    rt_synt(synt_counter) = rt;
    synt_counter = synt_counter + 1;
elseif sema_wrd > 0
    rt_sema(sema_counter) = rt;
    sema_counter = sema_counter + 1;
end
           
            Screen('FillRect', mainwin ,bgcolor); Screen('Flip', mainwin);
        
        WaitSecs(0.5);
        %%%%%%%%%% 
        
        
end

%Calculate average reaction time for semantic/syntactic/no primimg and
%create text for it
%wors
mean_rt_sema = mean(rt_sema);
mean_rt_sema_str = string(mean_rt_sema);
mean_rt_sema_text = append('Average Response Time in Semantic Condition =', mean_rt_sema_str,' secs');% do this for all 3 conditions at the end of everything
sema_text = char(mean_rt_sema_text);

mean_rt_unrel = mean(rt_unrel);
mean_rt_unrel_str = string(mean_rt_unrel);
mean_rt_unrel_text = append('Average Response Time in Unrelated Condition =', mean_rt_unrel_str,' secs');
unrel_text = char(mean_rt_unrel_text);

mean_rt_synt = mean(rt_synt);
mean_rt_synt_str = string(mean_rt_synt);
mean_rt_synt_text = append('Average Response Time in Syntactic Condition =', mean_rt_synt_str,' secs');
synt_text = char(mean_rt_synt_text);

%%Display result%%
Screen('DrawText', mainwin, 'Your Results:', centerq1(1), center(2)-70);
Screen('DrawText', mainwin, unrel_text, centerq1(1), center(2)+35); %this at the centre centre
Screen('DrawText', mainwin, sema_text, centerq1(1), center(2)-35); %this one should be printed at the centre top of the screen roughly
Screen('DrawText', mainwin, synt_text, centerq1(1), center(2)); %not sure how to place this at the bottom

Screen('Flip', mainwin);

WaitSecs(3);       
sca;
