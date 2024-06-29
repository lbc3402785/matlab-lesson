function h = circle(hAx,x,y,r)
hold on
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
if ~isempty(hAx) && isgraphics(hAx, 'axes')
    plot(hAx,xunit, yunit);
    axis(hAx,'equal');
    axis(hAx,'off');
end
end