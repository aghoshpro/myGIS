Password = 'SUNNY';

Bin = num2str((0:1));

MySet = ('A':'Z');
%MySet = ['a' 'b' 'c'];
MySetperms = combinator(length(MySet),length(Password),'p','r'); % Take 3 at a time.
MySetperms = MySet(MySetperms);
MySetperms = sortrows(MySetperms);
%disp(sortrows(MySetperms));   

for i = 1:length(MySetperms)
    
    if(strcmp(MySetperms(i,:),Password)== 1)
        fprintf('%s == %s',Password,MySetperms(i,:));
        fprintf('\n');
        disp("(: ----- UNLOCKED ----- :)");
        fprintf('Password matched at %d th iteration\n',i);%,length(List_of_Files));
        break;
    else
        fprintf('%s =X= %s',Password,MySetperms(i,:));
        fprintf('\n');
    end  
    
end  


