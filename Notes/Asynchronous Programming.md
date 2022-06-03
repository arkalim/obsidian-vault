---
created: 2022-06-03T13:46:08+05:30
updated: 2022-06-03T14:01:06+05:30
---
[[Notes]]

---
# Asynchronous Programming

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