// Write a function which will accept original array and array of values that needs to be 
// excluded and return a new array by excluding unwanted values from original array.
//        Eg. function exclude(arr, values) {};
//        exclude([1, 2, 3, 4], [1, 4]) => [2, 3]

var array = [4,2,6,3,4,875,354,78,77,444] 
var values = [875,751,4,77]      

function Exclude(arr , excludeValues ){
    // array.sort();
    // values.sort();
    freqArr = Array(1000).fill(0);
    
    array.forEach(v => {   
        freqArr[v]++;
    });

    values.forEach(v => {
        if(freqArr[v]>0)
            freqArr[v] = 0;
    });

    var resultArray = []
    array.forEach(v => {   
        if(freqArr[v] > 0){
            resultArray.push(v);
        }
    });
    return resultArray
}

var result = Exclude(array,values);
console.log(result)