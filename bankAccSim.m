clear;clf;
s = 100; %starting money
m = s; % current money
r = 0.05/365; % 5% interest rate / year
day = 0;
dayOfWeek = 1;
pay = 1000;

money_v = [];

moneyForDay = @(m, r) m*r + m;

while (day < 700) 
    
    m = moneyForDay(m, r);
    
    if (dayOfWeek == 5) % if friday
        m += pay;
    endif
    
    if (dayOfWeek == 7)
        dayOfWeek = 1;
    elseif (dayOfWeek < 7)
        dayOfWeek++;
    endif
    
    m -= m * rand(1)/10;
    day++;
    money_v = [money_v, m];
endwhile

plot(money_v, "linewidth", 0.5);

xlabel ("Day"); ylabel ("Balance");

title('Balance for Day');

money_v;
