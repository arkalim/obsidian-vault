---
created: 2022-09-26T19:43:43-04:00
updated: 2022-09-26T19:57:22-04:00
---
[[Pre-Requisites]]

---
# YAML
- Format to store configuration data

## Key Value
- There must be a  blank space after the colon to separate the key and value
```yaml
name: Abdur Rahman
age: 23
```

## List
- The `-` indicates that the item is a part of the list
```yaml
Fruits:
- Apple
- Banana
- Mango

Cities:
- Toronto
- Calgary
- Waterloo
```

## Dictionary
- Equal spacing for nesting
- Unequal spacing will lead to unwanted nesting
```yaml
Student:
	name: Abdur Rahman
	age: 23
	location: Toronto

Employee:
	dept: Computer Science
	company: Google
```

## List of Dictionaries
```yaml
People:
	- Student:
		name: Abdur Rahman
		age: 23
		location: Toronto
	
	- Employee:
		dept: Computer Science
		company: Google
```