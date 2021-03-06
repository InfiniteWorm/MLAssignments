%primal SVM
%x = weight

H = [1 0 0; 
    0 1 0; 
    0 0 0]
f = [0; 
    0; 
    0]

A = [-2 -2 -1;
    -4 -4 -1;
    -4 0 -1;
    0 0 1;
    2 0 1;
    0 2 1]

b = [-1;-1;-1;-1;-1;-1]

[w,fval] = quadprog(H,f,A,b)

%dual SVM
 
f = [-1;
    -1;
    -1;
    -1;
    -1;
    -1;]

X = [2 2;
    4 4;
    4 0;
    0 0;
    2 0;
    0 2]

Y = X*X'

t = [1;
    1;
    1;
    -1;
    -1;
    -1]

T = t*t'

H = (Y .* T)

beq = [0]
Aeq = [1 1 1 -1 -1 -1]
lb = [0;0;0;0;0;0]

[alpha,fval2] = quadprog(H,f,[],[],Aeq,beq,lb)

