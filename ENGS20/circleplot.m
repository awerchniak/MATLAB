function [ output_args ] = circleplot(x,y,r)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
x1=x-r:.01:x+r;
y1=sqrt(r^2-(x1-x).^2)+y;
y2=-sqrt(r^2-(x1-x).^2)+y;

plot(x1,y1, 'b', x1,y2, 'b');
axis equal tight;
end

