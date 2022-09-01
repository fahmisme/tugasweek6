class operasiPerhitungan{
    menghitungKembalian(totalPembelian, totalUang) {
        let uangKembalian = totalUang - totalPembelian;
        let hasil = this.menghitungLembarKembalian(uangKembalian);
        return hasil;
    }
    
    menghitungLembarKembalian(uangKembalian) {
        const pecahanUang = [50000, 10000, 5000, 2000, 1000];
        const rincian = {};
        let sisa = uangKembalian;
        // return uangKembalian;
    
        //50000
        if (sisa >= pecahanUang[0]){
            let banyakLembar = (sisa/pecahanUang[0]);
            banyakLembar = Math.floor(banyakLembar);
            
            if (sisa%50000 >= 0 ){
                rincian[pecahanUang[0]] = banyakLembar;
                sisa = sisa-(pecahanUang[0]*banyakLembar);
                }
        }
        else{
            rincian[pecahanUang[0]] = 0;
        }
                    
        //10000
        if (sisa >= pecahanUang[1]){
            let banyakLembar = (sisa/pecahanUang[1]);
            banyakLembar = Math.floor(banyakLembar);
            if (sisa%20000 >= 0){
                rincian[pecahanUang[1]] = banyakLembar;
                sisa = sisa-(pecahanUang[1]*banyakLembar);
                }
        }
        else{
            rincian[pecahanUang[1]] = 0;
        }
        
        //5000
        if (sisa >= pecahanUang[2]){
            let banyakLembar = (sisa/pecahanUang[2]);
            banyakLembar = Math.floor(banyakLembar);
            if (sisa%pecahanUang[2] >= 0){
                rincian[pecahanUang[2]] = banyakLembar;
                sisa = sisa-(pecahanUang[2]*banyakLembar);
            }
        }
        else{
            rincian[pecahanUang[2]] = 0;
        }
    
        //2000
        if (sisa >= pecahanUang[3]){
            let banyakLembar = (sisa/pecahanUang[3]);
            banyakLembar = Math.floor(banyakLembar);
            if (sisa%pecahanUang[3] >= 0){
                rincian[pecahanUang[3]] = banyakLembar;
                sisa = sisa-(pecahanUang[3]*banyakLembar);
            }
        }
        else{
            rincian[pecahanUang[3]] = 0;
        }
    
        //1000
        if (sisa >= pecahanUang[4]){
            let banyakLembar = (sisa/pecahanUang[4]);
            banyakLembar = Math.floor(banyakLembar);
            if (sisa%pecahanUang[4] >= 0){
                rincian[pecahanUang[4]] = banyakLembar;
                sisa = sisa-(pecahanUang[4]*banyakLembar);
            }
        }
        else{
            rincian[pecahanUang[4]] = 0;
        }

                return rincian;
            }
    }

    
    module.exports = operasiPerhitungan;