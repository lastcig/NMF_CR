clear all

setsSource = '/Volumes/Audio/ISMIR2011/PitchSpec';
load([setsSource filesep 'sets.mat']);

r = 25;
for norm_w = [0 2]
    norm_h = 0;
    alpha = 0;

    basesFolder = '/Volumes/Audio/ISMIR2011/NMF_Bases';
    makedir(basesFolder);
    for set = 1:size(sets,1)
        trainingSet = sets{set,2};
        
        [W1,H,E,C] = nmf_kl_ns_large(trainingSet, r , 'verb', 4, 'norm_w', norm_w, 'norm_h', norm_h, 'alpha', alpha, 'niter', 100,'EPS', eps, 'allinonce', 0);

        filename = sprintf('%s/Set%02d_norm%d.mat', basesFolder, set, norm);
        
        Bases = W1;
        save(filename, 'Bases');
    end
end
