package list

// A basic dynamic list that can be added to, indexed, and removed from.
List :: struct($T: typeid){
    data: [dynamic]T
}

// De-allocate a list.
Delete :: proc(list: ^List($T)) {
    delete(list.data)
}

// Adds a value to the end of a list.
Add :: proc(list: ^List($T), value: T) {
    append(&list.data, value)
}

// Adds a value to the end of a list.
Append_Value :: proc(list: ^List($T), value: T) {
    Add(list, value)
}

// Adds a list to the end of a list.
Append_List :: proc(list: ^List($T), list2: [dynamic]T) {
    append_elems(list, list2)
}

// Inserts a value into a list at a specific index.
Insert :: proc(list: ^List($T), value: T, index: u32) {
    inject_at(&list.data, value, index)
}

// Removes a value from the list at a specific index.
Remove :: proc(list: ^List($T), index: u32) {
    ordered_remove(&list.data, index)
}

// Removes a value from the list at a specific index. The list may not stay in the some order afterwards.
UnorderedRemove :: proc(list: ^List($T), index: u32) {
    unordered_remove(&list.data, index)
}

// Append something to the end of a list.
Append :: proc{
    Append_Value,
    Append_List,
}

// Add something to the end of a list.
PushBack :: proc(list: ^List($T), value: T) {
    Add(list, value)
}

// Get the length of a list.
Length :: proc(list: ^List($T)) -> u32 {
    return len(list.data)
}

// Get the maximum size of a list. The list will automatically restructure itself past this size to allow for more elements.
Cap :: proc(list: ^List($T)) -> u32 {
    return cap(list.data)
}

// Set a value in a list at a specific index.
Set :: proc(list: ^List($T), index: u32) {
    assign_at(list.data, index)
}

// Get a value in a list at a specific index.
Get :: proc(list: ^List($T), index: u32) -> T {
    return list.data[index]
}

// Get the value at the beginning of a list.
Front :: proc(list: ^List($T), index: u32) -> T {
    return list.data[0]
}

// Get the value at the end of a list.
Back :: proc(list: ^List($T), index: u32) -> T {
    return list.data[Length(list) - 1]
}

// Get the last value of a list, and remove it from said list.
PopBack :: proc(list: ^List($T)) -> T {
    return pop(list)
}

// Get the first value of a list, and remove it from said list.
PopFront :: proc(list: ^List($T)) -> T {
    return pop_front(list)
}

// Clear a list of all values.
Clear :: proc(list: ^List($T)) {
    clear(list.data)
}

// Resize a list.
Resize :: proc(list: ^List($T), size: uint) {
    resize(list, size)
}

// Resize a list, reserving memory just for this size.
Reserve :: proc(list: ^List($T), size: uint) {
    reserve(list, size)
}