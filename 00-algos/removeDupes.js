//given an array, remove duplicate values from it. Do it in place (do not create a new array)
// you can use an object to keep track of values

// const removeDupes = (arr) => {
//     let arrObj = {};

//     for(let i = 0; i < arr.length; i++){
//         // console.log("current value at index " + i +" is " + arr[i] )
//         if (!(arr[i] in arrObj)){
//             arrObj[arr[i]] = 1;
//         }
//         else if (arr[i] in arrObj){
//             // console.log("value", arr[i], "is a duplicate, removing it now");
//             arr.splice(i, 1)
//             i--;
//         }
//     }
//     // console.log(arrObj);
// }

// arr = [3,6,7,3,2,7,7,9,0,1];
// removeDupes(arr);
// console.log(arr);


// const removeDupes = (arr) => {
//     let arrObj = {};

//     for(let i = 0; i < arr.length; i++){
//         // if value at index i not in array object, then add it to array object with value of 1
//         if (!(arr[i] in arrObj)){
//             arrObj[arr[i]] = 1;
//         }
//         else if (arr[i] in arrObj){
//             // otherwise , if value at index i is in array object, then remove it from array using splice.
//             // splice takes in an index (i) and a number of elements to remove (only 1 in this case)
//             arr.splice(i, 1)
//             // because splice removes the value at index i and shifts the array, we need to decrement i
//             // to avoid skipping any values
//             i--;
//         }
//     }
// }

let removeDupes = arr => newArr = [...new Set(arr)];

arr = [3,6,7,3,2,7,7,9,0,1];
console.log(removeDupes(arr));
// console.log(arr);