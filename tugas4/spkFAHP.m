%SPK PEMILIHAN HOTEL
namaHotel = {'Amar' 'Bara' 'Can' 'Di'};

    %[harga fasilitas pelayanan]
data = [4 6 5
        7 3 4
        8 2 3
        5 4 6];
    
%batas maksimal kriteria
maksHarga = 9;
maksFasilitas = 9;
maksPelayanan = 9;

%normalisasi data
data(:,1) = data(:,1)/maksHarga;
data(:,2) = data(:,2)/maksFasilitas;
data(:,3) = data(:,3)/maksPelayanan;

relasiAntarKriteria = [1 2 4
                       0 1 3
                       0 0 1];
                   
TFN = {[-100/3   0   100/3] [3/100   0   -3/100]
       [   0   100/3 200/3] [3/200 3/100    0  ]
       [ 100/3 200/3 300/3] [3/300 3/200  3/100]
       [ 200/3 300/3 400/3] [3/400 3/300  3/200]};
   
RasioKonsistensi = HitungKonsistensiAHP(relasiAntarKriteria);

if RasioKonsistensi < 0.10
    %metode fuzzy AHP
    [bobotAntarKriteria, relasiAntarKriteria] = FuzzyAHP(relasiAntarKriteria, TFN);
    
    %menghitung nilai skor akhir
    ahp = data * bobotAntarKriteria';
    
    disp('Hasil Perhitungan Dengan Metode Fuzzy AHP');
    disp('Nama Hotel, Skor Akhir, Kesimpulan');
end

%rentang kriteria kesimpulan
for i=1:size(ahp,1)
    if ahp(i) < 0.5
        status = 'Kurang';
    elseif ahp(i) < 0.65
        status = 'Cukup';
    elseif ahp(i) < 0.85
        status = 'Baik';
    else
        status = 'Sangat Baik';
    end
    
    disp([char(namaHotel(i)), blanks(13 - cellfun('length',namaHotel(i))), ', ', ...
        num2str(ahp(i)), blanks(10 - length(num2str(ahp(i)))), ', ', ...
        char(status)])
end
