function [bobotAntarKriteria, relasiAntarKriteria] = FuzzyAHP(relasiAntarKriteria, TFN)
    %menghitung nilai skor akhir dengan mengalikan data dengan
    %masing-masing bobot antar kriteria
    
    fuzzyRelasi = {};
    [jumlahData, jumlahKriteria] = size(relasiAntarKriteria);
    
    %konversi relasi antar kriteria menjadi TFN
        %memasukkan nilai segitiga bawah pada matrik relasi antar kriteria
        for i=1:jumlahData
            for j=i+1:jumlahData
                relasiAntarKriteria(j,i) = 1/relasiAntarKriteria(i,j);
            end
        end
        
        %perhitungan pada matriks relasi antar kriteria
        for i=1:jumlahData
            for j=1:jumlahKriteria
                kriteria = relasiAntarKriteria(i,j);
                if kriteria >= 1
                    fuzzyRelasi{i,j} = TFN{kriteria, 1};
                else
                    fuzzyRelasi{i,j} = TFN{round(kriteria^-1), 2};
                end
            end
        end
        
    %menghitung jumlah dari masing-masing TFN yang dipakai dalam matriks
    %relasi antar kriteria, lalu hasil dijumlah pada masing-masing kolom kriteria
    for i=1:jumlahData
        barisRelasi = [fuzzyRelasi{1,:}];
        jumlahRelasiPerBaris{1,i} = sum(reshape(barisRelasi,3,[]));
    end
    
    RelasiPerData = [jumlahRelasiPerBaris{1,:}];
    jumlahRelasiPerKolom = sum(reshape(RelasiPerData,3,[]));
    
    %perhitungan masing-masing nilai relasi pada masing-masing kolom
    for i=1:jumlahData
        RelasiPerData = [jumlahRelasiPerBaris{1,i}];
        for j=1:3
            nilaiRelasiPerKolom = jumlahRelasiPerKolom(1,j);
            jumlahPerKolom(1,j) = (RelasiPerData(1,j))*(1/nilaiRelasiPerKolom);
        end
        jumlahRelasiPerBaris{1,i} = jumlahPerKolom;
    end
    
    %perhitungan derajat kemungkinan
        derajatKemungkinan = zeros(jumlahData*(jumlahData-1),3);
        idxBaris = 1;

        %perhitungan masing-masing data dengan indeks baris dan kolom tidak sama
        for i=1:jumlahData
            for j=1:jumlahData
                if i~=j
                    %memasukkan nilai awal derajat kemungkinan, M1, dan M2
                    derajatKemungkinan(idxBaris,[1,2]) = [i,j];
                    M1 = jumlahRelasiPerBaris{1,i};
                    M2 = jumlahRelasiPerBaris{1,j};
                    
                    %menghitung nilai derajar kemungkinan
                    if M1(1,2) >= M2(1,2)
                        derajatKemungkinan(idxBaris,3) = 1;
                    elseif M2(1,1) >= M1(1,3)
                        derajatKemungkinan(idxBaris,3) = 0;
                    else
                        derajatKemungkinan(idxBaris,3) = (M2(1,1)-M1(1,3)) / ((M1(1,2)-M1(1,3))-(M2(1,2)-M2(1,1)));
                    end
                    
                    idxBaris = idxBaris+1;
                end
            end
        end
        
    %menghitung nilai bobot menggunakan nilai derajat kemungkinan minimal
    %pada masing-masing kriteria
    bobotAntarKriteria = zeros(1,jumlahData);
    for i=1:jumlahData
        bobotAntarKriteria(1,i) = min(derajatKemungkinan([find(derajatKemungkinan(:,1)==i)],[3]));
    end
    
    %normalisasi nilai bobot dengan membagi masing-masing nilai bobot
    %dengan total semua bobot
    bobotAntarKriteria = bobotAntarKriteria/sum(bobotAntarKriteria);
    
end