// 1.  Write a function multiplyWithCallback that accepts two numbers and a callback function as arguments. The function should multiply the two numbers and pass the result to the callback function. 

// function display(text){
//     console.log(text);
// }

// function multiplyWithCallback(x, y, callBack){
//     let prod=x*y;
//     callBack(prod);
// }

// multiplyWithCallback(7, 8, display);

 

// 2.  Write a function doAsyncOperation that simulates an asynchronous operation. It takes a callback function callback as an argument. Inside doAsyncOperation, perform a setTimeout for 2 seconds and then invoke the callback with a success message. 

// function display(text){
//     console.log(text);
// }

// function doAsyncOperation(callback) {
//     setTimeout(() => {
//         callback('Operation completed successfully!');
//     }, 2000);
// }

// doAsyncOperation(display);
 

// 3.  Write a function delay that returns a promise. The promise should resolve after a given number of milliseconds (delayTime) with the message "Resolved after X milliseconds", where X is delayTime. Pass delayTime as an argument 

 

// 4.  Write a function fetchData that fetches data from a mock API. Implement using promises: 

// If the request is successful, return the data. 

// If there's an error (e.g., status code is not 200), throw an error. 

async function fetchData(endpoint){
    try {
        const response = await fetch(endpoint);
        if (!response.ok) {
            throw new Error(`Error: ${response.status}`);
        }
        const data = response.json;
        return data;
    } catch (error) {
        throw error;
    }
}
 
const dummyUrl='https://api.example.com/data';

fetchData(dummyUrl)
    .then(data => {
        console.log('Data fetched successfuly', data);
    }).catch(error => {
        console.log(error)
    });

// 5.  Write a function using async/await to fetch data from a REST API endpoint (https://api.example.com/data). Parse the JSON response and return the result. 

 

// 6.  Write a function that performs three asynchronous tasks sequentially using async/await: 

// Task 1: Fetch data from https://api.example.com/task1. 

// Task 2: Process the data (e.g., filter or transform it). 

// Task 3: Post the processed data to https://api.example.com/task3. Ensure each task waits for the previous one to complete before proceeding. 

 

// 7.  Write an async function that fetches data from multiple endpoints in parallel: 

// https://api.example.com/data1 

// https://api.example.com/data2 Ensure that the function waits for all requests to complete and collects all the results before returning. 

 

// 8.  Given an array of numbers, double each number and return the new array. 

// const nums=[1, 2, 3, 4, 5]; 

// const result = nums.map((it) =>{ 
//     return it*2; 
// }) 

// console.log(result) 

// 9.  Print each element of an array followed by its index. 

// const nums=[1, 2, 3, 4, 5]; 

// for(let i=0;i<nums.length;i++){ 
//     console.log(nums[i], i); 
// }  

// 10.  Check if any element in an array is greater than 10. 

// const nums = [5, 8, 15, 3, 2]; 
// const checkGreater = nums.some(number => number > 10); 

// console.log(checkGreater);  

// 11. Check if all elements in an array are positive. const nums = [1, 2, 3, -4, 5]; 

// const checkPositive = nums.every(number => number > 0); 

// console.log(checkPositive); 


// 12.  Filter an array of numbers to get only even numbers. const nums = [1, 2, 3, 4, 5, 6]; 

// const result = nums.filter(number => number%2===0);  

// console.log(result) 