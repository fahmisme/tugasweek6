const tradingStock = require('./tradingStock')
const ts = new tradingStock();

ts.findHighestProfit([10,2,11,20,3,5]);
ts.findHighestProfit([33,29,11,3]);
ts.findHighestProfit([2000,1000,69,1800,2000,900])
ts.findHighestProfit([6000,7000,9,6,90,120]);