function sanitizeBody(body,validProperties){
    const data = {}
    let validate = []

    for ([key, value] of Object.entries(body)) {
        for (let index = 0; index < validProperties.length; index++) {
            if(key==validProperties[index]){
                data[key] = value
            }
        }  
      }

    console.log(data)
}

sanitizeBody({
    username:'andi',
    password:'andi123',
    lastname:'siahaan'
},
[
    'username','password'
]
)