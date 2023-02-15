u=[1,0,0];
v=[0,0,1];
th=-pi*0.5;
qs=[cos(th/2),sin((th/2))*v(1),sin((th/2))*v(2),sin((th/2))*v(3)];
t=quatrotate(qs,u);
disp(t);