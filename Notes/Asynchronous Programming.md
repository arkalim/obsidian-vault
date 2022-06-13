---
created: 2022-06-13T18:18:55+05:30
updated: 2022-06-13T18:18:55+05:30
---
[[Notes]]

---
# Asynchronous Programming
- In synchronous programming, the code runs from top of the file to the bottom in a single thread
- In asynchronous programming, the code runs from the top of the file to the bottom but if it encounters some asynchronous pieces of code in file, a new thread will be given to execute each asynchronous task whereas the main thread continues executing the main code. 
- A file containing asynchronous tasks will run in multiple threads (multi-threading). So, if a some task is taking some time to execute, it will not block other asynchronous tasks or the main code.
- Because each asynchronous task is handled by a separate thread, the code may not execute in order.
![[attachments/Pasted image 20220603182929.png]]

## Callback
- A callback is a function passed as an argument to another function which the calling function can invoke once it has done some task.
 ```JS
const order = (production: Function) => {
	console.log('Order placed, calling production...')
	production()
}

const production = () => {
	console.log('Starting production')
}

// call the order function and tell what to do once the order is placed
order(production);
```

## Resources
[Asynchronous JS | YouTube](https://www.youtube.com/watch?v=ZYb_ZU8LNxs&t=788s)
[Asynchronous Vs Synchronous Programming - YouTube](https://www.youtube.com/watch?v=Kpn2ajSa92c)
