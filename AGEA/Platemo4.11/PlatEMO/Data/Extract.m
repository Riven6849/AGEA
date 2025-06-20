num_problems = 29;    %Number of problems
num_files = 25;       
num_rows = 1000;      


for problem_idx = 1:num_problems

    target_values = zeros(num_rows, num_files);


    base_value = problem_idx * 100;
    

    for file_idx = 1:num_files
       
        filename = sprintf('AGEA_CEC17_F%d_M1_D30_%d.mat', problem_idx, file_idx);
        
        try
          
            load(filename, 'result');
            
            
            second_column = result(:, 2);
            
            
            for row_idx = 1:num_rows
                if ~isempty(second_column{row_idx})
                    
                    solution = second_column{row_idx}(1);  
                    target_values(row_idx, file_idx) = solution.obj; 
                else
                    target_values(row_idx, file_idx) = NaN;
                end
            end
        catch
            warning('文件 %s 加载失败，对应位置填充NaN', filename);
            target_values(:, file_idx) = NaN;
        end
    end
    
    
    abs_diff = abs(target_values - base_value);
    
    
    output_filename = sprintf('AGEA_F%d_Min_EV.mat', problem_idx);
    
    
    save(output_filename, 'abs_diff');
    
    
    fprintf('已完成问题F%d的处理，保存为%s\n', problem_idx, output_filename);
    fprintf('当前工作目录: %s\n', pwd);
    output_dir = pwd; 
    fprintf('保存路径: %s\n', fullfile(output_dir, output_filename));
end

disp('所有29个问题处理完成！');