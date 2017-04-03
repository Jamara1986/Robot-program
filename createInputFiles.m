function [] = createInputFiles(subjects,group)
%% Generate inputFiles for experiments with robot
% You need to change the specific inputvariables for each new experiment
% Also creates a folder for subject data in the outputFiles directory
%
% Input = subjectID (string) and groupNumber (int 1 or 2)

% We need to make sure that the second training FF is opposite of the first
% training

% set header texts
headerBaseline = {
    'BlockName					s               BASELINE';
    'TargetSuccessColor			c               g';
    'TargetSlowColor			c               b';
    'TargetFastColor			c               y';
    'TargetMissColor			c               g';
    'PerturbationType           s               NONE';
    'PerturbationMag            d               0';
    'RetentionTest              i               0';
    'END'};

headerFFTraining = {
    'BlockName					s               FORCETRAINING';
    'TargetSuccessColor			c               g';
    'TargetSlowColor			c               b';
    'TargetFastColor			c               y';
    'TargetMissColor			c               g';
    'PerturbationType           s               FORCE';
    'PerturbationMag            d               1.5';
    'RetentionTest              i               0';
    'END'};


headerFFEasy = {
    'BlockName					s               FORCENOCOG';
    'TargetSuccessColor			c               g';
    'TargetSlowColor			c               b';
    'TargetFastColor			c               y';
    'TargetMissColor			c               g';
    'PerturbationType           s               FORCE';
    'PerturbationMag            d               -1.5';
    'RetentionTest              i               1';
    'END'};

headerFFHard = {
    'BlockName					s               FORCECOG';
    'TargetSuccessColor			c               g';
    'TargetSlowColor			c               b';
    'TargetFastColor			c               y';
    'TargetMissColor			c               g';
    'PerturbationType           s               FORCE';
    'PerturbationMag            d               1.5';
    'RetentionTest              i               1';
    'END'};

variableDeclaration  = {
    'Origin                     i #origin location';
    'VisualPerturbationType     i #1 for rotation, 2 for clamp';
    'showCursor                 i #show cursor during trial';
    'VisualRotationDeg          d #rotation of cursor in degrees';
    'Target                     i #target location';
    'forceType                  i #1 for FF, 2 for EC';
    'forceGain                  d #strength of forcegain in n/cm';
    'interTrialInterval         d #length between trials in ms';
    'NextOrigin                 i #position of origin on next trial';
    'showBackground             s #0 for white, "String.bmp" for .bmp as background';
    'END'};

% add variable declaration to end of header
headerBaseline = char([headerBaseline; variableDeclaration]);
headerFFTraining = char([headerFFTraining; variableDeclaration]);
headerFFEasy = char([headerFFEasy; variableDeclaration]);
headerFFHard = char([headerFFHard; variableDeclaration]);

% set list text
% this assumes three different targets
listBaseline = {
    '1 0 1 0 2 0 0.0 1000.0 2 0 ';
    '2 0 1 0 1 0 0.0 1000.0 1 0 ';
    '1 0 1 0 2 0 0.0 1000.0 2 0 ';
    '2 0 1 0 1 0 0.0 1000.0 1 0 ';
    '1 0 1 0 2 0 0.0 1000.0 2 0 ';
    '2 0 1 0 1 0 0.0 1000.0 1 0 ';
    '1 0 1 0 2 0 0.0 1000.0 2 0 ';
    '2 0 1 0 1 0 0.0 1000.0 1 0 ';
    '1 0 1 0 2 2  0.0 1000.0 2 0 '; % trial 9 EC 1
    '2 0 1 0 1 0 0.0 1000.0 1 0 ';
    '1 0 1 0 2 0 0.0 1000.0 2 0 ';
    '2 0 1 0 1 0 0.0 1000.0 1 0 ';
    '1 0 1 0 2 0 0.0 1000.0 2 0 ';
    '2 0 1 0 1 0 0.0 1000.0 1 0 ';
    '1 0 1 0 2 0 0.0 1000.0 2 0 ';
    '2 0 1 0 1 2  0.0 1000.0 1 0 '; % trial 16 EC 2
    };

listFFTrainingEasy = {
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 2  0.0 1000.0 2 0 '; % trial 9 EC 1
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 2  0.0 1000.0 1 0 '; % trial 16 EC 2
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 2  0.0 1000.0 2 0 '; % trial 25 EC 1
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 2  0.0 1000.0 1 0 '; % trial 32 EC 2
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 2  0.0 1000.0 2 0 '; % trial 41 EC 1
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 2  0.0 1000.0 1 0 '; % trial 48 EC 2
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    };

listFFTrainingHard = {
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 2 0.0 1000.0 2 0 '; % trial 9 EC 1
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 2 0.0 1000.0 1 0 '; % trial 16 EC 2
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 2 0.0 1000.0 2 0 '; % trial 25 EC 1
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 2 0.0 1000.0 1 0 '; % trial 32 EC 2
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 2 0.0 1000.0 2 0 '; % trial 41 EC 1
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 2 0.0 1000.0 1 0 '; % trial 48 EC 2
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    };

listFFEasy = {
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 2  0.0 1000.0 2 0 '; % trial 9 EC 1
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 2  0.0 1000.0 1 0 '; % trial 16 EC 2
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 2  0.0 1000.0 2 0 '; % trial 25 EC 1
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 2  0.0 1000.0 1 0 '; % trial 32 EC 2
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 2  0.0 1000.0 2 0 '; % trial 41 EC 1
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 2  0.0 1000.0 1 0 '; % trial 48 EC 2
    '1 0 1 0 2 1 -1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 -1.5 1000.0 1 0 ';
    '1 0 0 0 1 0  0.0 1000.0 1 Background.bmp '; % cogn test of niet
    '1 0 1 0 2 2  0.0 1000.0 2 0 '; % 10 EC
    '2 0 1 0 1 2  0.0 1000.0 1 0 ';
    '1 0 1 0 2 2  0.0 1000.0 2 0 ';
    '2 0 1 0 1 2  0.0 1000.0 1 0 ';
    '1 0 1 0 2 2  0.0 1000.0 2 0 ';
    '2 0 1 0 1 2  0.0 1000.0 1 0 ';
    '1 0 1 0 2 2  0.0 1000.0 2 0 ';
    '2 0 1 0 1 2  0.0 1000.0 1 0 ';
    '1 0 1 0 2 2  0.0 1000.0 2 0 ';
    '2 0 1 0 1 2  0.0 1000.0 1 0 ';
    };

listFFHard = {
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 2 0.0 1000.0 2 0 '; % trial 9 EC 1
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 2 0.0 1000.0 1 0 '; % trial 16 EC 2
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 2 0.0 1000.0 2 0 '; % trial 25 EC 1
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 2 0.0 1000.0 1 0 '; % trial 32 EC 2
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 2 0.0 1000.0 2 0 '; % trial 41 EC 1
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 2 0.0 1000.0 1 0 '; % trial 48 EC 2
    '1 0 1 0 2 1 1.5 1000.0 2 0 ';
    '2 0 1 0 1 1 1.5 1000.0 1 0 ';
    '1 0 0 0 1 0 0.0 1000.0 1 Background.bmp '; % cogn test of niet
    '1 0 1 0 2 2 0.0 1000.0 2 0 '; % 10 EC
    '2 0 1 0 1 2 0.0 1000.0 1 0 ';
    '1 0 1 0 2 2 0.0 1000.0 2 0 ';
    '2 0 1 0 1 2 0.0 1000.0 1 0 ';
    '1 0 1 0 2 2 0.0 1000.0 2 0 ';
    '2 0 1 0 1 2 0.0 1000.0 1 0 ';
    '1 0 1 0 2 2 0.0 1000.0 2 0 ';
    '2 0 1 0 1 2 0.0 1000.0 1 0 ';
    '1 0 1 0 2 2 0.0 1000.0 2 0 ';
    '2 0 1 0 1 2 0.0 1000.0 1 0 ';
    };

% Block loop, set amount of trials and blocktype here
% randomize the ITI Times
ITITimeAll = [1000, 3000, 6000, 12000, 20000, 30000 120000];
numITIAll = numel(ITITimeAll);
randNumEasy = randperm(numITIAll);
randNumHard = randperm(numITIAll);
for block=1:6% amount of blocks
    switch block
        case {1,4} % both baseline blocks
            headerText = headerBaseline;
            numberOfBins = 12; % 12*16 = 196
            listRep = char(repmat(listBaseline,1,numberOfBins));
        case {2}
            headerText = headerFFTraining;
            listRep = char(listFFTrainingEasy);
            
        case {3}
            % no strooptask
            headerText = headerFFEasy;
            numberOfBins = 7; % 1 bin = 50 FF, 1 test, 10EC = 61: 61*7 = 427
            listText = (repmat(listFFEasy,1,numberOfBins));
            [numTrials, numBins] = size(listText);
            % we need to randomnize the ITI and copy the correct .bmp
            % in the 51th trial
            for binNum = 1:numBins; 
                thisRand = randNumEasy(binNum); 
                ITITime = ITITimeAll(thisRand);
                listText{51, binNum} =  ['1 0 0 0 1 0  0.0 ' num2str(ITITime) ' 1 Congruent' num2str(binNum) '.bmp'];
            end
            listRep = char(listText);
            
        case {5}
            headerText = headerFFTraining;
            listRep = char(listFFTrainingHard);
            
        case {6}
            % no strooptask
            headerText = headerFFHard;
            numberOfBins = 7; % 1 bin = 50 FF, 1 test, 10EC = 61: 61*7 = 427
            listText = (repmat(listFFHard,1,numberOfBins));
            [numTrials, numBins] = size(listText);
            % we need to randomnize the ITI and copy the correct .bmp
            % in the 51th trial
            for binNum = 1:numBins; 
                thisRand = randNumHard(binNum); 
                ITITime = ITITimeAll(thisRand);
                listText{51, binNum} =  ['1 0 0 0 1 0 0.0 ' num2str(ITITime) ' 1 Incongruent' num2str(binNum) '.bmp'];
            end
            listRep = char(listText);
            
        otherwise
            %do nothing
    end
    
    for day=1 % just one day in our experiment :)
        
        %now we need to swap the order of block 2,3 with 5,6
        %depending on the group: group 1 for Easy first, group 2 for Hard
        %first
        if (group == 1)
            %do nothing
        end
        
        newblockorder = [1,5,6,4,2,3];
        if (group == 2)
            %swap 3-9 with 10-16
            block = newblockorder(block);
        end
        
        fDirectory = [pwd filesep 'InputFiles' filesep];
        if ~exist(fDirectory,'dir')
            error('ERROR, ERROR, BEEP BOOP.... Directory InputFiles does not exist, you are probably working in the wrong directory!');
        end
        
        [headLines, ~] = size(headerText);
        [listLines, ~] = size(listRep);
        
        for subject=subjects
            subj = sprintf('%03d', subject);
            fName = [fDirectory subj '_Day' int2str(day) '_Block' int2str(block) '.input'];
            fid = fopen(fName,'w');
            
            if fid ~= -1
                for headLine=1:headLines
                    fprintf(fid,'%s\r\n',headerText(headLine,:));       %# Print the string
                end;
                for listLine=1:listLines
                    fprintf(fid,'%s\r\n',listRep(listLine,:));       %# Print the string
                end;
                fclose(fid);
            end
        end
    end
end
createOutputFolders(subjects);


