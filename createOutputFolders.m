function createOutputFolders(subjects)
%% Generate outputFolders for robot experiment Variability
% Input:
%   subjects: vector of subjectIDs, e.g. [000], [001] etc
%
% createOutputFolders([000])
subj = sprintf('%03d', subjects);
outputFolder = [pwd filesep 'OutputFiles' filesep subj filesep];
if exist(outputFolder,'dir')
    error('ERROR, ERROR, BEEP BOOP.... Directory already exists! Make sure you are not going to overwrite existing data')  
else
    for i=subjects
        mkdir([outputFolder])
    end;
end

