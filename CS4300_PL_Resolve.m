function resolvents = CS4300_PL_Resolve(clause1,clause2)

    resolvents = [];
    
    num_resolvent = 1;
       
    for c1 = 1:length(clause1)
        d1 = clause1(c1);
        for c2 = 1:length(clause2)
            d2 = clause2(c2);
            if(d1 == -d2)
                v1 = [clause1(1:c1-1), clause1(c1+1:end),clause2(1:c2-1), clause2(c2+1:end)]; 
                %v1 = Rem_Contradictions(v1);
                v1 = unique(v1);
                resolvents(num_resolvent).resolvent = sort(v1);
                num_resolvent = num_resolvent + 1;
            end
        end
    end
    
    resolvents = Rem_Duplicates(resolvents)
    %resolvents = unique(resolvents, 'rows');
    

end

function rem_contradictions = Rem_Contradictions(v1)
    rem_contradictions = [];
    
    rem_counter = 1;
    for i = 1:length(v1)
        for j = i+1:length(v1)
            if(v1(i) == -v1(j))
                v1(i) = 0;
                v1(j) = 0;
            end
        end
    end
   
    for i = 1:length(v1)
        if(v1(i) ~= 0)
            rem_contradictions(rem_counter) = v1(i);
            rem_counter = rem_counter + 1;
        end
    end

end

function rem_duplicates = Rem_Duplicates(resolvents)
    
    rem_duplicates = [];
    rem_counter = 1;
    if(length(resolvents)==1)
        rem_duplicates = resolvents;
        return ;
    end
    
    for i = 1:length(resolvents)
        d1 = resolvents(i).resolvent;
        for j = i+1:length(resolvents)
            d2 = resolvents(j).resolvent;
            if(isequal(d1, d2))
                resolvents(j).resolvent = [0,0];
            end
        end
    end
    
    for i = 1:length(resolvents)
        if(~isequal(resolvents(i).resolvent, [0,0]))
            rem_duplicates(rem_counter).resolvent = resolvents(i).resolvent;
            rem_counter = rem_counter + 1;
        end
    end

end
