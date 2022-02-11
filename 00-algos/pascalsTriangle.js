// https://leetcode.com/problems/pascals-triangle/

//     To build out this triangle, we need to take note of a few things.
// Each row starts and ends with a 1.
// Inside each row, between the 1s, each digit is the sum of the two digits immediately above it.
// We can use this pattern to build new rows starting with row 3. But we can’t use it to build the first or second rows.
// Each row is represented as an array; we need to output the entire triangle as an array of these rows (ie an array of arrays).

function generate(numRows) {

    if (numRows == 1) {
        return [[1]];
    }
    // Initialize first two rows, since they will always be the same
    let result = [[1], [1, 1]];

    for (let i = 2; i < numRows; i++) {
        let newRow = [];
        for (let j = 0; j <= i; j++) {
            // The first or last value of the row will always be 1
            if (j === 0 || j == i) {
                newRow.push(1);
            }
            else {
                // Otherwise add together sums of previous row and push to new row
                let aboveNumSum = result[i - 1][j - 1] + result[i - 1][j];
                newRow.push(aboveNumSum);
            }
        }
        result.push(newRow);
    }
    return result;
};



console.log(generate(5)) //[[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]