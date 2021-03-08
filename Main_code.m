ctgr = {'Emotional'; 'Animal'; 'Colours'};

prompt_emo = {'Sad','Happy','Scared','Nervous','Angry'};
prompt_col = {'Red','Black','Blue','Teal','Green'};
prompt_ani = {'Cat','Dog','Bird','Fish','Rabbit'};

prompt_random = {'Watermelon','Hospital','License','Alarm','Factory','Phone','Computer','Driver','Teacher','Program','President','Caste','Doll','Pillow','Handbag','Couple','Piano','Opera'};
choice_random = {'Bug','Peanut','Water','Cantaloupe','Unicorn','Toes','Slipper','Round','Porch','Gate','Lost','Bumper','Clip','Orange','Pink','Sock','Pool','television'};

semantic_emo = {'Depressed','Unhappy','Miserable','Delighted','Joyful','Glad','Afraid','Frightened','Terrified','Stressed','Anxious','Worried','Furious','Upset','Mad'};
semantic_col = {'Blood','Tomato','Crimson','Crow','Ebony','Midnight','Sky','Navy','Ocean','Turquoise','Aqua','Cyan','Mint','Grass','Leaf'};
semantic_ani = {'Meow','Kitten','Feline','Bark','Canine','Puppy','Fly','Wings','Chirp','Ocean','Scale','Swim','Bunny','Easter','Carrot'};

syntax_emo = {'Sed','Said','Scad','Hobby','Hoppy','Hippy','Squared','Scarred','Scored','Nervus','Famous','Nervosa','Ambry','Hungry','Anger'};
syntax_col = {'Reed','Rid','Rod','Back','Block','Blake','Blu','Blew','Bleu','Teale','Tale','Teel','Greene','Gene','Grene'};
syntax_ani = {'Cut','Kat','Chat','Dug','Doggy','Doug','Birdy','Birde','Bride','Fisch','Fiche','Fishy','Rabbet','Rabid','Rapid'};

Index_ctgr = [1:3]; %#ok<NBRAK>
Index_prompt = [1:5]; %#ok<NBRAK>
Index_semantic = [1:15]; %#ok<NBRAK>
Index_syntax = [1:15]; %#ok<NBRAK>
Index_random = [1:18]; %#ok<NBRAK>

vector_ctgr = ctgr(Index_ctgr);

vector_prompt_random = prompt_random(Index_random);
vector_choice_random = choice_random(Index_random);

vector_prompt_emo = prompt_emo(Index_promt);
vector_semantic_emo = semantic_emo(Index_semantic);
vector_syntax_emo = syntax_emo(Index_syntax);

vector_prompt_col = prompt_col(Index_promt);
vector_semantic_col = semantic_col(Index_semantic);
vector_syntax_col = syntax_col(Index_syntax);

vector_prompt_ani = prompt_ani(Index_promt);
vector_semantic_ani = semantic_ani(Index_semantic);
vector_syntax_ani = syntax_ani(Index_syntax);

%%have to define prompt_word, choice_word; want them to be strings%%
%don't think it's necessary actually%

total_num_RT_semantic_emo = 0;
RT_semantic_emo = 0;
total_sum_RT_semantic_emo = 0;
mean_RT_semantic_emo = 0;

total_num_RT_syntax_emo = 0;
RT_syntax_emo = 0;
total_sum_RT_syntax_emo = 0;
mean_RT_syntax_emo = 0;

total_num_RT_baseline_emo = 0;
RT_baseline_emo = 0;
total_sum_RT_baseline_emo = 0;
mean_RT_baseline_emo = 0;


total_num_RT_semantic_col = 0;
RT_semantic_col = 0;
total_sum_RT_semantic_col = 0;
mean_RT_semantic_col = 0;

total_num_RT_syntax_col = 0;
RT_syntax_col = 0;
total_sum_RT_syntax_col = 0;
mean_RT_syntax_col = 0;

total_num_RT_baseline_col = 0;
RT_baseline_col = 0;
total_sum_RT_baseline_col = 0;
mean_RT_baseline_col = 0;

tal_num_RT_semantic_ani = 0;
RT_semantic_ani = 0;
total_sum_RT_semantic_ani = 0;
mean_RT_semantic_ani = 0;

total_num_RT_syntax_ani = 0;
RT_syntax_ani = 0;
total_sum_RT_syntax_ani = 0;
mean_RT_syntax_ani = 0;

total_num_RT_baseline_ani = 0;
RT_baseline_ani = 0;
total_sum_RT_baseline_ani = 0;
mean_RT_baseline_ani = 0;

%%Learning block%%
For jj = 1:20
    prompt_word = vector_prompt_random(randi(18));
    disp(prompt_word); %%for x seconds%%
    choice_word = vector_choice_random(randi(18));
    prompt_choice_vector = [prompt_word,choice_word];
    disp_vector = prompt_choice_vector(randperm(2));
    disp(disp_vector); %%untill participant clicks correct arrow%%
    idx = find(disp_vector(prompt_word));
    
    % determine which arrow should be pressed%
    if idx == 1
        correct_key_ascii = 37; %%37 is the ascii code for left arrow 
    else
        correct_key_ascii = 39; %%39 is the ascii code for right arrow
    end
    
    % check that correct arrow is pressed% %%not very sure about this%%
    while n > 0 %%loop so that if the pressed key is wrong, the getkey resets%% 
        if getkey == correct_key_ascii %%getkey returns the ascii code of the first pressed key
            change_screen_function; %%go to black screen for 0.5 seconds then to prompt screen for x time%%
            break
        else
            n = n+1; %%to reset getkey%%
            %can also potentially add a beep sound to signal the pressed
            %key is wrong
        end
    end


%%Block code%%
promt_ctgr = randi(3,45);
for ii = 1:45    
    a = prompt_ctgr(ii);
    if a == 1
        b = randi(5);
       prompt_word = vector_prompt_emo(b);
       
       %%disp(prompt_word); use apprpriate function to display it for x time then black screen for y time then disp promt and choice%%
       
       if  b == 1
           vector_choice_word = [vector_semantic_emo(randi(3)),vector_syntax_emo(randi(3)),vector_choice_random(randi(18))];
           choice_word = vector_choice_word(randi(3)); %%create a vector that contains one of these 3 values, and then pick an index from that vector randi(2) that vector)%%
           prompt_choice_vector = [prompt_word,choice_word];
           disp_vector = prompt_choice_vector(randperm(2));
           disp(disp_vector); %%untill participant clicks correct arrow%%
           idx = find(disp_vector(prompt_word));
            % determine which arrow should be pressed%
            if idx == 1
                correct_key_ascii = 37; %%37 is the ascii code for left arrow 
            else
                correct_key_ascii = 39; %%39 is the ascii code for right arrow
            end
            % check that correct arrow is pressed% %%not very sure about this%%
            while n > 0 %%loop so that if the pressed key is wrong, the getkey resets%% 
                if getkey == correct_key_ascii %%getkey returns the ascii code of the first pressed key
                    reaction_time = record_RT_function; %%PTB RT%%
                    change_screen_function; %%go to black screen for 0.5 seconds then to prompt screen for x time%%
                    break
                else
                    n = n+1; %%to reset getkey%%
                end
            end
           if choice_word == vector_semantic_emo(1) || choice_word ==  vector_semantic_emo(2) || choice_word ==  vector_semantic_emo(3) %%categorize recation time as semantic%%
               total_num_RT_semantic_emo = total_num_RT_semantic_emo + 1;
               RT_semantic_emo = reaction_time;
               total_sum_RT_semantic_emo = total_sum_RT_semantic_emo + RT_semantic_emo;
               mean_RT_semantic_emo = total_sum_RT_semantic_emo / total_num_RT_semantic_emo;
           elseif choice_word == vector_syntax_emo(1) || choice_word ==  vector_syntax_emo(2) || choice_word ==  vector_syntax_emo(3)
               total_num_RT_syntax_emo = total_num_RT_syntax_emo + 1; %%categorie reaction time as syntax%%
               RT_syntax_emo = reaction_time;
               total_sum_RT_syntax_emo = total_sum_RT_syntax_emo + RT_syntax_emo;
               mean_RT_syntax_emo = total_sum_RT_syntax_emo / total_num_RT_syntax_emo;
           else
               total_num_RT_baseline_emo = total_num_RT_baseline_emo + 1; %%categorie reaction time as random%%
               RT_baseline_emo = reaction_time;
               total_sum_RT_baselinex_emo = total_sum_RT_baseline_emo + RT_baseline_emo;
               mean_RT_baseline_emo = total_sum_RT_baseline_emo / total_num_RT_baseline_emo;
           end
           
       elseif b == 2
           vector_choice_word = [vector_semantic_emo(randi(3)+3),vector_syntax_emo(randi(3)+3),vector_choice_random(randi(18))];
           choice_word = vector_choice_word(randi(3));
           prompt_choice_vector = [prompt_word,choice_word];
           disp_vector = prompt_choice_vector(randperm(2));
           disp(disp_vector); %%untill participant clicks correct arrow%%
           idx = find(disp_vector(prompt_word));
    
            % determine which arrow should be pressed%
            if idx == 1
                correct_key_ascii = 37; %%37 is the ascii code for left arrow 
            else
                correct_key_ascii = 39; %%39 is the ascii code for right arrow
            end
    
             % check that correct arrow is pressed% %%not very sure about this%%
            while n > 0 %%loop so that if the pressed key is wrong, the getkey resets%% 
                if getkey == correct_key_ascii %%getkey returns the ascii code of the first pressed key
                    reaction_time = record_RT_function; %%PTB RT%%
                    change_screen_function; %%go to black screen for 0.5 seconds then to prompt screen for x time%%
                    break
                else
                    n = n+1; %%to reset getkey%%
                end
            end
           if choice_word == vector_semantic_emo(4) || choice_word ==  vector_semantic_emo(5) || choice_word ==  vector_semantic_emo(6)
               total_num_RT_semantic_emo = total_num_RT_semantic_emo + 1;
               RT_semantic_emo = reaction_time;
               total_sum_RT_semantic_emo = total_sum_RT_semantic_emo + RT_semantic_emo;
               mean_RT_semantic_emo = total_sum_RT_semantic_emo / total_num_RT_semantic_emo;
           elseif choice_word == vector_syntax_emo(4) || choice_word ==  vector_syntax_emo(5) || choice_word ==  vector_syntax_emo(6)
               total_num_RT_syntax_emo = total_num_RT_syntax_emo + 1;
               RT_syntax_emo = reaction_time;
               total_sum_RT_syntax_emo = total_sum_RT_syntax_emo + RT_syntax_emo;
               mean_RT_syntax_emo = total_sum_RT_syntax_emo / total_num_RT_syntax_emo;
           else
               total_num_RT_baseline_emo = total_num_RT_baseline_emo + 1; %%categorie reaction time as random%%
               RT_baseline_emo = reaction_time;
               total_sum_RT_baselinex_emo = total_sum_RT_baseline_emo + RT_baseline_emo;
               mean_RT_baseline_emo = total_sum_RT_baseline_emo / total_num_RT_baseline_emo;
               
           end
           
       elseif b == 3
           vector_choice_word = [vector_semantic_emo(randi(3)+6),vector_syntax_emo(randi(3)+6),vector_choice_random(randi(18))];
           choice_word = vector_choice_word(randi(3));
           prompt_choice_vector = [prompt_word,choice_word];
           disp_vector = prompt_choice_vector(randperm(2));
           disp(disp_vector); %%untill participant clicks correct arrow%%
           idx = find(disp_vector(prompt_word));
    
            % determine which arrow should be pressed%
            if idx == 1
                correct_key_ascii = 37; %%37 is the ascii code for left arrow 
            else
                correct_key_ascii = 39; %%39 is the ascii code for right arrow
            end
    
             % check that correct arrow is pressed% %%not very sure about this%%
            while n > 0 %%loop so that if the pressed key is wrong, the getkey resets%% 
                if getkey == correct_key_ascii %%getkey returns the ascii code of the first pressed key
                    reaction_time = record_RT_function; %%PTB RT%%
                    change_screen_function; %%go to black screen for 0.5 seconds then to prompt screen for x time%%
                    break
                else
                    n = n+1; %%to reset getkey%%
                end
            end
           if choice_word == vector_semantic_emo(7) || choice_word ==  vector_semantic_emo(8) || choice_word ==  vector_semantic_emo(9)
               total_num_RT_semantic_emo = total_num_RT_semantic_emo + 1;
               RT_semantic_emo = reaction_time;
               total_sum_RT_semantic_emo = total_sum_RT_semantic_emo + RT_semantic_emo;
               mean_RT_semantic_emo = total_sum_RT_semantic_emo / total_num_RT_semantic_emo;
           elseif choice_word == vector_syntax_emo(7) || choice_word ==  vector_syntax_emo(8) || choice_word ==  vector_syntax_emo(9)
               total_num_RT_syntax_emo = total_num_RT_syntax_emo + 1;
               RT_syntax_emo = reaction_time;
               total_sum_RT_syntax_emo = total_sum_RT_syntax_emo + RT_syntax_emo;
               mean_RT_syntax_emo = total_sum_RT_syntax_emo / total_num_RT_syntax_emo;
           else
               total_num_RT_baseline_emo = total_num_RT_baseline_emo + 1; %%categorie reaction time as random%%
               RT_baseline_emo = reaction_time;
               total_sum_RT_baselinex_emo = total_sum_RT_baseline_emo + RT_baseline_emo;
               mean_RT_baseline_emo = total_sum_RT_baseline_emo / total_num_RT_baseline_emo; 
           end
           
       elseif b == 4
           vector_choice_word = [vector_semantic_emo(randi(3)+9),vector_syntax_emo(randi(3)+9),vector_choice_random(randi(18))];
           choice_word = vector_choice_word(randi(3));
           prompt_choice_vector = [prompt_word,choice_word];
           disp_vector = prompt_choice_vector(randperm(2));
           disp(disp_vector); %%untill participant clicks correct arrow%%
           idx = find(disp_vector(prompt_word));
    
            % determine which arrow should be pressed%
            if idx == 1
                correct_key_ascii = 37; %%37 is the ascii code for left arrow 
            else
                correct_key_ascii = 39; %%39 is the ascii code for right arrow
            end
    
             % check that correct arrow is pressed% %%not very sure about this%%
            while n > 0 %%loop so that if the pressed key is wrong, the getkey resets%% 
                if getkey == correct_key_ascii %%getkey returns the ascii code of the first pressed key
                    reaction_time = record_RT_function; %%PTB RT%%
                    change_screen_function; %%go to black screen for 0.5 seconds then to prompt screen for x time%%
                    break
                else
                    n = n+1; %%to reset getkey%%
                end
            end
           if choice_word == vector_semantic_emo(10) || choice_word ==  vector_semantic_emo(11) || choice_word ==  vector_semantic_emo(12)
               total_num_RT_semantic_emo = total_num_RT_semantic_emo + 1;
               RT_semantic_emo = reaction_time;
               total_sum_RT_semantic_emo = total_sum_RT_semantic_emo + RT_semantic_emo;
               mean_RT_semantic_emo = total_sum_RT_semantic_emo / total_num_RT_semantic_emo;
           elseif choice_word == vector_syntax_emo(10) || choice_word ==  vector_syntax_emo(11) || choice_word ==  vector_syntax_emo(12)
               total_num_RT_syntax_emo = total_num_RT_syntax_emo + 1;
               RT_syntax_emo = reaction_time;
               total_sum_RT_syntax_emo = total_sum_RT_syntax_emo + RT_syntax_emo;
               mean_RT_syntax_emo = total_sum_RT_syntax_emo / total_num_RT_syntax_emo;
           else
               total_num_RT_baseline_emo = total_num_RT_baseline_emo + 1; %%categorie reaction time as random%%
               RT_baseline_emo = reaction_time;
               total_sum_RT_baselinex_emo = total_sum_RT_baseline_emo + RT_baseline_emo;
               mean_RT_baseline_emo = total_sum_RT_baseline_emo / total_num_RT_baseline_emo;
           end
           
       else
           vector_choice_word = [vector_semantic_emo(randi(3)+12),vector_syntax_emo(randi(3)+12),vector_choice_random(randi(18))];
           choice_word = vector_choice_word(randi(3));
           prompt_choice_vector = [prompt_word,choice_word];
           disp_vector = prompt_choice_vector(randperm(2));
           disp(disp_vector); %%untill participant clicks correct arrow%%
           idx = find(disp_vector(prompt_word));
    
            % determine which arrow should be pressed%
            if idx == 1
                correct_key_ascii = 37; %%37 is the ascii code for left arrow 
            else
                correct_key_ascii = 39; %%39 is the ascii code for right arrow
            end
    
             % check that correct arrow is pressed% %%not very sure about this%%
            while n > 0 %%loop so that if the pressed key is wrong, the getkey resets%% 
                if getkey == correct_key_ascii %%getkey returns the ascii code of the first pressed key
                    reaction_time = record_RT_function; %%PTB RT%%
                    change_screen_function; %%go to black screen for 0.5 seconds then to prompt screen for x time%%
                    break
                else
                    n = n+1; %%to reset getkey%%
                end
            end
           if choice_word == vector_semantic_emo(13) || choice_word ==  vector_semantic_emo(14) || choice_word ==  vector_semantic_emo(15)
               total_num_RT_semantic_emo = total_num_RT_semantic_emo + 1;
               RT_semantic_emo = reaction_time;
               total_sum_RT_semantic_emo = total_sum_RT_semantic_emo + RT_semantic_emo;
               mean_RT_semantic_emo = total_sum_RT_semantic_emo / total_num_RT_semantic_emo;
           elseif choice_word == vector_syntax_emo(13) || choice_word ==  vector_syntax_emo(14) || choice_word ==  vector_syntax_emo(15)
               total_num_RT_syntax_emo = total_num_RT_syntax_emo + 1;
               RT_syntax_emo = reaction_time;
               total_sum_RT_syntax_emo = total_sum_RT_syntax_emo + RT_syntax_emo;
               mean_RT_syntax_emo = total_sum_RT_syntax_emo / total_num_RT_syntax_emo;
           else
               total_num_RT_baseline_emo = total_num_RT_baseline_emo + 1; %%categorie reaction time as random%%
               RT_baseline_emo = reaction_time;
               total_sum_RT_baselinex_emo = total_sum_RT_baseline_emo + RT_baseline_emo;
               mean_RT_baseline_emo = total_sum_RT_baseline_emo / total_num_RT_baseline_emo;
           end
       end
           
        
    elseif a == 2
        b = randi(5);
       prompt_word = vector_prompt_col(b);
       disp(prompt_word); %%for x time then black screen for y time then disp promt and choice%%
       
       if b == 1
           vector_choice_word = [vector_semantic_col(randi(3)),vector_syntax_col(randi(3)),vector_choice_random(randi(18))];
           choice_word = vector_choice_word(randi(3));
           prompt_choice_vector = [prompt_word,choice_word];
           disp_vector = prompt_choice_vector(randperm(2));
           disp(disp_vector); %%untill participant clicks correct arrow%%
           idx = find(disp_vector(prompt_word));
    
            % determine which arrow should be pressed%
            if idx == 1
                correct_key_ascii = 37; %%37 is the ascii code for left arrow 
            else
                correct_key_ascii = 39; %%39 is the ascii code for right arrow
            end
    
             % check that correct arrow is pressed% %%not very sure about this%%
            while n > 0 %%loop so that if the pressed key is wrong, the getkey resets%% 
                if getkey == correct_key_ascii %%getkey returns the ascii code of the first pressed key
                    reaction_time = record_RT_function; %%PTB RT%%
                    change_screen_function; %%go to black screen for 0.5 seconds then to prompt screen for x time%%
                    break
                else
                    n = n+1; %%to reset getkey%%
                end
            end
           if choice_word == vector_semantic_col(1) || choice_word ==  vector_semantic_col(2) || choice_word ==  vector_semantic_col(3)
               total_num_RT_semantic_col = total_num_RT_semantic_col + 1;
               RT_semantic_col = reaction_time;
               total_sum_RT_semantic_col = total_sum_RT_semantic_col + RT_semantic_col;
               mean_RT_semantic_col = total_sum_RT_semantic_col / total_num_RT_semantic_col;
           elseif choice_word == vector_syntax_col(1) || choice_word ==  vector_syntax_col(2) || choice_word ==  vector_syntax_col(3)
               total_num_RT_syntax_col = total_num_RT_syntax_col + 1;
               RT_syntax_col = reaction_time;
               total_sum_RT_syntax_col = total_sum_RT_syntax_col + RT_syntax_col;
               mean_RT_syntax_col = total_sum_RT_syntax_col / total_num_RT_syntax_col;
           else
               total_num_RT_baseline_col = total_num_RT_baseline_col + 1; %%categorie reaction time as random%%
               RT_baseline_col = reaction_time;
               total_sum_RT_baselinex_col = total_sum_RT_baseline_col + RT_baseline_col;
               mean_RT_baseline_col = total_sum_RT_baseline_col / total_num_RT_baseline_col;
           end
           
       elseif b == 2
           vector_choice_word = [vector_semantic_col(randi(3)+3),vector_syntax_col(randi(3)+3),vector_choice_random(randi(18))];
           choice_word = vector_choice_word(randi(3));
           prompt_choice_vector = [prompt_word,choice_word];
           disp_vector = prompt_choice_vector(randperm(2));
           disp(disp_vector); %%untill participant clicks correct arrow%%
           idx = find(disp_vector(prompt_word));
    
            % determine which arrow should be pressed%
            if idx == 1
                correct_key_ascii = 37; %%37 is the ascii code for left arrow 
            else
                correct_key_ascii = 39; %%39 is the ascii code for right arrow
            end
    
             % check that correct arrow is pressed% %%not very sure about this%%
            while n > 0 %%loop so that if the pressed key is wrong, the getkey resets%% 
                if getkey == correct_key_ascii %%getkey returns the ascii code of the first pressed key
                    reaction_time = record_RT_function; %%PTB RT%%
                    change_screen_function; %%go to black screen for 0.5 seconds then to prompt screen for x time%%
                    break
                else
                    n = n+1; %%to reset getkey%%
                end
            end
           if choice_word == vector_semantic_col(4) || choice_word ==  vector_semantic_col(5) || choice_word ==  vector_semantic_col(6)
               total_num_RT_semantic_col = total_num_RT_semantic_col + 1;
               RT_semantic_col = reaction_time;
               total_sum_RT_semantic_col = total_sum_RT_semantic_col + RT_semantic_col;
               mean_RT_semantic_col = total_sum_RT_semantic_col / total_num_RT_semantic_col;
           elseif choice_word == vector_syntax_col(4) || choice_word ==  vector_syntax_col(5) || choice_word ==  vector_syntax_col(6)
               total_num_RT_syntax_col = total_num_RT_syntax_col + 1;
               RT_syntax_col = reaction_time;
               total_sum_RT_syntax_col = total_sum_RT_syntax_col + RT_syntax_col;
               mean_RT_syntax_col = total_sum_RT_syntax_col / total_num_RT_syntax_col;
           else
               total_num_RT_baseline_col = total_num_RT_baseline_col + 1; %%categorie reaction time as random%%
               RT_baseline_col = reaction_time;
               total_sum_RT_baselinex_col = total_sum_RT_baseline_col + RT_baseline_col;
               mean_RT_baseline_col = total_sum_RT_baseline_col / total_num_RT_baseline_col;
           end
           
       elseif b == 3
           vector_choice_word = [vector_semantic_col(randi(3)+6),vector_syntax_col(randi(3)+6),vector_choice_random(randi(18))];
           choice_word = vector_choice_word(randi(3));
           prompt_choice_vector = [prompt_word,choice_word];
           disp_vector = prompt_choice_vector(randperm(2));
           disp(disp_vector); %%untill participant clicks correct arrow%%
           idx = find(disp_vector(prompt_word));
    
            % determine which arrow should be pressed%
            if idx == 1
                correct_key_ascii = 37; %%37 is the ascii code for left arrow 
            else
                correct_key_ascii = 39; %%39 is the ascii code for right arrow
            end
    
             % check that correct arrow is pressed% %%not very sure about this%%
            while n > 0 %%loop so that if the pressed key is wrong, the getkey resets%% 
                if getkey == correct_key_ascii %%getkey returns the ascii code of the first pressed key
                    reaction_time = record_RT_function; %%PTB RT%%
                    change_screen_function; %%go to black screen for 0.5 seconds then to prompt screen for x time%%
                    break
                else
                    n = n+1; %%to reset getkey%%
                end
            end
           if choice_word == vector_semantic_col(7) || choice_word ==  vector_semantic_col(8) || choice_word ==  vector_semantic_col(9)
               total_num_RT_semantic_col = total_num_RT_semantic_col + 1;
               RT_semantic_col = reaction_time;
               total_sum_RT_semantic_col = total_sum_RT_semantic_col + RT_semantic_col;
               mean_RT_semantic_col = total_sum_RT_semantic_col / total_num_RT_semantic_col;
           elseif choice_word == vector_syntax_col(7) || choice_word ==  vector_syntax_col(8) || choice_word ==  vector_syntax_col(9)
               total_num_RT_syntax_col = total_num_RT_syntax_col + 1;
               RT_syntax_col = reaction_time;
               total_sum_RT_syntax_col = total_sum_RT_syntax_col + RT_syntax_col;
               mean_RT_syntax_col = total_sum_RT_syntax_col / total_num_RT_syntax_col;
           else
               total_num_RT_baseline_col = total_num_RT_baseline_col + 1; %%categorie reaction time as random%%
               RT_baseline_col = reaction_time;
               total_sum_RT_baselinex_col = total_sum_RT_baseline_col + RT_baseline_col;
               mean_RT_baseline_col = total_sum_RT_baseline_col / total_num_RT_baseline_col;
           end
           
       elseif b == 4
           vector_choice_word = [vector_semantic_col(randi(3)+9),vector_syntax_col(randi(3)+9),vector_choice_random(randi(18))];
           choice_word = vector_choice_word(randi(3));
           prompt_choice_vector = [prompt_word,choice_word];
           disp_vector = prompt_choice_vector(randperm(2));
           disp(disp_vector); %%untill participant clicks correct arrow%%
           idx = find(disp_vector(prompt_word));
    
            % determine which arrow should be pressed%
            if idx == 1
                correct_key_ascii = 37; %%37 is the ascii code for left arrow 
            else
                correct_key_ascii = 39; %%39 is the ascii code for right arrow
            end
    
             % check that correct arrow is pressed% %%not very sure about this%%
            while n > 0 %%loop so that if the pressed key is wrong, the getkey resets%% 
                if getkey == correct_key_ascii %%getkey returns the ascii code of the first pressed key
                    reaction_time = record_RT_function; %%PTB RT%%
                    change_screen_function; %%go to black screen for 0.5 seconds then to prompt screen for x time%%
                    break
                else
                    n = n+1; %%to reset getkey%%
                end
            end
           if choice_word == vector_semantic_col(10) || choice_word ==  vector_semantic_col(11) || choice_word ==  vector_semantic_col(12)
               total_num_RT_semantic_col = total_num_RT_semantic_col + 1;
               RT_semantic_col = reaction_time;
               total_sum_RT_semantic_col = total_sum_RT_semantic_col + RT_semantic_col;
               mean_RT_semantic_col = total_sum_RT_semantic_col / total_num_RT_semantic_col;
           elseif choice_word == vector_syntax_col(10) || choice_word ==  vector_syntax_col(11) || choice_word ==  vector_syntax_col(12)
               total_num_RT_syntax_col = total_num_RT_syntax_col + 1;
               RT_syntax_col = reaction_time;
               total_sum_RT_syntax_col = total_sum_RT_syntax_col + RT_syntax_col;
               mean_RT_syntax_col = total_sum_RT_syntax_col / total_num_RT_syntax_col;
           else
               total_num_RT_baseline_col = total_num_RT_baseline_col + 1; %%categorie reaction time as random%%
               RT_baseline_col = reaction_time;
               total_sum_RT_baselinex_col = total_sum_RT_baseline_col + RT_baseline_col;
               mean_RT_baseline_col = total_sum_RT_baseline_col / total_num_RT_baseline_col;
           end
           
       else
           vector_choice_word = [vector_semantic_col(randi(3)+12),vector_syntax_col(randi(3)+12),vector_choice_random(randi(18))];
           choice_word = vector_choice_word(randi(3));
           prompt_choice_vector = [prompt_word,choice_word];
           disp_vector = prompt_choice_vector(randperm(2));
           disp(disp_vector); %%untill participant clicks correct arrow%%
           idx = find(disp_vector(prompt_word));
    
            % determine which arrow should be pressed%
            if idx == 1
                correct_key_ascii = 37; %%37 is the ascii code for left arrow 
            else
                correct_key_ascii = 39; %%39 is the ascii code for right arrow
            end
    
             % check that correct arrow is pressed% %%not very sure about this%%
            while n > 0 %%loop so that if the pressed key is wrong, the getkey resets%% 
                if getkey == correct_key_ascii %%getkey returns the ascii code of the first pressed key
                    reaction_time = record_RT_function; %%PTB RT%%
                    change_screen_function; %%go to black screen for 0.5 seconds then to prompt screen for x time%%
                    break
                else
                    n = n+1; %%to reset getkey%%
                end
            end
           if choice_word == vector_semantic_col(13) || choice_word ==  vector_semantic_col(14) || choice_word ==  vector_semantic_col(15)
               total_num_RT_semantic_col = total_num_RT_semantic_col + 1;
               RT_semantic_col = reaction_time;
               total_sum_RT_semantic_col = total_sum_RT_semantic_col + RT_semantic_col;
               mean_RT_semantic_col = total_sum_RT_semantic_col / total_num_RT_semantic_col;
           elseif choice_word == vector_syntax_col(13) || choice_word ==  vector_syntax_col(14) || choice_word ==  vector_syntax_col(15)
               total_num_RT_syntax_col = total_num_RT_syntax_col + 1;
               RT_syntax_col = reaction_time;
               total_sum_RT_syntax_col = total_sum_RT_syntax_col + RT_syntax_col;
               mean_RT_syntax_col = total_sum_RT_syntax_col / total_num_RT_syntax_col;
           else
               total_num_RT_baseline_col = total_num_RT_baseline_col + 1; %%categorie reaction time as random%%
               RT_baseline_col = reaction_time;
               total_sum_RT_baselinex_col = total_sum_RT_baseline_col + RT_baseline_col;
               mean_RT_baseline_col = total_sum_RT_baseline_col / total_num_RT_baseline_col;
           end
       end
           
    else
    b = randi(5);
       prompt_word = vector_prompt_ani(b);
       disp(prompt_word); %%for x time then black screen for y time then disp promt and choice%%
       
       if b == 1
           vector_choice_word = [vector_semantic_ani(randi(3)),vector_syntax_ani(randi(3)),vector_choice_random(randi(18))];
           choice_word = vector_choice_word(randi(3));
           prompt_choice_vector = [prompt_word,choice_word];
           disp_vector = prompt_choice_vector(randperm(2));
           disp(disp_vector); %%untill participant clicks correct arrow%%
           idx = find(disp_vector(prompt_word));
    
            % determine which arrow should be pressed%
            if idx == 1
                correct_key_ascii = 37; %%37 is the ascii code for left arrow 
            else
                correct_key_ascii = 39; %%39 is the ascii code for right arrow
            end
    
             % check that correct arrow is pressed% %%not very sure about this%%
            while n > 0 %%loop so that if the pressed key is wrong, the getkey resets%% 
                if getkey == correct_key_ascii %%getkey returns the ascii code of the first pressed key
                    reaction_time = record_RT_function; %%PTB RT%%
                    change_screen_function; %%go to black screen for 0.5 seconds then to prompt screen for x time%%
                    break
                else
                    n = n+1; %%to reset getkey%%
                end
            end
           if choice_word == vector_semantic_ani(1) || choice_word ==  vector_semantic_ani(2) || choice_word ==  vector_semantic_ani(3)
               total_num_RT_semantic_ani = total_num_RT_semantic_ani + 1;
               RT_semantic_ani = reaction_time;
               total_sum_RT_semantic_ani = total_sum_RT_semantic_ani + RT_semantic_ani;
               mean_RT_semantic_ani = total_sum_RT_semantic_ani / total_num_RT_semantic_ani;
           elseif choice_word == vector_syntax_ani(1) || choice_word ==  vector_syntax_ani(2) || choice_word ==  vector_syntax_ani(3)
               total_num_RT_syntax_ani = total_num_RT_syntax_ani + 1;
               RT_syntax_ani = reaction_time;
               total_sum_RT_syntax_ani = total_sum_RT_syntax_ani + RT_syntax_ani;
               mean_RT_syntax_ani = total_sum_RT_syntax_ani / total_num_RT_syntax_ani;
           else
               total_num_RT_baseline_ani = total_num_RT_baseline_ani + 1; %%categorie reaction time as random%%
               RT_baseline_ani = reaction_time;
               total_sum_RT_baselinex_ani = total_sum_RT_baseline_ani + RT_baseline_ani;
               mean_RT_baseline_ani = total_sum_RT_baseline_ani / total_num_RT_baseline_ani;
           end
           
       elseif b == 2
           vector_choice_word = [vector_semantic_ani(randi(3)+3),vector_syntax_ani(randi(3)+3),vector_choice_random(randi(18))];
           choice_word = vector_choice_word(randi(3));
           prompt_choice_vector = [prompt_word,choice_word];
           disp_vector = prompt_choice_vector(randperm(2));
           disp(disp_vector); %%untill participant clicks correct arrow%%
           idx = find(disp_vector(prompt_word));
    
            % determine which arrow should be pressed%
            if idx == 1
                correct_key_ascii = 37; %%37 is the ascii code for left arrow 
            else
                correct_key_ascii = 39; %%39 is the ascii code for right arrow
            end
    
             % check that correct arrow is pressed% %%not very sure about this%%
            while n > 0 %%loop so that if the pressed key is wrong, the getkey resets%% 
                if getkey == correct_key_ascii %%getkey returns the ascii code of the first pressed key
                    reaction_time = record_RT_function; %%PTB RT%%
                    change_screen_function; %%go to black screen for 0.5 seconds then to prompt screen for x time%%
                    break
                else
                    n = n+1; %%to reset getkey%%
                end
            end
           if choice_word == vector_semantic_ani(4) || choice_word ==  vector_semantic_ani(5) || choice_word ==  vector_semantic_ani(6)
               total_num_RT_semantic_ani = total_num_RT_semantic_ani + 1;
               RT_semantic_ani = reaction_time;
               total_sum_RT_semantic_ani = total_sum_RT_semantic_ani + RT_semantic_ani;
               mean_RT_semantic_ani = total_sum_RT_semantic_ani / total_num_RT_semantic_ani;
           elseif choice_word == vector_syntax_ani(4) || choice_word ==  vector_syntax_ani(5) || choice_word ==  vector_syntax_ani(6)
               total_num_RT_syntax_ani = total_num_RT_syntax_ani + 1;
               RT_syntax_ani = reaction_time;
               total_sum_RT_syntax_ani = total_sum_RT_syntax_ani + RT_syntax_ani;
               mean_RT_syntax_ani = total_sum_RT_syntax_ani / total_num_RT_syntax_ani;
           else
               total_num_RT_baseline_ani = total_num_RT_baseline_ani + 1; %%categorie reaction time as random%%
               RT_baseline_ani = reaction_time;
               total_sum_RT_baselinex_ani = total_sum_RT_baseline_ani + RT_baseline_ani;
               mean_RT_baseline_ani = total_sum_RT_baseline_ani / total_num_RT_baseline_ani;
           end
           
       elseif b == 3
           vector_choice_word = [vector_semantic_ani(randi(3)+6),vector_syntax_ani(randi(3)+6),vector_choice_random(randi(18))];
           choice_word = vector_choice_word(randi(3));
           prompt_choice_vector = [prompt_word,choice_word];
           disp_vector = prompt_choice_vector(randperm(2));
           disp(disp_vector); %%untill participant clicks correct arrow%%
           idx = find(disp_vector(prompt_word));
    
            % determine which arrow should be pressed%
            if idx == 1
                correct_key_ascii = 37; %%37 is the ascii code for left arrow 
            else
                correct_key_ascii = 39; %%39 is the ascii code for right arrow
            end
    
             % check that correct arrow is pressed% %%not very sure about this%%
            while n > 0 %%loop so that if the pressed key is wrong, the getkey resets%% 
                if getkey == correct_key_ascii %%getkey returns the ascii code of the first pressed key
                    reaction_time = record_RT_function; %%PTB RT%%
                    change_screen_function; %%go to black screen for 0.5 seconds then to prompt screen for x time%%
                    break
                else
                    n = n+1; %%to reset getkey%%
                end
            end
           if choice_word == vector_semantic_ani(7) || choice_word ==  vector_semantic_ani(8) || choice_word ==  vector_semantic_ani(9)
               total_num_RT_semantic_ani = total_num_RT_semantic_ani + 1;
               RT_semantic_ani = reaction_time;
               total_sum_RT_semantic_ani = total_sum_RT_semantic_ani + RT_semantic_ani;
               mean_RT_semantic_ani = total_sum_RT_semantic_ani / total_num_RT_semantic_ani;
           elseif choice_word == vector_syntax_ani(7) || choice_word ==  vector_syntax_ani(8) || choice_word ==  vector_syntax_ani(9)
               total_num_RT_syntax_ani = total_num_RT_syntax_ani + 1;
               RT_syntax_ani = reaction_time;
               total_sum_RT_syntax_ani = total_sum_RT_syntax_ani + RT_syntax_ani;
               mean_RT_syntax_ani = total_sum_RT_syntax_ani / total_num_RT_syntax_ani;
           else
               total_num_RT_baseline_ani = total_num_RT_baseline_ani + 1; %%categorie reaction time as random%%
               RT_baseline_ani = reaction_time;
               total_sum_RT_baselinex_ani = total_sum_RT_baseline_ani + RT_baseline_ani;
               mean_RT_baseline_ani = total_sum_RT_baseline_ani / total_num_RT_baseline_ani;
           end
           
           
       elseif b == 4
           vector_choice_word = [vector_semantic_ani(randi(3)+9),vector_syntax_ani(randi(3)+9),vector_choice_random(randi(18))];
           choice_word = vector_choice_word(randi(3));
           prompt_choice_vector = [prompt_word,choice_word];
           disp_vector = prompt_choice_vector(randperm(2));
           disp(disp_vector); %%untill participant clicks correct arrow%%
           idx = find(disp_vector(prompt_word));
    
            % determine which arrow should be pressed%
            if idx == 1
                correct_key_ascii = 37; %%37 is the ascii code for left arrow 
            else
                correct_key_ascii = 39; %%39 is the ascii code for right arrow
            end
    
             % check that correct arrow is pressed% %%not very sure about this%%
            while n > 0 %%loop so that if the pressed key is wrong, the getkey resets%% 
                if getkey == correct_key_ascii %%getkey returns the ascii code of the first pressed key
                    reaction_time = record_RT_function; %%PTB RT%%
                    change_screen_function; %%go to black screen for 0.5 seconds then to prompt screen for x time%%
                    break
                else
                    n = n+1; %%to reset getkey%%
                end
            end
           if choice_word == vector_semantic_ani(10) || choice_word ==  vector_semantic_ani(11) || choice_word ==  vector_semantic_ani(12)
               total_num_RT_semantic_ani = total_num_RT_semantic_ani + 1;
               RT_semantic_ani = reaction_time;
               total_sum_RT_semantic_ani = total_sum_RT_semantic_ani + RT_semantic_ani;
               mean_RT_semantic_ani = total_sum_RT_semantic_ani / total_num_RT_semantic_ani;
           elseif choice_word == vector_syntax_ani(10) || choice_word ==  vector_syntax_ani(11) || choice_word ==  vector_syntax_ani(12)
               total_num_RT_syntax_ani = total_num_RT_syntax_ani + 1;
               RT_syntax_ani = reaction_time;
               total_sum_RT_syntax_ani = total_sum_RT_syntax_ani + RT_syntax_ani;
               mean_RT_syntax_ani = total_sum_RT_syntax_ani / total_num_RT_syntax_ani;
           else
               total_num_RT_baseline_ani = total_num_RT_baseline_ani + 1; %%categorie reaction time as random%%
               RT_baseline_ani = reaction_time;
               total_sum_RT_baselinex_ani = total_sum_RT_baseline_ani + RT_baseline_ani;
               mean_RT_baseline_ani = total_sum_RT_baseline_ani / total_num_RT_baseline_ani;
           end
           
       else
           vector_choice_word = [vector_semantic_ani(randi(3)+12),vector_syntax_ani(randi(3)+12),vector_choice_random(randi(18))];
           choice_word = vector_choice_word(randi(3));
           prompt_choice_vector = [prompt_word,choice_word];
           disp_vector = prompt_choice_vector(randperm(2));
           disp(disp_vector); %%untill participant clicks correct arrow%%
           idx = find(disp_vector(prompt_word));
    
            % determine which arrow should be pressed%
            if idx == 1
                correct_key_ascii = 37; %%37 is the ascii code for left arrow 
            else
                correct_key_ascii = 39; %%39 is the ascii code for right arrow
            end
    
             % check that correct arrow is pressed% %%not very sure about this%%
            while n > 0 %%loop so that if the pressed key is wrong, the getkey resets%% 
                if getkey == correct_key_ascii %%getkey returns the ascii code of the first pressed key
                    reaction_time = record_RT_function; %%PTB RT%%
                    change_screen_function; %%go to black screen for 0.5 seconds then to prompt screen for x time%%
                    break
                else
                    n = n+1; %%to reset getkey%%
                end
            end
           if choice_word == vector_semantic_ani(13) || choice_word ==  vector_semantic_ani(14) || choice_word ==  vector_semantic_ani(15)
               total_num_RT_semantic_ani = total_num_RT_semantic_ani + 1;
               RT_semantic_ani = reaction_time;
               total_sum_RT_semantic_ani = total_sum_RT_semantic_ani + RT_semantic_ani;
               mean_RT_semantic_ani = total_sum_RT_semantic_ani / total_num_RT_semantic_ani;
           elseif choice_word == vector_syntax_ani(13) || choice_word ==  vector_syntax_ani(14) || choice_word ==  vector_syntax_ani(15)
               total_num_RT_syntax_ani = total_num_RT_syntax_ani + 1;
               RT_syntax_ani = reaction_time;
               total_sum_RT_syntax_ani = total_sum_RT_syntax_ani + RT_syntax_ani;
               mean_RT_syntax_ani = total_sum_RT_syntax_ani / total_num_RT_syntax_ani;
           else
               total_num_RT_baseline_ani = total_num_RT_baseline_ani + 1; %%categorie reaction time as random%%
               RT_baseline_ani = reaction_time;
               total_sum_RT_baselinex_ani = total_sum_RT_baseline_ani + RT_baseline_ani;
               mean_RT_baseline_ani = total_sum_RT_baseline_ani / total_num_RT_baseline_ani;
           end
      end
    end
end

mean_baseline_RT = (total_sum_RT_baseline_emo + total_sum_RT_baseline_col + total_sum_RT_baseline_ani)/(total_num_RT_baseline_emo + total_num_RT_baseline_col + total_num_RT_baseline_ani);
mean_semantic_RT = (total_sum_RT_semantic_emo + total_sum_RT_semantic_col + total_sum_RT_semantic_ani)/(total_num_RT_semantic_emo + total_num_RT_semantic_col + total_num_RT_semantic_ani);    
mean_syntax_RT = (total_sum_RT_syntax_emo + total_sum_RT_syntax_col + total_sum_RT_syntax_ani)/(total_num_RT_syntax_emo + total_num_RT_syntax_col + total_num_RT_syntax_ani);
           
