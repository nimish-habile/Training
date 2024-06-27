// 1. Write a JavaScript class Car with a constructor that takes make and model as parameters. Include an instance method displayInfo that logs "Make: [make], Model: [model]" to the console when called.

// class Car{
//     constructor(make, model){
//         this.make=make;
//         this.model=model;
//     }
//     displayInfo() {
//         console.log(`Make: ${this.make}, Model: ${this.model}`);
//     }
// }

// const myCar = new Car(1, 2);
// myCar.displayInfo();


// 2. Create a subclass ElectricCar that extends the Car class. Add a new property batteryCapacity to the ElectricCar class and override the displayInfo method to include battery information.
// Create a Engine class with methods start and stop. Modify the Car class to include an instance of Engine and delegate the start and stop methods to it.

// class ElectricCar extends Car{
//     constructor(make, model, batteryCapacity){
//         super(make, model);
//         this.batteryCapacity=batteryCapacity;
//     }

//     displayInfo(){
//         console.log(`Make: ${this.make}, Model: ${this.model}, Battery Capacity: ${this.batteryCapacity}`);
//     }
// }

// const myElectricCar = new ElectricCar(5, 6, 7);
// myElectricCar.displayInfo();

// 3. Write a function printPersonInfo that accepts an object parameter person containing name, age, and city properties, and uses object destructuring to print each property.

// class Person{
//     constructor(name, age, city){
//         this.name=name;
//         this.age=age;
//         this.city=city;
//     }
// };

// const firstPerson = new Person("Nimish", 21, "Jaipur");

// function printPersonInfo(obj){
//     const {name, age, city}=obj;
//     console.log(name, age, city);
// }

// printPersonInfo(firstPerson);


// 4. Modify the printPersonInfo function to assign default values ('Unknown') to age and city if they are not provided in the person object.

// const firstPerson = new Person(name="Nimish");

// function printPersonInfo(obj){
//     const {name, age='Unknown', city='Unknown'}=obj;
//     console.log(name, age, city);
// }

// printPersonInfo(firstPerson);

// 5. Write a function mergeObjects that takes two objects as parameters and merges them using the spread operator (...). If there are duplicate keys, the second object should overwrite the first.

// function mergeObjects(obj1, obj2) {
//     return { ...obj1, ...obj2 };
// }
  
// const obj1 = { "Name": "Nimish", "Age": 21, "City": "Jaipur" };
// const obj2 = { "City": "Bhilwara", "Company": "Habile"};
  
// const result = mergeObjects(obj1, obj2);
// console.log(result);

// 6. Write a function getRemainingProperties that extracts the name property from an object and gathers all remaining properties into a new object using object destructuring and the rest syntax (...).

// const obj = { "Name": "Nimish", "Age": 21, "City": "Bhilwara", "Company": "Habile"};
  
// function getRemainingProperties(obj){
//     const {Name, ...remaining}=obj;
//     return remaining;
// }
// console.log(getRemainingProperties(obj));

// Create a function updatePersonInfo that updates the name property of a person object using object destructuring and the spread operator, leaving other properties unchanged.

// function updatePersonInfo(obj, newname){
//     return {...obj, Name:newname};
// }

// console.log(updatePersonInfo(obj, 'Unnamed'))