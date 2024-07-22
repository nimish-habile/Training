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

// async function fetchData(endpoint){
//     try {
//         const response = await fetch(endpoint);
//         if (!response.ok) {
//             throw new Error(`Error: ${response.status}`);
//         }
//         const data = response.json;
//         return data;
//     } catch (error) {
//         throw error;
//     }
// }

// const dummyUrl='https://api.example.com/data';

// fetchData(dummyUrl)
//     .then(data => {
//         console.log('Data fetched successfuly', data);
//     }).catch(error => {
//         console.log(error)
//     });

// 5.  Write a function using async/await to fetch data from a REST API endpoint (https://api.example.com/data). Parse the JSON response and return the result.

// async function fetchData() {
//   const url = 'https://api.example.com/data';

//   try {
//     const response = await fetch(url);
    
//     if (!response.ok) {
//       throw new Error(`HTTP error! status: ${response.status}`);
//     }

//     const data = await response.json();
    
//     return data;
//   } catch (error) {
//     console.error('Error fetching data:', error);
//     throw error;
//   }
// }

// fetchData();


// 6.  Write a function that performs three asynchronous tasks sequentially using async/await:

// Task 1: Fetch data from https://api.example.com/task1.

// Task 2: Process the data (e.g., filter or transform it).

// Task 3: Post the processed data to https://api.example.com/task3. 

// Ensure each task waits for the previous one to complete before proceeding.

// async function performTasks() {
//   try {
//     const fetchedResponse = await fetch('https://api.example.com/task1');
//     if (!fetchedResponse.ok) {
//       throw new Error('Failed to fetch data');
//     }
//     const data = await fetchResponse.json();

//     const processedData = data.filter(id => id%2 === 0); //transformation of data

//     const postResponse = await fetch('https://api.example.com/task3', {
//       method: 'POST',
//       headers: {
//         'Content-Type': 'application/json'
//       },
//       body: JSON.stringify(processedData)
//     });
//     if (!postResponse.ok) {
//       throw new Error('Failed to post data to task3');
//     }
//     const result = await postResponse.json();

//     return result;
//   } catch (error) {
//     console.error('Error in some of the tasks:', error);
//   }
// }

// performTasks().then(result => console.log('Result:', result));

// 7.  Write an async function that fetches data from multiple endpoints in parallel:

// https://api.example.com/data1

// https://api.example.com/data2 

// Ensure that the function waits for all requests to complete and collects all the results before returning.

// async function fetchData() {
//   const url1 = "https://api.example.com/data1";
//   const url2 = "https://api.example.com/data2";

//   try {
//     const results = [];

//     const response1 = await fetch(url1);
//     const data1 = await response1.json();
//     results.push(data1);

//     const response2 = await fetch(url2);
//     const data2 = await response2.json();
//     results.push(data2);

//     return results;
//   } catch (error) {
//     console.error("Error fetching data:", error);
//   }
// }

// fetchData().then((data) => console.log(data));

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
