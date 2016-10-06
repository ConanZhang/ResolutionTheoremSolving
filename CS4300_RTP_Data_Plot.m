function data = CS4300_RTP_Data_Plot()
% CS4300_RTP_Data_Plot - Driver to plot data for RTP
% On output:
% Call:
% CS4300_RTP_Data();
% Author:
% Rajul Ramchandani and Conan Zhang
% UU
% Fall 2016
%
    DP = [];
    
    % 1 Clause Length 2
    DP(1).clauses = [1];
    thm = [1];
    vars = [1];

    % Commutativity of OR (1 Clause Length 3)
%     DP(1).clauses = [1,2];
%     thm = [2,1];
%     vars = [1,2];
 
    % Associativity of OR (1 Clause Length 4)
%     DP(1).clauses = [1,2,3];
%     thm = [1,2,3];
%     vars = [1,2,3];

    % Contraposition
%     DP(1).clauses = [-1,2];
%     thm = [2,-1];
%     vars = [1,2];
    
    % De Morgan's Law
%     DP(1).clauses = [-1];
%     DP(2).clauses = [-2];
%     thm = [-1,-2];
%     vars = [1,2];

    % 1 Clause Length 5
%     DP(1).clauses = [1,2,3,4];
%     thm = [1,2,3,4];
%     vars = [1,2,3,4];
    
    % 1 Clause Length 6
%     DP(1).clauses = [1,2,3,4,5];
%     thm = [1,2,3,4,5];
%     vars = [1,2,3,4,5];

    % 2 Clauses Length 1
%     DP(1).clauses = [1];
%     DP(2).clauses = [2];
%     thm = [1,2];
%     vars = [1,2];
    
    % 3 Clauses Length 1
%     DP(1).clauses = [1];
%     DP(2).clauses = [2];
%     DP(3).clauses = [3];
%     thm = [1,2,3];
%     vars = [1,2,3];

    % 4 Clauses Length 1
%     DP(1).clauses = [1];
%     DP(2).clauses = [2];
%     DP(3).clauses = [3];
%     DP(4).clauses = [4];
%     thm = [1,2,3,4];
%     vars = [1,2,3,4];

    % 5 Clauses Length 1
%     DP(1).clauses = [1];
%     DP(2).clauses = [2];
%     DP(3).clauses = [3];
%     DP(4).clauses = [4];
%     DP(5).clauses = [5];
%     thm = [1,2,3,4,5];
%     vars = [1,2,3,4,5];
    
    ans = CS4300_RTP(DP,thm,vars)
    
    % Length
    initial_clause_count = [2, 3, 4, 5,6];
    sentences_produced = [0, 2, 6, 14,30];
    iteration_count = [1, 10, 44, 186,814];
    
    % Clause Count
    clause_count = [1,2,3,4,5];
    clause_sentences_produced = [0, 0, 0, 0, 0];
    clause_iteration_count = [1, 2, 3, 4, 5];
    

    % Length vs. Produced
%     plot(initial_clause_count, sentences_produced);
%     set(gca,'XTick', [2,3,4,5,6]);
%     title('Figure 1: Clause Length vs. Number of Sentences Produced ');
%     xlabel('Clause Length');
%     ylabel('Number of Sentences Produced');

    % Length vs. Iteration
%     plot(initial_clause_count, iteration_count);
%     set(gca,'XTick', [2,3,4,5,6]);
%     title('Figure 2: Clause Length vs. Iteration Count');
%     xlabel('Clause Length');
%     ylabel('Loop Iteration Count');

    % Length vs. Iteration
%     plot(initial_clause_count, iteration_count);
%     set(gca,'XTick', [2,3,4,5,6]);
%     title('Figure 2: Clause Length vs. Iteration Count');
%     xlabel('Clause Length');
%     ylabel('Loop Iteration Count');
end