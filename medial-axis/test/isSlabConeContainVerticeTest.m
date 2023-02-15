% c1=[6,-6,2];
% c2=[2,4,0];
% c3=[-5,2,3];
% c1=[3,3,1];
% c2=[10,6,0];
% c3=[-5,5,-2];
c1=[359.156097,171.203094,172.972748];
c2=[358.990845,171.054413,172.814499];

c3=[360.994934,174.264099,175.432449];

% r1=5;
r1=0.245204881;
r2=0.512650788;
r3=2.72637463;




[L1,R1,L3,R3,slabCone13,cv]=drawMedialCone(c1,c3,r1,r3,180,64,'FaceAlpha',0.5);
[check]=isSlabConeContainVertice(slabCone13,c1);
if check
    text(c1(1),c1(2),c1(3),sprintf('$$c_{%i}$$',1),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','red');
else
    text(c1(1),c1(2),c1(3),sprintf('$$c_{%i}$$',1),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
end
[check]=isSlabConeContainVertice(slabCone13,c2);
if check
    text(c3(1),c3(2),c3(3),sprintf('$$c_{%i}$$',3),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','red');
else
    text(c3(1),c3(2),c3(3),sprintf('$$c_{%i}$$',3),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
end
test=(c1+c3)*0.5;
[check]=isSlabConeContainVertice(slabCone13,test);
if check
    text(test(1),test(2),test(3),sprintf('test'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','red');
else
    text(test(1),test(2),test(3),sprintf('test'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
end
bigCenter=slabCone13.bigCenter+0.0000001*slabCone13.axis;
[check]=isSlabConeContainVertice(slabCone13,bigCenter);
if check
    text(bigCenter(1),bigCenter(2),bigCenter(3),sprintf('bigCenter'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','red');
else
    text(bigCenter(1),bigCenter(2),bigCenter(3),sprintf('bigCenter'),'Interpreter', 'latex','HorizontalAlignment','left','FontSize',15,'Color','blue');
end
grid off;
hold off;
axis off;
% ka= 0.7;
% kd= 0.84;
% ks= 0.4;
% shine=120;
% material([ka kd ks shine]);
light('Color',[0.8, 0.8, 0.8],'Position',[10 10 -10],'Style','infinite');
%light('Color',[0.8, 0.8, 0.8],'Position',[-10 10 -10],'Style','infinite');
%light('Color',[0.8, 0.8, 0.8],'Position',[0 0 -10],'Style','infinite');

camlight;