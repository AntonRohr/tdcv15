function col = getMaxInCell( input_cell )
max_val = 0;
max_col = 0;
for i = 1 : size(input_cell,2)
    if(input_cell{i} >= max_val)
        max_val = input_cell{i};
        max_col = i;
    end
end
col = max_col;
end

