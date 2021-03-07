ctgr = {'Emotional'; 'Animal'; 'Colours'};

prompt_emo = {'Sad','Happy','Scared','Nervous','Angry'};
prompt_col = {'Red','Black','Blue','Teal','Green'};
prompt_ani = {'Cat','Dog','Bird','Fish','Rabbit'};

semantic_emo = {'Depressed','Unhappy','Miserable','Delighted','Joyful','Glad','Afraid','Frightened','Terrified','Stressed','Anxious','Worried','Furious','Upset','Mad'};
semantic_col = {'Blood','Tomato','Crimson','Crow','Ebony','Midnight','Sky','Navy','Ocean','Turquoise','Aqua','Cyan','Mint','Grass','Leaf'};
semantic_ani = {'Meow','Kitten','Feline','Bark','Canine','Puppy','Fly','Wings','Chirp','Ocean','Scale','Swim','Bunny','Easter','Carrot'};

syntax_emo = {'Sed','Said','Scad','Hobby','Hoppy','Hippy','Squared','Scarred','Scored','Nervus','Famous','Nervosa','Ambry','Hungry','Anger'};
syntax_col = {'Reed','Rid','Rod','Back','Block','Blake','Blu','Blew','Bleu','Teale','Tale','Teel','Greene','Gene','Grene'};
syntax_ani = {'Cut','Kat','Chat','Dug','Doggy','Doug','Birdy','Birde','Bride','Fisch','Fiche','Fishy','Rabbet','Rabid','Rapid'};

Index_ctgr = [1:3];
Index_prompt = [1:5];
Index_semantic = [1:15];
Index_syntax = [1:15];

vector_ctgr = ctgr(Index_ctgr);

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

total_num_RT_semantic_emo = 0;
RT_semantic_emo = 0;
total_sum_RT_semantic_emo = 0;
mean_RT_semantic_emo = 0;

total_num_RT_syntax_emo = 0;
RT_syntax_emo = 0;
total_sum_RT_syntax_emo = 0;
mean_RT_syntax_emo = 0;

tal_num_RT_semantic_col = 0;
RT_semantic_col = 0;
total_sum_RT_semantic_col = 0;
mean_RT_semantic_col = 0;

total_num_RT_syntax_col = 0;
RT_syntax_col = 0;
total_sum_RT_syntax_col = 0;
mean_RT_syntax_col = 0;

tal_num_RT_semantic_ani = 0;
RT_semantic_ani = 0;
total_sum_RT_semantic_ani = 0;
mean_RT_semantic_ani = 0;

total_num_RT_syntax_ani = 0;
RT_syntax_ani = 0;
total_sum_RT_syntax_ani = 0;
mean_RT_syntax_ani = 0;

%%Block code%%
promt_ctgr = randi(3,45);
For ii = 1:45    
    a = prompt_ctgr(ii);
    if a == 1
        b = randi(5);
       prompt_word = vector_prompt_emo(b);
       
       %%disp(prompt_word); use apprpriate function to display it for x time then black screen for y time then disp promt and choice%%
       
       if  b == 1
           choice_word = vector_semantic_emo(randi(3)) || choice_word = vector_syntax_emo(randi(3)); %%create a vector that contaisn theese 2 values, and then pick an index from that vector randi(2) that vector)%%
           disp(prompt_word     choice_word) %%untill participant clicks correct arrow%% %%not sure this is how it should be written - review this line%% %%USE PTB key_check%%
           reaction_time = %%reaction time code here%% %%PTB RT%
           if choice_word == vector_semantic_emo(1) | choice_word ==  vector_semantic_emo(2) | choice_word ==  vector_semantic_emo(3) %%categorize recation time as semantic%%
               total_num_RT_semantic_emo = total_num_RT_semantic_emo + 1;
               RT_semantic_emo = reaction_time;
               total_sum_RT_semantic_emo = total_sum_RT_semantic_emo + RT_semantic_emo;
               mean_RT_semantic_emo = total_sum_RT_semantic_emo / total_num_RT_semantic_emo;
           else total_num_RT_syntax_emo = total_num_RT_syntax_emo + 1; %%categorie reaction time as syntax%%
               RT_syntax_emo = reaction_time;
               total_sum_RT_syntax_emo = total_sum_RT_syntax_emo + RT_syntax_emo;
               mean_RT_syntax_emo = total_sum_RT_syntax_emo / total_num_RT_syntax_emo;
           end
           
       elseif b == 2
           choice_word = vector_semantic_emo(randi(3)+3) || choice_word = vector_syntax_emo(randi(3)+3);
           disp(prompt_word     choice_word) %%untill participant clicks correct arrow%% %%not sure this is how it should be written - review this line%%
           reaction_time = %%reaction time code here%%
           if choice_word == vector_semantic_emo(4) | choice_word ==  vector_semantic_emo(5) | choice_word ==  vector_semantic_emo(6)
               total_num_RT_semantic_emo = total_num_RT_semantic_emo + 1;
               RT_semantic_emo = reaction_time;
               total_sum_RT_semantic_emo = total_sum_RT_semantic_emo + RT_semantic_emo;
               mean_RT_semantic_emo = total_sum_RT_semantic_emo / total_num_RT_semantic_emo;
           else total_num_RT_syntax_emo = total_num_RT_syntax_emo + 1;
               RT_syntax_emo = reaction_time;
               total_sum_RT_syntax_emo = total_sum_RT_syntax_emo + RT_syntax_emo;
               mean_RT_syntax_emo = total_sum_RT_syntax_emo / total_num_RT_syntax_emo;
           end
           
       elseif b == 3
           choice_word = vector_semantic_emo(randi(3)+6) || choice_word = vector_syntax_emo(randi(3)+6);
           disp(prompt_word     choice_word) %%untill participant clicks correct arrow%% %%not sure this is how it should be written - review this line%%
           reaction_time = %%reaction time code here%%
           if choice_word == vector_semantic_emo(7) | choice_word ==  vector_semantic_emo(8) | choice_word ==  vector_semantic_emo(9)
               total_num_RT_semantic_emo = total_num_RT_semantic_emo + 1;
               RT_semantic_emo = reaction_time;
               total_sum_RT_semantic_emo = total_sum_RT_semantic_emo + RT_semantic_emo;
               mean_RT_semantic_emo = total_sum_RT_semantic_emo / total_num_RT_semantic_emo;
           else total_num_RT_syntax_emo = total_num_RT_syntax_emo + 1;
               RT_syntax_emo = reaction_time;
               total_sum_RT_syntax_emo = total_sum_RT_syntax_emo + RT_syntax_emo;
               mean_RT_syntax_emo = total_sum_RT_syntax_emo / total_num_RT_syntax_emo;
           end
           
       elseif b == 4
           choice_word = vector_semantic_emo(randi(3)+9) || choice_word = vector_syntax_emo(randi(3)+9);
           disp(prompt_word     choice_word) %%untill participant clicks correct arrow%% %%not sure this is how it should be written - review this line%%
           reaction_time = %%reaction time code here%%
           if choice_word == vector_semantic_emo(10) | choice_word ==  vector_semantic_emo(11) | choice_word ==  vector_semantic_emo(12)
               total_num_RT_semantic_emo = total_num_RT_semantic_emo + 1;
               RT_semantic_emo = reaction_time;
               total_sum_RT_semantic_emo = total_sum_RT_semantic_emo + RT_semantic_emo;
               mean_RT_semantic_emo = total_sum_RT_semantic_emo / total_num_RT_semantic_emo;
           else total_num_RT_syntax_emo = total_num_RT_syntax_emo + 1;
               RT_syntax_emo = reaction_time;
               total_sum_RT_syntax_emo = total_sum_RT_syntax_emo + RT_syntax_emo;
               mean_RT_syntax_emo = total_sum_RT_syntax_emo / total_num_RT_syntax_emo;
           end
           
       else choice_word = vector_semantic_emo(randi(3)+12) || choice_word = vector_syntax_emo(randi(3)+12);
           disp(prompt_word     choice_word) %%untill participant clicks correct arrow%% %%not sure this is how it should be written - review this line%%
           reaction_time = %%reaction time code here%%
           if choice_word == vector_semantic_emo(13) | choice_word ==  vector_semantic_emo(14) | choice_word ==  vector_semantic_emo(15)
               total_num_RT_semantic_emo = total_num_RT_semantic_emo + 1;
               RT_semantic_emo = reaction_time;
               total_sum_RT_semantic_emo = total_sum_RT_semantic_emo + RT_semantic_emo;
               mean_RT_semantic_emo = total_sum_RT_semantic_emo / total_num_RT_semantic_emo;
           else total_num_RT_syntax_emo = total_num_RT_syntax_emo + 1;
               RT_syntax_emo = reaction_time;
               total_sum_RT_syntax_emo = total_sum_RT_syntax_emo + RT_syntax_emo;
               mean_RT_syntax_emo = total_sum_RT_syntax_emo / total_num_RT_syntax_emo;
           end
       end
           
        
    elseif a == 2
        b = randi(5);
       prompt_word = vector_prompt_col(b);
       disp(prompt_word); %%for x time then black screen for y time then disp promt and choice%%
       
       if b == 1
           choice_word = vector_semantic_col(randi(3)) || choice_word = vector_syntax_col(randi(3));
           disp(prompt_word     choice_word) %%untill participant clicks correct arrow%% %%not sure this is how it should be written - review this line%%
           reaction_time = %%reaction time code here%%
           if choice_word == vector_semantic_col(1) | choice_word ==  vector_semantic_col(2) | choice_word ==  vector_semantic_col(3)
               total_num_RT_semantic_col = total_num_RT_semantic_col + 1;
               RT_semantic_col = reaction_time;
               total_sum_RT_semantic_col = total_sum_RT_semantic_col + RT_semantic_col;
               mean_RT_semantic_col = total_sum_RT_semantic_col / total_num_RT_semantic_col;
           else total_num_RT_syntax_col = total_num_RT_syntax_col + 1;
               RT_syntax_col = reaction_time;
               total_sum_RT_syntax_col = total_sum_RT_syntax_col + RT_syntax_col;
               mean_RT_syntax_col = total_sum_RT_syntax_col / total_num_RT_syntax_col;
           end
           
       elseif b == 2
           choice_word = vector_semantic_col(randi(3)+3) || choice_word = vector_syntax_col(randi(3)+3);
           disp(prompt_word     choice_word) %%untill participant clicks correct arrow%% %%not sure this is how it should be written - review this line%%
           reaction_time = %%reaction time code here%%
           if choice_word == vector_semantic_col(4) | choice_word ==  vector_semantic_col(5) | choice_word ==  vector_semantic_col(6)
               total_num_RT_semantic_col = total_num_RT_semantic_col + 1;
               RT_semantic_col = reaction_time;
               total_sum_RT_semantic_col = total_sum_RT_semantic_col + RT_semantic_col;
               mean_RT_semantic_col = total_sum_RT_semantic_col / total_num_RT_semantic_col;
           else total_num_RT_syntax_col = total_num_RT_syntax_col + 1;
               RT_syntax_col = reaction_time;
               total_sum_RT_syntax_col = total_sum_RT_syntax_col + RT_syntax_col;
               mean_RT_syntax_col = total_sum_RT_syntax_col / total_num_RT_syntax_col;
           end
           
       elseif b == 3
           choice_word = vector_semantic_col(randi(3)+6) || choice_word = vector_syntax_col(randi(3)+6);
           disp(prompt_word     choice_word) %%untill participant clicks correct arrow%% %%not sure this is how it should be written - review this line%%
           reaction_time = %%reaction time code here%%
           if choice_word == vector_semantic_col(7) | choice_word ==  vector_semantic_col(8) | choice_word ==  vector_semantic_col(9)
               total_num_RT_semantic_col = total_num_RT_semantic_col + 1;
               RT_semantic_col = reaction_time;
               total_sum_RT_semantic_col = total_sum_RT_semantic_col + RT_semantic_col;
               mean_RT_semantic_col = total_sum_RT_semantic_col / total_num_RT_semantic_col;
           else total_num_RT_syntax_col = total_num_RT_syntax_col + 1;
               RT_syntax_col = reaction_time;
               total_sum_RT_syntax_col = total_sum_RT_syntax_col + RT_syntax_col;
               mean_RT_syntax_col = total_sum_RT_syntax_col / total_num_RT_syntax_col;
           end
           
       elseif b == 4
           choice_word = vector_semantic_col(randi(3)+9) || choice_word = vector_syntax_col(randi(3)+9);
           disp(prompt_word     choice_word) %%untill participant clicks correct arrow%% %%not sure this is how it should be written - review this line%%
           reaction_time = %%reaction time code here%%
           if choice_word == vector_semantic_col(10) | choice_word ==  vector_semantic_col(11) | choice_word ==  vector_semantic_col(12)
               total_num_RT_semantic_col = total_num_RT_semantic_col + 1;
               RT_semantic_col = reaction_time;
               total_sum_RT_semantic_col = total_sum_RT_semantic_col + RT_semantic_col;
               mean_RT_semantic_col = total_sum_RT_semantic_col / total_num_RT_semantic_col;
           else total_num_RT_syntax_col = total_num_RT_syntax_col + 1;
               RT_syntax_col = reaction_time;
               total_sum_RT_syntax_col = total_sum_RT_syntax_col + RT_syntax_col;
               mean_RT_syntax_col = total_sum_RT_syntax_col / total_num_RT_syntax_col;
           end
           
       else choice_word = vector_semantic_col(randi(3)+12) || choice_word = vector_syntax_col(randi(3)+12);
           disp(prompt_word     choice_word) %%untill participant clicks correct arrow%% %%not sure this is how it should be written - review this line%%
           reaction_time = %%reaction time code here%%
           if choice_word == vector_semantic_col(13) | choice_word ==  vector_semantic_col(14) | choice_word ==  vector_semantic_col(15)
               total_num_RT_semantic_col = total_num_RT_semantic_col + 1;
               RT_semantic_col = reaction_time;
               total_sum_RT_semantic_col = total_sum_RT_semantic_col + RT_semantic_col;
               mean_RT_semantic_col = total_sum_RT_semantic_col / total_num_RT_semantic_col;
           else total_num_RT_syntax_col = total_num_RT_syntax_col + 1;
               RT_syntax_col = reaction_time;
               total_sum_RT_syntax_col = total_sum_RT_syntax_col + RT_syntax_col;
               mean_RT_syntax_col = total_sum_RT_syntax_col / total_num_RT_syntax_col;
           end
       end
           
    else
    b = randi(5);
       prompt_word = vector_prompt_ani(b);
       disp(prompt_word); %%for x time then black screen for y time then disp promt and choice%%
       
       if b == 1
           choice_word = vector_semantic_ani(randi(3)) || choice_word = vector_syntax_ani(randi(3));
           disp(prompt_word     choice_word) %%untill participant clicks correct arrow%% %%not sure this is how it should be written - review this line%%
           reaction_time = %%reaction time code here%%
           if choice_word == vector_semantic_ani(1) | choice_word ==  vector_semantic_ani(2) | choice_word ==  vector_semantic_ani(3)
               total_num_RT_semantic_ani = total_num_RT_semantic_ani + 1;
               RT_semantic_ani = reaction_time;
               total_sum_RT_semantic_ani = total_sum_RT_semantic_ani + RT_semantic_ani;
               mean_RT_semantic_ani = total_sum_RT_semantic_ani / total_num_RT_semantic_ani;
           else total_num_RT_syntax_ani = total_num_RT_syntax_ani + 1;
               RT_syntax_ani = reaction_time;
               total_sum_RT_syntax_ani = total_sum_RT_syntax_ani + RT_syntax_ani;
               mean_RT_syntax_ani = total_sum_RT_syntax_ani / total_num_RT_syntax_ani;
           end
           
       elseif b == 2
           choice_word = vector_semantic_ani(randi(3)+3) || choice_word = vector_syntax_ani(randi(3)+3);
           disp(prompt_word     choice_word) %%untill participant clicks correct arrow%% %%not sure this is how it should be written - review this line%%
           reaction_time = %%reaction time code here%%
           if choice_word == vector_semantic_ani(4) | choice_word ==  vector_semantic_ani(5) | choice_word ==  vector_semantic_ani(6)
               total_num_RT_semantic_ani = total_num_RT_semantic_ani + 1;
               RT_semantic_ani = reaction_time;
               total_sum_RT_semantic_ani = total_sum_RT_semantic_ani + RT_semantic_ani;
               mean_RT_semantic_ani = total_sum_RT_semantic_ani / total_num_RT_semantic_ani;
           else total_num_RT_syntax_ani = total_num_RT_syntax_ani + 1;
               RT_syntax_ani = reaction_time;
               total_sum_RT_syntax_ani = total_sum_RT_syntax_ani + RT_syntax_ani;
               mean_RT_syntax_ani = total_sum_RT_syntax_ani / total_num_RT_syntax_ani;
           end
           
       elseif b == 3
           choice_word = vector_semantic_ani(randi(3)+6) || choice_word = vector_syntax_ani(randi(3)+6);
           disp(prompt_word     choice_word) %%untill participant clicks correct arrow%% %%not sure this is how it should be written - review this line%%
           reaction_time = %%reaction time code here%%
           if choice_word == vector_semantic_ani(7) | choice_word ==  vector_semantic_ani(8) | choice_word ==  vector_semantic_ani(9)
               total_num_RT_semantic_ani = total_num_RT_semantic_ani + 1;
               RT_semantic_ani = reaction_time;
               total_sum_RT_semantic_ani = total_sum_RT_semantic_ani + RT_semantic_ani;
               mean_RT_semantic_ani = total_sum_RT_semantic_ani / total_num_RT_semantic_ani;
           else total_num_RT_syntax_ani = total_num_RT_syntax_ani + 1;
               RT_syntax_ani = reaction_time;
               total_sum_RT_syntax_ani = total_sum_RT_syntax_ani + RT_syntax_ani;
               mean_RT_syntax_ani = total_sum_RT_syntax_ani / total_num_RT_syntax_ani;
           end
           
           
       elseif b == 4
           choice_word = vector_semantic_ani(randi(3)+9) || choice_word = vector_syntax_ani(randi(3)+9);
           disp(prompt_word     choice_word) %%untill participant clicks correct arrow%% %%not sure this is how it should be written - review this line%%
           reaction_time = %%reaction time code here%%
           if choice_word == vector_semantic_ani(10) | choice_word ==  vector_semantic_ani(11) | choice_word ==  vector_semantic_ani(12)
               total_num_RT_semantic_ani = total_num_RT_semantic_ani + 1;
               RT_semantic_ani = reaction_time;
               total_sum_RT_semantic_ani = total_sum_RT_semantic_ani + RT_semantic_ani;
               mean_RT_semantic_ani = total_sum_RT_semantic_ani / total_num_RT_semantic_ani;
           else total_num_RT_syntax_ani = total_num_RT_syntax_ani + 1;
               RT_syntax_ani = reaction_time;
               total_sum_RT_syntax_ani = total_sum_RT_syntax_ani + RT_syntax_ani;
               mean_RT_syntax_ani = total_sum_RT_syntax_ani / total_num_RT_syntax_ani;
           end
           
       else choice_word = vector_semantic_ani(randi(3)+12) || choice_word = vector_syntax_ani(randi(3)+12);
           disp(prompt_word     choice_word) %%untill participant clicks correct arrow%% %%not sure this is how it should be written - review this line%%
           reaction_time = %%reaction time code here%%
           if choice_word == vector_semantic_ani(13) | choice_word ==  vector_semantic_ani(14) | choice_word ==  vector_semantic_ani(15)
               total_num_RT_semantic_ani = total_num_RT_semantic_ani + 1;
               RT_semantic_ani = reaction_time;
               total_sum_RT_semantic_ani = total_sum_RT_semantic_ani + RT_semantic_ani;
               mean_RT_semantic_ani = total_sum_RT_semantic_ani / total_num_RT_semantic_ani;
           else total_num_RT_syntax_ani = total_num_RT_syntax_ani + 1;
               RT_syntax_ani = reaction_time;
               total_sum_RT_syntax_ani = total_sum_RT_syntax_ani + RT_syntax_ani;
               mean_RT_syntax_ani = total_sum_RT_syntax_ani / total_num_RT_syntax_ani;
           end
           
       end
    end
end
    
           
