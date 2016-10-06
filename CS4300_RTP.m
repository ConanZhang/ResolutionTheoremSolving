function Sip = CS4300_RTP(sentences,thm,vars)
% CS4300_RTP - resolution theorem prover
% On input:
% clause (CNF data structure): array of conjuctive clauses
% (i).clauses
% each clause is a list of integers (- for negated literal)
% thm (CNF datastructure): a disjunctive clause to be tested
% vars (1xn vector): list of variables (positive integers)
% On output:
% Sip (CNF data structure): results of resolution
% []: proved sentence |- thm
% not []: thm does not follow from clause
% Call: (example from Russell & Norvig, p. 252)
% DP(1).clauses = [-1,2,3,4];
% DP(2).clauses = [-2];
% DP(3).clauses = [-3];
% DP(4).clauses = [1];
% thm = [4];
% vars = [1,2,3,4];
% Sr = CS4300_RTP(DP,thm,vars);
% Author:
% Rajul Ramchandani and Conan Zhang
% UU
% Fall 2016
%

clause = sentences;
new = [];
iteration_count = 0;

for k = 1:length(thm)
    clause(end+1).clauses = -thm(k);
end

initial_clause_count = length(clause)

ctable = {};


while 1
    for c1 = 1:length(clause)
        for c2 = c1+1:length(clause)
            iteration_count = iteration_count + 1;
            resolvents = CS4300_PL_Resolve(clause(c1).clauses, clause(c2).clauses);
            
            
            %Uncomment to get ctable with [c1] [c2] [resolvents]
%             ctable{end+1, 1} = c1;
%             ctable{end, 2} = c2;
%             if Contains_Empty_Clause(resolvents)
%                 ctable{end, 3} = [];
%             elseif(~isempty(resolvents))
%                 ctable{end, 3} = resolvents.clauses
%             end
            
            
            if Contains_Empty_Clause(resolvents)
               Sip = [];
               %Uncomment to print ctable when done
               %ctable
               sentences_produced = length(clause) - initial_clause_count
               iteration_count
               return;
            end
            new = [new resolvents];
            new = Rem_Duplicates(new);
            
            %Uncomment for Table of with new for every iteration
           %T = struct2table(new)
            
        end
        
    end
    
    
    
    if Is_Subset(new, clause)
        Sip = clause;
        sentences_produced = length(clause) - initial_clause_count
        iteration_count
        return;
    end
    
    clause = [clause, new];
    clause = Rem_Duplicates(clause);
end

end

function contains_empty = Contains_Empty_Clause(resolvents)
    contains_empty = 0;
    for i = 1:length(resolvents)
        if isempty(resolvents(i).clauses)
            contains_empty = 1;
            return;
        end
    end
end

function is_subset = Is_Subset(new, clause)
    is_subset = 0;
    counter = 0;
    for r1 = 1:length(new)
        currentNew = new(r1);
        for r2 = 1:length(clause)
            currentSentence = clause(r2);
            if isequal(currentNew, currentSentence)
                counter = counter + 1;
            end            
        end
    end
    if counter == length(new)
        is_subset = 1;
    end
end