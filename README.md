# GroupSections
An easy way to group your Lists in different Sections in UITableView by Date. Just download the source code from files.

<img src="https://github.com/emilianscheel/GroupSections/blob/main/Example.png" width="200">

## How to use

1. Create a Item-Class which has `GroupSections.ObjectRow` as SuperClass.
```Swift
class Person: GroupSections.ObjectRow {
	var id: Int
	var name: String
	
	init(id: Int, name: String) {
		self.id = id
		self.name = name
	}
}
```



2. Create some objects of `Person`.
```Swift
var persons = [Person]()
persons.append(id: 1, name: "Mike")
persons.append(id: 2: name: "Dave")
```



3. Change in `GroupSections`-Class the parameter from `group` to your custom Person-Class
```Swift
static func group(_ persons: [Person], by component: Calendar.Component) -> [Object] { ... }
```



4. Group your objects by calling `group`.
```Swift
var groupedPersons: [GroupSections.Object] = GroupSections.group(persons, by: .month)
```
