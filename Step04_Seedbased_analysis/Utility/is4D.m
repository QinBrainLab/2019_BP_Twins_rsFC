function res = is4D(file)
    nbframes = spm_select_get_nbframes(file);
    if nbframes > 1
        res = true;
    else
        res = false;
    end
end
