% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% Project Think FastTM 
% This code measures reaction times with differentlly related words. The 
% prompt words are drawn from three categories:
% emotions, colors, and animals. We measured differences in reaction times
% between unrelated words, semantically related words, and syntactically 
% related words. Each experiment includes 45 randomized choices, with a
% final comaprison of reaction times with 15 of each thematic type
% (unrelated, sematically, and syntactially related). The final output is
% given as a mean reaction time for each thematic category. 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% Basic setup, intializing variables 
% closing all screens and clearing variables 
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

%Assigning key presses to variables
Key1=KbName('LeftArrow');
Key2=KbName('RightArrow');
spaceKey = KbName('space');
escKey = KbName('ESCAPE');

%defining background and text colour
white = [ 255 255 255]; black = [ 0 0 0];
bgcolor = black; textcolor = white;

%Initiating variables for RT recording loop
unrel_counter = 1;
synt_counter = 1;
sema_counter = 1;

%preallocating vectors for reaction time storage
rt_unrel = ones(1,15);
rt_synt = ones(1,15);
rt_sema = ones(1,15);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Screen parameters
[mainwin, screenrect] = Screen(0, 'OpenWindow'); %Assign screen 0 to mainwin %screenrect = [left top right bottom]
Screen('FillRect', mainwin, bgcolor);
center = [screenrect(3)/2 screenrect(4)/2];     %position of center of screen
centerq1 = [screenrect(3)/4 screenrect(4)/2];   %position of x 1st quarter of screen
centerq2 = [screenrect(3)*.75 screenrect(4)/2]; %position of x 3rd quarter of screen
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
%col1 = prompt words, col 2:4 = unrelated words, col 5:7 = semantic words,
%col 8:10 = syntactic words
exp_words = strings(45,2); %create empty string array of dimesions 45 x 2
%Assign column 1 to triplets of prompt words in order
exp_words(:,1)= ["Sad" "Sad" "Sad" "Happy" "Happy" "Happy" "Scared" "Scared" "Scared" "Nervous" "Nervous" "Nervous" ...
    "Angry" "Angry" "Angry" "Red" "Red" "Red" "Black" "Black" "Black" "Blue" "Blue" "Blue" "Teal" "Teal" "Teal" "Green" ...
    "Green" "Green" "Cat" "Cat" "Cat" "Dog" "Dog" "Dog" "Bird" "Bird" "Bird" "Fish" "Fish" "Fish" "Rabbit" "Rabbit" "Rabbit"];
%Assign column 2 to exp_words

%loop to randomize, thematic word selection such that each prompt word is matched with a choice word
for ii = 1:15
    exp_words(ii*3 -2,2) = words(ii,randi([2 4],1,1)); 
    exp_words(ii*3 -1,2) = (words(ii,randi([5 7],1,1)));
    exp_words(ii*3 ,2) = (words(ii,randi([8 10],1,1)));
end
%exp_words is a 45*2 randomized selection of a given trial's choices s.t
%there are 15 of each thematic category and 3 uses of each prompt word

%rearrange rows of exp_words to randomized order and preserve pairing
exp_order = (exp_words(randperm(45),:));
exp_order = rot90(exp_order); %reshape matrix to 2*45 so that now prompt words are all in row 2 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Experimental instructions, wait for a spacebar response to start
%text and bg formating for instructions
Screen('FillRect', mainwin ,bgcolor);
Screen('TextSize', mainwin, 24);
Screen('TextFont', mainwin, 'Times');
Screen('DrawText',mainwin,'Press the arrow key that corresponds to the location of the prompt word.' ,center(1)-350,center(2)-20,textcolor);
Screen('DrawText',mainwin,'Press spacebar to start the experiment' ,center(1)-350,center(2)+30,textcolor);
Screen('Flip',mainwin ); %display instructions

%%Initialize kbCheck 
%start if space OR close if esc.
keyIsDown=0; %No key is pressed
while 1 %for any key is pressed
    [keyIsDown, secs, keyCode] = KbCheck; %When keyisdown=1, kbCheck gives time when key is pressed, and record keyCode
    if keyIsDown    %Assess if any keys are pressed
        if keyCode(spaceKey)    %if space key is pressed
            break ;
        elseif keyCode(escKey)  %if esc key pressed
            ShowCursor;
            Screen('CloseAll');
            return;
        end
    end
end
WaitSecs(0.3);
%%%%% 

%Trial loop
for ii = 1:45 

str1 = exp_order(1,ii); % str1 = CHOICE WORD
str2 = exp_order(2, ii); %sstr2 = PROMPT WORD 
pt_word = char(str2); %convert prompt word to characters for screen command
trial_choice = [str1; str2];% turn choice into column vector to use shuffle function
mytext = Shuffle(trial_choice);  %randomize the order of the choice words
char1 = char(mytext(1));    %switch to char so it can be displayed with screen
char2 = char(mytext(2));

%find where prompt word ended up after shuffle and assign position to
%location variable
if mytext(1) == str2 
    location = 1;
else
    location = 2;
end

%%%% display prompt word for 600ms
Screen('TextSize', mainwin, 50);
Screen('DrawText',mainwin,pt_word ,center(1)-20,center(2)-20,textcolor);
Screen('Flip', mainwin); % display prompt word
WaitSecs(0.6); %display period in seconds of prompt word
Screen('FillRect', mainwin ,bgcolor); Screen('Flip', mainwin); %display blank screen
WaitSecs(0.6); %time interval between prompt word and choice

%%%%%% display choice 
 Screen('DrawText',mainwin,char1 ,centerq1(1)+50,centerq1(2)-20,textcolor);
 Screen('DrawText',mainwin,char2 ,centerq2(1)-150,centerq2(2)-20,textcolor);

 Screen('Flip', mainwin); % flip to display choice on the mainwin
           
        
        %now record response
        timeStart = GetSecs; %stores time of when choices display
        keyIsDown=0; rt=0;
        
        %%Determining effect of the first pressed key. 
        %effect = record time if left/right arrows are pressed correctly OR close if esc.
        %Loop is to ensure reaction time is only recorded when correct key
        %is pressed
         while 1
                [keyIsDown, secs, keyCode] = KbCheck;
                FlushEvents('keyDown');
                if keyIsDown    % =1 when a key is pressed
                    nKeys = sum(keyCode);       %Assess number of keys pressed
                    if nKeys==1     %To detect only one key pres at a time
                        if keyCode(Key1) && location == 1  %Press left arrow key correctly
                            rt = GetSecs-timeStart;     %Calculate time since the options appeared and now
                            Screen('Flip', mainwin);    %Switch screen
                            break;
                        elseif keyCode(Key2) && location ==2 %Press right arrow correctly
                            rt = GetSecs-timeStart; 
                            Screen('Flip', mainwin);
                            break;
                        elseif keyCode(escKey)  %esc key pressed
                            ShowCursor;  Screen('CloseAll'); return
                        end
                        keyIsDown=0; keyCode=0; %reinitialize
                    end
                end
         end
         
 % code to determine thematic category of choice word/ storing category of
 % RT data 
 % Determines if choice word is present in first, second, or third set of
 % columns in words matrix
 % double sum is to convert logical array to integer
unrel_wrd = sum(sum(str1 == words(:,2:4)));
synt_wrd = sum(sum(str1 == words(:,5:7)));
sema_wrd = sum(sum(str1 == words(:,8:10))); 

%Add recorded reaction time to correct rt_category vector at index = length(category vector) +1
if unrel_wrd > 0
    rt_unrel(unrel_counter) = rt; %assign value rt at index = unrel_counter
    unrel_counter = unrel_counter +1; %move index up by 1
elseif synt_wrd > 0
    rt_synt(synt_counter) = rt;
    synt_counter = synt_counter + 1;
elseif sema_wrd > 0
    rt_sema(sema_counter) = rt;
    sema_counter = sema_counter + 1;
end
           
            Screen('FillRect', mainwin ,bgcolor);
            Screen('Flip', mainwin);
        
        WaitSecs(0.5);
        %%%%%%%%%% 
        
        
end

%Calculate average reaction time for semantic/syntactic/no primimg and
%create text for it

mean_rt_sema = mean(rt_sema);   %calculate mean reaction time for all semantic words displayed in trial
mean_rt_sema_str = string(mean_rt_sema);    %converts above to string
mean_rt_sema_text = append('Average Response Time in Semantic Condition =', mean_rt_sema_str,' secs');
%the message that will be displayed for average semantic response time
sema_text = char(mean_rt_sema_text); %converts above to character array

mean_rt_unrel = mean(rt_unrel);
mean_rt_unrel_str = string(mean_rt_unrel);
mean_rt_unrel_text = append('Average Response Time in Unrelated Condition =', mean_rt_unrel_str,' secs');
unrel_text = char(mean_rt_unrel_text);

mean_rt_synt = mean(rt_synt);
mean_rt_synt_str = string(mean_rt_synt);
mean_rt_synt_text = append('Average Response Time in Syntactic Condition =', mean_rt_synt_str,' secs');
synt_text = char(mean_rt_synt_text);

%displays final output given as a mean reaction time for each thematic category
Screen('TextSize', mainwin, 24);
Screen('DrawText', mainwin, 'Your Results:', centerq1(1), center(2)-70);
Screen('DrawText', mainwin, unrel_text, centerq1(1), center(2)+35); %this at the centre centre
Screen('DrawText', mainwin, sema_text, centerq1(1), center(2)-35); %this one should be printed at the centre top of the screen roughly
Screen('DrawText', mainwin, synt_text, centerq1(1), center(2)); %not sure how to place this at the bottom

Screen('Flip', mainwin);

WaitSecs(3); 
KbStrokeWait; 
sca;
