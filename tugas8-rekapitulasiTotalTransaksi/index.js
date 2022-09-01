const transactions = require('./dataTransaction')

let result = transactions.reduce((c, v) => {
  c[v.day] = (c[v.day] || 0) + v.totalPrice;
  return c;
}, {});

console.log(result);