function obj2mat(obj_filename)
    display(obj_filename)
    display('Parsing...')

    obj_text = fileread(obj_filename);

    % Extract vertices
    vertex_expr = '[^\n]*v [^\n]*';
    vertex_matches = regexp(obj_text, vertex_expr, 'match');


    % Parse
    len_vertex_matches = length(vertex_matches);
    vertex_arr = zeros(len_vertex_matches, 3);
    vertex_normals_arr = zeros(len_vertex_matches, 3);
    for idx = 1:len_vertex_matches
        tmp=strsplit(vertex_matches{idx});
        vertex_arr(idx, :) = str2double(tmp(2:4));
    end

    % Create obj struct
    p= vertex_arr;

    % Save data
    [~, obj_name, ~] = fileparts(obj_filename);
    mat_filename = strcat(obj_name, '.mat');
    save(mat_filename, 'p', '-mat')
    display('Saved')
    display(mat_filename)
end