// Matrix Search
// Jenny digs image and wants to maxe a JavaScript imaging library lixe PIL for python. She is given 2 different two-dimensional arrays, containing integers between 0 and 65535. Each two dimensional array represents a grey-scale image, where each integer value is a pixel. The second image might be somewhere inside the larger one. Return whether it is.
// Given Array: [ [12, 34, 45, 56],    And Array: [ [67, 78],      return: true
//                [98, 87, 76, 65],                 [43, 32] ];   
//                [56, 67, 78, 89],
//                [54, 43, 32, 21] ];


let x = [
    [12, 34, 45, 56],
    [98, 87, 76, 65],
    [56, 67, 78, 89],
    [54, 43, 32, 21]
]

let y = [
    [67, 78],
    [43, 32]
]


let z = [
    [67, 77],
    [43, 32]
]

// console.log(x[0][0])

function matrixSearch(bigArr, smallArr) {
    for (let i = 0; i < bigArr.length; i++) {
        for (let j = 0; j < bigArr[i].length; j++) {
            let exists = true;
            for (let x = 0; x < smallArr.length && exists; x++) {
                for (let y = 0; y < smallArr[x].length && exists; y++) {
                    exists = bigArr[i+x][j+y] == smallArr[x][y]
                }
            }
            if (exists){
                return true;
            }

        }
    }
    return false;
}

console.log(matrixSearch(x, y)) //true
console.log(matrixSearch(x, z)) //false