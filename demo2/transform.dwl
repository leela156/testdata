%dw 2.0
output application/json
fun Keys(value: Any, keys = []): Array<String> | Null = do {
flatten([keys,
typeOf(value) as String match {
case "Object" -> keysOf(value) reduce (v0, a0 = flatten([keys, keysOf(value)])) -> flatten([a0, Keys(value[v0], keys)])
case "Array" -> value reduce (v1, a1 = []) -> flatten([a1, Keys(v1, keys)])
else -> []
}])
}
---
Keys(payload)
