function u = heatDisk (a, b, t, r, init, int_temp, air_temp, transfer)
% This function returns temperature distribution as a matrix u
% a, b - parameters of equation
% t - vector with values of time
% r - vector with values of radius
% init - initial temperatute distribution at t = 0
% int_ temp - temperature on internal face
% air_temp - temperature of ambient air
% transfer - bool parameter, 1 - consider heat exchange to air from
% surface, 0 - neglect

L = length ( r );
N = length ( t );
dr = mean ( diff ( r ) );
dt = mean ( diff ( t ) );
u = zeros ( N , L );
u(1, : ) = init;

C = a * dt / ( dr * dr );

if transfer > 0
    D = b * dt; % with heat transfer to air
elseif transfer == 0 
    D = 0; % without heat transfer to air
end

for i = 1:N-1
    for j = 2:L-1
        r_j = r ( j );
        
        A = 1 - a * dt / (r_j * dr) - 2 * a * dt / ( dr * dr ) - D; 
        B = a * dt / (r_j * dr) + a * dt / ( dr * dr );
        
        u ( i + 1 , j ) = A * u ( i , j ) + B * u ( i , j + 1 ) + C * u ( i , j - 1 ) + D * air_temp;
        
        u ( i + 1 , 1 ) = int_temp; 
        u ( i + 1 , L ) = u ( i + 1 , L - 1 ); % ( du / dr ) ( L ) = 0
    end
end