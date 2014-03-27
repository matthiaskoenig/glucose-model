intervals = linspace(10, 90, 9)
additions = linspace(1, 10, 10)
Ni = length(intervals);
Na = length(additions);
count = 0;
count_max = Ni * Na;
for k=1:Ni
    add_interval = intervals(k);
    for p=1:Na
        gu_addition = additions(p);
        count = count + 1;
        disp('****************************');
        count/count_max*100
        add_interval
        gu_addition
        tic
        sim_hypoglycemia_timecourse_driver(gu_addition, add_interval)
        toc
    end
end