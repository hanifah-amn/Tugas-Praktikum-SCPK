function [RasioKonsistensi] = HitungKonsistensiAHP(relasiAntarKriteria)
    %indeks konsistensi acak
    indeksAcak = [0 0 0.57 0.9 1.11 1.24 1.31 1.41 1.44 1.49];
    
    %menghitung jumlah kriteria yang sesuai dengan ukuran matriks relasi
    %antar kriteria
    [op, jumlahKriteria] = size(relasiAntarKriteria);
    
    %menghitung nilai lambda (nilai eigenvalue)
    [opp, lambda] = eig(relasiAntarKriteria);
    
    %menentukan maksimal nilai lambda
    maksLambda = max(max(lambda));
    
    IndeksKonsistensi = (maksLambda - jumlahKriteria)/(jumlahKriteria - 1);
    
    %rasio konsistensi untuk mendapatkan jawaban akhir
    RasioKonsistensi = IndeksKonsistensi/indeksAcak(1, jumlahKriteria);
    
    if RasioKonsistensi > 0.10
        str = 'Rasio Konsistensi adalah %% %1.2f. Matriks yang dievaluasi tidak konsisten!';
        str = sprintf(str, RasioKonsistensi);
        disp(str);
    end
end