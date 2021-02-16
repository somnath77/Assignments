// Consider array of primitive type and count the number of occurrences of an element
//        Eg: function(arr, search) {}


var arr = [5,65,3,2,75,4,33,2,765,22,56,987,54,43,23,8,234,65,3]

var searchElement = 3;

function Find(array,search){
    var freq = 0
    array.forEach(a => {
        if( a == search ){
            // console.log("Found at index: "+ a.index() );
            freq++
            // flg = 1
        }
    });
    if(freq == 0)
        return -1
    else
        return freq
}

var freq =  Find(arr , searchElement);
if(freq == -1)
    console.log("Element Not found")
else
console.log("Element Frequency: "+freq)
