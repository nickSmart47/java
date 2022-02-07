// Here, a balance point is on an index, not between indices.
// Return the balance index where sums are equal on either side (exclude its own value)
// ex. [-2,5,7,0,3] should return 2 (index 2 is balance point, sums on either side equal 3)
// if no balance point, return -1


// function balanceIndex(arr) {
//     let totalSum = 0;
//     let runner = arr[0];
//     for (let i = 0; i < arr.length; i++) {
//         totalSum += arr[i];
//     }

//     for (let j = 0; j < arr.length; j++) {
//         if (totalSum != runner) {
//             runner += arr[j + 1];
//             totalSum -= arr[j];
//         }
//         else {
//             return j;
//         }
//     }
//     return -1;
// }

// console.log(balanceIndex([1, 2, 4, 9, 20])) // -1 (means that there is no index where a balance occurs)
// console.log(balanceIndex([4, 1, 2, 4, 9, -20, 18])) // 3 (means that there is a balance at index 3)
// console.log(balanceIndex([-2, 5, 7, 0, 3])) // 2
// find total sum of array,
// then minus each index from total sum?


// function balanceIndex(arr) {
//     let sum = 0;
//     let sumLeft = arr[0];
//     let sumRight = arr[1];

//     for (let i = 0; i < arr.length; i++) {
//         sum += arr[i]

//     }
//     // sumRight is sum total minus sumleft minus index
//     sumRight = sum - sumLeft - arr[1];

//     for (let j = 1; j < arr.length - 1; j++) {
//         // console.log(sumLeft, sumRight )
//         if (sumLeft === sumRight) {

//             return j
//         } else {
//             sumLeft += arr[j];
//             sumRight = sum - sumLeft - arr[j + 1];

//         }
//     }
//     return -1;
//     // console.log(sum)
// }


// console.log(balanceIndex([1, 2, 4, 9, 20])) //-1 (means that there is no index where a balance occurs)
// console.log(balanceIndex([4, 1, 2, 4, 9, -20, 18])) //3 (means that there is a balance at index 3 occurs)
// console.log(balanceIndex([-2, 5, 7, 0, 3])) // 2

// function balanceIndex(arr) {

//     let totalValue = arr.reduce((currentValue, nextValue) => currentValue + nextValue, 0);
//     let runningValue = arr[0];

//     if (arr.length === 1) {
//         return arr[0];
//     }

//     for (let i = 0; i < arr.length; i++) {
//         if (totalValue != runningValue) {
//             runningValue += arr[i + 1]
//             totalValue -= arr[i];
//         }
//         else {
//             return i;
//         }
//     }


//     return -1;
// }


