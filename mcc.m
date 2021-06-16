function MakeClasscell = mcc(arr)
    MakeClasscell = {};
    if ~isempty(arr)
        for l = 1:size(arr, 1)
            sav = [];
            for k = 1:size(arr,2)
                if ~isempty(arr{l,k})
                    sav(size(sav,1)+1,1:4) = arr{l,k};
                else
                    continue
                end
            end
            MakeClasscell(l,1) = {sav};
        end
    end
end 

