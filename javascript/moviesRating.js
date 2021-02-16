// Consider movies = [ { title: "xxx", year: 2020, rating: 8 } ] filter movies which has 
// a rating more than 7 and display the title of those movies in desc order of release year.



var movies=[ { title: "Ludo", year: 2020, rating: 8 },
{ title: "hum", year: 2019, rating: 5},
{ title: "tum", year: 2000, rating: 9 },
{ title: "shor", year: 1985, rating: 1 },
{ title: "dhol", year: 2002, rating: 7},
{ title: "The Shawshank Redemption ", year: 1994, rating: 9.2},
{ title: "The Lion King ", year: 1994, rating: 8.5},
{ title: "Joker", year: 2019, rating: 8.4},
{ title: " Interstellar", year: 2014, rating: 8.5},
{ title: "Django Unchained", year: 2012, rating: 8.4},
{ title: "Natsamrat", year: 2016, rating: 9},
{ title: "Katyar Kaljat Ghusali", year: 2015, rating: 8.8},
{ title: "Ashi Hi Banwa Banwi", year: 1988, rating: 8.8},]


function filter(arrayOfMovies){
    var res = []
    movies.forEach( m => {
        if(m.rating > 7)
            res.push(m);
    });
    return res;
}

var result = filter(movies);

// console.log(result);


// result.sort((a, b) => (a.year < b.year) ? 1 : -1)  // This also works


function comparable( a,  b){
    if(a.year < b.year)
        return 1;
    else
    return -1;
}
result.sort(comparable)



// console.log(result);
console.log("Movies with rating greater than 7 and in descending order of release year:")
var i = 1
result.forEach( movie => {
    console.log(i+". "+movie.title + "( Releasing year : " + movie.year + " )");
    i++;
});