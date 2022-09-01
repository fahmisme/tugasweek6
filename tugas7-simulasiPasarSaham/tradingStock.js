class tradingStock{
    findHighestProfit(/**/){
        const hargaSaham = arguments[0];
        this.config(hargaSaham);
    }

    config(hargaSaham){
        let totalIndex = hargaSaham.length-1;
        let nilaiMax = Math.max.apply(null, hargaSaham);
        let nilaiMin = Math.min.apply(null, hargaSaham);
        let indexMax = hargaSaham.indexOf(nilaiMax);
        let indexMin = hargaSaham.indexOf(nilaiMin);

        if (indexMin > indexMax){
            let stockPrice = hargaSaham.slice(indexMin,totalIndex+1);
            nilaiMax = Math.max.apply(null, stockPrice);
            nilaiMin = Math.min.apply(null, stockPrice);
            indexMax = stockPrice.indexOf(nilaiMax)
            indexMin = stockPrice.indexOf(nilaiMin)
            
            
            if(indexMin > indexMax){
                stockPrice.splice(indexMin,1)
            }

            nilaiMax = Math.max.apply(null, stockPrice);
            nilaiMin = Math.min.apply(null, stockPrice);
            indexMax = stockPrice.indexOf(nilaiMax);
            indexMin = stockPrice.indexOf(nilaiMin);
        }

        if (indexMax == 0){
            console.log('Tidak bisa mendapatkan profit hari-hari ini')
        }
        
        else{
            console.log(nilaiMax - nilaiMin)
        }
    }
}

module.exports = tradingStock;
