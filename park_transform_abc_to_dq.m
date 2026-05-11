function [d, q] = park_transform_abc_to_dq(a, b, c, theta)
    % Performs Park's transform from ABC to DQ reference frame.
    
d = -(2/3)*(  a*cosd(theta) + b*cosd(theta-120)+ c*cosd(theta+120) );
q = -(2/3)*( -a*sind(theta) - b*sind(theta-120)- c*sind(theta+120) );

end

% % Example usage
% a = 1.0;
% b = 1.0;
% c = 1.0;
% theta = pi/4;  % 45 degrees
% 
% [d, q] = park_transform_abc_to_dq(a, b, c, theta);
% disp('d-axis component: ' + string(d));
% disp('q-axis component: ' + string(q));
