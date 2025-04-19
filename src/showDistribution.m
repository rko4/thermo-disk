function u_step = showDistribution( u_vals , r_vals , t_vals , t_moment , new_figure )
% This function returns a temperature distribution at time moment t_moment
% u_vals - temperature distribution as a matrix
% t_vals - vector with values of time
% r_vals - vector with values of radius
% t_moment - time moment to show distribution on it
% new_figure - bool parameter for creating figure

t_length = length (t_vals);
Dt = mean ( diff ( t_vals ) );

r_length = length ( r_vals );
try
    if new_figure == 1
        figure;
    end
    
    t_step = int16 ( t_moment / Dt );
    
    u_step = zeros ( t_step , r_length );
    for t_j = 1 : t_step
        u_step ( t_j, : ) = u_vals( t_j , 1:r_length);
    end
    t_vals_step = zeros(1, t_step);

    t_vals_step ( : ) =  t_vals(1 : t_step);
    contourf ( r_vals , t_vals_step , u_step );
    xlabel 'r, m'; ylabel 't, sec';
  
        title ( strcat ( 'Temperature distribution in copper disk as a function of radius and time at t = ' , num2str(t_moment) , ' sec' ) );
catch
    disp ( strcat ( 'Error, consider time moment less than', ' ' , num2str ( t_vals ( t_length ) )  , ' seconds or increase t_final at file "initParameters.m "' ) )
    u_step = 0;
end

