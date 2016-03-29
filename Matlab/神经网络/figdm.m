function figdm(d)
hold on
axis square
for j = 1:5
    for i = 1:5
        if d((j - 1) * 5 + i) == 0
            fill([i - 1 i i i-1], [5 - j, 5 - j, 6 - j, 6 - j], 'w');
        else
            fill([i - 1 i i i-1], [5 - j, 5 - j, 6 - j, 6 - j], 'k');
        end
    end
end
hold off